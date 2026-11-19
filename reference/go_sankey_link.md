# Sankey link objects

The links of the Sankey plot. The object for the `link` of a sankey
trace
([`go_sankey()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey.md)).
`go_sankey_link()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_sankey_link(
  ...,
  arrowlen = NULL,
  color = NULL,
  colorscales = NULL,
  customdata = NULL,
  hovercolor = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  label = NULL,
  line = NULL,
  sort = NULL,
  source = NULL,
  target = NULL,
  value = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- arrowlen:

  Sets the length (in px) of the links arrow, if 0 no arrow will be
  drawn. Number in the interval \[0, Inf\].

- color:

  Sets the \`link\` color. It can be a single value, or an array for
  specifying color for each \`link\`. If \`link.color\` is omitted, then
  by default, a translucent grey link will be used. Color: a CSS color
  string or R color name, or a vector of these.

- colorscales:

  List, each element a
  [`go_sankey_link_concentrationscales()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey_link_concentrationscales.md)
  object or named list, with properties `cmax`, `cmin`, `colorscale`,
  `label`, `name` and `templateitemname` (see
  [`go_sankey_link_concentrationscales()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey_link_concentrationscales.md)).

- customdata:

  Assigns extra data to each link. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

- hovercolor:

  Sets the \`link\` hover color. It can be a single value, or an array
  for specifying hover colors for each \`link\`. If \`link.hovercolor\`
  is omitted, then by default, links will become slightly more opaque
  when hovered over. Color: a CSS color string or R color name, or a
  vector of these.

- hoverinfo:

  Determines what trace information appears when hovering links. If
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

  The shown name of the link. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- line:

  A
  [`go_sankey_link_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey_link_line.md)
  object or named list, with properties `color` and `width` (see
  [`go_sankey_link_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey_link_line.md)).

- sort:

  For \`auto\` (the default), the order of links attached to each node
  is determined automatically by the layout. For \`input\`, the order of
  links at each node is kept the same as the order in the input array.
  One of `"auto"`, `"input"`.

- source:

  An integer number \`\[0..nodes.length - 1\]\` that represents the
  source node. Data array: a vector, factor, Date/POSIXct vector, matrix
  or list.

- target:

  An integer number \`\[0..nodes.length - 1\]\` that represents the
  target node. Data array: a vector, factor, Date/POSIXct vector, matrix
  or list.

- value:

  A numeric value representing the flow volume value. Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_sankey_link` object (a named list).

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
  link = go_sankey_link(color = "red")
)
#> <go_sankey>
#> {
#>   "type": "sankey",
#>   "link": {
#>     "color": "red"
#>   }
#> }
#> 
```
