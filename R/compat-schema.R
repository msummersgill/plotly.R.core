#' The plotly.js plot schema
#'
#' The schema of the bundled plotly.js: every trace type and layout object
#' with its attributes, as in the legacy package.
#'
#' @param jsonedit Show it in an interactive viewer (needs the listviewer
#'   package)?
#' @param ... Unused.
#' @return The schema as a list (invisibly): `traces`, `layout`, `frames`,
#'   `animation`, `config` and `defs`, and `transforms`: the trace transforms
#'   [plot_ly()] applies in R (plotly.js 3 removed them).
#' @export
#' @examples
#' s <- schema(jsonedit = FALSE)
#' names(s$traces)
schema <- function(jsonedit = interactive(), ...) {
  s <- PLOT_SCHEMA$value
  if (is.null(s)) {
    con <- gzfile(system.file("schema", "plot-schema.json.gz", package = "plotly.core"))
    on.exit(close(con))
    s <- jsonlite::parse_json(paste(readLines(con, warn = FALSE), collapse = "\n"), simplifyVector = TRUE)
    s$transforms <- lp_transforms_schema()
    PLOT_SCHEMA$value <- s
  }
  if (jsonedit) {
    if (!requireNamespace("listviewer", quietly = TRUE)) stop("schema(jsonedit = TRUE) needs the listviewer package", call. = FALSE)
    print(listviewer::jsonedit(s, mode = "form"))
  }
  invisible(s)
}

PLOT_SCHEMA <- new.env(parent = emptyenv())

# The transforms plot_ly() applies (R/compat-transforms.R), in the form of
# plotly.js 2's schema.
lp_transforms_schema <- function() {
  enum <- function(values, dflt) list(valType = "enumerated", values = values, dflt = dflt)
  list(
    filter = list(attributes = list(
      enabled = list(valType = "boolean", dflt = TRUE), target = list(valType = "any", dflt = "x"),
      operation = enum(c("=", "!=", "<", ">=", ">", "<=", "[]", "()", "[)", "(]", "][", ")(", "](", ")[", "{}", "}{"), "="),
      value = list(valType = "any", dflt = 0), preservegaps = list(valType = "boolean", dflt = FALSE))),
    groupby = list(attributes = list(
      enabled = list(valType = "boolean", dflt = TRUE), groups = list(valType = "data_array"),
      nameformat = list(valType = "string"),
      styles = list(items = list(style = list(target = list(valType = "string"), value = list(valType = "any")))))),
    aggregate = list(attributes = list(
      enabled = list(valType = "boolean", dflt = TRUE), groups = list(valType = "string", dflt = "x"),
      aggregations = list(items = list(aggregation = list(
        target = list(valType = "string"), func = enum(names(LP_AGG_FUNCS), "first"),
        funcmode = enum(c("sample", "population"), "sample"), enabled = list(valType = "boolean", dflt = TRUE)))))),
    sort = list(attributes = list(
      enabled = list(valType = "boolean", dflt = TRUE), target = list(valType = "any", dflt = "x"),
      order = enum(c("ascending", "descending"), "ascending")))
  )
}
