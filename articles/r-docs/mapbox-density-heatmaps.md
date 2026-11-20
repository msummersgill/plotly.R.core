# Mapbox Density

### Map Tiles, no Token Needed

plotly.core draws density heatmaps on MapLibre tile maps with
[`add_densitymap()`](https://msummersgill.github.io/plotly.R.core/reference/go_densitymap.md)
and `update_layout(map = go_map(...))`. The built-in styles (such as
`"open-street-map"`, `"carto-positron"` or `"carto-darkmatter"`) need no
access token. See [Map
Layers](https://msummersgill.github.io/plotly.R.core/articles/r-docs/mapbox-layers.md)
for more information.

#### Open Street Map Tiles

``` r

library(plotly.core)

quakes <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/earthquakes-23k.csv")

quakes |>
  go_figure() |>
  add_densitymap(
    lat = ~Latitude,
    lon = ~Longitude,
    coloraxis = "coloraxis",
    radius = 10
  ) |>
  update_layout(
    map = go_map(style = "carto-voyager", center = go_map_center(lon = 180)),
    coloraxis = go_coloraxis(colorscale = "Viridis")
  )
```

\#Reference

See
[`go_densitymap()`](https://msummersgill.github.io/plotly.R.core/reference/go_densitymap.md)
for more information and options!
