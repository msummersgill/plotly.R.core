# Parcats dimension objects

The dimensions (variables) of the parallel categories diagram. The
object for an element of the `dimensions` list of a parcats trace
([`go_parcats()`](https://msummersgill.github.io/plotly.R.core/reference/go_parcats.md)).
`go_parcats_dimension()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_parcats_dimension(
  ...,
  categoryarray = NULL,
  categoryorder = NULL,
  displayindex = NULL,
  label = NULL,
  ticktext = NULL,
  values = NULL,
  visible = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- categoryarray:

  Sets the order in which categories in this dimension appear. Only has
  an effect if \`categoryorder\` is set to "array". Used with
  \`categoryorder\`. Data array: a vector, factor, Date/POSIXct vector,
  matrix or list.

- categoryorder:

  Specifies the ordering logic for the categories in the dimension. By
  default, plotly uses "trace", which specifies the order that is
  present in the data supplied. Set \`categoryorder\` to "category
  ascending" or "category descending" if order should be determined by
  the alphanumerical order of the category names. Set \`categoryorder\`
  to "array" to derive the ordering from the attribute
  \`categoryarray\`. If a category is not found in the \`categoryarray\`
  array, the sorting behavior for that attribute will be identical to
  the "trace" mode. The unspecified categories will follow the
  categories in \`categoryarray\`. One of `"trace"`,
  `"category ascending"`, `"category descending"`, `"array"`.

- displayindex:

  The display index of dimension, from left to right, zero indexed,
  defaults to dimension index. Integer.

- label:

  The shown name of the dimension. String.

- ticktext:

  Sets alternative tick labels for the categories in this dimension.
  Only has an effect if \`categoryorder\` is set to "array". Should be
  an array the same length as \`categoryarray\` Used with
  \`categoryorder\`. Data array: a vector, factor, Date/POSIXct vector,
  matrix or list.

- values:

  Dimension values. \`values\[n\]\` represents the category value of the
  \`n\`th point in the dataset, therefore the \`values\` vector for all
  dimensions must be the same (longer vectors will be truncated). Data
  array: a vector, factor, Date/POSIXct vector, matrix or list.

- visible:

  Shows the dimension when set to \`true\` (the default). Hides the
  dimension for \`false\`. Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_parcats_dimension` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
go_parcats(
  dimensions = list(go_parcats_dimension(visible = TRUE))
)
#> <go_parcats>
#> {
#>   "type": "parcats",
#>   "dimensions": [
#>     {
#>       "visible": true
#>     }
#>   ]
#> }
#> 
```
