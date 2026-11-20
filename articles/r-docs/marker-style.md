# Marker Styling

#### Add Marker Border

In order to make markers distinct, you can add a border to the markers.
This can be achieved by passing a
[`go_scatter_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter_marker_line.md)
as the `line` of the marker, for example
`marker = go_scatter_marker(..., line = go_scatter_marker_line(...))`.

``` r

library(plotly.core)

x <- runif(500, min = 3, max = 6)
y <- runif(500, min = 3, max = 6)

go_figure() |>
  add_scatter(
    mode = "markers",
    x = x,
    y = y,
    marker = go_scatter_marker(
      color = "rgb(17, 157, 255)",
      size = 20,
      line = go_scatter_marker_line(
        color = "rgb(231, 99, 250)",
        width = 2
      )
    ),
    showlegend = FALSE
  ) |>
  add_scatter(
    mode = "markers",
    x = c(2),
    y = c(4.5),
    marker = go_scatter_marker(
      color = "rgb(17, 157, 255)",
      size = 120,
      line = go_scatter_marker_line(
        color = "rgb(231, 99, 250)",
        width = 12
      )
    ),
    showlegend = FALSE
  )
```

#### Fully Opaque

Fully opaque, the default setting, is useful for non-overlapping
markers. When many points overlap it can be hard to observe density.

``` r

library(plotly.core)

x <- runif(500, min = 3, max = 6)
y <- runif(500, min = 3, max = 6)

go_figure() |>
  add_scatter(
    mode = "markers",
    x = x,
    y = y,
    marker = go_scatter_marker(
      color = "rgb(17, 157, 255)",
      size = 20,
      line = go_scatter_marker_line(
        color = "rgb(231, 99, 250)",
        width = 2
      )
    ),
    showlegend = FALSE
  ) |>
  add_scatter(
    mode = "markers",
    x = c(2, 2),
    y = c(4.25, 4.75),
    marker = go_scatter_marker(
      color = "rgb(17, 157, 255)",
      size = 120,
      line = go_scatter_marker_line(
        color = "rgb(231, 99, 250)",
        width = 12
      )
    ),
    showlegend = FALSE
  )
```

#### Opacity

Setting opacity outside the marker will set the opacity of the trace.
Thus, it will allow greater visbility of additional traces but like
fully opaque it is hard to distinguish density.

``` r

library(plotly.core)

x <- runif(500, min = 3, max = 6)
y <- runif(500, min = 3, max = 4.5)
x2 <- runif(500, min = 3, max = 6)
y2 <- runif(500, min = 4.5, max = 6)

go_figure() |>
  add_scatter(
    mode = "markers",
    x = x,
    y = y,
    opacity = 0.5,
    marker = go_scatter_marker(
      color = "rgb(17, 157, 255)",
      size = 20,
      line = go_scatter_marker_line(
        color = "rgb(231, 99, 250)",
        width = 2
      )
    ),
    name = "Opacity 0.5"
  ) |>
  add_scatter(
    mode = "markers",
    x = x2,
    y = y2,
    marker = go_scatter_marker(
      color = "rgb(17, 157, 255)",
      size = 20,
      line = go_scatter_marker_line(
        color = "rgb(231, 99, 250)",
        width = 2
      )
    ),
    name = "Opacity 1.0"
  ) |>
  add_scatter(
    mode = "markers",
    x = c(2, 2),
    y = c(4.25, 4.75),
    opacity = 0.5,
    marker = go_scatter_marker(
      color = "rgb(17, 157, 255)",
      size = 120,
      line = go_scatter_marker_line(
        color = "rgb(231, 99, 250)",
        width = 12
      )
    ),
    showlegend = FALSE
  )
```

#### Marker Opacity

To maximise visibility of density, it is recommended to set the opacity
inside the marker `marker = go_scatter_marker(opacity = 0.5)`. If
mulitple traces exist with high density, consider using marker opacity
in conjunction with trace opacity.

``` r

library(plotly.core)

x <- runif(500, min = 3, max = 6)
y <- runif(500, min = 3, max = 6)

go_figure() |>
  add_scatter(
    mode = "markers",
    x = x,
    y = y,
    marker = go_scatter_marker(
      color = "rgb(17, 157, 255)",
      size = 20,
      opacity = 0.5,
      line = go_scatter_marker_line(
        color = "rgb(231, 99, 250)",
        width = 2
      )
    ),
    showlegend = FALSE
  ) |>
  add_scatter(
    mode = "markers",
    x = c(2, 2),
    y = c(4.25, 4.75),
    marker = go_scatter_marker(
      color = "rgb(17, 157, 255)",
      size = 120,
      opacity = 0.5,
      line = go_scatter_marker_line(
        color = "rgb(231, 99, 250)",
        width = 12
      )
    ),
    showlegend = FALSE
  )
```

#### Color Opacity

To maximise visibility of each point, set the color opacity by using
alpha: `marker = go_scatter_marker(color = "rgba(0,0,0,0.5)")`. Here,
the marker line will remain opaque.

``` r

library(plotly.core)

x <- runif(500, min = 3, max = 6)
y <- runif(500, min = 3, max = 6)

go_figure() |>
  add_scatter(
    mode = "markers",
    x = x,
    y = y,
    marker = go_scatter_marker(
      color = "rgba(17, 157, 255, 0.5)",
      size = 20,
      line = go_scatter_marker_line(
        color = "rgb(231, 99, 250)",
        width = 2
      )
    ),
    showlegend = FALSE
  ) |>
  add_scatter(
    mode = "markers",
    x = c(2, 2),
    y = c(4.25, 4.75),
    marker = go_scatter_marker(
      color = "rgba(17, 157, 255, 0.5)",
      size = 120,
      line = go_scatter_marker_line(
        color = "rgb(231, 99, 250)",
        width = 12
      )
    ),
    showlegend = FALSE
  )
```

### Reference

See
[`go_scatter_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter_marker.md)
for more information and chart attribute options!
