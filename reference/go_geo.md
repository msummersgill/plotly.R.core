# Layout geo objects

The object for the figure layout's `geo` (and `geo2`, `geo3`, ...: see
[`update_geos()`](https://msummersgill.github.io/plotly.R.core/reference/update_geos.md)).
`go_geo()` creates one, with exactly its properties; a named list with
the same properties works too.

## Usage

``` r
go_geo(
  ...,
  bgcolor = NULL,
  center = NULL,
  coastlinecolor = NULL,
  coastlinewidth = NULL,
  countrycolor = NULL,
  countrywidth = NULL,
  domain = NULL,
  fitbounds = NULL,
  framecolor = NULL,
  framewidth = NULL,
  lakecolor = NULL,
  landcolor = NULL,
  lataxis = NULL,
  lonaxis = NULL,
  oceancolor = NULL,
  projection = NULL,
  resolution = NULL,
  rivercolor = NULL,
  riverwidth = NULL,
  scope = NULL,
  showcoastlines = NULL,
  showcountries = NULL,
  showframe = NULL,
  showlakes = NULL,
  showland = NULL,
  showocean = NULL,
  showrivers = NULL,
  showsubunits = NULL,
  subunitcolor = NULL,
  subunitwidth = NULL,
  uirevision = NULL,
  visible = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- bgcolor:

  Set the background color of the map Color: a CSS color string or R
  color name.

- center:

  A
  [`go_geo_center()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo_center.md)
  object or named list, with properties `lat` and `lon` (see
  [`go_geo_center()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo_center.md)).

- coastlinecolor:

  Sets the coastline color. Color: a CSS color string or R color name.

- coastlinewidth:

  Sets the coastline stroke width (in px). Number in the interval \[0,
  Inf\].

- countrycolor:

  Sets line color of the country boundaries. Color: a CSS color string
  or R color name.

- countrywidth:

  Sets line width (in px) of the country boundaries. Number in the
  interval \[0, Inf\].

- domain:

  A
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)
  object or named list, with properties `column`, `row`, `x` and `y`
  (see
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)).

- fitbounds:

  Determines if this subplot's view settings are auto-computed to fit
  trace data. On scoped maps, setting \`fitbounds\` leads to
  \`center.lon\` and \`center.lat\` getting auto-filled. On maps with a
  non-clipped projection, setting \`fitbounds\` leads to \`center.lon\`,
  \`center.lat\`, and \`projection.rotation.lon\` getting auto-filled.
  On maps with a clipped projection, setting \`fitbounds\` leads to
  \`center.lon\`, \`center.lat\`, \`projection.rotation.lon\`,
  \`projection.rotation.lat\`, \`lonaxis.range\` and \`lataxis.range\`
  getting auto-filled. If "locations" (default), only the trace's
  visible locations are considered in the \`fitbounds\` computations. If
  "geojson", the entire trace input \`geojson\` (if provided) is
  considered in the \`fitbounds\` computations. If FALSE, the view
  settings are used as-is; set this to opt out of auto-fitting. One of
  `"locations"`, `"geojson"`, `FALSE`.

- framecolor:

  Sets the color the frame. Color: a CSS color string or R color name.

- framewidth:

  Sets the stroke width (in px) of the frame. Number in the interval
  \[0, Inf\].

- lakecolor:

  Sets the color of the lakes. Color: a CSS color string or R color
  name.

- landcolor:

  Sets the land mass color. Color: a CSS color string or R color name.

- lataxis:

  A
  [`go_geo_lataxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo_lataxis.md)
  object or named list, with properties `dtick`, `gridcolor`,
  `griddash`, `gridwidth`, `range`, `showgrid` and `tick0` (see
  [`go_geo_lataxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo_lataxis.md)).

- lonaxis:

  A
  [`go_geo_lonaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo_lonaxis.md)
  object or named list, with properties `dtick`, `gridcolor`,
  `griddash`, `gridwidth`, `range`, `showgrid` and `tick0` (see
  [`go_geo_lonaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo_lonaxis.md)).

- oceancolor:

  Sets the ocean color Color: a CSS color string or R color name.

- projection:

  A
  [`go_geo_projection()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo_projection.md)
  object or named list, with properties `distance`, `maxscale`,
  `minscale`, `parallels`, `rotation`, `scale`, `tilt` and `type` (see
  [`go_geo_projection()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo_projection.md)).

- resolution:

  Sets the resolution of the base layers. The values have units of km/mm
  e.g. 110 corresponds to a scale ratio of 1:110,000,000. One of `110`,
  `50`.

- rivercolor:

  Sets color of the rivers. Color: a CSS color string or R color name.

- riverwidth:

  Sets the stroke width (in px) of the rivers. Number in the interval
  \[0, Inf\].

- scope:

  Set the scope of the map. One of `"africa"`, `"antarctica"`, `"asia"`,
  `"europe"`, `"north america"`, `"oceania"`, `"south america"`,
  `"usa"`, `"world"`.

- showcoastlines:

  Sets whether or not the coastlines are drawn. Logical.

- showcountries:

  Sets whether or not country boundaries are drawn. Logical.

- showframe:

  Sets whether or not a frame is drawn around the map. Logical.

- showlakes:

  Sets whether or not lakes are drawn. Logical.

- showland:

  Sets whether or not land masses are filled in color. Logical.

- showocean:

  Sets whether or not oceans are filled in color. Logical.

- showrivers:

  Sets whether or not rivers are drawn. Logical.

- showsubunits:

  Sets whether or not boundaries of subunits within countries (e.g.
  states, provinces) are drawn. Logical.

- subunitcolor:

  Sets the color of the subunits boundaries. Color: a CSS color string
  or R color name.

- subunitwidth:

  Sets the stroke width (in px) of the subunits boundaries. Number in
  the interval \[0, Inf\].

- uirevision:

  Controls persistence of user-driven changes in the view (projection
  and center). Defaults to \`layout.uirevision\`. Any value.

- visible:

  Sets the default visibility of the base layers. Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_geo` object (a named list).

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
  add_scattergeo(lat = ~lat, lon = ~long) |>
  update_layout(geo = go_geo(visible = TRUE))
```
