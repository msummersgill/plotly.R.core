# Access plotly events in Shiny

Returns the data of the most recent plotly event of a given type, from
the plot with the given `source` (see
[`event_source()`](https://msummersgill.github.io/plotly.R.core/reference/event_register.md));
`NULL` before any such event. Must be called in a reactive context of a
Shiny app.

## Usage

``` r
event_data(
  event = c("plotly_hover", "plotly_unhover", "plotly_click", "plotly_doubleclick",
    "plotly_selected", "plotly_selecting", "plotly_brushed", "plotly_brushing",
    "plotly_deselect", "plotly_relayout", "plotly_restyle", "plotly_legendclick",
    "plotly_legenddoubleclick", "plotly_clickannotation", "plotly_afterplot",
    "plotly_sunburstclick"),
  source = "A",
  session = shiny::getDefaultReactiveDomain(),
  priority = c("input", "event")
)
```

## Arguments

- event:

  The event type.

- source:

  The source id of the plot.

- session:

  The Shiny session.

- priority:

  `"input"` (default) triggers reactivity only when the value changes;
  `"event"` on every event, even with the same value.

## Value

Event data, or `NULL`.

## Details

Point events (click, hover, selected, ...) return a data frame with
`curveNumber`, `pointNumber`, `x`, `y` and, where available, `z`,
`customdata` and `key`. `plotly_relayout` returns the changed layout
properties (e.g. axis ranges after zooming).

## Examples

``` r
if (interactive() && requireNamespace("shiny", quietly = TRUE)) {
  ui <- shiny::fluidPage(plotlyOutput("plot"), shiny::verbatimTextOutput("click"))
  server <- function(input, output, session) {
    output$plot <- renderPlotly(px_data_iris() |> px_scatter(x = ~sepal_width, y = ~sepal_length))
    output$click <- shiny::renderPrint(event_data("plotly_click"))
  }
  shiny::shinyApp(ui, server)
}
```
