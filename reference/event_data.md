# Access plotly user input event data in shiny

This function must be called within a reactive shiny context.

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

  The type of plotly event. All supported events are listed in the
  function signature above (i.e., the usage section).

- source:

  a character string of length 1. Match the value of this string with
  the source id set with
  [`event_source()`](https://msummersgill.github.io/plotly.R.core/reference/event_source.md)
  to respond to events emitted from that specific plot.

- session:

  a shiny session object (the default should almost always be used).

- priority:

  the priority of the corresponding shiny input value. If equal to
  `"event"`, then `event_data()` always triggers re-execution, instead
  of re-executing only when the relevant shiny input value changes (the
  default).

## Value

Event data, or `NULL` before any such event. Point events (click, hover,
selected, ...) return a data frame with `curveNumber`, `pointNumber`,
`x`, `y` and, where available, `z`, `customdata` and `key`;
`plotly_relayout` returns the changed layout properties.

## References

- <https://plotly-r.com/linking-views-with-shiny.html#shiny-plotly-inputs>

- <https://plotly.com/javascript/plotlyjs-function-reference/>

## See also

[event_register](https://msummersgill.github.io/plotly.R.core/reference/event_register.md),
[event_unregister](https://msummersgill.github.io/plotly.R.core/reference/event_unregister.md)

## Author

Carson Sievert

## Examples

``` r
if (interactive() && requireNamespace("shiny", quietly = TRUE)) {
  ui <- shiny::fluidPage(plotlyOutput("plot"), shiny::verbatimTextOutput("click"))
  server <- function(input, output, session) {
    output$plot <- renderPlotly(
      iris |> go_figure() |> add_scatter(x = ~Sepal.Width, y = ~Sepal.Length, mode = "markers")
    )
    output$click <- shiny::renderPrint(event_data("plotly_click"))
  }
  shiny::shinyApp(ui, server)
}
```
