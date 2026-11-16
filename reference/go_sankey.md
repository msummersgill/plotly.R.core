# Sankey traces

Sankey plots for network flow data analysis. The nodes are specified in
\`nodes\` and the links between sources and targets in \`links\`. The
colors are set in \`nodes\[i\].color\` and \`links\[i\].color\`,
otherwise defaults are used.

## Usage

``` r
add_sankey(fig, ...)

# Default S3 method
add_sankey(
  fig,
  ...,
  data = NULL,
  arrangement = NULL,
  customdata = NULL,
  direction = NULL,
  domain = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  ids = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  link = NULL,
  meta = NULL,
  name = NULL,
  node = NULL,
  orientation = NULL,
  selectedpoints = NULL,
  textfont = NULL,
  uid = NULL,
  uirevision = NULL,
  valueformat = NULL,
  valuesuffix = NULL,
  visible = NULL,
  row = NULL,
  col = NULL,
  skip_invalid = FALSE
)

go_sankey(
  arg = NULL,
  ...,
  arrangement = NULL,
  customdata = NULL,
  direction = NULL,
  domain = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  ids = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  link = NULL,
  meta = NULL,
  name = NULL,
  node = NULL,
  orientation = NULL,
  selectedpoints = NULL,
  textfont = NULL,
  uid = NULL,
  uirevision = NULL,
  valueformat = NULL,
  valuesuffix = NULL,
  visible = NULL,
  skip_invalid = FALSE
)

go_sankey_domain(
  arg = NULL,
  ...,
  column = NULL,
  row = NULL,
  x = NULL,
  y = NULL,
  skip_invalid = FALSE
)

go_sankey_hoverlabel(
  arg = NULL,
  ...,
  align = NULL,
  bgcolor = NULL,
  bordercolor = NULL,
  font = NULL,
  namelength = NULL,
  showarrow = NULL,
  skip_invalid = FALSE
)

go_sankey_hoverlabel_font(
  arg = NULL,
  ...,
  color = NULL,
  family = NULL,
  lineposition = NULL,
  shadow = NULL,
  size = NULL,
  style = NULL,
  textcase = NULL,
  variant = NULL,
  weight = NULL,
  skip_invalid = FALSE
)

go_sankey_legendgrouptitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_sankey_legendgrouptitle_font(
  arg = NULL,
  ...,
  color = NULL,
  family = NULL,
  lineposition = NULL,
  shadow = NULL,
  size = NULL,
  style = NULL,
  textcase = NULL,
  variant = NULL,
  weight = NULL,
  skip_invalid = FALSE
)

