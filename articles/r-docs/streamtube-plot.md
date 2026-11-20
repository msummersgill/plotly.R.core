# 3D Streamtube Plots

#### Introduction

In streamtube plots, attributes include `x`, `y`, and `z`, which set the
coordinates of the vector field, and `u`, `v`, and `w`, which set the x,
y, and z components of the vector field. Additionally, you can use
`starts` (built with
[`go_streamtube_starts()`](https://msummersgill.github.io/plotly.R.core/reference/go_streamtube_starts.md))
to determine the streamtube’s starting position. Lastly, `maxdisplayed`
determines the maximum segments displayed in a streamtube.

#### Basic Streamtube Plot

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/streamtube-basic.csv")

fig <- df |>
  go_figure() |>
  add_streamtube(
    x = ~x,
    y = ~y,
    z = ~z,
    u = ~u,
    v = ~v,
    w = ~w,
    sizeref = 0.5,
    cmin = 0,
    cmax = 3
  ) |>
  update_layout(
    scene = go_scene(
      camera = go_scene_camera(
        eye = go_scene_camera_eye(
          x = -0.7243612458865182,
          y = 1.9269804254717962,
          z = 0.6704828299861716
        )
      )
    )
  )

fig
```

#### Starting Position and Segments

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/streamtube-wind.csv")

fig <- df |>
  go_figure() |>
  add_streamtube(
    x = ~x,
    y = ~y,
    z = ~z,
    u = ~u,
    v = ~v,
    w = ~w,
    starts = go_streamtube_starts(
      x = rep(80, 16),
      y = rep(c(20, 30, 40, 50), 4),
      z = c(rep(0, 4), rep(5, 4), rep(10, 4), rep(15, 4))
    ),
    sizeref = 0.3,
    showscale = FALSE,
    maxdisplayed = 3000
  ) |>
  update_layout(
    scene = go_scene(aspectratio = go_scene_aspectratio(x = 2, y = 1, z = 0.3)),
    margin = go_margin(t = 20, b = 20, l = 20, r = 20)
  )

fig
```

#### Reference

See
[`go_streamtube()`](https://msummersgill.github.io/plotly.R.core/reference/go_streamtube.md)
for more information and chart attribute options!
