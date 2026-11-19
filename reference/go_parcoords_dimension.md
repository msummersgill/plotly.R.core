# Parcoords dimension objects

The dimensions (variables) of the parallel coordinates chart. 2..60
dimensions are supported. The object for an element of the `dimensions`
list of a parcoords trace
([`go_parcoords()`](https://msummersgill.github.io/plotly.R.core/reference/go_parcoords.md)).
`go_parcoords_dimension()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_parcoords_dimension(
  arg = NULL,
  ...,
  constraintrange = NULL,
  label = NULL,
  multiselect = NULL,
  name = NULL,
  range = NULL,
  templateitemname = NULL,
  tickformat = NULL,
  ticktext = NULL,
  tickvals = NULL,
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

- constraintrange:

  The domain range to which the filter on the dimension is constrained.
  Must be an array of \`\[fromValue, toValue\]\` with \`fromValue \<=
  toValue\`, or if \`multiselect\` is not disabled, you may give an
  array of arrays, where each inner array is \`\[fromValue, toValue\]\`.
  Vector or list of up to 2 element(s).

- label:

  The shown name of the dimension. String.

- multiselect:

  Do we allow multiple selection ranges or just a single range? Logical.

- name:

  When used in a template, named items are created in the output figure
  in addition to any items the figure already has in this array. You can
  modify these items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- range:

  The domain range that represents the full, shown axis extent. Defaults
  to the \`values\` extent. Must be an array of \`\[fromValue,
  toValue\]\` with finite numbers as elements. Vector or list of 2
  element(s).

- templateitemname:

  Used to refer to a named item in this array in the template. Named
  items from the template will be created even without a matching item
  in the input figure, but you can modify one by making an item with
  \`templateitemname\` matching its \`name\`, alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). If there is no template or no matching item, this item will
  be hidden unless you explicitly show it with \`visible: true\`.
  String.

- tickformat:

  Sets the tick label formatting rule using d3 formatting mini-languages
  which are very similar to those in Python. For numbers, see:
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for dates
  see: https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format.
  We add two items to d3's date formatter: "%h" for half of the year as
  a decimal number as well as "%{n}f" for fractional seconds with n
  digits. For example, "2016-10-13 09:15:23.456" with tickformat
  "%H~%M~%S.%2f" would display "09~15~23.46" String.

- ticktext:

  Sets the text displayed at the ticks position via \`tickvals\`. Data
  array: a vector, factor, Date/POSIXct vector, matrix or list.

- tickvals:

  Sets the values at which ticks on this axis appear. Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- values:

  Dimension values. \`values\[n\]\` represents the value of the \`n\`th
  point in the dataset, therefore the \`values\` vector for all
  dimensions must be the same (longer vectors will be truncated). Each
  value must be a finite number. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

- visible:

  Shows the dimension when set to \`true\` (the default). Hides the
  dimension for \`false\`. Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_parcoords_dimension` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
go_parcoords(
  dimensions = list(go_parcoords_dimension(visible = TRUE))
)
#> <go_parcoords>
#> {
#>   "type": "parcoords",
#>   "dimensions": [
#>     {
#>       "visible": true
#>     }
#>   ]
#> }
#> 
```
