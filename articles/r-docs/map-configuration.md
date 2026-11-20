# Map Configuration and Styling

### Mapbox Maps vs Geo Maps

Plotly supports two different kinds of maps:

1.  **Tile maps** are [tile-based
    maps](https://en.wikipedia.org/wiki/Tiled_web_map) drawn with
    MapLibre. If your figure is created with one or more
    [`add_scattermap()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattermap.md),
    [`add_choroplethmap()`](https://msummersgill.github.io/plotly.R.core/reference/go_choroplethmap.md)
    or
    [`add_densitymap()`](https://msummersgill.github.io/plotly.R.core/reference/go_densitymap.md)
    traces, the `map` layout object
    ([`go_map()`](https://msummersgill.github.io/plotly.R.core/reference/go_map.md))
    in your figure contains configuration information for the map
    itself.
2.  **Geo maps** are outline-based maps. If your figure is created with
    [`add_scattergeo()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattergeo.md)
    or
    [`add_choropleth()`](https://msummersgill.github.io/plotly.R.core/reference/go_choropleth.md),
    the `geo` layout object
    ([`go_geo()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo.md))
    in your figure contains configuration information for the map
    itself.

This page documents Geo outline-based maps, and the [Map Layers
documentation](https://msummersgill.github.io/plotly.R.core/articles/r-docs/mapbox-layers.md)
describes how to configure tile-based maps.

**Note:** Every configuration option here is equally applicable to
non-empty maps created with
[`add_scattergeo()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattergeo.md)
and
[`add_choropleth()`](https://msummersgill.github.io/plotly.R.core/reference/go_choropleth.md).

### Physical Base Maps

Plotly Geo maps have a built-in base map layer composed of “physical”
and “cultural” (i.e. administrative border) data from the [Natural Earth
Dataset](https://www.naturalearthdata.com/downloads/). Various lines and
area fills can be shown or hidden, and their color and line-widths
specified. In the default template, a map frame and physical features
such as a coastal outline and filled land areas are shown, at a
small-scale 1:110m resolution:

``` r

library(plotly.core)
g <- go_geo(showland = TRUE, landcolor = "#e5ecf6")
fig <- go_figure() |>
  add_scattergeo(mode = "markers") |>
  update_layout(geo = g)
fig
```

Here is a map with all physical features enabled and styled, at a
larger-scale 1:50m resolution:

``` r

library(plotly.core)

g <- go_geo(
  scope = "world",
  showland = TRUE,
  landcolor = "LightGreen",
  showocean = TRUE,
  oceancolor = "LightBlue",
  showlakes = TRUE,
  lakecolor = "Blue",
  showrivers = TRUE,
  rivercolor = "Blue",
  resolution = 50
)

fig <- go_figure() |>
  add_scattergeo(mode = "markers") |>
  update_layout(geo = g)
fig
```

### Disabling Base Maps

In certain cases, such as large scale [choropleth
maps](https://msummersgill.github.io/plotly.R.core/articles/r-docs/choropleth-maps.md),
the default physical map can be distracting. In this case the `visible`
attribute of
[`go_geo()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo.md)
attribute can be set to `FALSE` to hide all base map attributes except
those which are explicitly set to true. For example in the following map
we hide all physical features except rivers and lakes, neither of which
are shown by default:

``` r

library(plotly.core)

g <- go_geo(
  scope = "world",
  visible = FALSE,
  showlakes = TRUE,
  lakecolor = "Blue",
  showrivers = TRUE,
  rivercolor = "Blue",
  resolution = 50
)

fig <- go_figure() |>
  add_scattergeo(mode = "markers") |>
  update_layout(geo = g)
fig
```

### Cultural Base Maps

In addition to physical base map features, a “cultural” base map is
included which is composed of country borders and selected sub-country
borders such as states.

**Note and disclaimer:** cultural features are by definition subject to
change, debate and dispute. Plotly includes data from Natural Earth
“as-is” and defers to the [Natural Earth policy regarding disputed
borders](https://www.naturalearthdata.com/downloads/50m-cultural-vectors/50m-admin-0-countries-2/)
which read:

> Natural Earth Vector draws boundaries of countries according to
> defacto status. We show who actually controls the situation on the
> ground.

**To create a map with your own cultural features** please refer to our
[choropleth
documentation](https://msummersgill.github.io/plotly.R.core/articles/r-docs/choropleth-maps.md).

Here is a map with only cultural features enabled and styled, at a 1:50m
resolution, which includes only country boundaries. See below for
country sub-unit cultural base map features:

``` r

library(plotly.core)

g <- go_geo(
  scope = "world",
  visible = FALSE,
  showcountries = TRUE,
  countrycolor = "Purple",
  resolution = 50,
  showland = TRUE,
  landcolor = "#e5ecf6"
)

fig <- go_figure() |>
  add_scattergeo(mode = "markers") |>
  update_layout(geo = g)
fig
```

### Map Projections

Geo maps are drawn according to a given map
[projection](https://en.wikipedia.org/wiki/Map_projection) that flattens
the Earth’s roughly-spherical surface into a 2-dimensional space.

The available projections are `'equirectangular'`, `'mercator'`,
`'orthographic'`, `'natural earth'`, `'kavrayskiy7'`, `'miller'`,
`'robinson'`, `'eckert4'`, `'azimuthal equal area'`,
`'azimuthal equidistant'`, `'conic equal area'`, `'conic conformal'`,
`'conic equidistant'`, `'gnomonic'`, `'stereographic'`, `'mollweide'`,
`'hammer'`, `'transverse mercator'`, `'albers usa'`, `'winkel tripel'`,
`'aitoff'` and `'sinusoidal'`.

``` r

library(plotly.core)

g <- go_geo(
  projection = go_geo_projection(
    type = "orthographic"
  ),
  showland = TRUE,
  landcolor = "#e5ecf6"
)

fig <- go_figure() |>
  add_scattergeo(mode = "markers") |>
  update_layout(geo = g)
fig
```

``` r

library(plotly.core)

g <- go_geo(
  projection = go_geo_projection(
    type = "natural earth"
  ),
  showland = TRUE,
  landcolor = "#e5ecf6"
)

fig <- go_figure() |>
  add_scattergeo(mode = "markers") |>
  update_layout(geo = g)
fig
```

Map projections can be rotated using the `rotation` of
[`go_geo_projection()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo_projection.md),
and maps can be translated using the `center` of
[`go_geo()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo.md),
as well as truncated to a certain longitude and latitude range using the
`range` of
[`go_geo_lataxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo_lataxis.md)
and
[`go_geo_lonaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo_lonaxis.md).

The map below uses all of these attributes to demonstrate the types of
effect this can yield:

``` r

library(plotly.core)

g <- go_geo(
  projection = go_geo_projection(
    rotation = go_geo_projection_rotation(lon = 30, lat = 30, roll = 30)
  ),
  center = go_geo_center(lon = -30, lat = -30),
  lonaxis = go_geo_lonaxis(range = c(0, 200)),
  lataxis = go_geo_lataxis(range = c(-50, 20)),
  showland = TRUE,
  landcolor = "#e5ecf6"
)

fig <- go_figure() |>
  add_scattergeo(mode = "markers") |>
  update_layout(geo = g)
fig
```

### Automatic Zooming or Bounds Fitting

The `fitbounds` attribute of
[`go_geo()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo.md)
can be set to `locations` to automatically set the center and latitude
and longitude range according to the data being plotted. See the
[choropleth
maps](https://msummersgill.github.io/plotly.R.core/articles/r-docs/choropleth-maps.md)
documentation for more information.

``` r

library(plotly.core)

g <- go_geo(
  fitbounds = "locations",
  showland = TRUE,
  landcolor = "#e5ecf6"
)

fig <- go_figure() |>
  add_scattergeo(
    mode = "lines",
    lat = c(0, 15, 20, 35),
    lon = c(5, 10, 25, 30)
  ) |>
  update_layout(geo = g)
fig
```

### Named Map Scopes and Country Sub-Units

In addition, the named “scope” of a map defines a sub-set of the earth’s
surface to draw. Each scope has a *default projection type, center and
roll, as well as bounds*, and certain scopes contain country sub-unit
cultural layers certain resolutions, such as `scope="north america"` at
`resolution=50` which contains US state and Canadian province
boundaries.

The available scopes are: `'world'`, `'usa'`, `'europe'`, `'asia'`,
`'africa'`, `'north america'`, `'south america'`.

``` r

library(plotly.core)

g <- go_geo(
  visible = FALSE,
  resolution = 50,
  scope = "north america",
  showcountries = TRUE,
  countrycolor = "Black",
  showsubunits = TRUE,
  subunitcolor = "Blue",
  showland = TRUE,
  landcolor = "#e5ecf6"
)

fig <- go_figure() |>
  add_scattergeo(mode = "markers") |>
  update_layout(geo = g)
fig
```

The `"usa"` scope contains state boundaries at both resolutions, and
uses the special `'albers usa'` projection which moves Alaska and Hawaii
closer to the “lower 48 states” to reduce projection distortion and
produce a more compact map.

``` r

library(plotly.core)

g <- go_geo(
  visible = FALSE,
  resolution = 110,
  scope = "usa",
  showcountries = TRUE,
  countrycolor = "Black",
  showsubunits = TRUE,
  subunitcolor = "Blue",
  showland = TRUE,
  landcolor = "#e5ecf6"
)

fig <- go_figure() |>
  add_scattergeo(mode = "markers") |>
  update_layout(geo = g)
fig
```

### Graticules (Latitude and Longitude Grid Lines)

A graticule can be drawn using the `showgrid` of
[`go_geo_lataxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo_lataxis.md)
and
[`go_geo_lonaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo_lonaxis.md)
with options similar to [2d cartesian
ticks](https://msummersgill.github.io/plotly.R.core/articles/r-docs/axes.md).

``` r

library(plotly.core)

g <- go_geo(
  lonaxis = go_geo_lonaxis(showgrid = TRUE),
  lataxis = go_geo_lataxis(showgrid = TRUE),
  showland = TRUE,
  landcolor = "#e5ecf6"
)

fig <- go_figure() |>
  add_scattergeo(mode = "markers") |>
  update_layout(geo = g)
fig
```

### Reference

See
[`go_geo()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo.md)
for more information and chart attribute options!
