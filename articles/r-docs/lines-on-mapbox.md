# Lines on Mapbox

### Map Tiles

plotly.core bundles plotly.js 4, where the Mapbox-based traces were
replaced by MapLibre-based “map” traces. The `"open-street-map"` and
`carto-*` styles need no access token. See [Map
Layers](https://msummersgill.github.io/plotly.R.core/articles/r-docs/mapbox-layers.md)
for more information.

### Lines on tile maps using “Scattermap” traces

To draw a line on your map, you either can use
[`add_scattermap()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattermap.md)
(see
[`go_scattermap()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattermap.md))
or
[`add_scattergeo()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattergeo.md)
(see
[`go_scattergeo()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattergeo.md))
in plotly.core. This example uses scattermap and sets the drawing `mode`
to the combination of markers and lines.

``` r

library(plotly.core)

go_figure() |>
  add_scattermap(
    mode = "markers+lines",
    lon = c(10, 20, 30),
    lat = c(10, 20, 30),
    marker = go_scattermap_marker(size = 10)
  ) |>
  add_scattermap(
    mode = "markers+lines",
    lon = c(-50, -60, 40),
    lat = c(30, 10, -20),
    marker = go_scattermap_marker(size = 10)
  ) |>
  update_layout(
    map = go_map(
      style = "carto-voyager",
      center = go_map_center(lon = 10, lat = 10),
      zoom = 1
    ),
    margin = go_margin(l = 0, t = 0, b = 0, r = 0)
  )
```

\#Reference

See
[`go_scattermap()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattermap.md)
for more information and options!
