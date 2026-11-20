# 3D Mesh Plots

### Basic 3D Mesh Plot

``` r

library(plotly.core)

x <- runif(50, 0, 1)
y <- runif(50, 0, 1)
z <- runif(50, 0, 1)

go_figure() |>
  add_mesh3d(x = ~x, y = ~y, z = ~z)
```

### Tetrahedron Mesh Plot

``` r

library(plotly.core)

go_figure() |>
  add_mesh3d(
    x = c(0, 1, 2, 0),
    y = c(0, 0, 1, 2),
    z = c(0, 2, 0, 1),
    i = c(0, 0, 0, 1),
    j = c(1, 2, 3, 2),
    k = c(2, 3, 1, 3),
    intensity = c(0, 0.33, 0.66, 1),
    colorscale = list(c(0, "red"), c(0.5, "green"), c(1, "blue"))
  )
```

### Cube Mesh Plot

``` r

library(plotly.core)

rainbow_scale <- Map(c, seq(0, 1, length.out = 8), substr(rainbow(8), 1, 7))

go_figure() |>
  add_mesh3d(
    x = c(0, 0, 1, 1, 0, 0, 1, 1),
    y = c(0, 1, 1, 0, 0, 1, 1, 0),
    z = c(0, 0, 0, 0, 1, 1, 1, 1),
    i = c(7, 0, 0, 0, 4, 4, 6, 6, 4, 0, 3, 2),
    j = c(3, 4, 1, 2, 5, 6, 5, 2, 0, 1, 6, 3),
    k = c(0, 7, 2, 3, 6, 7, 1, 1, 5, 5, 7, 6),
    intensity = seq(0, 1, length.out = 8),
    colorscale = rainbow_scale
  )
```

\#Reference

See
[`go_mesh3d()`](https://msummersgill.github.io/plotly.R.core/reference/go_mesh3d.md)
for more information and chart attribute options!
