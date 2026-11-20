# 3D Tri-Surf Plots

### Basic Tri-Surf Plot

``` r

library(plotly.core)

fig <- go_figure() |>
  add_mesh3d(
    x = c(0, 1, 2, 0),
    y = c(0, 0, 1, 2),
    z = c(0, 2, 0, 1),
    i = c(0, 0, 0, 1),
    j = c(1, 2, 3, 2),
    k = c(2, 3, 1, 3),
    facecolor = substr(viridisLite::viridis(4), 1, 7)
  )

fig
```

### Cube with Different Face Colors

``` r

library(plotly.core)

fig <- go_figure() |>
  add_mesh3d(
    x = c(0, 0, 1, 1, 0, 0, 1, 1),
    y = c(0, 1, 1, 0, 0, 1, 1, 0),
    z = c(0, 0, 0, 0, 1, 1, 1, 1),
    i = c(7, 0, 0, 0, 4, 4, 2, 6, 4, 0, 3, 7),
    j = c(3, 4, 1, 2, 5, 6, 5, 5, 0, 1, 2, 2),
    k = c(0, 7, 2, 3, 6, 7, 1, 2, 5, 5, 7, 6),
    facecolor = rep(substr(viridisLite::inferno(6), 1, 7), each = 2)
  )

fig
```
