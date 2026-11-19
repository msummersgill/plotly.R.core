# Layout geo center objects

The object for the layout's `geo.center`
([`go_geo()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo.md)).
`go_geo_center()` creates one, with exactly its properties; a named list
with the same properties works too.

## Usage

``` r
go_geo_center(arg = NULL, ..., lat = NULL, lon = NULL, skip_invalid = FALSE)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- lat:

  Sets the latitude of the map's center. For all projection types, the
  map's latitude center lies at the middle of the latitude range by
  default. Number.

- lon:

  Sets the longitude of the map's center. By default, the map's
  longitude center lies at the middle of the longitude range for scoped
  projection and above \`projection.rotation.lon\` otherwise. Number.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_geo_center` object (a named list).

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
  update_layout(geo = go_geo(center = go_geo_center()))
```
