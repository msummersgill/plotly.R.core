#' Shiny bindings for plotly
#'
#' Output and render functions for using plotly within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{"100\%"},
#'   `"400px"`, `"auto"`) or a number, which will be coerced to a
#'   string and have `"px"` appended. Note that, for height, using "auto"
#'   or "100%" generally will not work as expected, because of how
#'   height is computed with HTML/CSS.
#' @param inline use an inline (`span()`) or block container
#' (`div()`) for the output
#' @param reportTheme whether or not to report CSS styles.
#' @param expr An expression that generates a [go_figure()] or a plotly
#'   htmlwidget (or a promise of one)
#' @param env The environment in which to evaluate `expr`.
#' @param quoted Is `expr` a quoted expression (with `quote()`)? This
#'   is useful if you want to save an expression in a variable.
#' @param fill see [htmlwidgets::shinyWidgetOutput()] for explanation.
#' @return `plotlyOutput()` returns a Shiny UI element; `renderPlotly()` a
#'   Shiny render function.
#' @seealso [event_data()], [plotlyProxy()]
#' @name plotly-shiny
#' @author Carson Sievert
#'
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
    outputId = outputId,
    name = "plotly_core",
    width = width,
    height = height,
    inline = inline,
    package = "plotly.core",
    reportSize = TRUE,
    reportTheme = reportTheme,
    fill = fill
  )
}

#' @rdname plotly-shiny
#' @export
renderPlotly <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    quoted <- TRUE
    expr <- substitute(expr)
  }
  # Install the (user-supplied) expression as a function
  # This way, if the user-supplied expression contains a return()
  # statement, we can capture that return value and pass it along
  # to prepareWidget()
  # prepareWidget() makes it possible to pass different objects to
  # renderPlotly() (e.g., go_figure(), htmlwidgets, promises). It also is used
  # to inform event_data about what events have been registered
  shiny::installExprFunction(expr, "func", env, quoted)
  expr2 <- quote(getFromNamespace("prepareWidget", "plotly.core")(func()))
  htmlwidgets::shinyRenderWidget(
    expr2,
    plotlyOutput,
    environment(),
    quoted,
    cacheHint = list(label = "renderPlotly", userExpr = expr)
  )
}

# Converts a plot, OR a promise of a plot, to a plotly.core widget.
# promises is a Suggests: it is always installed with shiny, and this only
# runs inside renderPlotly().
prepareWidget <- function(x) {
  if (promises::is.promising(x)) {
    promises::then(
      promises::then(x, as_widget),
      register_plot_events
    )
  } else {
    register_plot_events(as_widget(x))
  }
}

register_plot_events <- function(p) {
  session <- shiny::getDefaultReactiveDomain()
  eventIDs <- paste(p$x$shinyEvents, p$x$source, sep = "-")
  session$userData$plotlyShinyEventIDs <- unique(c(
    session$userData$plotlyShinyEventIDs,
    eventIDs
  ))
  p
}


