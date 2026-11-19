# Table header fill objects

The object for the `header.fill` of a table trace
([`go_table_header()`](https://msummersgill.github.io/plotly.R.core/reference/go_table_header.md)).
`go_table_header_fill()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_table_header_fill(arg = NULL, ..., color = NULL, skip_invalid = FALSE)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- color:

  Sets the cell fill color. It accepts either a specific color or an
  array of colors or a 2D array of colors. Color: a CSS color string or
  R color name, or a vector of these.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_table_header_fill` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
go_table(
  header = go_table_header(
    fill = go_table_header_fill(color = "red")
  )
)
#> <go_table>
#> {
#>   "type": "table",
#>   "header": {
#>     "fill": {
#>       "color": "red"
#>     }
#>   }
#> }
#> 
```
