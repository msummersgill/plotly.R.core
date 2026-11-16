// JSON text for double vectors and matrices: each number in the fewest
// significant digits (15, 16 or 17) that read back as the same double, as
// JavaScript prints numbers, so values round-trip exactly without the noise
// of always writing 17 digits (0.1 rather than 0.10000000000000001). With
// `f32`, the fewest digits (6 to 9) that read back as the same single
// precision value. Non-finite values are written as null.

#include <R.h>
#include <Rinternals.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int fmt_num(double v, int f32, char *buf) {
  if (!R_FINITE(v)) {
    memcpy(buf, "null", 5);
    return 4;
  }
  int lo = f32 ? 6 : 15, hi = f32 ? 9 : 17, n = 0;
  for (int p = lo; p <= hi; p++) {
    n = snprintf(buf, 32, "%.*g", p, v);
    double back = strtod(buf, NULL);
    if (f32 ? (float)back == (float)v : back == v) break;
  }
  return n;
}

// x: double vector; nrow, ncol: its dimensions for a matrix (written row by
// row as nested arrays), or ncol = -1 for a vector; scalar: write a length-1
// vector as a bare number. Returns a character string.
SEXP C_num_json(SEXP x, SEXP nrow, SEXP ncol, SEXP scalar, SEXP f32) {
  const double *v = REAL_RO(x);
  const R_xlen_t n = xlength(x);
  const int nr = asInteger(nrow), nc = asInteger(ncol), single = asLogical(f32) == TRUE;
  // at most 25 characters per number, plus separators and brackets
  size_t cap = (size_t)n * 26 + (nc > 0 ? (size_t)nr * 3 : 0) + 8;
  char *out = R_alloc(cap, 1), *p = out, buf[32];
  if (nc < 0 && n == 1 && asLogical(scalar) == TRUE) {
    p += fmt_num(v[0], single, p);
  } else if (nc < 0) {
    *p++ = '[';
    for (R_xlen_t i = 0; i < n; i++) {
      if (i) *p++ = ',';
      int k = fmt_num(v[i], single, buf);
      memcpy(p, buf, k);
      p += k;
    }
    *p++ = ']';
  } else {
    *p++ = '[';
    for (int i = 0; i < nr; i++) {
      if (i) *p++ = ',';
      *p++ = '[';
      for (int j = 0; j < nc; j++) {
        if (j) *p++ = ',';
        int k = fmt_num(v[i + (R_xlen_t)j * nr], single, buf);
        memcpy(p, buf, k);
        p += k;
      }
      *p++ = ']';
    }
    *p++ = ']';
  }
  return ScalarString(mkCharLenCE(out, (int)(p - out), CE_UTF8));
}
