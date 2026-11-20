// JSON for a widget payload, as jsonlite::toJSON() writes it with the options
// of to_JSON() (auto_unbox, null and NA as null, json_verbatim), but without
// jsonlite's per-object S4 dispatch, which dominates for figures with many
// traces. Lists (whatever their class, except data frames) are objects when
// named and arrays otherwise; atomic vectors are arrays, or bare values when
// of length 1 and not wrapped in I(); doubles are written in the fewest
// digits that read back as the same double (see json_num.c). Anything else
// (data frames, classed vectors such as dates, factors and "json" vectors
// longer than 1, non-double matrices) is written by the R function
// `fallback` (jsonlite).

#include <R.h>
#include <Rinternals.h>
#include <string.h>
#include <limits.h>

int fmt_num(double v, int f32, char *buf);

typedef struct {
  char *buf;
  size_t len, cap;
} jbuf;

static void jb_grow(jbuf *b, size_t extra) {
  if (b->len + extra <= b->cap) return;
  size_t cap = b->cap ? b->cap : 1024;
  while (cap < b->len + extra) cap *= 2;
  b->buf = (char *) R_Realloc(b->buf, cap, char);
  b->cap = cap;
}

static void jb_put(jbuf *b, const char *s, size_t n) {
  jb_grow(b, n);
  memcpy(b->buf + b->len, s, n);
  b->len += n;
}

static void jb_c(jbuf *b, char c) {
  jb_grow(b, 1);
  b->buf[b->len++] = c;
}

static void jb_str(jbuf *b, SEXP s) {
  if (s == NA_STRING) {
    jb_put(b, "null", 4);
    return;
  }
  const char *p = translateCharUTF8(s);
  static const char hex[] = "0123456789abcdef";
  jb_c(b, '"');
  unsigned char prev = 0;
  for (; *p; prev = (unsigned char) *p, p++) {
    unsigned char c = (unsigned char) *p;
    // "</" as "<\/", as jsonlite writes it, so a string can't close the
    // page's <script> element
    if (c == '/' && prev == '<') {
      jb_put(b, "\\/", 2);
      continue;
    }
    switch (c) {
    case '"': jb_put(b, "\\\"", 2); break;
    case '\\': jb_put(b, "\\\\", 2); break;
    case '\b': jb_put(b, "\\b", 2); break;
    case '\f': jb_put(b, "\\f", 2); break;
    case '\n': jb_put(b, "\\n", 2); break;
    case '\r': jb_put(b, "\\r", 2); break;
    case '\t': jb_put(b, "\\t", 2); break;
    default:
      if (c < 0x20) {
        char u[6] = {'\\', 'u', '0', '0', hex[c >> 4], hex[c & 15]};
        jb_put(b, u, 6);
      } else {
        jb_c(b, (char) c);
      }
    }
  }
  jb_c(b, '"');
}

static int has_class(SEXP x, const char *cls) {
  SEXP k = getAttrib(x, R_ClassSymbol);
  for (R_xlen_t i = 0; i < xlength(k); i++) {
    if (strcmp(CHAR(STRING_ELT(k, i)), cls) == 0) return 1;
  }
  return 0;
}

// class is exactly "AsIs"
static int only_asis(SEXP x) {
  SEXP k = getAttrib(x, R_ClassSymbol);
  return xlength(k) == 1 && strcmp(CHAR(STRING_ELT(k, 0)), "AsIs") == 0;
}

static void write_value(jbuf *b, SEXP x, SEXP fallback, SEXP rho);

static void write_fallback(jbuf *b, SEXP x, SEXP fallback, SEXP rho) {
  SEXP call = PROTECT(lang2(fallback, x));
  SEXP out = PROTECT(eval(call, rho));
  const char *s = CHAR(STRING_ELT(out, 0));
  jb_put(b, s, strlen(s));
  UNPROTECT(2);
}

