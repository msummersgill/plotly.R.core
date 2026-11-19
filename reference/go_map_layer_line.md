# Layout map layer line objects

The object for the layout's `map.layer.line`
([`go_map_layer()`](https://msummersgill.github.io/plotly.R.core/reference/go_map_layer.md)).
`go_map_layer_line()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_map_layer_line(..., dash = NULL, width = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- dash:

  Sets the length of dashes and gaps (map.layer.paint.line-dasharray).
  Has an effect only when \`type\` is set to "line". Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- width:

  Sets the line width (map.layer.paint.line-width). Has an effect only
  when \`type\` is set to "line". Number.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_map_layer_line` object (a named list).

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
  update_layout(
    map = go_map(
      layers = list(go_map_layer(line = go_map_layer_line(width = 2)))
    )
  )
```
