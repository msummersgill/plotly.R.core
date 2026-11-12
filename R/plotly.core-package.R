#' @keywords internal
"_PACKAGE"

#' @importFrom data.table :=
NULL

# Let data.table syntax work inside this namespace.
.datatable.aware <- TRUE

.onLoad <- function(libname, pkgname) {
  reset_px_defaults()
}

# data.table's .SD, used in px hierarchy aggregation
utils::globalVariables(c(".SD", ".I", ".N"))
