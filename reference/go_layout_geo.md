# Layout geo objects

Properties of `layout.geo`.

## Usage

``` r
go_layout_geo(
  arg = NULL,
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

go_layout_geo_center(
  arg = NULL,
  ...,
  lat = NULL,
  lon = NULL,
  skip_invalid = FALSE
)

go_layout_geo_domain(
  arg = NULL,
  ...,
  column = NULL,
  row = NULL,
  x = NULL,
  y = NULL,
  skip_invalid = FALSE
)

go_layout_geo_lataxis(
  arg = NULL,
  ...,
  dtick = NULL,
  gridcolor = NULL,
  griddash = NULL,
  gridwidth = NULL,
  range = NULL,
  showgrid = NULL,
  tick0 = NULL,
  skip_invalid = FALSE
)

go_layout_geo_lonaxis(
  arg = NULL,
  ...,
  dtick = NULL,
  gridcolor = NULL,
  griddash = NULL,
  gridwidth = NULL,
  range = NULL,
  showgrid = NULL,
  tick0 = NULL,
  skip_invalid = FALSE
)

go_layout_geo_projection(
  arg = NULL,
  ...,
  distance = NULL,
  maxscale = NULL,
  minscale = NULL,
  parallels = NULL,
  rotation = NULL,
  scale = NULL,
  tilt = NULL,
  type = NULL,
  skip_invalid = FALSE
)

go_layout_geo_projection_rotation(
  arg = NULL,
  ...,
  lat = NULL,
  lon = NULL,
  roll = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from (constructors). Named arguments take precedence.

- ...:

  Further properties, including nested properties in "magic underscore"
  form, e.g. `marker_size = 10` for `marker = list(size = 10)`. Property
  values may be one-sided formulas, evaluated in `data` for `add_*()`
  functions.

- bgcolor:

  Set the background color of the map Color: a CSS color string or R
  color name.

- center:

  Named list or `go_layout_geo_center()` object.

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

  Named list or `go_layout_geo_domain()` object.

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

  Named list or `go_layout_geo_lataxis()` object.

- lonaxis:

  Named list or `go_layout_geo_lonaxis()` object.

- oceancolor:

  Sets the ocean color Color: a CSS color string or R color name.

- projection:

  Named list or `go_layout_geo_projection()` object.

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

- lat:

  **`go_layout_geo_center()`**: Sets the latitude of the map's center.
  For all projection types, the map's latitude center lies at the middle
  of the latitude range by default. Number.

  **`go_layout_geo_projection_rotation()`**: Rotates the map along
  meridians (in degrees North). Number.

- lon:

  **`go_layout_geo_center()`**: Sets the longitude of the map's center.
  By default, the map's longitude center lies at the middle of the
  longitude range for scoped projection and above
  \`projection.rotation.lon\` otherwise. Number.

  **`go_layout_geo_projection_rotation()`**: Rotates the map along
  parallels (in degrees East). Defaults to the center of the
  \`lonaxis.range\` values. Number.

- column:

  If there is a layout grid, use the domain for this column in the grid
  for this geo subplot. Note that geo subplots are constrained by
  domain. In general, when \`projection.scale\` is set to 1. a map will
  fit either its x or y domain, but not both. Integer in the interval
  \[0, Inf\].

- row:

  If there is a layout grid, use the domain for this row in the grid for
  this geo subplot. Note that geo subplots are constrained by domain. In
  general, when \`projection.scale\` is set to 1. a map will fit either
  its x or y domain, but not both. Integer in the interval \[0, Inf\].

- x:

  Sets the horizontal domain of this geo subplot (in plot fraction).
  Note that geo subplots are constrained by domain. In general, when
  \`projection.scale\` is set to 1. a map will fit either its x or y
  domain, but not both. Vector or list of 2 element(s).

- y:

  Sets the vertical domain of this geo subplot (in plot fraction). Note
  that geo subplots are constrained by domain. In general, when
  \`projection.scale\` is set to 1. a map will fit either its x or y
  domain, but not both. Vector or list of 2 element(s).

- dtick:

  Sets the graticule's longitude/latitude tick step. Number.

- gridcolor:

  Sets the graticule's stroke color. Color: a CSS color string or R
  color name.

- griddash:

  Sets the dash style of lines. Set to a dash type string ("solid",
  "dot", "dash", "longdash", "dashdot", or "longdashdot") or a dash
  length list in px (eg "5px,10px,2px,2px"). One of `"solid"`, `"dot"`,
  `"dash"`, `"longdash"`, `"dashdot"`, `"longdashdot"`, or a string
  matching
  `"^\\d+(\\.\\d+)?(px|%)?((,|\\s)\\s*\\d+(\\.\\d+)?(px|%)?)*$"`.

- gridwidth:

  Sets the graticule's stroke width (in px). Number in the interval \[0,
  Inf\].

- range:

  Sets the range of this axis (in degrees), sets the map's clipped
  coordinates. Vector or list of 2 element(s).

- showgrid:

  Sets whether or not graticule are shown on the map. Logical.

- tick0:

  Sets the graticule's starting tick longitude/latitude. Number.

- distance:

  For satellite projection type only. Sets the distance from the center
  of the sphere to the point of view as a proportion of the sphere's
  radius. Number in the interval \[1.001, Inf\].

- maxscale:

  Sets the maximum zoom level of the map view, relative to
  \`projection.scale\`. A \`maxscale\` of 2 (200%) prevents the user
  from zooming in beyond twice the base zoom level. Must be greater than
  or equal to "0"; has no upper bound. Defaults to "null" for no upper
  bound on zoom. Number in the interval \[0, Inf\].

- minscale:

  Sets the minimum zoom level of the map view, relative to
  \`projection.scale\`. A \`minscale\` of 0.5 (50%) prevents the user
  from zooming out beyond half the base zoom level. Must be greater than
  or equal to "0"; has no upper bound. The default of 0 imposes no lower
  bound on zoom. Number in the interval \[0, Inf\].

- parallels:

  For conic projection types only. Sets the parallels (tangent, secant)
  where the cone intersects the sphere. Vector or list of 2 element(s).

- rotation:

  Named list or `go_layout_geo_projection_rotation()` object.

- scale:

  Zooms in or out on the map view. A scale of 1 corresponds to the
  largest zoom level that fits the map's lon and lat ranges. Number in
  the interval \[0, Inf\].

- tilt:

  For satellite projection type only. Sets the tilt angle of perspective
  projection. Number.

- type:

  Sets the projection type. One of `"airy"`, `"aitoff"`, `"albers"`,
  `"albers usa"`, `"august"`, `"azimuthal equal area"`,
  `"azimuthal equidistant"`, `"baker"`, `"bertin1953"`, `"boggs"`,
  `"bonne"`, `"bottomley"`, `"bromley"`, `"collignon"`,
  `"conic conformal"`, `"conic equal area"`, `"conic equidistant"`,
  `"craig"`, `"craster"`, `"cylindrical equal area"`,
  `"cylindrical stereographic"`, `"eckert1"`, `"eckert2"`, `"eckert3"`,
  `"eckert4"`, `"eckert5"`, `"eckert6"`, `"eisenlohr"`, `"equal earth"`,
  `"equirectangular"`, `"fahey"`, `"foucaut"`, `"foucaut sinusoidal"`,
  `"ginzburg4"`, `"ginzburg5"`, `"ginzburg6"`, `"ginzburg8"`,
  `"ginzburg9"`, `"gnomonic"`, `"gringorten"`,
  `"gringorten quincuncial"`, `"guyou"`, `"hammer"`, `"hill"`,
  `"homolosine"`, `"hufnagel"`, `"hyperelliptical"`, `"kavrayskiy7"`,
  `"lagrange"`, `"larrivee"`, `"laskowski"`, `"loximuthal"`,
  `"mercator"`, `"miller"`, `"mollweide"`, `"mt flat polar parabolic"`,
  `"mt flat polar quartic"`, `"mt flat polar sinusoidal"`,
  `"natural earth"`, `"natural earth1"`, `"natural earth2"`,
  `"nell hammer"`, `"nicolosi"`, `"orthographic"`, `"patterson"`,
  `"peirce quincuncial"`, `"polyconic"`, `"rectangular polyconic"`,
  `"robinson"`, `"satellite"`, `"sinu mollweide"`, `"sinusoidal"`,
  `"stereographic"`, `"times"`, `"transverse mercator"`,
  `"van der grinten"`, `"van der grinten2"`, `"van der grinten3"`,
  `"van der grinten4"`, `"wagner4"`, `"wagner6"`, `"wiechel"`,
  `"winkel tripel"`, `"winkel3"`.

- roll:

  Roll the map (in degrees) For example, a roll of 180 makes the map
  appear upside down. Number.

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_geo()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

Nested objects documented here:

- `go_layout_geo_center()`:

  `layout.geo.center`

- `go_layout_geo_domain()`:

  `layout.geo.domain`

- `go_layout_geo_lataxis()`:

  `layout.geo.lataxis`

- `go_layout_geo_lonaxis()`:

  `layout.geo.lonaxis`

- `go_layout_geo_projection()`:

  `layout.geo.projection`

- `go_layout_geo_projection_rotation()`:

  `layout.geo.projection.rotation`

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