static void write_atomic(jbuf *b, SEXP x, int asis) {
  R_xlen_t n = xlength(x);
  int scalar = n == 1 && !asis;
  char num[32];
  if (!scalar) jb_c(b, '[');
  for (R_xlen_t i = 0; i < n; i++) {
    if (i) jb_c(b, ',');
    switch (TYPEOF(x)) {
    case LGLSXP: {
      int v = LOGICAL_RO(x)[i];
      if (v == NA_LOGICAL) jb_put(b, "null", 4);
      else if (v) jb_put(b, "true", 4);
      else jb_put(b, "false", 5);
      break;
    }
    case INTSXP: {
      int v = INTEGER_RO(x)[i];
      if (v == NA_INTEGER) jb_put(b, "null", 4);
      else jb_put(b, num, snprintf(num, sizeof num, "%d", v));
      break;
    }
    case REALSXP:
      jb_put(b, num, fmt_num(REAL_RO(x)[i], 0, num));
      break;
    case STRSXP:
      jb_str(b, STRING_ELT(x, i));
      break;
    }
  }
  if (!scalar) jb_c(b, ']');
}

// a double matrix: an array of rows
static void write_matrix(jbuf *b, SEXP x, int nr, int nc) {
  const double *v = REAL_RO(x);
  char num[32];
  jb_c(b, '[');
  for (int i = 0; i < nr; i++) {
    if (i) jb_c(b, ',');
    jb_c(b, '[');
    for (int j = 0; j < nc; j++) {
      if (j) jb_c(b, ',');
      jb_put(b, num, fmt_num(v[i + (R_xlen_t) j * nr], 0, num));
    }
    jb_c(b, ']');
  }
  jb_c(b, ']');
}

static void write_value(jbuf *b, SEXP x, SEXP fallback, SEXP rho) {
  int type = TYPEOF(x);
  if (type == NILSXP) {
    jb_put(b, "null", 4);
    return;
  }
  if (type == VECSXP) {
    // lists jsonlite writes its own way
    if (OBJECT(x) && (has_class(x, "data.frame") || has_class(x, "POSIXlt") ||
                      has_class(x, "AsIs"))) {
      write_fallback(b, x, fallback, rho);
      return;
    }
    SEXP nms = getAttrib(x, R_NamesSymbol);
    R_xlen_t n = xlength(x);
    if (nms != R_NilValue) {
      jb_c(b, '{');
      for (R_xlen_t i = 0; i < n; i++) {
        if (i) jb_c(b, ',');
        jb_str(b, STRING_ELT(nms, i));
        jb_c(b, ':');
        write_value(b, VECTOR_ELT(x, i), fallback, rho);
      }
      jb_c(b, '}');
    } else {
      jb_c(b, '[');
      for (R_xlen_t i = 0; i < n; i++) {
        if (i) jb_c(b, ',');
        write_value(b, VECTOR_ELT(x, i), fallback, rho);
      }
      jb_c(b, ']');
    }
    return;
  }
  if (type != LGLSXP && type != INTSXP && type != REALSXP && type != STRSXP) {
    write_fallback(b, x, fallback, rho);
    return;
  }
  int asis = 0;
  if (OBJECT(x)) {
    if (type == STRSXP && xlength(x) == 1 && has_class(x, "json")) {
      // json_verbatim: written as is
      const char *s = CHAR(STRING_ELT(x, 0));
      jb_put(b, s, strlen(s));
      return;
    }
    if (!only_asis(x)) {
      write_fallback(b, x, fallback, rho);
      return;
    }
    asis = 1;
  }
  SEXP dim = getAttrib(x, R_DimSymbol);
  if (dim != R_NilValue) {
    if (type == REALSXP && xlength(dim) == 2) {
      write_matrix(b, x, INTEGER(dim)[0], INTEGER(dim)[1]);
    } else {
      write_fallback(b, x, fallback, rho);
    }
    return;
  }
  write_atomic(b, x, asis);
}

SEXP C_json_write(SEXP x, SEXP fallback, SEXP rho) {
  jbuf b = {NULL, 0, 0};
  write_value(&b, x, fallback, rho);
  if (b.len > (size_t) INT_MAX) {
    R_Free(b.buf);
    error("The figure's JSON is too large (over 2 GB)");
  }
  SEXP out = PROTECT(allocVector(STRSXP, 1));
  SET_STRING_ELT(out, 0, mkCharLenCE(b.buf ? b.buf : "", (int) b.len, CE_UTF8));
  R_Free(b.buf);
  UNPROTECT(1);
  return out;
}
