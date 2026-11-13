#' The plotly.js plot schema
#'
#' The schema of the bundled plotly.js: every trace type and layout object
#' with its attributes.
#'
#' @param jsonedit Show it in an interactive viewer (needs the listviewer
#'   package)?
#' @param ... Unused.
#' @return The schema as a list (invisibly): `traces`, `layout`, `frames`,
#'   `animation`, `config` and `defs`.
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
    PLOT_SCHEMA$value <- s
  }
  if (jsonedit) {
    if (!requireNamespace("listviewer", quietly = TRUE)) stop("schema(jsonedit = TRUE) needs the listviewer package", call. = FALSE)
    print(listviewer::jsonedit(s, mode = "form"))
  }
  invisible(s)
}

PLOT_SCHEMA <- new.env(parent = emptyenv())
