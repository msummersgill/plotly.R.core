#' Modify a plotly object inside a shiny app
#'
#' @param outputId single-element character vector indicating the output ID
#'   map to modify (if invoked from a Shiny module, the namespace will be added
#'   automatically)
#' @param session the Shiny session object to which the map belongs; usually the
#'   default value will suffice.
#' @param deferUntilFlush indicates whether actions performed against this
#'   instance should be carried out right away, or whether they should be held
#'   until after the next time all of the outputs are updated.
#' @return `plotlyProxy()` returns a proxy object; `plotlyProxyInvoke()`
#'   returns it invisibly.
#' @rdname plotlyProxy
#' @export
#' @author Carson Sievert
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
  # implementation very similar to leaflet::leafletProxy & DT:dataTableProxy
  if (is.null(session)) {
    stop("plotlyProxy must be called from the server function of a Shiny app")
  }

  if (
    !is.null(session$ns) &&
      nzchar(session$ns(NULL)) &&
      !startsWith(outputId, session$ns(""))
  ) {
    outputId <- session$ns(outputId)
  }
  structure(
    list(
      session = session,
      id = outputId,
      deferUntilFlush = deferUntilFlush
      # TODO: is there actually a use-case for this?
      #x = structure(list(), leafletData = data),
      #dependencies = NULL
    ),
    class = "plotly_proxy"
  )
}


# ----------------------------------------------------------------------
# TODO: implement some higher-level functions, say `plotlyProxyLayout()`,
# `plotlyProxyAddTraces()`, `plotlyProxyStyle()`, that pick the right
# method, except formula/data mappings, and possibly some argument checking
# ----------------------------------------------------------------------

#' @param p a plotly proxy object (created with `plotlyProxy`)
#' @param method a plotlyjs method to invoke. For a list of options,
#' visit <https://plotly.com/javascript/plotlyjs-function-reference/>
#' @param ... unnamed arguments passed onto the plotly.js method. Graph
#'   objects and data frames are serialised as in figures (data frames as
#'   rows).
#' @rdname plotlyProxy
#' @export
#' @author Carson Sievert
plotlyProxyInvoke <- function(p, method, ...) {
  if (!is.proxy(p)) {
    stop("p must be a proxy object. See `help(plotlyProxy)`", call. = FALSE)
  }

  if (missing(method)) {
    stop(
      "Must provide a plotly.js method (as a character string of length 1).\n",
      sprintf(
        "Valid options include: '%s'",
        paste(plotlyjs_methods(), collapse = "', '")
      ),
      call. = FALSE
    )
  }

  method <- match.arg(method, plotlyjs_methods())

  # Graph objects are classed lists: unclass them and serialise the
  # arguments with the figure's JSON writer (typed arrays, data frames as
  # rows), as plotly.js receives figures
  args <- lapply(list(...), function(a) {
    if (inherits(a, "plotly_obj")) unclass(a) else a
  })
  msg <- list(
    id = p$id,
    method = method,
    args = as.character(to_JSON(unname(args)))
  )

  if (isTRUE(p$deferUntilFlush)) {
    p$session$onFlushed(
      function() {
        p$session$sendCustomMessage("plotly-calls", msg)
      },
      once = TRUE
    )
  } else {
    p$session$sendCustomMessage("plotly-calls", msg)
  }

  invisible(p)
}


plotlyjs_methods <- function() {
  c(
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
}


is.proxy <- function(x) {
  inherits(x, "plotly_proxy")
}
