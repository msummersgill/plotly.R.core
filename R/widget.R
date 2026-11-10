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
    prepare_json(x), digits = NA, auto_unbox = TRUE, force = TRUE,
    null = "null", na = "null", ...
  )
}

# Convert values jsonlite would serialise lossily. Date-times become strings
# with millisecond precision; other values are left as they are.
prepare_json <- function(x) {
  if (inherits(x, "POSIXt")) {
    out <- format_datetime(x)
    if (inherits(x, "AsIs")) out <- I(out)
    dim(out) <- dim(x)
    return(out)
  }
  if (is.list(x) && length(x)) x[] <- lapply(x, prepare_json)
  x
}

# Format date-times as "YYYY-MM-DD HH:MM:SS[.mmm]" in the object's time zone
# (plotly.js has no time zones). Milliseconds are rounded, not truncated as
# format(x, "%OS3") does, and omitted when zero.
format_datetime <- function(x) {
  x <- as.POSIXct(x)
  tz <- attr(x, "tzone")[1L] %||% ""
  secs <- round(as.numeric(x) * 1000) / 1000
  whole <- floor(secs)
  ms <- round((secs - whole) * 1000)
  out <- format(as.POSIXct(whole, origin = "1970-01-01", tz = tz), "%Y-%m-%d %H:%M:%S")
  out <- ifelse(!is.na(ms) & ms > 0, paste0(out, sprintf(".%03d", as.integer(ms))), out)
  out[is.na(x)] <- NA_character_
  out
}

`%||%` <- function(x, y) if (is.null(x)) y else x
