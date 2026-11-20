# 3D Subplots

### 3D Subplot

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
      add_surface(z = ~volcano, showscale = FALSE, row = row, col = col)
  }
}

fig <- fig |>
  update_scenes(xaxis = axx, yaxis = axx, zaxis = axx, aspectmode = "cube") |>
  update_layout(title = "3D Subplots")

fig
```

### Reference

See
[`go_scene()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene.md)
and
[`go_scene_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_axis.md)
for more information and options!
