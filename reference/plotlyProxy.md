# Modify a plotly object inside a shiny app

Modify a plotly object inside a shiny app

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

  single-element character vector indicating the output ID map to modify
  (if invoked from a Shiny module, the namespace will be added
  automatically)

- session:

  the Shiny session object to which the map belongs; usually the default
  value will suffice.

- deferUntilFlush:

  indicates whether actions performed against this instance should be
  carried out right away, or whether they should be held until after the
  next time all of the outputs are updated.

- p:

  a plotly proxy object (created with `plotlyProxy`)

- method:

  a plotlyjs method to invoke. For a list of options, visit
  <https://plotly.com/javascript/plotlyjs-function-reference/>

- ...:

  unnamed arguments passed onto the plotly.js method. Graph objects and
  data frames are serialised as in figures (data frames as rows).

## Value

`plotlyProxy()` returns a proxy object; `plotlyProxyInvoke()` returns it
invisibly.

## Author

Carson Sievert

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
