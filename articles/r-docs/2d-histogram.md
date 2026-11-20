# 2D Histograms

#### Basic 2D Histogram

2D histograms require `x`/`y`, but in contrast to heatmaps, `z` is
optional. If `z` is not provided, binning occurs in the browser (see
[`go_histogram2d()`](https://msummersgill.github.io/plotly.R.core/reference/go_histogram2d.md)
for a list of binning options, e.g. `histnorm`).

``` r

# install.packages('mvtnorm')
library(plotly.core)

s <- matrix(c(1, -.75, -.75, 1), ncol = 2)
obs <- mvtnorm::rmvnorm(500, sigma = s)

fig <- make_subplots(rows = 1, cols = 2) |>
  add_scatter(
    x = obs[, 1],
    y = obs[, 2],
    mode = "markers",
    opacity = 0.2,
    row = 1,
    col = 1
  ) |>
  add_histogram2d(x = obs[, 1], y = obs[, 2], row = 1, col = 2)

fig
```

#### Colorscale

If `z` is not provided, the only way to control coloring is through the
`colorscale` attribute (see
[`go_histogram2d()`](https://msummersgill.github.io/plotly.R.core/reference/go_histogram2d.md))

``` r

fig <- go_figure() |>
  add_histogram2d(x = obs[, 1], y = obs[, 2], colorscale = "Blues")

fig
```
