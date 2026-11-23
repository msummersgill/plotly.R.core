# Shiny bindings for plotly

Output and render functions for using plotly within Shiny applications
and interactive Rmd documents.

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

  output variable to read from

- width, height:

  Must be a valid CSS unit (like `"100%"`, `"400px"`, `"auto"`) or a
  number, which will be coerced to a string and have `"px"` appended.
  Note that, for height, using "auto" or "100%" generally will not work
  as expected, because of how height is computed with HTML/CSS.

- inline:

  use an inline
  ([`span()`](https://rstudio.github.io/htmltools/reference/builder.html))
  or block container
  ([`div()`](https://rstudio.github.io/htmltools/reference/builder.html))
  for the output

- reportTheme:

  whether or not to report CSS styles.

- fill:

  see
  [`htmlwidgets::shinyWidgetOutput()`](https://rdrr.io/pkg/htmlwidgets/man/htmlwidgets-shiny.html)
  for explanation.

- expr:

  An expression that generates a
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
  or a plotly htmlwidget (or a promise of one)

- env:

  The environment in which to evaluate `expr`.

- quoted:

  Is `expr` a quoted expression (with
  [`quote()`](https://rdrr.io/r/base/substitute.html))? This is useful
  if you want to save an expression in a variable.

## Value

`plotlyOutput()` returns a Shiny UI element; `renderPlotly()` a Shiny
render function.

## See also

[`event_data()`](https://msummersgill.github.io/plotly.R.core/reference/event_data.md),
[`plotlyProxy()`](https://msummersgill.github.io/plotly.R.core/reference/plotlyProxy.md)

## Author

Carson Sievert
