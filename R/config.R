# Figure-level widget settings (config, event source, registered events,
# linked-highlighting options).
#
# For go_figure objects the settings are stored as attributes
# ("plotly_config", "plotly_source", ...); htmlwidgets (including the plotly
# package's plot_ly() objects) store them in p$x.

get_widget_setting <- function(p, name) {
  if (inherits(p, "htmlwidget")) {
    p$x[[name]]
  } else {
    attr(p, paste0("plotly_", name), exact = TRUE)
  }
}

#' @rdname plotly.core-extending
#' @export
set_widget_setting <- function(p, name, value) {
  if (inherits(p, "htmlwidget")) {
    p$x[[name]] <- value
  } else {
    check_figure(p)
    attr(p, paste0("plotly_", name)) <- value
  }
  p
}

#' Set plotly.js configuration options
#'
#' Sets options of the plotly.js `config` object (e.g. `displayModeBar`,
#' `scrollZoom`, `toImageButtonOptions`), which control interaction rather
#' than appearance. Options are merged with any set previously.
#' `config()` is an S3 generic, so packages can handle options of their own
#' plot classes before the default method validates them.
#'
#' @param p A [go_figure()] or plotly htmlwidget.
#' @param ... Named configuration options; see
#'   <https://plotly.com/javascript/configuration-options/>.
#' @param locale A locale such as `"de"` or `"fr-ch"`, for translated
#'   modebar text and number/date formatting.
#' @param mathjax Load MathJax so LaTeX in `$...$` text (see [TeX()]) is
#'   rendered: `"local"` (or `TRUE`) for the MathJax 3 bundled with the
#'   package, which works offline and is embedded in self-contained HTML
#'   (about 2 MB), or `"cdn"` to load it from cdn.jsdelivr.net. A figure
#'   with TeX gets the bundled MathJax without this.
#' @param cloud,showSendToCloud Show the modebar button that sends the chart
#'   to Plotly Cloud (`plotlyServerURL`)? Off by default, because clicking it
#'   uploads the chart data to an external server. `cloud` is the legacy
#'   plotly package's name for it.
#' @return The modified figure.
#' @export
#' @examples
#' go_figure(go_scatter(y = 1:3)) |>
#'   config(displayModeBar = FALSE, scrollZoom = TRUE, locale = "de")
config <- function(p, ...) UseMethod("config")

#' @rdname config
#' @export
config.default <- function(
  p,
  ...,
  locale = NULL,
  mathjax = NULL,
  cloud = FALSE,
  showSendToCloud = cloud
) {
  opts <- list(...)
  if (length(opts) && (is.null(names(opts)) || any(!nzchar(names(opts))))) {
    stop("All config options must be named", call. = FALSE)
  }
  bad <- setdiff(names(opts), .config_options)
  if (length(bad)) {
    stop(
      sprintf(
        "Invalid config option(s): %s\n    Valid options: %s",
        paste(bad, collapse = ", "),
        paste(.config_options, collapse = ", ")
      ),
      call. = FALSE
    )
  }
  if (!is.null(locale)) {
    # plotly.js locale names are lower case ("zh-cn"); "zh-CN" also works
    if (
      !locale %in% available_locales() &&
        tolower(locale) %in% available_locales()
    ) {
      locale <- tolower(locale)
    }
    if (!locale %in% available_locales()) {
      stop(
        sprintf(
          "Unknown locale '%s'. Available locales: %s",
          locale,
          paste(available_locales(), collapse = ", ")
        ),
        call. = FALSE
      )
    }
    opts$locale <- locale
  }
  if (!is.null(mathjax)) {
    if (isTRUE(mathjax)) {
      mathjax <- "local"
    }
    if (
      !is.character(mathjax) ||
        length(mathjax) != 1L ||
        !mathjax %in% c("local", "cdn")
    ) {
      stop("`mathjax` must be \"local\" (or TRUE) or \"cdn\"", call. = FALSE)
    }
    p <- set_widget_setting(p, "mathjax", mathjax)
  }
  if (!missing(cloud) || !missing(showSendToCloud)) {
    opts$showSendToCloud <- isTRUE(showSendToCloud)
  }
  current <- get_widget_setting(p, "config") %||% list()
  set_widget_setting(p, "config", utils::modifyList(current, opts))
}

available_locales <- function() {
  sub(
    "[.]js$",
    "",
    list.files(
      system.file(
        "htmlwidgets",
        "lib",
        "plotlyjs",
        "locales",
        package = "plotly.core"
      ),
      "[.]js$"
    )
  )
}

#' Set the source id of a plot's events
#'
#' Sets the source id that [event_data()] uses to tell plots apart (default
#' `"A"`); the plotly package sets it with the `source` argument of
#' `plot_ly()`.
#'
#' @param p A [go_figure()] or plotly htmlwidget.
#' @param source A string identifying the plot.
#' @return The modified figure.
#' @seealso [event_register()], [event_unregister()]
#' @export
#' @examples
#' fig <- go_figure(go_scatter(y = 1:3)) |>
#'   event_source("scatter") |>
#'   event_register("plotly_legendclick")
event_source <- function(p, source) {
  if (!is.character(source) || length(source) != 1L) {
    stop("`source` must be a single string", call. = FALSE)
  }
  set_widget_setting(p, "source", source)
}
