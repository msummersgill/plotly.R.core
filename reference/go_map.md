# Layout map objects

The object for the figure layout's `map` (and `map2`, `map3`, ...: see
[`update_maps()`](https://msummersgill.github.io/plotly.R.core/reference/update_maps.md)).
`go_map()` creates one, with exactly its properties; a named list with
the same properties works too.

## Usage

``` r
go_map(
  ...,
  bearing = NULL,
  bounds = NULL,
  center = NULL,
  domain = NULL,
  fitbounds = NULL,
  layers = NULL,
  pitch = NULL,
  style = NULL,
  uirevision = NULL,
  zoom = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- bearing:

  Sets the bearing angle of the map in degrees counter-clockwise from
  North (map.bearing). Number.

- bounds:

  A
  [`go_map_bounds()`](https://msummersgill.github.io/plotly.R.core/reference/go_map_bounds.md)
  object or named list, with properties `east`, `north`, `south` and
  `west` (see
  [`go_map_bounds()`](https://msummersgill.github.io/plotly.R.core/reference/go_map_bounds.md)).

- center:

  A
  [`go_map_center()`](https://msummersgill.github.io/plotly.R.core/reference/go_map_center.md)
  object or named list, with properties `lat` and `lon` (see
  [`go_map_center()`](https://msummersgill.github.io/plotly.R.core/reference/go_map_center.md)).

- domain:

  A
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)
  object or named list, with properties `column`, `row`, `x` and `y`
  (see
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)).

- fitbounds:

  Determines if this subplot's view settings are auto-computed to fit
  trace data. If "locations" (default), the view is auto-fit to the
  lon/lat coordinates of the visible trace data. If FALSE, the view
  settings are used as-is; set this to opt out of auto-fitting. If
  \`fitbounds\` is enabled but a user provides \`center\` or \`zoom\`,
  auto-fit will be skipped. One of `"locations"`, `FALSE`.

- layers:

  List, each element a
  [`go_map_layer()`](https://msummersgill.github.io/plotly.R.core/reference/go_map_layer.md)
  object or named list, with properties `below`, `circle`, `color`,
  `coordinates`, `fill`, `line`, `maxzoom`, `minzoom`, `name`,
  `opacity`, `source`, `sourceattribution` and 6 more (see
  [`go_map_layer()`](https://msummersgill.github.io/plotly.R.core/reference/go_map_layer.md)).

- pitch:

  Sets the pitch angle of the map (in degrees, where 0 means
  perpendicular to the surface of the map) (map.pitch). Number.

- style:

  Defines the map layers that are rendered by default below the trace
  layers defined in \`data\`, which are themselves by default rendered
  below the layers defined in \`layout.map.layers\`. These layers can be
  defined either explicitly as a Map Style object which can contain
  multiple layer definitions that load data from any public or private
  Tile Map Service (TMS or XYZ) or Web Map Service (WMS) or implicitly
  by using one of the built-in style objects which use WMSes or by using
  a custom style URL Map Style objects are of the form described in the
  MapLibre GL JS documentation available at
  https://maplibre.org/maplibre-style-spec/ The built-in plotly.js
  styles objects are: basic, carto-darkmatter,
  carto-darkmatter-nolabels, carto-positron, carto-positron-nolabels,
  carto-voyager, carto-voyager-nolabels, dark, light, open-street-map,
  outdoors, satellite, satellite-streets, streets, white-bg. Any value.

- uirevision:

  Controls persistence of user-driven changes in the view: \`center\`,
  \`zoom\`, \`bearing\`, \`pitch\`. Defaults to \`layout.uirevision\`.
  Any value.

- zoom:

  Sets the zoom level of the map (map.zoom). Number.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_map` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
quakes |>
  go_figure() |>
  add_scattermap(lat = ~lat, lon = ~long) |>
  update_layout(map = go_map())
```
