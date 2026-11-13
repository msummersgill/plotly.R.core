#' @keywords internal
"_PACKAGE"

#' @importFrom data.table :=
#' @useDynLib plotly.core, .registration = TRUE
NULL

# Let data.table syntax work inside this namespace.
.datatable.aware <- TRUE

.onLoad <- function(libname, pkgname) {
  reset_px_defaults()
}

# data.table's .SD, used in px hierarchy aggregation
utils::globalVariables(c(".SD", ".I", ".N"))
