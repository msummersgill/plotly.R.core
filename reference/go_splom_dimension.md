# Splom dimension objects

The object for an element of the `dimensions` list of a splom trace
([`go_splom()`](https://msummersgill.github.io/plotly.R.core/reference/go_splom.md)).
`go_splom_dimension()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_splom_dimension(
  arg = NULL,
  ...,
  axis = NULL,
  label = NULL,
  name = NULL,
  templateitemname = NULL,
  values = NULL,
  visible = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- axis:

  A
  [`go_splom_dimension_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_splom_dimension_axis.md)
  object or named list, with properties `matches` and `type` (see
  [`go_splom_dimension_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_splom_dimension_axis.md)).

- label:

  Sets the label corresponding to this splom dimension. String.

- name:

  When used in a template, named items are created in the output figure
  in addition to any items the figure already has in this array. You can
  modify these items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- templateitemname:

  Used to refer to a named item in this array in the template. Named
  items from the template will be created even without a matching item
  in the input figure, but you can modify one by making an item with
  \`templateitemname\` matching its \`name\`, alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). If there is no template or no matching item, this item will
  be hidden unless you explicitly show it with \`visible: true\`.
  String.

- values:

  Sets the dimension values to be plotted. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

- visible:

  Determines whether or not this dimension is shown on the graph. Note
  that even visible false dimension contribute to the default grid
  generate by this splom trace. Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_splom_dimension` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
go_splom(
  dimensions = list(go_splom_dimension(visible = TRUE))
)
#> <go_splom>
#> {
#>   "type": "splom",
#>   "dimensions": [
#>     {
#>       "visible": true
#>     }
#>   ]
#> }
#> 
```
