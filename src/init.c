#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>

SEXP C_typed_array(SEXP, SEXP, SEXP, SEXP);
SEXP C_time_bins(SEXP);
SEXP C_datetime_array(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
SEXP C_json_splice(SEXP, SEXP);
SEXP C_num_json(SEXP, SEXP, SEXP, SEXP, SEXP);
SEXP C_json_write(SEXP, SEXP, SEXP);

static const R_CallMethodDef CallEntries[] = {
  {"C_typed_array", (DL_FUNC) &C_typed_array, 4},
  {"C_time_bins", (DL_FUNC) &C_time_bins, 1},
  {"C_datetime_array", (DL_FUNC) &C_datetime_array, 7},
  {"C_json_splice", (DL_FUNC) &C_json_splice, 2},
  {"C_num_json", (DL_FUNC) &C_num_json, 5},
  {"C_json_write", (DL_FUNC) &C_json_write, 3},
  {NULL, NULL, 0}
};

void R_init_plotly_core(DllInfo *dll) {
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
