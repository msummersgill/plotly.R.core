# WebGL in Plotly and R

## WebGL with 1 Million points

``` r

library(plotly.core)

n <- 1e5
x <- rnorm(n)
y <- 2 * x + rnorm(n, sd = 5)

fig <- go_figure() |>
  add_scattergl(
    x = x,
    y = y,
    mode = "markers",
    marker = go_scattergl_marker(opacity = 0.01)
  )

fig
```

## Reference

See
[`go_scattergl()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattergl.md)
for more information.
