#' Render a figure as an htmlwidget
#'
#' `plotly_widget()` and `as_widget()` turn a figure into an htmlwidget,
#' which is what printing a figure does. Use them to embed figures with
#' htmltools or [htmlwidgets::saveWidget()].
#'
#' @param fig A [go_figure()], a figure from a `px_*()` function, or a list
#'   with `data` (list of traces), `layout`, `frames` and `config` elements.
#' @param x A figure, [plot_ly()] object or htmlwidget.
#' @param width,height Widget size in CSS units, or `NULL` for the layout's
#'   `width`/`height` or to fill the container.
#' @param elementId Optional element id for the widget.
#' @param config Plotly.js configuration options (e.g.
#'   `list(displayModeBar = FALSE)`), merged over those set with [config()].
#' @param ... Passed to `plotly_widget()`.
#' @return An object of class `htmlwidget`.
#' @details If the figure's layout has no `template`, the default template
#'   (see [default_template()]) is applied.
#' @export
#' @examples
#' plotly_widget(list(data = list(list(type = "bar", x = 1:3, y = c(2, 5, 3)))))
plotly_widget <- function(fig, width = NULL, height = NULL, elementId = NULL, config = NULL) {
  layout <- unclass(fig$layout %||% list())
  if (is.null(layout$template)) {
    tpl <- default_template()
    if (!identical(tpl, "none")) layout$template <- get_template(tpl)
  }
  if (!length(layout)) layout <- structure(list(), names = character())
  setting <- function(name) attr(fig, paste0("plotly_", name), exact = TRUE) %||% fig[[name]]
  cfg <- utils::modifyList(setting("config") %||% list(), config %||% list())
  x <- list(
    data = unname(fig$data %||% list()),
    layout = layout,
    frames = unname(fig$frames %||% list()),
    config = if (length(cfg)) cfg else structure(list(), names = character()),
    source = setting("source") %||% "A",
    shinyEvents = I(setting("shinyEvents") %||% DEFAULT_EVENTS)
  )
  for (k in c("keys", "sets", "frameKeys", "highlight", "fitBounds")) {
    if (!is.null(setting(k))) x[[k]] <- setting(k)
  }
  if (!is.null(setting("selectize"))) x$selectize <- lp_selectize_json(setting("selectize"))
  attr(x, "TOJSON_FUNC") <- to_JSON
  deps <- list()
  if (!is.null(cfg$locale) && cfg$locale != "en") deps <- c(deps, list(locale_dependency(cfg$locale)))
  if (identical(setting("mathjax"), "cdn")) deps <- c(deps, list(mathjax_dependency()))
  if (!is.null(x$sets)) deps <- c(deps, lp_crosstalk_deps(x$highlight))
  htmlwidgets::createWidget(
    name = "plotly_R_core",
    x = x,
    width = width %||% layout$width,
    height = height %||% layout$height,
    package = "plotly.R.core",
    elementId = elementId,
    dependencies = deps,
    sizingPolicy = htmlwidgets::sizingPolicy(
      browser.fill = TRUE,
      padding = 0,
      defaultWidth = "100%",
      defaultHeight = 400
    )
  )
}

#' @rdname plotly_widget
#' @export
as_widget <- function(x, ...) {
  if (inherits(x, "htmlwidget") && !is_legacy_plot(x)) return(x)
  if (is_legacy_plot(x)) return(legacy_widget(x, ...))
  plotly_widget(x, ...)
}

locale_dependency <- function(locale) {
  htmltools::htmlDependency(
    name = paste0("plotly-locale-", locale), version = plotlyjs_version(),
    src = "htmlwidgets/lib/plotlyjs/locales", script = paste0(locale, ".js"),
    package = "plotly.R.core", all_files = FALSE
  )
}

mathjax_dependency <- function() {
  htmltools::htmlDependency(
    name = "mathjax", version = "2.7.5",
    src = c(href = "https://cdn.jsdelivr.net/npm/mathjax@2.7.5"),
    script = "MathJax.js?config=TeX-AMS-MML_SVG"
  )
}

# JSON serialiser used by the widget: length-1 vectors become scalars and
# missing values become null, matching what plotly.js expects.
to_JSON <- function(x, ...) {
  jsonlite::toJSON(
    prepare_json(x), digits = NA, auto_unbox = TRUE, force = TRUE,
    null = "null", na = "null", dataframe = "values", ...
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
