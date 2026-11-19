# Layout map center objects

The object for the layout's `map.center`
([`go_map()`](https://msummersgill.github.io/plotly.R.core/reference/go_map.md)).
`go_map_center()` creates one, with exactly its properties; a named list
with the same properties works too.

## Usage

``` r
go_map_center(arg = NULL, ..., lat = NULL, lon = NULL, skip_invalid = FALSE)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- lat:

  Sets the latitude of the center of the map (in degrees North). Number.

- lon:

  Sets the longitude of the center of the map (in degrees East). Number.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_map_center` object (a named list).

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
  update_layout(map = go_map(center = go_map_center()))
```
