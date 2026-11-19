# Sankey node objects

The nodes of the Sankey plot. The object for the `node` of a sankey
trace
([`go_sankey()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey.md)).
`go_sankey_node()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_sankey_node(
  arg = NULL,
  ...,
  align = NULL,
  color = NULL,
  customdata = NULL,
  groups = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  label = NULL,
  line = NULL,
  pad = NULL,
  sort = NULL,
  thickness = NULL,
  x = NULL,
  y = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- align:

  Sets the alignment method used to position the nodes along the
  horizontal axis. One of `"justify"`, `"left"`, `"right"`, `"center"`.

- color:

  Sets the \`node\` color. It can be a single value, or an array for
  specifying color for each \`node\`. If \`node.color\` is omitted, then
  the default \`Plotly\` color palette will be cycled through to have a
  variety of colors. These defaults are not fully opaque, to allow some
  visibility of what is beneath the node. Color: a CSS color string or R
  color name, or a vector of these.

- customdata:

  Assigns extra data to each node. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

- groups:

  Groups of nodes. Each group is defined by an array with the indices of
  the nodes it contains. Multiple groups can be specified. Vector or
  list of up to 1 element(s).

- hoverinfo:

  Determines what trace information appears when hovering nodes. If
  \`none\` or \`skip\` are set, no information is displayed upon
  hovering. But, if \`none\` is set, click and hover events are still
  fired. One of `"all"`, `"none"`, `"skip"`.

- hoverlabel:

  A
  [`go_hoverlabel()`](https://msummersgill.github.io/plotly.R.core/reference/go_hoverlabel.md)
  object or named list, with properties `align`, `bgcolor`,
  `bordercolor`, `font`, `namelength` and `showarrow` (see
  [`go_hoverlabel()`](https://msummersgill.github.io/plotly.R.core/reference/go_hoverlabel.md)).

- hovertemplate:

  Template string used for rendering the information that appear on
  hover box. Note that this will override \`hoverinfo\`. Variables are
  inserted using %{variable}, for example "y: %{y}" as well as
  %{xother}, {%\_xother}, {%\_xother\_}, {%xother\_}. When showing info
  for several points, "xother" will be added to those with different x
  positions from the first point. An underscore before or after
  "(x\|y)other" will add a space on that side, only when this field is
  shown. Numbers are formatted using d3-format's syntax
  %{variable:d3-format}, for example "Price: %{y:\$.2f}".
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format for details on
  the formatting syntax. Dates are formatted using d3-time-format's
  syntax %{variable\|d3-time-format}, for example "Day:
  %{2019-01-01\|%A}".
  https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format for
  details on the date formatting syntax. Variables that can't be found
  will be replaced with the specifier. For example, a template of "data:
  %{x}, %{y}" will result in a value of "data: 1, %{y}" if x is 1 and y
  is missing. Variables with an undefined value will be replaced with
  the fallback value. The variables available in \`hovertemplate\` are
  the ones emitted as event data described at this link
  https://plotly.com/javascript/plotlyjs-events/#event-data.
  Additionally, all attributes that can be specified per-point (the ones
  that are \`arrayOk: true\`) are available. Finally, the template
  string has access to variables \`value\` and \`label\`. Anything
  contained in tag \`\<extra\>\` is displayed in the secondary box, for
  example \`\<extra\>%{fullData.name}\</extra\>\`. To hide the secondary
  box completely, use an empty tag \`\<extra\>\</extra\>\`. String, or a
  vector of these.

- hovertemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- label:

  The shown name of the node. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- line:

  A
  [`go_sankey_node_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey_node_line.md)
  object or named list, with properties `color` and `width` (see
  [`go_sankey_node_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey_node_line.md)).

- pad:

  Sets the padding (in px) between the \`nodes\`. Number in the interval
  \[0, Inf\].

- sort:

  For \`auto\` (the default), the vertical order of nodes will be
  determined automatically by the layout. For \`input\`, the vertical
  order of nodes is kept the same as the order in the input array. One
  of `"auto"`, `"input"`.

- thickness:

  Sets the thickness (in px) of the \`nodes\`. Number in the interval
  \[1, Inf\].

- x:

  The normalized horizontal position of the node. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

- y:

  The normalized vertical position of the node. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_sankey_node` object (a named list).

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
  node = go_sankey_node(color = "red")
)
#> <go_sankey>
#> {
#>   "type": "sankey",
#>   "node": {
#>     "color": "red"
#>   }
#> }
#> 
```
