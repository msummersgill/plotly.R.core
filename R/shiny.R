# Shiny integration and figure-level widget settings (config, event source,
# registered events). The functions match the legacy plotly R package's.
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
#' @param mathjax `"cdn"` to load MathJax from a CDN so LaTeX in `$...$`
#'   text (see [TeX()]) is rendered.
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
    if (!identical(mathjax, "cdn")) {
      stop("Only `mathjax = \"cdn\"` is supported", call. = FALSE)
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

#' Wrap text for LaTeX rendering
#'
#' Wraps a string in `$...$` so plotly.js renders it with MathJax (requires
#' `config(p, mathjax = "cdn")`).
#'
#' @param x A character string of LaTeX.
#' @return The wrapped string.
#' @export
#' @examples
#' go_figure() |>
#'   update_layout(title = TeX("\\alpha + \\beta x")) |>
#'   config(mathjax = "cdn")
TeX <- function(x) paste0("$", x, "$")

# Shiny events -----------------------------------------------------------------------

EVENT_NAMES <- c(
  "plotly_hover",
  "plotly_unhover",
  "plotly_click",
  "plotly_doubleclick",
  "plotly_selected",
  "plotly_selecting",
  "plotly_brushed",
  "plotly_brushing",
  "plotly_deselect",
  "plotly_relayout",
  "plotly_restyle",
  "plotly_legendclick",
  "plotly_legenddoubleclick",
  "plotly_clickannotation",
  "plotly_afterplot",
  "plotly_sunburstclick"
)

DEFAULT_EVENTS <- c(
  "plotly_hover",
  "plotly_click",
  "plotly_selected",
  "plotly_relayout",
  "plotly_brushed",
  "plotly_brushing",
  "plotly_clickannotation",
  "plotly_doubleclick",
  "plotly_deselect",
  "plotly_afterplot",
  "plotly_sunburstclick"
)

#' Register plotly events for Shiny
#'
#' Plots send these events to Shiny by default: `plotly_hover`,
#' `plotly_click`, `plotly_selected`, `plotly_relayout`, `plotly_brushed`,
#' `plotly_brushing`, `plotly_clickannotation`, `plotly_doubleclick`,
#' `plotly_deselect`, `plotly_afterplot` and `plotly_sunburstclick`.
#' `event_register()` adds others (e.g. `plotly_legendclick`);
#' `event_unregister()` removes events. `event_source()` sets the source id
#' that [event_data()] uses to tell plots apart (default `"A"`).
#'
#' @param p A [go_figure()] or plotly htmlwidget.
#' @param event An event name (see [event_data()]).
#' @param source A string identifying the plot.
#' @return The modified figure.
#' @export
#' @examples
#' fig <- go_figure(go_scatter(y = 1:3)) |>
#'   event_source("scatter") |>
#'   event_register("plotly_legendclick")
event_register <- function(p, event = NULL) {
  event <- match.arg(event, EVENT_NAMES)
  set_widget_setting(
    p,
    "shinyEvents",
    unique(c(get_widget_setting(p, "shinyEvents") %||% DEFAULT_EVENTS, event))
  )
}

#' @rdname event_register
#' @export
event_unregister <- function(p, event = NULL) {
  event <- match.arg(event, EVENT_NAMES)
  set_widget_setting(
    p,
    "shinyEvents",
    setdiff(get_widget_setting(p, "shinyEvents") %||% DEFAULT_EVENTS, event)
  )
}

#' @rdname event_register
#' @export
event_source <- function(p, source) {
  if (!is.character(source) || length(source) != 1L) {
    stop("`source` must be a single string", call. = FALSE)
  }
  set_widget_setting(p, "source", source)
}

#' Access plotly events in Shiny
#'
#' Returns the data of the most recent plotly event of a given type, from
#' the plot with the given `source` (see [event_source()]); `NULL` before any
#' such event. Must be called in a reactive context of a Shiny app.
#'
#' Point events (click, hover, selected, ...) return a data frame with
#' `curveNumber`, `pointNumber`, `x`, `y` and, where available, `z`,
#' `customdata` and `key`. `plotly_relayout` returns the changed layout
#' properties (e.g. axis ranges after zooming).
#'
#' @param event The event type.
#' @param source The source id of the plot.
#' @param session The Shiny session.
#' @param priority `"input"` (default) triggers reactivity only when the
#'   value changes; `"event"` on every event, even with the same value.
#' @return Event data, or `NULL`.
#' @export
#' @examples
#' if (interactive() && requireNamespace("shiny", quietly = TRUE)) {
#'   ui <- shiny::fluidPage(plotlyOutput("plot"), shiny::verbatimTextOutput("click"))
#'   server <- function(input, output, session) {
#'     output$plot <- renderPlotly(px_data_iris() |> px_scatter(x = ~sepal_width, y = ~sepal_length))
#'     output$click <- shiny::renderPrint(event_data("plotly_click"))
#'   }
#'   shiny::shinyApp(ui, server)
#' }
event_data <- function(
  event = c(
    "plotly_hover",
    "plotly_unhover",
    "plotly_click",
    "plotly_doubleclick",
    "plotly_selected",
    "plotly_selecting",
    "plotly_brushed",
    "plotly_brushing",
    "plotly_deselect",
    "plotly_relayout",
    "plotly_restyle",
    "plotly_legendclick",
    "plotly_legenddoubleclick",
    "plotly_clickannotation",
    "plotly_afterplot",
    "plotly_sunburstclick"
  ),
  source = "A",
  session = shiny::getDefaultReactiveDomain(),
  priority = c("input", "event")
) {
  if (is.null(session)) {
    stop(
      "No reactive domain detected. This function can only be called \nfrom within a reactive shiny context.",
      call. = FALSE
    )
  }
  event <- match.arg(event)
  event_id <- paste(event, source, sep = "-")
  session$onFlushed(function() {
    if (!event_id %in% session$userData$plotlyShinyEventIDs) {
      warning(
        "The '",
        event,
        "' event tied a source ID of '",
        source,
        "' is not registered. ",
        "In order to obtain this event data, please add `event_register(p, '",
        event,
        "')` to the plot (`p`) that you wish to obtain event data from.",
        call. = FALSE
      )
    }
  })
  parse <- if (event %in% c("plotly_legendclick", "plotly_legenddoubleclick")) {
    function(x) jsonlite::parse_json(x, simplifyVector = FALSE)
  } else {
    function(x) jsonlite::parse_json(x, simplifyVector = TRUE)
  }
  parsed_input <- function() {
    v <- session$rootScope()$input[[event_id]]
    if (is.null(v)) v else parse(v)
  }
  priority <- if (
    event %in% c("plotly_doubleclick", "plotly_deselect", "plotly_afterplot")
  ) {
    "event"
  } else {
    match.arg(priority)
  }
  if (priority == "event") {
    return(parsed_input())
  }
  store <- session$userData$plotlyInputStore
  if (!event_id %in% shiny::isolate(names(store))) {
    session$userData$plotlyInputStore <- store %||% shiny::reactiveValues()
    session$userData$plotlyInputStore[[
      event_id
    ]] <- shiny::isolate(parsed_input())
    shiny::observe(
      {
        session$userData$plotlyInputStore[[event_id]] <- parsed_input()
      },
      priority = 10000,
      domain = session
    )
  }
  session$userData$plotlyInputStore[[event_id]]
}

#' Shiny bindings for plotly figures
#'
#' `plotlyOutput()` creates a plot output element in a Shiny UI;
#' `renderPlotly()` renders a [go_figure()], a figure from a `px_*()`
#' function or a plotly htmlwidget (or a promise of one) into it.
#'
#' @param outputId Output variable to read the plot from.
#' @param width,height Size of the plot output, as a valid CSS unit (e.g.
#'   `"100%"`, `"400px"`).
#' @param inline Use an inline (`span()`) container instead of a block one.
#' @param reportTheme Report CSS colors and fonts to the server (see
#'   [shiny::getCurrentOutputInfo()]).
#' @param fill Whether the plot fills its container in fillable layouts.
#' @param expr An expression that returns a figure.
#' @param env The environment in which to evaluate `expr`.
#' @param quoted Is `expr` a quoted expression?
#' @return `plotlyOutput()` returns a Shiny UI element; `renderPlotly()` a
#'   Shiny render function.
#' @seealso [event_data()], [plotlyProxy()]
#' @export
plotlyOutput <- function(
  outputId,
  width = "100%",
  height = "400px",
  inline = FALSE,
  reportTheme = TRUE,
  fill = !inline
) {
  htmlwidgets::shinyWidgetOutput(
    outputId,
    name = "plotly_core",
    width = width,
    height = height,
    package = "plotly.core",
    inline = inline,
    reportSize = TRUE,
    reportTheme = reportTheme,
    fill = fill
  )
}

#' @rdname plotlyOutput
#' @export
renderPlotly <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    quoted <- TRUE
    expr <- substitute(expr)
  }
  shiny::installExprFunction(expr, "func", env, quoted)
  expr2 <- quote(getFromNamespace(
    "prepare_shiny_widget",
    "plotly.core"
  )(func()))
  htmlwidgets::shinyRenderWidget(
    expr2,
    plotlyOutput,
    environment(),
    quoted,
    cacheHint = list(label = "renderPlotly", userExpr = expr)
  )
}

