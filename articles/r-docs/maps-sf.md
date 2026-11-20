# Simple Features

### Introduction

In order to complete the examples below, you’ll require installing
additional packages (`install.packages("packageName")`): -
[sf](https://github.com/r-spatial/sf) -
[geojsonsf](https://github.com/SymbolixAU/geojsonsf)

The examples below use the library [simple
features](https://r-spatial.github.io/sf/) to read in the shape files
before plotting the features with Plotly. plotly.core doesn’t draw `sf`
objects directly, so the examples convert them to coordinates or GeoJSON
first.

### Map Tiles

Tile-based maps
([`add_choroplethmap()`](https://msummersgill.github.io/plotly.R.core/reference/go_choroplethmap.md),
[`add_scattermap()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattermap.md),
…) use MapLibre and need no access token. See the [Map
Layers](https://msummersgill.github.io/plotly.R.core/articles/r-docs/mapbox-layers.md)
documentation for more information.

### Basic sf

The polygon coordinates can be drawn as filled scatter paths, with `NA`
separating the rings:

``` r

library(plotly.core)
library(sf)

nc <- sf::st_read(system.file("shape/nc.shp", package = "sf"), quiet = TRUE)

coords <- as.data.frame(sf::st_coordinates(nc))
rings <- split(coords, list(coords$L1, coords$L2, coords$L3), drop = TRUE)
x <- unlist(lapply(rings, function(r) c(r$X, NA)), use.names = FALSE)
y <- unlist(lapply(rings, function(r) c(r$Y, NA)), use.names = FALSE)

go_figure() |>
  add_scatter(
    x = x,
    y = y,
    mode = "lines",
    fill = "toself",
    line = go_scatter_line(width = 1)
  ) |>
  update_yaxes(scaleanchor = "x")
```

You can also draw the features on a geo map with
[`add_choropleth()`](https://msummersgill.github.io/plotly.R.core/reference/go_choropleth.md),
passing them as GeoJSON:

``` r

library(plotly.core)
library(sf)

nc <- sf::st_read(system.file("shape/nc.shp", package = "sf"), quiet = TRUE)
nc_geojson <- jsonlite::fromJSON(
  geojsonsf::sf_geojson(nc),
  simplifyVector = FALSE
)

nc |>
  go_figure() |>
  add_choropleth(
    geojson = nc_geojson,
    locations = ~NAME,
    featureidkey = "properties.NAME",
    z = ~AREA,
    colorscale = "Viridis"
  ) |>
  update_geos(fitbounds = "locations", visible = FALSE)
```

Or on a tile map with
[`add_choroplethmap()`](https://msummersgill.github.io/plotly.R.core/reference/go_choroplethmap.md):

``` r

library(plotly.core)
library(sf)

nc <- sf::st_read(system.file("shape/nc.shp", package = "sf"), quiet = TRUE)
nc_geojson <- jsonlite::fromJSON(
  geojsonsf::sf_geojson(nc),
  simplifyVector = FALSE
)

nc |>
  go_figure() |>
  add_choroplethmap(
    geojson = nc_geojson,
    locations = ~NAME,
    featureidkey = "properties.NAME",
    z = seq_len(nrow(nc)),
    colorscale = "Turbo",
    showscale = FALSE,
    marker = go_choroplethmap_marker(opacity = 0.6),
    text = ~NAME,
    hoverinfo = "text"
  ) |>
  update_layout(
    map = go_map(
      style = "carto-positron",
      zoom = 6,
      center = go_map_center(lon = -79.5, lat = 35.5)
    )
  )
```

### Reference

See
[`go_choropleth()`](https://msummersgill.github.io/plotly.R.core/reference/go_choropleth.md)
and
[`go_choroplethmap()`](https://msummersgill.github.io/plotly.R.core/reference/go_choroplethmap.md)
for more information and chart attribute options! If you would like to
read more on visualizing geo-spatial data with sf and plotly click
[here](https://blog.cpsievert.me/2018/03/30/visualizing-geo-spatial-data-with-sf-and-plotly/).
