# Modify a plotly figure in Shiny without re-rendering it

`plotlyProxy()` refers to a plot rendered with
[`renderPlotly()`](https://msummersgill.github.io/plotly.R.core/reference/plotlyOutput.md);
`plotlyProxyInvoke()` calls a plotly.js function on it, e.g.
`"restyle"`, `"relayout"`, `"update"`, `"addTraces"`, `"deleteTraces"`,
`"extendTraces"` or `"animate"`. Arguments are passed to the plotly.js
function after the plot element (see
<https://plotly.com/javascript/plotlyjs-function-reference/>);
`"reconfig"` sets a new `config`.

## Usage

``` r
plotlyProxy(
  outputId,
  session = shiny::getDefaultReactiveDomain(),
  deferUntilFlush = TRUE
)

plotlyProxyInvoke(p, method, ...)
```

## Arguments

- outputId:

  The output id of the plot.

- session:

  The Shiny session.

- deferUntilFlush:

  Send the message after Shiny's next flush (so the plot exists).

- p:

  A proxy from `plotlyProxy()`.

- method:

  A plotly.js function name.

- ...:

  Arguments to the plotly.js function. Graph objects and data frames are
  serialised like figures (data frames as rows).

## Value

The proxy, invisibly for `plotlyProxyInvoke()`.

## Examples

``` r
if (interactive() && requireNamespace("shiny", quietly = TRUE)) {
  ui <- shiny::fluidPage(shiny::actionButton("add", "Add a point"), plotlyOutput("plot"))
  server <- function(input, output, session) {
    output$plot <- renderPlotly(go_figure(go_scatter(y = c(1, 3, 2))))
    shiny::observeEvent(input$add, {
      plotlyProxy("plot", session) |>
        plotlyProxyInvoke("extendTraces", list(y = list(list(stats::runif(1)))), list(0))
    })
  }
  shiny::shinyApp(ui, server)
}
```
