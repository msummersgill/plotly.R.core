// Typed array encoding for the widget serialiser: numeric vectors and
// date-times are sent to plotly.js as {dtype, bdata} specs, bdata being the
// base64 of the little-endian values (see typed_array_spec() in R/widget.R).
//
// The approach follows data.table's fread.c and fwrite.c:
//  - type detection is one pass that "bumps" to the most general type at the
//    first value that rules out a narrower one (as fread bumps column types),
//    instead of separate range(), trunc() and anyNA() passes in R;
//  - output is written straight into one preallocated buffer, with lookup
//    tables (as fwrite's digit lookups) and no intermediate raw vector, split
//    into independent chunks over OpenMP threads where available.

// omp.h first: R's headers define macros (e.g. match, as Rf_match) that
// break LLVM's omp.h (clang on Windows arm64)
#ifdef _OPENMP
#include <omp.h>
#endif
#include <R.h>
#include <Rinternals.h>
#include <math.h>
#include <limits.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#define INT32_LIM 2147483647.0

// ---- base64 -------------------------------------------------------------

static const char B64[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
// 12 bits -> 2 base64 characters, so 3 bytes become 2 lookups
static char B64PAIR[4096 * 2];
static int b64_ready = 0;

static void b64_init(void) {
  if (b64_ready) return;
  for (int i = 0; i < 4096; i++) {
    B64PAIR[2 * i] = B64[i >> 6];
    B64PAIR[2 * i + 1] = B64[i & 63];
  }
  b64_ready = 1;
}

static inline size_t b64_len(size_t nbytes) { return (nbytes + 2) / 3 * 4; }

// Encode `nbytes` bytes from `in` into `out` (b64_len(nbytes) chars).
static void b64_encode(const uint8_t *in, size_t nbytes, char *out, int nth) {
  const size_t ntrip = nbytes / 3;
  // chunks of whole 3-byte groups are independent: each thread writes its own
  // part of the output (fwrite writes batches to per-thread buffers instead,
  // as its line lengths are not known in advance)
  const size_t CHUNK = 1 << 16; // triplets per chunk
  const size_t nchunk = (ntrip + CHUNK - 1) / CHUNK;
  (void)nth;
#ifdef _OPENMP
#pragma omp parallel for num_threads(nth) schedule(static) if (nchunk > 1)
#endif
  for (size_t c = 0; c < nchunk; c++) {
    size_t from = c * CHUNK, to = from + CHUNK < ntrip ? from + CHUNK : ntrip;
    const uint8_t *p = in + 3 * from;
    char *o = out + 4 * from;
    for (size_t t = from; t < to; t++, p += 3, o += 4) {
      uint32_t v = ((uint32_t)p[0] << 16) | ((uint32_t)p[1] << 8) | p[2];
      memcpy(o, B64PAIR + 2 * (v >> 12), 2);
      memcpy(o + 2, B64PAIR + 2 * (v & 4095), 2);
    }
  }
  size_t rest = nbytes - 3 * ntrip;
  if (rest) {
    const uint8_t *p = in + 3 * ntrip;
    char *o = out + 4 * ntrip;
    uint32_t v = (uint32_t)p[0] << 16 | (rest == 2 ? (uint32_t)p[1] << 8 : 0);
    o[0] = B64[v >> 18];
    o[1] = B64[(v >> 12) & 63];
    o[2] = rest == 2 ? B64[(v >> 6) & 63] : '=';
    o[3] = '=';
  }
}

// ---- typed arrays -------------------------------------------------------

enum { T_I1, T_I2, T_I4, T_F4, T_F8 };
static const char *DTYPE[] = {"i1", "i2", "i4", "f4", "f8"};
static const int SIZE[] = {1, 2, 4, 4, 8};

static int int_type(double mn, double mx) {
  if (mn >= -128 && mx <= 127) return T_I1;
  if (mn >= -32768 && mx <= 32767) return T_I2;
  return T_I4;
}

static inline int little_endian(void) {
  const uint16_t one = 1;
  return *(const uint8_t *)&one == 1;
}

// Values (double or int) converted to `type`, little-endian, as base64.
// `raw`: bdata is a raw vector holding the base64 in double quotes (a JSON
// string), for json_splice(), instead of a character string: making a large
// R string scans and hashes it, and jsonlite would copy it again at every
// level of nesting.
static SEXP encode(const double *d, const int *iv, R_xlen_t n, int type, int raw, int nth) {
  const size_t size = SIZE[type], nbytes = (size_t)n * size;
  const uint8_t *bytes;
  if (type == T_F8 && d && little_endian()) {
    bytes = (const uint8_t *)d; // already the bytes to send
  } else {
    uint8_t *buf = (uint8_t *)R_alloc(nbytes ? nbytes : 1, 1);
    (void)nth;
#ifdef _OPENMP
#pragma omp parallel for num_threads(nth) schedule(static) if (n > 100000)
#endif
    for (R_xlen_t i = 0; i < n; i++) {
      double x = d ? d[i] : (iv[i] == NA_INTEGER ? NA_REAL : (double)iv[i]);
      switch (type) {
      case T_I1: { int8_t v = (int8_t)(d ? x : iv[i]); memcpy(buf + i, &v, 1); break; }
      case T_I2: { int16_t v = (int16_t)(d ? x : iv[i]); memcpy(buf + 2 * i, &v, 2); break; }
      case T_I4: { int32_t v = (int32_t)(d ? x : iv[i]); memcpy(buf + 4 * i, &v, 4); break; }
      case T_F4: { float v = (float)x; memcpy(buf + 4 * i, &v, 4); break; }
      default: memcpy(buf + 8 * i, &x, 8);
      }
    }
    if (!little_endian() && size > 1) {
      for (size_t i = 0; i < nbytes; i += size)
        for (size_t a = i, b = i + size - 1; a < b; a++, b--) {
          uint8_t t = buf[a]; buf[a] = buf[b]; buf[b] = t;
        }
    }
    bytes = buf;
  }
  const size_t len = b64_len(nbytes) + (raw ? 2 : 0);
  SEXP res = PROTECT(allocVector(VECSXP, 2)), nms = PROTECT(allocVector(STRSXP, 2));
  SET_STRING_ELT(nms, 0, mkChar("dtype"));
  SET_STRING_ELT(nms, 1, mkChar("bdata"));
  SET_VECTOR_ELT(res, 0, mkString(DTYPE[type]));
  if (raw) {
    SEXP r = allocVector(RAWSXP, len);
    SET_VECTOR_ELT(res, 1, r);
    char *out = (char *)RAW(r);
    out[0] = out[len - 1] = '"';
    b64_encode(bytes, nbytes, out + 1, nth);
  } else {
    if (len > INT_MAX) error("typed array too large to encode (%.0f bytes)", (double)nbytes);
    char *out = R_alloc(len ? len : 1, 1);
    b64_encode(bytes, nbytes, out, nth);
    SET_VECTOR_ELT(res, 1, ScalarString(mkCharLenCE(out, (int)len, CE_UTF8)));
  }
  setAttrib(res, R_NamesSymbol, nms);
  UNPROTECT(2);
  return res;
}

static int nthreads(SEXP nth) {
  int n = asInteger(nth);
  return n == NA_INTEGER || n < 1 ? 1 : n;
}

// Typed array spec of an integer or double vector: integers, and doubles that
// are all whole numbers in the 32-bit range, as the smallest integer type that
// holds them; otherwise float32 (`float32`) or float64. Integers with NA are
// sent as floats (NaN, a gap in plotly.js).
SEXP C_typed_array(SEXP x, SEXP float32, SEXP raw, SEXP nth) {
  b64_init();
  const R_xlen_t n = xlength(x);
  const int ftype = asLogical(float32) == TRUE ? T_F4 : T_F8;
  int type = ftype;
  if (TYPEOF(x) == REALSXP) {
    const double *d = REAL_RO(x);
    double mn = R_PosInf, mx = R_NegInf;
    int whole = n > 0;
    for (R_xlen_t i = 0; i < n; i++) {
      double v = d[i];
      // NaN fails v == trunc(v); +-Inf fails the range check. Either bumps
      // the type to float, so no later value needs checking.
      if (!(v == trunc(v)) || v < -INT32_LIM || v > INT32_LIM) { whole = 0; break; }
      if (v < mn) mn = v;
      if (v > mx) mx = v;
    }
    if (whole) type = int_type(mn, mx);
    return encode(d, NULL, n, type, asLogical(raw) == TRUE, nthreads(nth));
  }
  if (TYPEOF(x) == INTSXP || TYPEOF(x) == LGLSXP) {
    const int *iv = TYPEOF(x) == INTSXP ? INTEGER_RO(x) : LOGICAL_RO(x);
    int mn = INT_MAX, mx = INT_MIN, na = 0;
    for (R_xlen_t i = 0; i < n; i++) {
      int v = iv[i];
      if (v == NA_INTEGER) { na = 1; break; }
      if (v < mn) mn = v;
      if (v > mx) mx = v;
    }
    if (n > 0 && !na) type = int_type(mn, mx);
    return encode(NULL, iv, n, type, asLogical(raw) == TRUE, nthreads(nth));
  }
  error("typed arrays need an integer or double vector");
}

// ---- date-times ---------------------------------------------------------

// The 15-minute bins (floor(secs / 900)) holding the non-missing date-times
// `secs`, sorted and unique: one pass for sorted data (the usual time series),
// else sort a copy.
static int cmp_double(const void *a, const void *b) {
  double x = *(const double *)a, y = *(const double *)b;
  return (x > y) - (x < y);
}

SEXP C_time_bins(SEXP secs) {
  const R_xlen_t n = xlength(secs);
  const double *s = REAL_RO(secs);
  double *b = (double *)R_alloc(n ? n : 1, sizeof(double));
  R_xlen_t m = 0;
  int sorted = 1;
  for (R_xlen_t i = 0; i < n; i++) {
    if (!R_FINITE(s[i])) continue;
    double v = floor(s[i] / 900);
    if (m && v == b[m - 1]) continue;
    if (m && v < b[m - 1]) sorted = 0;
    b[m++] = v;
  }
  if (!sorted) {
    qsort(b, m, sizeof(double), cmp_double);
    R_xlen_t k = 0;
    for (R_xlen_t i = 0; i < m; i++) if (!k || b[i] != b[k - 1]) b[k++] = b[i];
    m = k;
  }
  SEXP out = PROTECT(allocVector(REALSXP, m));
  if (m) memcpy(REAL(out), b, m * sizeof(double));
  UNPROTECT(1);
  return out;
}

// Date-times `secs` as wall-clock whole milliseconds since 1970 (a typed
// array spec) and the microseconds within each millisecond: each value is
// rounded to the microsecond (its fraction of a second, so as precisely as
// format_datetime() in R), the UTC offset being `off0` of its bin in `bins`
// (from C_time_bins()) before the bin's transition instant `trans` and `off1`
// from then on. Returns list(spec, usec), usec a double vector of 0-999, or
// NULL when every value is a whole millisecond. NULL when there are no
// non-missing values or any is outside years 1000-9999 (sent as strings).
SEXP C_datetime_array(SEXP secs, SEXP bins, SEXP off0, SEXP trans, SEXP off1,
                      SEXP raw, SEXP nth) {
  b64_init();
  const R_xlen_t n = xlength(secs), nb = xlength(bins);
  const double *s = REAL_RO(secs), *b = REAL_RO(bins), *o0 = REAL_RO(off0),
               *tr = REAL_RO(trans), *o1 = REAL_RO(off1);
  double *ms = (double *)R_alloc(n ? n : 1, sizeof(double));
  double *us = (double *)R_alloc(n ? n : 1, sizeof(double));
  int anyus = 0;
  double mn = R_PosInf, mx = R_NegInf;
  R_xlen_t j = 0; // bin of the previous value: sorted data needs no search
  for (R_xlen_t i = 0; i < n; i++) {
    double x = s[i];
    if (!R_FINITE(x)) { ms[i] = NA_REAL; us[i] = 0; continue; }
    double bin = floor(x / 900);
    if (j >= nb || b[j] != bin) {
      if (j + 1 < nb && b[j + 1] == bin) {
        j++;
      } else { // binary search
        R_xlen_t lo = 0, hi = nb - 1;
        while (lo < hi) {
          R_xlen_t mid = lo + (hi - lo) / 2;
          if (b[mid] < bin) lo = mid + 1; else hi = mid;
        }
        if (b[lo] != bin) error("internal error: date-time bin not found");
        j = lo;
      }
    }
    double off = x < tr[j] ? o0[j] : o1[j];
    double whole = floor(x);
    double f = nearbyint((x - whole) * 1e6); // microseconds, as R's round()
    if (f >= 1e6) { whole += 1; f -= 1e6; }
    double msub = floor(f / 1000);
    double v = (whole + off) * 1000 + msub;
    us[i] = f - msub * 1000;
    if (us[i] != 0) anyus = 1;
    ms[i] = v;
    if (v < mn) mn = v;
    if (v > mx) mx = v;
  }
  if (!(mn <= mx) || mn < -30610224000000.0 || mx > 253402300799999.0) return R_NilValue;
  // whole numbers: integers if they fit (within 24 days of 1970), else float64
  int type = mn >= -INT32_LIM && mx <= INT32_LIM ? int_type(mn, mx) : T_F8;
  int anyna = 0;
  if (type != T_F8) for (R_xlen_t i = 0; i < n; i++) if (ISNAN(ms[i])) { anyna = 1; break; }
  if (anyna) type = T_F8;
  SEXP out = PROTECT(allocVector(VECSXP, 2));
  SET_VECTOR_ELT(out, 0, encode(ms, NULL, n, type, asLogical(raw) == TRUE, nthreads(nth)));
  if (anyus) {
    SEXP u = allocVector(REALSXP, n);
    SET_VECTOR_ELT(out, 1, u);
    memcpy(REAL(u), us, n * sizeof(double));
  }
  UNPROTECT(1);
  return out;
}

// ---- JSON splicing --------------------------------------------------------

// The JSON text `json` (one string) with each placeholder \x01<k>\x01 (k from
// 1) replaced by the bytes of raw vector blobs[[k]]: the widget serialiser
// writes the figure's small skeleton with jsonlite and the typed arrays'
// base64 is copied in once, into one buffer (as fwrite assembles its output),
// so the large strings are never made, scanned or pasted by R. jsonlite
// writes control characters in strings escaped, so \x01 is only a
// placeholder.
SEXP C_json_splice(SEXP json, SEXP blobs) {
  const char *s = CHAR(STRING_ELT(json, 0));
  const size_t n = strlen(s), nb = xlength(blobs);
  size_t total = 0;
  for (size_t i = 0; i < n; i++) {
    if (s[i] != '\x01') { total++; continue; }
    size_t j = i + 1, k = 0;
    while (j < n && s[j] >= '0' && s[j] <= '9') k = 10 * k + (s[j++] - '0');
    if (j >= n || s[j] != '\x01' || k < 1 || k > nb) error("internal error: bad typed array placeholder");
    total += xlength(VECTOR_ELT(blobs, k - 1));
    i = j;
  }
  if (total > INT_MAX) error("widget JSON too large (%.0f bytes)", (double)total);
  char *out = R_alloc(total ? total : 1, 1), *o = out;
  for (size_t i = 0; i < n; i++) {
    if (s[i] != '\x01') { *o++ = s[i]; continue; }
    size_t j = i + 1, k = 0;
    while (s[j] != '\x01') k = 10 * k + (s[j++] - '0');
    SEXP b = VECTOR_ELT(blobs, k - 1);
    memcpy(o, RAW(b), xlength(b));
    o += xlength(b);
    i = j;
  }
  return ScalarString(mkCharLenCE(out, (int)total, CE_UTF8));
}
