# Choroplethmap marker line objects

The object for the `marker.line` of a choroplethmap trace
([`go_choroplethmap_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_choroplethmap_marker.md)).
`go_choroplethmap_marker_line()` creates one, with exactly its
properties; a named list with the same properties works too.

## Usage

``` r
go_choroplethmap_marker_line(
  arg = NULL,
  ...,
  color = NULL,
  width = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- color:

  Sets the marker.line color. It accepts either a specific color or an
  array of numbers that are mapped to the colorscale relative to the max
  and min values of the array or relative to \`marker.line.cmin\` and
  \`marker.line.cmax\` if set. Color: a CSS color string or R color
  name, or a vector of these.

- width:

  Sets the width (in px) of the lines bounding the marker points. Number
  in the interval \[0, Inf\], or a vector of these.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_choroplethmap_marker_line` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
go_choroplethmap(
  marker = go_choroplethmap_marker(
    line = go_choroplethmap_marker_line(color = "red")
  )
)
#> <go_choroplethmap>
#> {
#>   "type": "choroplethmap",
#>   "marker": {
#>     "line": {
#>       "color": "red"
#>     }
#>   }
#> }
#> 
```
