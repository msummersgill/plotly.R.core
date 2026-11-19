# Layout geo projection rotation objects

The object for the layout's `geo.projection.rotation`
([`go_geo_projection()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo_projection.md)).
`go_geo_projection_rotation()` creates one, with exactly its properties;
a named list with the same properties works too.

## Usage

``` r
go_geo_projection_rotation(
  ...,
  lat = NULL,
  lon = NULL,
  roll = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- lat:

  Rotates the map along meridians (in degrees North). Number.

- lon:

  Rotates the map along parallels (in degrees East). Defaults to the
  center of the \`lonaxis.range\` values. Number.

- roll:

  Roll the map (in degrees) For example, a roll of 180 makes the map
  appear upside down. Number.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_geo_projection_rotation` object (a named list).

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
  update_layout(
    geo = go_geo(
      projection = go_geo_projection(rotation = go_geo_projection_rotation())
    )
  )
```