# Turn a figure (or a promise of one) into a widget and record its events so
# event_data() can warn about unregistered ones. promises is a Suggests: it is
# always installed with shiny, and this only runs inside renderPlotly().
prepare_shiny_widget <- function(x) {
  register <- function(fig) {
    w <- as_widget(fig)
    session <- shiny::getDefaultReactiveDomain()
    if (!is.null(session)) {
      ids <- paste(w$x$shinyEvents, w$x$source, sep = "-")
      session$userData$plotlyShinyEventIDs <- unique(c(
        session$userData$plotlyShinyEventIDs,
        ids
      ))
    }
    w
  }
  if (promises::is.promising(x)) promises::then(x, register) else register(x)
}

# Proxies ------------------------------------------------------------------------------

#' Modify a plotly figure in Shiny without re-rendering it
#'
#' `plotlyProxy()` refers to a plot rendered with [renderPlotly()];
#' `plotlyProxyInvoke()` calls a plotly.js function on it, e.g.
#' `"restyle"`, `"relayout"`, `"update"`, `"addTraces"`, `"deleteTraces"`,
#' `"extendTraces"` or `"animate"`. Arguments are passed to the plotly.js
#' function after the plot element (see
#' <https://plotly.com/javascript/plotlyjs-function-reference/>);
#' `"reconfig"` sets a new `config`.
#'
#' @param outputId The output id of the plot.
#' @param session The Shiny session.
#' @param deferUntilFlush Send the message after Shiny's next flush (so the
#'   plot exists).
#' @param p A proxy from `plotlyProxy()`.
#' @param method A plotly.js function name.
#' @param ... Arguments to the plotly.js function. Graph objects and data
#'   frames are serialised like figures (data frames as rows).
#' @return The proxy, invisibly for `plotlyProxyInvoke()`.
#' @export
#' @examples
#' if (interactive() && requireNamespace("shiny", quietly = TRUE)) {
#'   ui <- shiny::fluidPage(shiny::actionButton("add", "Add a point"), plotlyOutput("plot"))
#'   server <- function(input, output, session) {
#'     output$plot <- renderPlotly(go_figure(go_scatter(y = c(1, 3, 2))))
#'     shiny::observeEvent(input$add, {
#'       plotlyProxy("plot", session) |>
#'         plotlyProxyInvoke("extendTraces", list(y = list(list(stats::runif(1)))), list(0))
#'     })
#'   }
#'   shiny::shinyApp(ui, server)
#' }
plotlyProxy <- function(
  outputId,
  session = shiny::getDefaultReactiveDomain(),
  deferUntilFlush = TRUE
) {
  if (is.null(session)) {
    stop(
      "plotlyProxy must be called from the server function of a Shiny app",
      call. = FALSE
    )
  }
  if (
    !is.null(session$ns) &&
      nzchar(session$ns(NULL)) &&
      !startsWith(outputId, session$ns(""))
  ) {
    outputId <- session$ns(outputId)
  }
  structure(
    list(session = session, id = outputId, deferUntilFlush = deferUntilFlush),
    class = "plotly_proxy"
  )
}

