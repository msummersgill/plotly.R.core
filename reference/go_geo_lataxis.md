# Layout geo lataxis objects

The object for the layout's `geo.lataxis`
([`go_geo()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo.md)).
`go_geo_lataxis()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_geo_lataxis(
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
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

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

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_geo_lataxis` object (a named list).

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
  update_layout(geo = go_geo(lataxis = go_geo_lataxis()))
```
