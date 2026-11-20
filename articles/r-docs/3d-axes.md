# 3D Axes

### Range of Axes

``` r

library(plotly.core)

axx <- go_scene_axis(nticks = 4, range = c(-25, 75))

axy <- go_scene_axis(nticks = 4, range = c(-25, 75))

axz <- go_scene_axis(nticks = 4, range = c(0, 50))

x <- 70*(runif(70, 0, 1))
y <- 55*(runif(70, 0, 1))
z <- 40*(runif(70, 0, 1))

fig <- go_figure() |>
  add_mesh3d(x = x, y = y, z = z) |>
  update_layout(scene = go_scene(xaxis = axx, yaxis = axy, zaxis = axz))

fig
```

### Fixed Ratio Axes

``` r

library(plotly.core)

# custom grid style
axx <- go_scene_axis(
  gridcolor = "rgb(255, 255, 255)",
  zerolinecolor = "rgb(255, 255, 255)",
  showbackground = TRUE,
  backgroundcolor = "rgb(230, 230,230)"
)

scene_row <- list(list(type = "scene"), list(type = "scene"))

fig <- make_subplots(rows = 2, cols = 2, specs = list(scene_row, scene_row))
for (row in 1:2) {
  for (col in 1:2) {
    fig <- fig |>
      add_surface(z = volcano, showscale = FALSE, row = row, col = col)
  }
}

fig <- fig |>
  update_scenes(xaxis = axx, yaxis = axx, zaxis = axx) |>
  update_layout(
    title = "3D Subplots",
    # select the type of aspectmode
    scene = go_scene(aspectmode = "cube"),
    scene2 = go_scene(aspectmode = "data"),
    scene3 = go_scene(aspectmode = "auto"),
    scene4 = go_scene(
      aspectmode = "manual",
      # set your manual fixed aspect ratio
      aspectratio = go_scene_aspectratio(x = 1, y = 1, z = 2)
    )
  )

fig
```

### Set Axes Title

``` r

library(plotly.core)

axx <- go_scene_axis(title = "X AXIS TITLE")

axy <- go_scene_axis(title = "Y AXIS TITLE")

axz <- go_scene_axis(title = "Z AXIS TITLE")

x <- 70*(runif(70, 0, 1))
y <- 55*(runif(70, 0, 1))
z <- 40*(runif(70, 0, 1))

fig <- go_figure() |>
  add_mesh3d(x = x, y = y, z = z) |>
  update_layout(scene = go_scene(xaxis = axx, yaxis = axy, zaxis = axz))

fig
```

### Ticks Formatting

``` r

library(plotly.core)

axx <- go_scene_axis(
  tickmode = "array",
  ticktext = c("Huey", "Dewey", "Louie"),
  tickvals = c(0, 25, 50),
  range = c(-25, 75)
)

axy <- go_scene_axis(nticks = 4, range = c(-25, 75))

axz <- go_scene_axis(nticks = 4, range = c(0, 50))

x <- 70*(runif(70, 0, 1))
y <- 55*(runif(70, 0, 1))
z <- 40*(runif(70, 0, 1))

fig <- go_figure() |>
  add_mesh3d(x = x, y = y, z = z) |>
  update_layout(scene = go_scene(xaxis = axx, yaxis = axy, zaxis = axz))

fig
```

### Background and Grid Color

``` r

library(plotly.core)

axx <- go_scene_axis(
  backgroundcolor = "rgb(200, 200, 230)",
  gridcolor = "rgb(255,255,255)",
  showbackground = TRUE,
  zerolinecolor = "rgb(255,255,255)"
)

axy <- go_scene_axis(
  backgroundcolor = "rgb(230, 200,230)",
  gridcolor = "rgb(255,255,255)",
  showbackground = TRUE,
  zerolinecolor = "rgb(255,255,255)"
)

axz <- go_scene_axis(
  backgroundcolor = "rgb(230, 230,200)",
  gridcolor = "rgb(255,255,255)",
  showbackground = TRUE,
  zerolinecolor = "rgb(255,255,255)"
)

x <- 70*(runif(70, 0, 1))
y <- 55*(runif(70, 0, 1))
z <- 40*(runif(70, 0, 1))

fig <- go_figure() |>
  add_mesh3d(x = x, y = y, z = z) |>
  update_layout(scene = go_scene(xaxis = axx, yaxis = axy, zaxis = axz))

fig
```

### Reference

See
[`go_scene()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene.md)
and
[`go_scene_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_axis.md)
for more information and options!
