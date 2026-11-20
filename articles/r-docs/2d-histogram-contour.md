# 2D Histogram Contour

#### Basic 2D Histogram Contour

``` r

library(plotly.core)

s <- matrix(c(1, -.75, -.75, 1), ncol = 2)
obs <- mvtnorm::rmvnorm(500, sigma = s)

fig <- go_figure() |>
  add_histogram2dcontour(x = obs[, 1], y = obs[, 2])

fig
```

#### Styled 2D Histogram Contour

``` r

library(plotly.core)

diamonds <- ggplot2::diamonds

fig <- diamonds |>
  go_figure() |>
  add_histogram2dcontour(
    x = ~cut,
    y = ~clarity,
    contours = go_histogram2dcontour_contours(
      showlabels = TRUE,
      labelfont = go_font(family = "Raleway", color = "white")
    ),
    hoverlabel = go_hoverlabel(
      bgcolor = "white",
      bordercolor = "black",
      font = go_font(family = "Raleway", color = "black")
    )
  )

fig
```

#### 2D Histogram Contour Subplot

``` r

library(plotly.core)

x <- rnorm(1000)
y <- rnorm(1000)

fig <- make_subplots(
  rows = 2,
  cols = 2,
  row_heights = c(0.2, 0.8),
  column_widths = c(0.8, 0.2),
  shared_xaxes = TRUE,
  shared_yaxes = TRUE
) |>
  add_histogram(x = x, marker = go_histogram_marker(color = "black"), row = 1, col = 1) |>
  add_histogram2dcontour(x = x, y = y, showscale = FALSE, row = 2, col = 1) |>
  add_histogram(y = y, marker = go_histogram_marker(color = "black"), row = 2, col = 2) |>
  update_layout(showlegend = FALSE)

fig
```

#### Reference

See
[`go_histogram2dcontour()`](https://msummersgill.github.io/plotly.R.core/reference/go_histogram2dcontour.md)
for more information and options!
