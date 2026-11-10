#' Render a figure as an htmlwidget
#'
#' @param fig A list with `data` (list of traces), `layout` and `config`
#'   elements.
#' @param width,height Widget size in CSS units, or `NULL` to fill the
#'   container.
#' @param elementId Optional element id for the widget.
#' @return An object of class `htmlwidget`.
#' @export
#' @examples
#' plotly_widget(list(data = list(list(type = "bar", x = 1:3, y = c(2, 5, 3)))))
plotly_widget <- function(fig, width = NULL, height = NULL, elementId = NULL) {
  x <- list(
    data = unname(fig$data %||% list()),
    layout = fig$layout %||% structure(list(), names = character()),
    config = fig$config %||% structure(list(), names = character())
  )
  attr(x, "TOJSON_FUNC") <- to_JSON
  htmlwidgets::createWidget(
    name = "plotly_R_core",
    x = x,
    width = width,
    height = height,
    package = "plotly.R.core",
    elementId = elementId,
    sizingPolicy = htmlwidgets::sizingPolicy(
      browser.fill = TRUE,
      padding = 0,
      defaultWidth = "100%",
      defaultHeight = 400
    )
  )
}

# JSON serialiser used by the widget: length-1 vectors become scalars and
# missing values become null, matching what plotly.js expects.
to_JSON <- function(x, ...) {
  jsonlite::toJSON(
    x, digits = NA, auto_unbox = TRUE, force = TRUE,
    null = "null", na = "null", ...
  )
}

`%||%` <- function(x, y) if (is.null(x)) y else x
