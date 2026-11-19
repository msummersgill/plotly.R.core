# Layout geo projection objects

The object for the layout's `geo.projection`
([`go_geo()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo.md)).
`go_geo_projection()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_geo_projection(
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
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

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

  A
  [`go_geo_projection_rotation()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo_projection_rotation.md)
  object or named list, with properties `lat`, `lon` and `roll` (see
  [`go_geo_projection_rotation()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo_projection_rotation.md)).

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

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_geo_projection` object (a named list).

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
  update_layout(geo = go_geo(projection = go_geo_projection()))
```
