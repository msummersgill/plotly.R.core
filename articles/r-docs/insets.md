# Inset Plots

#### Basic Inset

See also the [subplots
page](https://msummersgill.github.io/plotly.R.core/articles/r-docs/subplots.md)
for laying out several plots with
[`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md).

``` r

library(plotly.core)

go_figure() |>
  add_scatter(x = c(1, 2, 3), y = c(4, 3, 2), mode = "lines") |>
  add_scatter(
    x = c(20, 30, 40),
    y = c(30, 40, 50),
    xaxis = "x2",
    yaxis = "y2",
    mode = "lines"
  ) |>
  update_layout(
    xaxis2 = go_xaxis(domain = c(0.6, 0.95), anchor = "y2"),
    yaxis2 = go_yaxis(domain = c(0.6, 0.95), anchor = "x2")
  )
```