#' Access plotly user input event data in shiny
#'
#' This function must be called within a reactive shiny context.
#'
#' @param event The type of plotly event. All supported events are listed in the
#' function signature above (i.e., the usage section).
#' @param source a character string of length 1. Match the value of this string
#' with the source id set with [event_source()] to respond to
#' events emitted from that specific plot.
#' @param session a shiny session object (the default should almost always be used).
#' @param priority the priority of the corresponding shiny input value.
#' If equal to `"event"`, then [event_data()] always triggers re-execution,
#' instead of re-executing only when the relevant shiny input value changes
#' (the default).
#' @return Event data, or `NULL` before any such event. Point events (click,
#'   hover, selected, ...) return a data frame with `curveNumber`,
#'   `pointNumber`, `x`, `y` and, where available, `z`, `customdata` and
#'   `key`; `plotly_relayout` returns the changed layout properties.
#' @export
#' @seealso [event_register], [event_unregister]
#' @references
#'   * <https://plotly-r.com/linking-views-with-shiny.html#shiny-plotly-inputs>
#'   * <https://plotly.com/javascript/plotlyjs-function-reference/>
#' @author Carson Sievert
#' @examples
#' if (interactive() && requireNamespace("shiny", quietly = TRUE)) {
#'   ui <- shiny::fluidPage(plotlyOutput("plot"), shiny::verbatimTextOutput("click"))
#'   server <- function(input, output, session) {
#'     output$plot <- renderPlotly(
#'       iris |> go_figure() |> add_scatter(x = ~Sepal.Width, y = ~Sepal.Length, mode = "markers")
#'     )
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
      "No reactive domain detected. This function can only be called \n",
      "from within a reactive shiny context."
    )
  }

  event <- match.arg(event)
  eventID <- paste(event, source, sep = "-")

  # It's possible for event_data() to execute before any
  # relevant input values have been registered (i.e, before
  # relevant plotly graphs have been executed). Therefore,
  # we delay checking that a relevant input value has been
  # registered until shiny flushes
  session$onFlushed(
    function() {
      eventIDRegistered <- eventID %in% session$userData$plotlyShinyEventIDs
      if (!eventIDRegistered) {
        warning(
          "The '",
          event,
          "' event tied a source ID of '",
          source,
          "' ",
          "is not registered. In order to obtain this event data, ",
          "please add `event_register(p, '",
          event,
          "')` to the plot (`p`) ",
          "that you wish to obtain event data from.",
          call. = FALSE
        )
      }
    }
  )

  # legend clicking returns trace(s), which shouldn't be simplified...
  parseJSON <- if (
    event %in% c("plotly_legendclick", "plotly_legenddoubleclick")
  ) {
    function(x) jsonlite::parse_json(x, simplifyVector = FALSE)
  } else {
    function(x) jsonlite::parse_json(x, simplifyVector = TRUE)
  }

  # Handle NULL sensibly
  parseJSONVal <- function(x) {
    if (is.null(x)) x else parseJSON(x)
  }

  parsedInputValue <- function() {
    parseJSONVal(session$rootScope()$input[[eventID]])
  }

  # events that don't emit any data should _always_ be treated with event priority
  priority <- if (
    event %in% c("plotly_doubleclick", "plotly_deselect", "plotly_afterplot")
  ) {
    "event"
  } else {
    match.arg(priority)
  }

  if (priority == "event") {
    # Shiny.setInputValue() is always called with event priority
    # so simply return the parse input value
    return(parsedInputValue())
  } else {
    eventHasStorage <- eventID %in%
      shiny::isolate(names(session$userData$plotlyInputStore))

    if (!eventHasStorage) {
      # store input value as a reactive value to leverage caching
      session$userData$plotlyInputStore <- session$userData$plotlyInputStore %||%
        shiny::reactiveValues()
      session$userData$plotlyInputStore[[eventID]] <- shiny::isolate(
        parsedInputValue()
      )
      shiny::observe(
        {
          session$userData$plotlyInputStore[[eventID]] <- parsedInputValue()
        },
        priority = 10000,
        domain = session
      )
    }

    session$userData$plotlyInputStore[[eventID]]
  }
}


#' Register a shiny input value
#'
#' @inheritParams event_data
#' @param p a [go_figure()] or plotly htmlwidget.
#' @return The modified figure.
#' @seealso [event_data]
#' @export
#' @author Carson Sievert
event_register <- function(p, event = NULL) {
  event <- match.arg(event, event_data_events())
  shiny_event_add(p, event)
}

#' Un-register a shiny input value
#'
#' @inheritParams event_data
#' @param p a [go_figure()] or plotly htmlwidget.
#' @return The modified figure.
#' @seealso [event_data]
#' @export
#' @author Carson Sievert
event_unregister <- function(p, event = NULL) {
  event <- match.arg(event, event_data_events())
  shiny_event_remove(p, event)
}


# helpers
# Figures keep the registered events as a widget setting (see
# get_widget_setting()); htmlwidgets in p$x$shinyEvents, as plotly does

shiny_event_add <- function(p, event) {
  p <- shiny_defaults_set(p)
  set_widget_setting(
    p,
    "shinyEvents",
    unique(c(get_widget_setting(p, "shinyEvents"), event))
  )
}

shiny_event_remove <- function(p, event) {
  p <- shiny_defaults_set(p)
  set_widget_setting(
    p,
    "shinyEvents",
    setdiff(get_widget_setting(p, "shinyEvents"), event)
  )
}

shiny_defaults_set <- function(p) {
  set_widget_setting(
    p,
    "shinyEvents",
    get_widget_setting(p, "shinyEvents") %||% shiny_event_defaults()
  )
}

shiny_event_defaults <- function() {
  c(
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
}

event_data_events <- function() {
  eval(formals(event_data)$event)
}
