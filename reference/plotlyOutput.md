# Shiny bindings for plotly figures

`plotlyOutput()` creates a plot output element in a Shiny UI;
`renderPlotly()` renders a
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
or a plotly htmlwidget (or a promise of one) into it.

## Usage

``` r
plotlyOutput(
  outputId,
  width = "100%",
  height = "400px",
  inline = FALSE,
  reportTheme = TRUE,
  fill = !inline
)

renderPlotly(expr, env = parent.frame(), quoted = FALSE)
```

## Arguments

- outputId:

  Output variable to read the plot from.

- width, height:

  Size of the plot output, as a valid CSS unit (e.g. `"100%"`,
  `"400px"`).

- inline:

  Use an inline
  ([`span()`](https://rstudio.github.io/htmltools/reference/builder.html))
  container instead of a block one.

- reportTheme:

  Report CSS colors and fonts to the server (see
  [`shiny::getCurrentOutputInfo()`](https://rdrr.io/pkg/shiny/man/getCurrentOutputInfo.html)).

- fill:

  Whether the plot fills its container in fillable layouts.

- expr:

  An expression that returns a figure.

- env:

  The environment in which to evaluate `expr`.

- quoted:

  Is `expr` a quoted expression?

## Value

`plotlyOutput()` returns a Shiny UI element; `renderPlotly()` a Shiny
render function.

## See also

[`event_data()`](https://msummersgill.github.io/plotly.R.core/reference/event_data.md),
[`plotlyProxy()`](https://msummersgill.github.io/plotly.R.core/reference/plotlyProxy.md)