go_sankey_link(
  arg = NULL,
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

go_sankey_link_concentrationscales(
  arg = NULL,
  ...,
  cmax = NULL,
  cmin = NULL,
  colorscale = NULL,
  label = NULL,
  name = NULL,
  templateitemname = NULL,
  skip_invalid = FALSE
)

go_sankey_link_hoverlabel(
  arg = NULL,
  ...,
  align = NULL,
  bgcolor = NULL,
  bordercolor = NULL,
  font = NULL,
  namelength = NULL,
  showarrow = NULL,
  skip_invalid = FALSE
)

go_sankey_link_hoverlabel_font(
  arg = NULL,
  ...,
  color = NULL,
  family = NULL,
  lineposition = NULL,
  shadow = NULL,
  size = NULL,
  style = NULL,
  textcase = NULL,
  variant = NULL,
  weight = NULL,
  skip_invalid = FALSE
)

go_sankey_link_line(
  arg = NULL,
  ...,
  color = NULL,
  width = NULL,
  skip_invalid = FALSE
)

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

go_sankey_node_hoverlabel(
  arg = NULL,
  ...,
  align = NULL,
  bgcolor = NULL,
  bordercolor = NULL,
  font = NULL,
  namelength = NULL,
  showarrow = NULL,
  skip_invalid = FALSE
)

go_sankey_node_hoverlabel_font(
  arg = NULL,
  ...,
  color = NULL,
  family = NULL,
  lineposition = NULL,
  shadow = NULL,
  size = NULL,
  style = NULL,
  textcase = NULL,
  variant = NULL,
  weight = NULL,
  skip_invalid = FALSE
)

go_sankey_node_line(
  arg = NULL,
  ...,
  color = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_sankey_textfont(
  arg = NULL,
  ...,
  color = NULL,
  family = NULL,
  lineposition = NULL,
  shadow = NULL,
  size = NULL,
  style = NULL,
  textcase = NULL,
  variant = NULL,
  weight = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- fig:

  A `go_figure` object.

- ...:

  Further properties, including nested properties in "magic underscore"
  form, e.g. `marker_size = 10` for `marker = list(size = 10)`. Property
  values may be one-sided formulas, evaluated in `data` for `add_*()`
  functions.

- data:

  A data frame in which formula properties (e.g. `x = ~col`,
  `marker_size = ~col`) are evaluated. Default: the data given to
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md).
  Only the evaluated values are added to the trace.

- arrangement:

  If value is \`snap\` (the default), the node arrangement is assisted
  by automatic snapping of elements to preserve space between nodes
  specified via \`nodepad\`. If value is \`perpendicular\`, the nodes
  can only move along a line perpendicular to the flow. If value is
  \`freeform\`, the nodes can freely move on the plane. If value is
  \`fixed\`, the nodes are stationary. One of `"snap"`,
  `"perpendicular"`, `"freeform"`, `"fixed"`.

- customdata:

  **`go_sankey()`**: Assigns extra data each datum. This may be useful
  when listening to hover, click and selection events. Note that,
  "scatter" traces also appends customdata items in the markers DOM
  elements Data array: a vector, factor, Date/POSIXct vector, matrix or
  list.

  **`go_sankey_link()`**: Assigns extra data to each link. Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

  **`go_sankey_node()`**: Assigns extra data to each node. Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- direction:

  Sets the direction of the flow along the \`orientation\` axis. With
  \`forward\` (the default), sources are on the left (horizontal) or top
  (vertical). With \`reversed\`, sources are on the right (horizontal)
  or bottom (vertical). One of `"forward"`, `"reversed"`.

- domain:

  Named list or `go_sankey_domain()` object.

- hoverinfo:

  **`go_sankey()`**: Determines what trace information appears on hover.
  If \`none\` or \`skip\` are set, no information is displayed upon
  hovering. But, if \`none\` is set, click and hover events are still
  fired. Note that this attribute is superseded by \`node.hoverinfo\`
  and \`node.hoverinfo\` for nodes and links respectively. Any
  combination of `""` joined with `"+"`, or one of `"all"`, `"none"`,
  `"skip"`.

  **`go_sankey_link()`**: Determines what trace information appears when
  hovering links. If \`none\` or \`skip\` are set, no information is
  displayed upon hovering. But, if \`none\` is set, click and hover
  events are still fired. One of `"all"`, `"none"`, `"skip"`.

  **`go_sankey_node()`**: Determines what trace information appears when
  hovering nodes. If \`none\` or \`skip\` are set, no information is
  displayed upon hovering. But, if \`none\` is set, click and hover
  events are still fired. One of `"all"`, `"none"`, `"skip"`.

- hoverlabel:

  **`go_sankey()`**: Named list or `go_sankey_hoverlabel()` object.

  **`go_sankey_link()`**: Named list or `go_sankey_link_hoverlabel()`
  object.

  **`go_sankey_node()`**: Named list or `go_sankey_node_hoverlabel()`
  object.

- ids:

  Assigns id labels to each datum. These ids for object constancy of
  data points during animation. Should be an array of strings, not
  numbers or any other type. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- legend:

  Sets the reference to a legend to show this trace in. References to
  these legends are "legend", "legend2", "legend3", etc. Settings for
  these legends are set in the layout, under \`layout.legend\`,
  \`layout.legend2\`, etc. Subplot id: `"legend"`, `"legend2"`,
  `"legend3"`, ....

- legendgrouptitle:

  Named list or `go_sankey_legendgrouptitle()` object.

- legendrank:

  Sets the legend rank for this trace. Items and groups with smaller
  ranks are presented on top/left side while with "reversed"
  \`legend.traceorder\` they are on bottom/right side. The default
  legendrank is 1000, so that you can use ranks less than 1000 to place
  certain items before all unranked items, and ranks greater than 1000
  to go after all unranked items. When having unranked or equal rank
  items shapes would be displayed after traces i.e. according to their
  order in data and layout. Number.

- legendwidth:

  Sets the width (in px or fraction) of the legend for this trace.
  Number in the interval \[0, Inf\].

- link:

  The links of the Sankey plot. Named list or `go_sankey_link()` object.

- meta:

  Assigns extra meta information associated with this trace that can be
  used in various text attributes. Attributes such as trace \`name\`,
  graph, axis and colorbar \`title.text\`, annotation \`text\`
  \`rangeselector\`, \`updatemenues\` and \`sliders\` \`label\` text all
  support \`meta\`. To access the trace \`meta\` values in an attribute
  in the same trace, simply use \`%{meta\[i\]}\` where \`i\` is the
  index or key of the \`meta\` item in question. To access trace
  \`meta\` in layout attributes, use \`%{data\[n\[.meta\[i\]}\` where
  \`i\` is the index or key of the \`meta\` and \`n\` is the trace
  index. Any value.

- name:

  **`go_sankey()`**: Sets the trace name. The trace name appears as the
  legend item and on hover. String.

  **`go_sankey_link_concentrationscales()`**: When used in a template,
  named items are created in the output figure in addition to any items
  the figure already has in this array. You can modify these items in
  the output figure by making your own item with \`templateitemname\`
  matching this \`name\` alongside your modifications (including
  \`visible: false\` or \`enabled: false\` to hide it). Has no effect
  outside of a template. String.

- node:

  The nodes of the Sankey plot. Named list or `go_sankey_node()` object.

- orientation:

  Sets the orientation of the Sankey diagram. With \`h\` (the default),
  the flow runs horizontally. With \`v\`, the flow runs vertically. Use
  \`direction\` to control which side the sources are placed on. One of
  `"v"`, `"h"`.

- selectedpoints:

  Array containing integer indices of selected points. Has an effect
  only for traces that support selections. Note that an empty array
  means an empty selection where the \`unselected\` are turned on for
  all points, whereas, any other non-array values means no selection all
  where the \`selected\` and \`unselected\` styles have no effect. Any
  value.

- textfont:

  Sets the font for node labels Named list or `go_sankey_textfont()`
  object.

- uid:

  Assign an id to this trace, Use this to provide object constancy
  between traces during animations and transitions. String.

- uirevision:

  Controls persistence of some user-driven changes to the trace:
  \`constraintrange\` in \`parcoords\` traces, as well as some
  \`editable: true\` modifications such as \`name\` and
  \`colorbar.title\`. Defaults to \`layout.uirevision\`. Note that other
  user-driven trace attribute changes are controlled by \`layout\`
  attributes: \`trace.visible\` is controlled by
  \`layout.legend.uirevision\`, \`selectedpoints\` is controlled by
  \`layout.selectionrevision\`, and \`colorbar.(x\|y)\` (accessible with
  \`config: {editable: true}\`) is controlled by
  \`layout.editrevision\`. Trace changes are tracked by \`uid\`, which
  only falls back on trace index if no \`uid\` is provided. So if your
  app can add/remove traces before the end of the \`data\` array, such
  that the same trace has a different index, you can still preserve
  user-driven changes if you give each trace a \`uid\` that stays with
  it as it moves. Any value.

- valueformat:

  Sets the value formatting rule using d3 formatting mini-languages
  which are very similar to those in Python. For numbers, see:
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format. String.

- valuesuffix:

  Adds a unit to follow the value in the hover tooltip. Add a space if a
  separation is necessary from the value. String.

- visible:

  Determines whether or not this trace is visible. If "legendonly", the
  trace is not drawn, but can appear as a legend item (provided that the
  legend itself is visible). One of `"legendonly"`, `TRUE`, `FALSE`.

- row:

  **`add_sankey()`**: Subplot grid row (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

  **`go_sankey_domain()`**: If there is a layout grid, use the domain
  for this row in the grid for this sankey trace. Integer in the
  interval \[0, Inf\].

- col:

  Subplot grid column (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from (constructors). Named arguments take precedence.

- column:

  If there is a layout grid, use the domain for this column in the grid
  for this sankey trace. Integer in the interval \[0, Inf\].

- x:

  **`go_sankey_domain()`**: Sets the horizontal domain of this sankey
  trace (in plot fraction). Vector or list of 2 element(s).

  **`go_sankey_node()`**: The normalized horizontal position of the
  node. Data array: a vector, factor, Date/POSIXct vector, matrix or
  list.

- y:

  **`go_sankey_domain()`**: Sets the vertical domain of this sankey
  trace (in plot fraction). Vector or list of 2 element(s).

  **`go_sankey_node()`**: The normalized vertical position of the node.
  Data array: a vector, factor, Date/POSIXct vector, matrix or list.

- align:

  **`go_sankey_hoverlabel()`, `go_sankey_link_hoverlabel()`,
  `go_sankey_node_hoverlabel()`**: Sets the horizontal alignment of the
  text content within hover label box. Has an effect only if the hover
  label text spans two or more lines One of `"left"`, `"right"`,
  `"auto"`, or a vector of these.

  **`go_sankey_node()`**: Sets the alignment method used to position the
  nodes along the horizontal axis. One of `"justify"`, `"left"`,
  `"right"`, `"center"`.

- bgcolor:

  Sets the background color of the hover labels for this trace Color: a
  CSS color string or R color name, or a vector of these.

- bordercolor:

  Sets the border color of the hover labels for this trace. Color: a CSS
  color string or R color name, or a vector of these.

- font:

  **`go_sankey_hoverlabel()`**: Sets the font used in hover labels.
  Named list or `go_sankey_hoverlabel_font()` object.

  **`go_sankey_legendgrouptitle()`**: Sets this legend group's title
  font. Named list or `go_sankey_legendgrouptitle_font()` object.

  **`go_sankey_link_hoverlabel()`**: Sets the font used in hover labels.
  Named list or `go_sankey_link_hoverlabel_font()` object.

  **`go_sankey_node_hoverlabel()`**: Sets the font used in hover labels.
  Named list or `go_sankey_node_hoverlabel_font()` object.

- namelength:

  Sets the default length (in number of characters) of the trace name in
  the hover labels for all traces. -1 shows the whole name regardless of
  length. 0-3 shows the first 0-3 characters, and an integer \>3 will
  show the whole name if it is less than that many characters, but if it
  is longer, will truncate to \`namelength - 3\` characters and add an
  ellipsis. Integer in the interval \[-1, Inf\], or a vector of these.

- showarrow:

  Sets whether or not to show the hover label arrow/triangle pointing to
  the data point. Logical.

- color:

  **`go_sankey_hoverlabel_font()`, `go_sankey_link_hoverlabel_font()`,
  `go_sankey_node_hoverlabel_font()`**: Color: a CSS color string or R
  color name, or a vector of these.

  **`go_sankey_legendgrouptitle_font()`, `go_sankey_textfont()`**:
  Color: a CSS color string or R color name.

  **`go_sankey_link()`**: Sets the \`link\` color. It can be a single
  value, or an array for specifying color for each \`link\`. If
  \`link.color\` is omitted, then by default, a translucent grey link
  will be used. Color: a CSS color string or R color name, or a vector
  of these.

  **`go_sankey_link_line()`**: Sets the color of the \`line\` around
  each \`link\`. Color: a CSS color string or R color name, or a vector
  of these.

  **`go_sankey_node()`**: Sets the \`node\` color. It can be a single
  value, or an array for specifying color for each \`node\`. If
  \`node.color\` is omitted, then the default \`Plotly\` color palette
  will be cycled through to have a variety of colors. These defaults are
  not fully opaque, to allow some visibility of what is beneath the
  node. Color: a CSS color string or R color name, or a vector of these.

  **`go_sankey_node_line()`**: Sets the color of the \`line\` around
  each \`node\`. Color: a CSS color string or R color name, or a vector
  of these.

- family:

  **`go_sankey_hoverlabel_font()`, `go_sankey_link_hoverlabel_font()`,
  `go_sankey_node_hoverlabel_font()`**: HTML font family - the typeface
  that will be applied by the web browser. The web browser can only
  apply a font if it is available on the system where it runs. Provide
  multiple font families, separated by commas, to indicate the order in
  which to apply fonts if they aren't available. String, or a vector of
  these.

  **`go_sankey_legendgrouptitle_font()`, `go_sankey_textfont()`**: HTML
  font family - the typeface that will be applied by the web browser.
  The web browser can only apply a font if it is available on the system
  where it runs. Provide multiple font families, separated by commas, to
  indicate the order in which to apply fonts if they aren't available.
  String.

- lineposition:

  **`go_sankey_hoverlabel_font()`, `go_sankey_link_hoverlabel_font()`,
  `go_sankey_node_hoverlabel_font()`**: Sets the kind of decoration
  line(s) with text, such as an "under", "over" or "through" as well as
  combinations e.g. "under+over", etc. Any combination of `"under"`,
  `"over"`, `"through"` joined with `"+"`, or one of `"none"`, or a
  vector of these.

  **`go_sankey_legendgrouptitle_font()`, `go_sankey_textfont()`**: Sets
  the kind of decoration line(s) with text, such as an "under", "over"
  or "through" as well as combinations e.g. "under+over", etc. Any
  combination of `"under"`, `"over"`, `"through"` joined with `"+"`, or
  one of `"none"`.

- shadow:

  **`go_sankey_hoverlabel_font()`, `go_sankey_link_hoverlabel_font()`,
  `go_sankey_node_hoverlabel_font()`**: Sets the shape and color of the
  shadow behind text. "auto" places minimal shadow and applies contrast
  text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String, or a vector of these.

  **`go_sankey_legendgrouptitle_font()`, `go_sankey_textfont()`**: Sets
  the shape and color of the shadow behind text. "auto" places minimal
  shadow and applies contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String.

- size:

  **`go_sankey_hoverlabel_font()`, `go_sankey_link_hoverlabel_font()`,
  `go_sankey_node_hoverlabel_font()`**: Number in the interval \[1,
  Inf\], or a vector of these.

  **`go_sankey_legendgrouptitle_font()`, `go_sankey_textfont()`**:
  Number in the interval \[1, Inf\].

- style:

  **`go_sankey_hoverlabel_font()`, `go_sankey_link_hoverlabel_font()`,
  `go_sankey_node_hoverlabel_font()`**: Sets whether a font should be
  styled with a normal or italic face from its family. One of
  `"normal"`, `"italic"`, or a vector of these.

  **`go_sankey_legendgrouptitle_font()`, `go_sankey_textfont()`**: Sets
  whether a font should be styled with a normal or italic face from its
  family. One of `"normal"`, `"italic"`.

- textcase:

  **`go_sankey_hoverlabel_font()`, `go_sankey_link_hoverlabel_font()`,
  `go_sankey_node_hoverlabel_font()`**: Sets capitalization of text. It
  can be used to make text appear in all-uppercase or all-lowercase, or
  with each word capitalized. One of `"normal"`, `"word caps"`,
  `"upper"`, `"lower"`, or a vector of these.

  **`go_sankey_legendgrouptitle_font()`, `go_sankey_textfont()`**: Sets
  capitalization of text. It can be used to make text appear in
  all-uppercase or all-lowercase, or with each word capitalized. One of
  `"normal"`, `"word caps"`, `"upper"`, `"lower"`.

- variant:

  **`go_sankey_hoverlabel_font()`, `go_sankey_link_hoverlabel_font()`,
  `go_sankey_node_hoverlabel_font()`**: Sets the variant of the font.
  One of `"normal"`, `"small-caps"`, `"all-small-caps"`,
  `"all-petite-caps"`, `"petite-caps"`, `"unicase"`, or a vector of
  these.

  **`go_sankey_legendgrouptitle_font()`, `go_sankey_textfont()`**: Sets
  the variant of the font. One of `"normal"`, `"small-caps"`,
  `"all-small-caps"`, `"all-petite-caps"`, `"petite-caps"`, `"unicase"`.

- weight:

  **`go_sankey_hoverlabel_font()`, `go_sankey_link_hoverlabel_font()`,
  `go_sankey_node_hoverlabel_font()`**: Sets the weight (or boldness) of
  the font. Integer in the interval \[1, 1000\], or a vector of these.

  **`go_sankey_legendgrouptitle_font()`, `go_sankey_textfont()`**: Sets
  the weight (or boldness) of the font. Integer in the interval \[1,
  1000\].

- text:

  Sets the title of the legend group. String.

- arrowlen:

  Sets the length (in px) of the links arrow, if 0 no arrow will be
  drawn. Number in the interval \[0, Inf\].

- colorscales:

  List of named lists or `go_sankey_link_concentrationscales()` objects.

- hovercolor:

  Sets the \`link\` hover color. It can be a single value, or an array
  for specifying hover colors for each \`link\`. If \`link.hovercolor\`
  is omitted, then by default, links will become slightly more opaque
  when hovered over. Color: a CSS color string or R color name, or a
  vector of these.

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

  **`go_sankey_link()`**: The shown name of the link. Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

  **`go_sankey_link_concentrationscales()`**: The label of the links to
  color based on their concentration within a flow. String.

  **`go_sankey_node()`**: The shown name of the node. Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- line:

  **`go_sankey_link()`**: Named list or `go_sankey_link_line()` object.

  **`go_sankey_node()`**: Named list or `go_sankey_node_line()` object.

- sort:

  **`go_sankey_link()`**: For \`auto\` (the default), the order of links
  attached to each node is determined automatically by the layout. For
  \`input\`, the order of links at each node is kept the same as the
  order in the input array. One of `"auto"`, `"input"`.

  **`go_sankey_node()`**: For \`auto\` (the default), the vertical order
  of nodes will be determined automatically by the layout. For
  \`input\`, the vertical order of nodes is kept the same as the order
  in the input array. One of `"auto"`, `"input"`.

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

- cmax:

  Sets the upper bound of the color domain. Number.

- cmin:

  Sets the lower bound of the color domain. Number.

- colorscale:

  Sets the colorscale. The colorscale must be an array containing arrays
  mapping a normalized value to an rgb, rgba, hex, hsl, hsla, hwb, or
  named color string. At minimum, a mapping for the lowest (0) and
  highest (1) values are required. For example, \`\[\[0,
  'rgb(0,0,255)'\], \[1, 'rgb(255,0,0)'\]\]\`. To control the bounds of
  the colorscale in color space, use \`cmin\` and \`cmax\`.
  Alternatively, \`colorscale\` may be a palette name string of the
  following list:
  Blackbody,Bluered,Blues,Cividis,Earth,Electric,Greens,Greys,Hot,Jet,Picnic,Portland,Rainbow,RdBu,Reds,Viridis,YlGnBu,YlOrRd.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

- templateitemname:

  Used to refer to a named item in this array in the template. Named
  items from the template will be created even without a matching item
  in the input figure, but you can modify one by making an item with
  \`templateitemname\` matching its \`name\`, alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). If there is no template or no matching item, this item will
  be hidden unless you explicitly show it with \`visible: true\`.
  String.

- width:

  **`go_sankey_link_line()`**: Sets the width (in px) of the \`line\`
  around each \`link\`. Number in the interval \[0, Inf\], or a vector
  of these.

  **`go_sankey_node_line()`**: Sets the width (in px) of the \`line\`
  around each \`node\`. Number in the interval \[0, Inf\], or a vector
  of these.

- groups:

  Groups of nodes. Each group is defined by an array with the indices of
  the nodes it contains. Multiple groups can be specified. Vector or
  list of up to 1 element(s).

- pad:

  Sets the padding (in px) between the \`nodes\`. Number in the interval
  \[0, Inf\].

- thickness:

  Sets the thickness (in px) of the \`nodes\`. Number in the interval
  \[1, Inf\].

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_sankey()` and the nested object constructors below create validated
graph objects (named lists). Every property is checked against the
plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
`add_sankey()` creates an object and adds it to a figure.

Nested objects documented here:

- `go_sankey_domain()`:

  `sankey.domain`

- `go_sankey_hoverlabel()`:

  `sankey.hoverlabel`

- `go_sankey_hoverlabel_font()`:

  `sankey.hoverlabel.font`: Sets the font used in hover labels.

- `go_sankey_legendgrouptitle()`:

  `sankey.legendgrouptitle`

- `go_sankey_legendgrouptitle_font()`:

  `sankey.legendgrouptitle.font`: Sets this legend group's title font.

- `go_sankey_link()`:

  `sankey.link`: The links of the Sankey plot.

- `go_sankey_link_concentrationscales()`:

  `sankey.link.concentrationscales`

- `go_sankey_link_hoverlabel()`:

  `sankey.link.hoverlabel`

- `go_sankey_link_hoverlabel_font()`:

  `sankey.link.hoverlabel.font`: Sets the font used in hover labels.

- `go_sankey_link_line()`:

  `sankey.link.line`

- `go_sankey_node()`:

  `sankey.node`: The nodes of the Sankey plot.

- `go_sankey_node_hoverlabel()`:

  `sankey.node.hoverlabel`

- `go_sankey_node_hoverlabel_font()`:

  `sankey.node.hoverlabel.font`: Sets the font used in hover labels.

- `go_sankey_node_line()`:

  `sankey.node.line`

- `go_sankey_textfont()`:

  `sankey.textfont`: Sets the font for node labels

## See also

[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)

## Examples

``` r
go_sankey()
#> <go_sankey>
#> {
#>   "type": "sankey"
#> }
#> 
```
