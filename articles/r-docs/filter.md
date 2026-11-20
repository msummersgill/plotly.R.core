# Filter

#### Basic Example

Trace transforms (including `filter`) were removed from plotly.js, so
filter the data in R and plot the result.

``` r

library(plotly.core)

cars <- mtcars[mtcars$qsec > mean(mtcars$qsec), ]

fig <- go_figure() |>
  add_scatter(
    x = cars$hp,
    y = cars$qsec,
    text = rownames(cars),
    hoverinfo = "text",
    mode = "markers"
  )

fig
```

#### Reference

See
[`go_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md)
for more information and options!
