# Filled Area in Mapbox

### Tile Maps

plotly.js draws tile maps with MapLibre (the `scattermap` trace and
`layout.map`), so no Mapbox account or access token is needed. See our
[Map
Layers](https://msummersgill.github.io/plotly.R.core/articles/r-docs/mapbox-layers.md)
documentation for more information.

### How to Show an Area on a Map

There are three different ways to show an area on a tile map:

1.  Use a `scattermap` trace
    ([`add_scattermap()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattermap.md))
    and set its `fill` attribute to “toself”
2.  Use a `scattermap` trace and define the corresponding geojson as a
    map layer
3.  Use the `choroplethmap` trace
    ([`add_choroplethmap()`](https://msummersgill.github.io/plotly.R.core/reference/go_choroplethmap.md))
    for tile maps, or the
    [Choropleth](https://msummersgill.github.io/plotly.R.core/articles/r-docs/choropleth-maps.md)
    trace for non-tile maps.

The following example uses the `scattermap` trace and sets
`fill = "toself"`

``` r

library(plotly.core)

go_figure() |>
  add_scattermap(
    fill = "toself",
    lon = c(-74, -70, -70, -74),
    lat = c(47, 47, 45, 45),
    marker = go_scattermap_marker(size = 10, color = "orange")
  ) |>
  update_layout(
    map = go_map(
      style = "outdoors",
      center = go_map_center(lon = -73, lat = 46),
      zoom = 5
    ),
    showlegend = FALSE
  )
```

### Provide Gaps on Map

The following example shows how to use missing values in your data to
provide gap in your graph. To ignore the gap on your plot, take benefit
of the `connectgaps` attribute (see
[`go_scattermap()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattermap.md)).

``` r

library(plotly.core)

go_figure() |>
  add_scattermap(
    mode = "lines",
    fill = "toself",
    lon = c(-10, -10, 8, 8, NaN, 30, 30, 50, 50, NaN, 100, 100, 80, 80),
    lat = c(30, 6, 6, 30, NaN, 20, 30, 30, 20, NaN, 40, 50, 50, 40)
  ) |>
  update_layout(
    map = go_map(
      style = "outdoors",
      center = go_map_center(lon = 30, lat = 30),
      zoom = 2
    ),
    showlegend = FALSE
  )
```

### Use the Corresponding Geojson

The second way is using the `scattermap` trace with the corresponding
geojson.

``` r

library(plotly.core)

# GeoJSON data for the layer source
geojson <- list(
  type = "FeatureCollection",
  features = list(list(
    type = "Feature",
    geometry = list(
      type = "MultiPolygon",
      coordinates = list(list(list(
        c(-73.606352888, 45.507489991), c(-73.606133883, 45.50687600),
        c(-73.605905904, 45.506773980), c(-73.603533905, 45.505698946),
        c(-73.602475870, 45.506856969), c(-73.600031904, 45.505696003),
        c(-73.599379992, 45.505389066), c(-73.599119902, 45.505632008),
        c(-73.598896977, 45.505514039), c(-73.598783894, 45.505617001),
        c(-73.591308727, 45.516246185), c(-73.591380782, 45.516280145),
        c(-73.596778656, 45.518690062), c(-73.602796770, 45.521348046),
        c(-73.612239983, 45.525564037), c(-73.612422919, 45.525642061),
        c(-73.617229085, 45.527751983), c(-73.617279234, 45.527774160),
        c(-73.617304713, 45.527741334), c(-73.617492052, 45.527498362),
        c(-73.617533258, 45.527512253), c(-73.618074188, 45.526759105),
        c(-73.618271651, 45.526500673), c(-73.618446320, 45.526287943),
        c(-73.618968507, 45.525698560), c(-73.619388002, 45.525216750),
        c(-73.619532966, 45.525064183), c(-73.619686662, 45.524889290),
        c(-73.619787038, 45.524770086), c(-73.619925742, 45.524584939),
        c(-73.619954486, 45.524557690), c(-73.620122362, 45.524377961),
        c(-73.620201713, 45.524298907), c(-73.620775593, 45.523650879)
      )))
    )
  ))
)

go_figure() |>
  add_scattermap(
    mode = "markers",
    lon = c(-73.605),
    lat = c(45.51),
    marker = go_scattermap_marker(size = 20, color = c("cyan"))
  ) |>
  update_layout(
    map = go_map(
      style = "outdoors",
      center = go_map_center(lon = -73.6, lat = 45.5),
      zoom = 12,
      layers = list(
        go_map_layer(
          source = geojson,
          type = "fill",
          below = "traces",
          color = "royalblue"
        )
      )
    )
  )
```

\#Reference

See
[`go_scattermap()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattermap.md)
and
[`go_map()`](https://msummersgill.github.io/plotly.R.core/reference/go_map.md)
for more information and options!
