# Choroplethmap marker objects

The object for the `marker` of a choroplethmap trace
([`go_choroplethmap()`](https://msummersgill.github.io/plotly.R.core/reference/go_choroplethmap.md)).
`go_choroplethmap_marker()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_choroplethmap_marker(
  arg = NULL,
  ...,
  line = NULL,
  opacity = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- line:

  A
  [`go_choroplethmap_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_choroplethmap_marker_line.md)
  object or named list, with properties `color` and `width` (see
  [`go_choroplethmap_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_choroplethmap_marker_line.md)).

- opacity:

  Sets the opacity of the locations. Number in the interval \[0, 1\], or
  a vector of these.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_choroplethmap_marker` object (a named list).

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
  marker = go_choroplethmap_marker(opacity = 0.5)
)
#> <go_choroplethmap>
#> {
#>   "type": "choroplethmap",
#>   "marker": {
#>     "opacity": 0.5
#>   }
#> }
#> 
```
