# Log Plots

#### Log Axes

``` r

library(plotly.core)

d <- ggplot2::diamonds[sample(nrow(ggplot2::diamonds), 1000), ]
# without log scales
fig <- d |>
  go_figure() |>
  add_scatter(x = ~carat, y = ~price, mode = "markers")

fig
```

``` r

# with log scales
fig <- fig |>
  update_layout(xaxis = go_xaxis(type = "log"), yaxis = go_yaxis(type = "log"))

fig
```
