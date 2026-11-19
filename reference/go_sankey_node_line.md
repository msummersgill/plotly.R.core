# Sankey node line objects

The object for the `node.line` of a sankey trace
([`go_sankey_node()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey_node.md)).
`go_sankey_node_line()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_sankey_node_line(..., color = NULL, width = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- color:

  Sets the color of the \`line\` around each \`node\`. Color: a CSS
  color string or R color name, or a vector of these.

- width:

  Sets the width (in px) of the \`line\` around each \`node\`. Number in
  the interval \[0, Inf\], or a vector of these.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_sankey_node_line` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
go_sankey(
  node = go_sankey_node(
    line = go_sankey_node_line(color = "red")
  )
)
#> <go_sankey>
#> {
#>   "type": "sankey",
#>   "node": {
#>     "line": {
#>       "color": "red"
#>     }
#>   }
#> }
#> 
```