PLOTLYJS_METHODS <- c(
  "restyle",
  "relayout",
  "update",
  "addTraces",
  "deleteTraces",
  "moveTraces",
  "extendTraces",
  "prependTraces",
  "purge",
  "toImage",
  "downloadImage",
  "animate",
  "newPlot",
  "react",
  "validate",
  "makeTemplate",
  "validateTemplate",
  "addFrames",
  "reconfig"
)

#' @rdname plotlyProxy
#' @export
plotlyProxyInvoke <- function(p, method, ...) {
  if (!inherits(p, "plotly_proxy")) {
    stop("p must be a proxy object. See `help(plotlyProxy)`", call. = FALSE)
  }
  if (missing(method)) {
    stop(
      "Must provide a plotly.js method (as a character string of length 1).\n",
      sprintf(
        "Valid options include: '%s'",
        paste(PLOTLYJS_METHODS, collapse = "', '")
      ),
      call. = FALSE
    )
  }
  method <- match.arg(method, PLOTLYJS_METHODS)
  args <- lapply(list(...), function(a) {
    if (inherits(a, "plotly_obj")) unclass(a) else a
  })
  msg <- list(
    id = p$id,
    method = method,
    args = as.character(to_JSON(unname(args)))
  )
  send <- function() p$session$sendCustomMessage("plotly-calls", msg)
  if (isTRUE(p$deferUntilFlush)) {
    p$session$onFlushed(send, once = TRUE)
  } else {
    send()
  }
  invisible(p)
}
