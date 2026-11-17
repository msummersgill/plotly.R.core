# Treemap traces

Visualize hierarchal data from leaves (and/or outer branches) towards
root with rectangles. The treemap sectors are determined by the entries
in "labels" or "ids" and in "parents".

## Usage

``` r
add_treemap(fig, ...)

# Default S3 method
add_treemap(
  fig,
  ...,
  data = NULL,
  branchvalues = NULL,
  count = NULL,
  customdata = NULL,
  domain = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  insidetextfont = NULL,
  labels = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  level = NULL,
  marker = NULL,
  maxdepth = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  outsidetextfont = NULL,
  parents = NULL,
  pathbar = NULL,
  root = NULL,
  sort = NULL,
  text = NULL,
  textfont = NULL,
  textinfo = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  tiling = NULL,
  uid = NULL,
  uirevision = NULL,
  values = NULL,
  visible = NULL,
  row = NULL,
  col = NULL,
  skip_invalid = FALSE
)

go_treemap(
  arg = NULL,
  ...,
  branchvalues = NULL,
  count = NULL,
  customdata = NULL,
  domain = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  insidetextfont = NULL,
  labels = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  level = NULL,
  marker = NULL,
  maxdepth = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  outsidetextfont = NULL,
  parents = NULL,
  pathbar = NULL,
  root = NULL,
  sort = NULL,
  text = NULL,
  textfont = NULL,
  textinfo = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  tiling = NULL,
  uid = NULL,
  uirevision = NULL,
  values = NULL,
  visible = NULL,
  skip_invalid = FALSE
)

go_treemap_domain(
  arg = NULL,
  ...,
  column = NULL,
  row = NULL,
  x = NULL,
  y = NULL,
  skip_invalid = FALSE
)

go_treemap_hoverlabel(
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

go_treemap_hoverlabel_font(
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

go_treemap_insidetextfont(
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

go_treemap_legendgrouptitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_treemap_legendgrouptitle_font(
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

go_treemap_marker(
  arg = NULL,
  ...,
  autocolorscale = NULL,
  cauto = NULL,
  cmax = NULL,
  cmid = NULL,
  cmin = NULL,
  coloraxis = NULL,
  colorbar = NULL,
  colors = NULL,
  colorscale = NULL,
  cornerradius = NULL,
  depthfade = NULL,
  line = NULL,
  pad = NULL,
  pattern = NULL,
  reversescale = NULL,
  showscale = NULL,
  skip_invalid = FALSE
)

go_treemap_marker_colorbar(
  arg = NULL,
  ...,
  bgcolor = NULL,
  bordercolor = NULL,
  borderwidth = NULL,
  dtick = NULL,
  exponentformat = NULL,
  labelalias = NULL,
  len = NULL,
  lenmode = NULL,
  minexponent = NULL,
  nticks = NULL,
  orientation = NULL,
  outlinecolor = NULL,
  outlinewidth = NULL,
  separatethousands = NULL,
  showexponent = NULL,
  showticklabels = NULL,
  showtickprefix = NULL,
  showticksuffix = NULL,
  thickness = NULL,
  thicknessmode = NULL,
  tick0 = NULL,
  tickangle = NULL,
  tickcolor = NULL,
  tickfont = NULL,
  tickformat = NULL,
  tickformatstops = NULL,
  ticklabeloverflow = NULL,
  ticklabelposition = NULL,
  ticklabelstep = NULL,
  ticklen = NULL,
  tickmode = NULL,
  tickprefix = NULL,
  ticks = NULL,
  ticksuffix = NULL,
  ticktext = NULL,
  tickvals = NULL,
  tickwidth = NULL,
  title = NULL,
  x = NULL,
  xanchor = NULL,
  xpad = NULL,
  xref = NULL,
  y = NULL,
  yanchor = NULL,
  ypad = NULL,
  yref = NULL,
  skip_invalid = FALSE
)

go_treemap_marker_colorbar_tickfont(
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

go_treemap_marker_colorbar_tickformatstop(
  arg = NULL,
  ...,
  dtickrange = NULL,
  enabled = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  skip_invalid = FALSE
)

go_treemap_marker_colorbar_title(
  arg = NULL,
  ...,
  font = NULL,
  side = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_treemap_marker_colorbar_title_font(
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

go_treemap_marker_line(
  arg = NULL,
  ...,
  color = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_treemap_marker_pad(
  arg = NULL,
  ...,
  b = NULL,
  l = NULL,
  r = NULL,
  t = NULL,
  skip_invalid = FALSE
)

go_treemap_marker_pattern(
  arg = NULL,
  ...,
  bgcolor = NULL,
  fgcolor = NULL,
  fgopacity = NULL,
  fillmode = NULL,
  path = NULL,
  shape = NULL,
  size = NULL,
  solidity = NULL,
  skip_invalid = FALSE
)

go_treemap_outsidetextfont(
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

go_treemap_pathbar(
  arg = NULL,
  ...,
  edgeshape = NULL,
  side = NULL,
  textfont = NULL,
  thickness = NULL,
  visible = NULL,
  skip_invalid = FALSE
)

go_treemap_pathbar_textfont(
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

go_treemap_root(arg = NULL, ..., color = NULL, skip_invalid = FALSE)

go_treemap_textfont(
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

go_treemap_tiling(
  arg = NULL,
  ...,
  flip = NULL,
  packing = NULL,
  pad = NULL,
  squarifyratio = NULL,
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
  Only the evaluated values are added to the trace. A
  [`crosstalk::SharedData`](https://rdrr.io/pkg/crosstalk/man/SharedData.html)
  works the same way, and links the trace to its crosstalk group (see
  [`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)).

- branchvalues:

  Determines how the items in \`values\` are summed. When set to
  "total", items in \`values\` are taken to be value of all its
  descendants. When set to "remainder", items in \`values\`
  corresponding to the root and the branches sectors are taken to be the
  extra part not part of the sum of the values at their leaves. One of
  `"remainder"`, `"total"`.

- count:

  Determines default for \`values\` when it is not provided, by
  inferring a 1 for each of the "leaves" and/or "branches", otherwise 0.
  Any combination of `"branches"`, `"leaves"` joined with `"+"`.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- domain:

  Named list or `go_treemap_domain()` object.

- hoverinfo:

  Determines what trace information appears on hover. Flags are rendered
  in a fixed order; use \`hovertemplate\` if you need explicit control
  over the rendered string, including the order of fields and
  surrounding text. Any combination of `"label"`, `"text"`, `"value"`,
  `"name"`, `"current path"`, `"percent root"`, `"percent entry"`,
  `"percent parent"` joined with `"+"`, or one of `"all"`, `"none"`,
  `"skip"`, or a vector of these.

- hoverlabel:

  Named list or `go_treemap_hoverlabel()` object.

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
  string has access to variables \`currentPath\`, \`root\`, \`entry\`,
  \`percentRoot\`, \`percentEntry\` and \`percentParent\`. Anything
  contained in tag \`\<extra\>\` is displayed in the secondary box, for
  example \`\<extra\>%{fullData.name}\</extra\>\`. To hide the secondary
  box completely, use an empty tag \`\<extra\>\</extra\>\`. String, or a
  vector of these.

- hovertemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- hovertext:

  Sets hover text elements associated with each sector. If a single
  string, the same string appears for all data points. If an array of
  string, the items are mapped in order of this trace's sectors. To be
  seen, trace \`hoverinfo\` must contain a "text" flag. String, or a
  vector of these.

- ids:

  Assigns id labels to each datum. These ids for object constancy of
  data points during animation. Should be an array of strings, not
  numbers or any other type. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- insidetextfont:

  Sets the font used for \`textinfo\` lying inside the sector. Named
  list or `go_treemap_insidetextfont()` object.

- labels:

  Sets the labels of each of the sectors. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

- legend:

  Sets the reference to a legend to show this trace in. References to
  these legends are "legend", "legend2", "legend3", etc. Settings for
  these legends are set in the layout, under \`layout.legend\`,
  \`layout.legend2\`, etc. Subplot id: `"legend"`, `"legend2"`,
  `"legend3"`, ....

- legendgrouptitle:

  Named list or `go_treemap_legendgrouptitle()` object.

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

- level:

  Sets the level from which this trace hierarchy is rendered. Set
  \`level\` to \`”\` to start from the root node in the hierarchy. Must
  be an "id" if \`ids\` is filled in, otherwise plotly attempts to find
  a matching item in \`labels\`. Any value.

- marker:

  Named list or `go_treemap_marker()` object.

- maxdepth:

  Sets the number of rendered sectors from any given \`level\`. Set
  \`maxdepth\` to "-1" to render all the levels in the hierarchy.
  Integer.

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

  **`go_treemap()`**: Sets the trace name. The trace name appears as the
  legend item and on hover. String.

  **`go_treemap_marker_colorbar_tickformatstop()`**: When used in a
  template, named items are created in the output figure in addition to
  any items the figure already has in this array. You can modify these
  items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- opacity:

  Sets the opacity of the trace. Number in the interval \[0, 1\].

- outsidetextfont:

  Sets the font used for \`textinfo\` lying outside the sector. This
  option refers to the root of the hierarchy presented on top left
  corner of a treemap graph. Please note that if a hierarchy has
  multiple root nodes, this option won't have any effect and
  \`insidetextfont\` would be used. Named list or
  `go_treemap_outsidetextfont()` object.

- parents:

  Sets the parent sectors for each of the sectors. Empty string items ”
  are understood to reference the root node in the hierarchy. If \`ids\`
  is filled, \`parents\` items are understood to be "ids" themselves.
  When \`ids\` is not set, plotly attempts to find matching items in
  \`labels\`, but beware they must be unique. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

- pathbar:

  Named list or `go_treemap_pathbar()` object.

- root:

  Named list or `go_treemap_root()` object.

- sort:

  Determines whether or not the sectors are reordered from largest to
  smallest. Logical.

- text:

  **`go_treemap()`**: Sets text elements associated with each sector. If
  trace \`textinfo\` contains a "text" flag, these elements will be seen
  on the chart. If trace \`hoverinfo\` contains a "text" flag and
  "hovertext" is not set, these elements will be seen in the hover
  labels. Data array: a vector, factor, Date/POSIXct vector, matrix or
  list.

  **`go_treemap_legendgrouptitle()`**: Sets the title of the legend
  group. String.

  **`go_treemap_marker_colorbar_title()`**: Sets the title of the color
  bar. String.

- textfont:

  **`go_treemap()`**: Sets the font used for \`textinfo\`. Named list or
  `go_treemap_textfont()` object.

  **`go_treemap_pathbar()`**: Sets the font used inside \`pathbar\`.
  Named list or `go_treemap_pathbar_textfont()` object.

- textinfo:

  Determines what trace information appears on the graph. Flags are
  rendered in a fixed order; use \`texttemplate\` if you need explicit
  control over the rendered string, including the order of fields and
  surrounding text. Any combination of `"label"`, `"text"`, `"value"`,
  `"current path"`, `"percent root"`, `"percent entry"`,
  `"percent parent"` joined with `"+"`, or one of `"none"`.

- textposition:

  Sets the positions of the \`text\` elements. One of `"top left"`,
  `"top center"`, `"top right"`, `"middle left"`, `"middle center"`,
  `"middle right"`, `"bottom left"`, `"bottom center"`,
  `"bottom right"`.

- texttemplate:

  Template string used for rendering the information text that appears
  on points. Note that this will override \`textinfo\`. Variables are
  inserted using %{variable}, for example "y: %{y}". Numbers are
  formatted using d3-format's syntax %{variable:d3-format}, for example
  "Price: %{y:\$.2f}".
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format for details on
  the formatting syntax. Dates are formatted using d3-time-format's
  syntax %{variable\|d3-time-format}, for example "Day:
  %{2019-01-01\|%A}".
  https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format for
  details on the date formatting syntax. Variables that can't be found
  will be replaced with the specifier. For example, a template of "data:
  %{x}, %{y}" will result in a value of "data: 1, %{y}" if x is 1 and y
  is missing. Variables with an undefined value will be replaced with
  the fallback value. All attributes that can be specified per-point
  (the ones that are \`arrayOk: true\`) are available. Finally, the
  template string has access to variables \`currentPath\`, \`root\`,
  \`entry\`, \`percentRoot\`, \`percentEntry\`, \`percentParent\`,
  \`label\` and \`value\`. String, or a vector of these.

- texttemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- tiling:

  Named list or `go_treemap_tiling()` object.

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

- values:

  Sets the values associated with each of the sectors. Use with
  \`branchvalues\` to determine how the values are summed. Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- visible:

  **`go_treemap()`**: Determines whether or not this trace is visible.
  If "legendonly", the trace is not drawn, but can appear as a legend
  item (provided that the legend itself is visible). One of
  `"legendonly"`, `TRUE`, `FALSE`.

  **`go_treemap_pathbar()`**: Determines if the path bar is drawn i.e.
  outside the trace \`domain\` and with one pixel gap. Logical.

- row:

  **`add_treemap()`**: Subplot grid row (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

  **`go_treemap_domain()`**: If there is a layout grid, use the domain
  for this row in the grid for this treemap trace. Integer in the
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
  for this treemap trace. Integer in the interval \[0, Inf\].

- x:

  **`go_treemap_domain()`**: Sets the horizontal domain of this treemap
  trace (in plot fraction). Vector or list of 2 element(s).

  **`go_treemap_marker_colorbar()`**: Sets the x position with respect
  to \`xref\` of the color bar (in plot fraction). When \`xref\` is
  "paper", defaults to 1.02 when \`orientation\` is "v" and 0.5 when
  \`orientation\` is "h". When \`xref\` is "container", defaults to 1
  when \`orientation\` is "v" and 0.5 when \`orientation\` is "h". Must
  be between 0 and 1 if \`xref\` is "container" and between "-2" and 3
  if \`xref\` is "paper". Number.

- y:

  **`go_treemap_domain()`**: Sets the vertical domain of this treemap
  trace (in plot fraction). Vector or list of 2 element(s).

  **`go_treemap_marker_colorbar()`**: Sets the y position with respect
  to \`yref\` of the color bar (in plot fraction). When \`yref\` is
  "paper", defaults to 0.5 when \`orientation\` is "v" and 1.02 when
  \`orientation\` is "h". When \`yref\` is "container", defaults to 0.5
  when \`orientation\` is "v" and 1 when \`orientation\` is "h". Must be
  between 0 and 1 if \`yref\` is "container" and between "-2" and 3 if
  \`yref\` is "paper". Number.

- align:

  Sets the horizontal alignment of the text content within hover label
  box. Has an effect only if the hover label text spans two or more
  lines One of `"left"`, `"right"`, `"auto"`, or a vector of these.

- bgcolor:

  **`go_treemap_hoverlabel()`**: Sets the background color of the hover
  labels for this trace Color: a CSS color string or R color name, or a
  vector of these.

  **`go_treemap_marker_colorbar()`**: Sets the color of padded area.
  Color: a CSS color string or R color name.

  **`go_treemap_marker_pattern()`**: When there is no colorscale sets
  the color of background pattern fill. Defaults to a \`marker.color\`
  background when \`fillmode\` is "overlay". Otherwise, defaults to a
  transparent background. Color: a CSS color string or R color name, or
  a vector of these.

- bordercolor:

  **`go_treemap_hoverlabel()`**: Sets the border color of the hover
  labels for this trace. Color: a CSS color string or R color name, or a
  vector of these.

  **`go_treemap_marker_colorbar()`**: Sets the axis line color. Color: a
  CSS color string or R color name.

- font:

  **`go_treemap_hoverlabel()`**: Sets the font used in hover labels.
  Named list or `go_treemap_hoverlabel_font()` object.

  **`go_treemap_legendgrouptitle()`**: Sets this legend group's title
  font. Named list or `go_treemap_legendgrouptitle_font()` object.

  **`go_treemap_marker_colorbar_title()`**: Sets this color bar's title
  font. Named list or `go_treemap_marker_colorbar_title_font()` object.

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

  **`go_treemap_hoverlabel_font()`, `go_treemap_insidetextfont()`,
  `go_treemap_outsidetextfont()`, `go_treemap_pathbar_textfont()`,
  `go_treemap_textfont()`**: Color: a CSS color string or R color name,
  or a vector of these.

  **`go_treemap_legendgrouptitle_font()`,
  `go_treemap_marker_colorbar_tickfont()`,
  `go_treemap_marker_colorbar_title_font()`**: Color: a CSS color string
  or R color name.

  **`go_treemap_marker_line()`**: Sets the color of the line enclosing
  each sector. Defaults to the \`paper_bgcolor\` value. Color: a CSS
  color string or R color name, or a vector of these.

  **`go_treemap_root()`**: sets the color of the root node for a
  sunburst/treemap/icicle trace. this has no effect when a colorscale is
  used to set the markers. Color: a CSS color string or R color name.

- family:

  **`go_treemap_hoverlabel_font()`, `go_treemap_insidetextfont()`,
  `go_treemap_outsidetextfont()`, `go_treemap_pathbar_textfont()`,
  `go_treemap_textfont()`**: HTML font family - the typeface that will
  be applied by the web browser. The web browser can only apply a font
  if it is available on the system where it runs. Provide multiple font
  families, separated by commas, to indicate the order in which to apply
  fonts if they aren't available. String, or a vector of these.

  **`go_treemap_legendgrouptitle_font()`,
  `go_treemap_marker_colorbar_tickfont()`,
  `go_treemap_marker_colorbar_title_font()`**: HTML font family - the
  typeface that will be applied by the web browser. The web browser can
  only apply a font if it is available on the system where it runs.
  Provide multiple font families, separated by commas, to indicate the
  order in which to apply fonts if they aren't available. String.

- lineposition:

  **`go_treemap_hoverlabel_font()`, `go_treemap_insidetextfont()`,
  `go_treemap_outsidetextfont()`, `go_treemap_pathbar_textfont()`,
  `go_treemap_textfont()`**: Sets the kind of decoration line(s) with
  text, such as an "under", "over" or "through" as well as combinations
  e.g. "under+over", etc. Any combination of `"under"`, `"over"`,
  `"through"` joined with `"+"`, or one of `"none"`, or a vector of
  these.

  **`go_treemap_legendgrouptitle_font()`,
  `go_treemap_marker_colorbar_tickfont()`,
  `go_treemap_marker_colorbar_title_font()`**: Sets the kind of
  decoration line(s) with text, such as an "under", "over" or "through"
  as well as combinations e.g. "under+over", etc. Any combination of
  `"under"`, `"over"`, `"through"` joined with `"+"`, or one of
  `"none"`.

- shadow:

  **`go_treemap_hoverlabel_font()`, `go_treemap_insidetextfont()`,
  `go_treemap_outsidetextfont()`, `go_treemap_pathbar_textfont()`,
  `go_treemap_textfont()`**: Sets the shape and color of the shadow
  behind text. "auto" places minimal shadow and applies contrast text
  font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String, or a vector of these.

  **`go_treemap_legendgrouptitle_font()`,
  `go_treemap_marker_colorbar_tickfont()`,
  `go_treemap_marker_colorbar_title_font()`**: Sets the shape and color
  of the shadow behind text. "auto" places minimal shadow and applies
  contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String.

- size:

  **`go_treemap_hoverlabel_font()`, `go_treemap_insidetextfont()`,
  `go_treemap_outsidetextfont()`, `go_treemap_pathbar_textfont()`,
  `go_treemap_textfont()`**: Number in the interval \[1, Inf\], or a
  vector of these.

  **`go_treemap_legendgrouptitle_font()`,
  `go_treemap_marker_colorbar_tickfont()`,
  `go_treemap_marker_colorbar_title_font()`**: Number in the interval
  \[1, Inf\].

  **`go_treemap_marker_pattern()`**: Sets the size of unit squares of
  the pattern fill in pixels, which corresponds to the interval of
  repetition of the pattern. Number in the interval \[0, Inf\], or a
  vector of these.

- style:

  **`go_treemap_hoverlabel_font()`, `go_treemap_insidetextfont()`,
  `go_treemap_outsidetextfont()`, `go_treemap_pathbar_textfont()`,
  `go_treemap_textfont()`**: Sets whether a font should be styled with a
  normal or italic face from its family. One of `"normal"`, `"italic"`,
  or a vector of these.

  **`go_treemap_legendgrouptitle_font()`,
  `go_treemap_marker_colorbar_tickfont()`,
  `go_treemap_marker_colorbar_title_font()`**: Sets whether a font
  should be styled with a normal or italic face from its family. One of
  `"normal"`, `"italic"`.

- textcase:

  **`go_treemap_hoverlabel_font()`, `go_treemap_insidetextfont()`,
  `go_treemap_outsidetextfont()`, `go_treemap_pathbar_textfont()`,
  `go_treemap_textfont()`**: Sets capitalization of text. It can be used
  to make text appear in all-uppercase or all-lowercase, or with each
  word capitalized. One of `"normal"`, `"word caps"`, `"upper"`,
  `"lower"`, or a vector of these.

  **`go_treemap_legendgrouptitle_font()`,
  `go_treemap_marker_colorbar_tickfont()`,
  `go_treemap_marker_colorbar_title_font()`**: Sets capitalization of
  text. It can be used to make text appear in all-uppercase or
  all-lowercase, or with each word capitalized. One of `"normal"`,
  `"word caps"`, `"upper"`, `"lower"`.

- variant:

  **`go_treemap_hoverlabel_font()`, `go_treemap_insidetextfont()`,
  `go_treemap_outsidetextfont()`, `go_treemap_pathbar_textfont()`,
  `go_treemap_textfont()`**: Sets the variant of the font. One of
  `"normal"`, `"small-caps"`, `"all-small-caps"`, `"all-petite-caps"`,
  `"petite-caps"`, `"unicase"`, or a vector of these.

  **`go_treemap_legendgrouptitle_font()`,
  `go_treemap_marker_colorbar_tickfont()`,
  `go_treemap_marker_colorbar_title_font()`**: Sets the variant of the
  font. One of `"normal"`, `"small-caps"`, `"all-small-caps"`,
  `"all-petite-caps"`, `"petite-caps"`, `"unicase"`.

- weight:

  **`go_treemap_hoverlabel_font()`, `go_treemap_insidetextfont()`,
  `go_treemap_outsidetextfont()`, `go_treemap_pathbar_textfont()`,
  `go_treemap_textfont()`**: Sets the weight (or boldness) of the font.
  Integer in the interval \[1, 1000\], or a vector of these.

  **`go_treemap_legendgrouptitle_font()`,
  `go_treemap_marker_colorbar_tickfont()`,
  `go_treemap_marker_colorbar_title_font()`**: Sets the weight (or
  boldness) of the font. Integer in the interval \[1, 1000\].

- autocolorscale:

  Determines whether the colorscale is a default palette
  (\`autocolorscale: true\`) or the palette determined by
  \`marker.colorscale\`. Has an effect only if colors is set to a
  numerical array. In case \`colorscale\` is unspecified or
  \`autocolorscale\` is true, the default palette will be chosen
  according to whether numbers in the \`color\` array are all positive,
  all negative or mixed. Logical.

- cauto:

  Determines whether or not the color domain is computed with respect to
  the input data (here colors) or the bounds set in \`marker.cmin\` and
  \`marker.cmax\` Has an effect only if colors is set to a numerical
  array. Defaults to \`false\` when \`marker.cmin\` and \`marker.cmax\`
  are set by the user. Logical.

- cmax:

  Sets the upper bound of the color domain. Has an effect only if colors
  is set to a numerical array. Value should have the same units as
  colors and if set, \`marker.cmin\` must be set as well. Number.

- cmid:

  Sets the mid-point of the color domain by scaling \`marker.cmin\`
  and/or \`marker.cmax\` to be equidistant to this point. Has an effect
  only if colors is set to a numerical array. Value should have the same
  units as colors. Has no effect when \`marker.cauto\` is \`false\`.
  Number.

- cmin:

  Sets the lower bound of the color domain. Has an effect only if colors
  is set to a numerical array. Value should have the same units as
  colors and if set, \`marker.cmax\` must be set as well. Number.

- coloraxis:

  Sets a reference to a shared color axis. References to these shared
  color axes are "coloraxis", "coloraxis2", "coloraxis3", etc. Settings
  for these shared color axes are set in the layout, under
  \`layout.coloraxis\`, \`layout.coloraxis2\`, etc. Note that multiple
  color scales can be linked to the same color axis. Subplot id:
  `"coloraxis"`, `"coloraxis2"`, `"coloraxis3"`, ....

- colorbar:

  Named list or `go_treemap_marker_colorbar()` object.

- colors:

  Sets the color of each sector of this trace. If not specified, the
  default trace color set is used to pick the sector colors. Data array:
  a vector, factor, Date/POSIXct vector, matrix or list.

- colorscale:

  Sets the colorscale. Has an effect only if colors is set to a
  numerical array. The colorscale must be an array containing arrays
  mapping a normalized value to an rgb, rgba, hex, hsl, hsla, hwb, or
  named color string. At minimum, a mapping for the lowest (0) and
  highest (1) values are required. For example, \`\[\[0,
  'rgb(0,0,255)'\], \[1, 'rgb(255,0,0)'\]\]\`. To control the bounds of
  the colorscale in color space, use \`marker.cmin\` and
  \`marker.cmax\`. Alternatively, \`colorscale\` may be a palette name
  string of the following list:
  Blackbody,Bluered,Blues,Cividis,Earth,Electric,Greens,Greys,Hot,Jet,Picnic,Portland,Rainbow,RdBu,Reds,Viridis,YlGnBu,YlOrRd.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

- cornerradius:

  Sets the maximum rounding of corners (in px). Number in the interval
  \[0, Inf\].

- depthfade:

  Determines if the sector colors are faded towards the background from
  the leaves up to the headers. This option is unavailable when a
  \`colorscale\` is present, defaults to false when \`marker.colors\` is
  set, but otherwise defaults to true. When set to "reversed", the
  fading direction is inverted, that is the top elements within
  hierarchy are drawn with fully saturated colors while the leaves are
  faded towards the background color. One of `"reversed"`, `TRUE`,
  `FALSE`.

- line:

  Named list or `go_treemap_marker_line()` object.

- pad:

  **`go_treemap_marker()`**: Named list or `go_treemap_marker_pad()`
  object.

  **`go_treemap_tiling()`**: Sets the inner padding (in px). Number in
  the interval \[0, Inf\].

- pattern:

  Sets the pattern within the marker. Named list or
  `go_treemap_marker_pattern()` object.

- reversescale:

  Reverses the color mapping if true. Has an effect only if colors is
  set to a numerical array. If true, \`marker.cmin\` will correspond to
  the last color in the array and \`marker.cmax\` will correspond to the
  first color. Logical.

- showscale:

  Determines whether or not a colorbar is displayed for this trace. Has
  an effect only if colors is set to a numerical array. Logical.

- borderwidth:

  Sets the width (in px) or the border enclosing this color bar. Number
  in the interval \[0, Inf\].

- dtick:

  Sets the step in-between ticks on this color bar. Use with \`tick0\`.
  Must be a positive number. Note: unlike on x/y axes, the special "log"
  and "date" string forms ("L\<f\>", "D1", "D2", "M\<n\>") are not
  supported here: this axis is always linear, so such strings are
  silently ignored and the step is set to 1. Any value.

- exponentformat:

  Determines a formatting rule for the tick exponents. For example,
  consider the number 1,000,000,000. If "none", it appears as
  1,000,000,000. If "e", 1e+9. If "E", 1E+9. If "power", 1x10^9 (with 9
  in a super script). If "SI", 1G. If "B", 1B. "SI" uses prefixes from
  "femto" f (10^-15) to "tera" T (10^12). "SI extended" covers instead
  the full SI range from "quecto" q (10^-30) to "quetta" Q (10^30). If
  "SI" or "SI extended" is used and the exponent is beyond the above
  ranges, the formatting rule will automatically be switched to the
  power notation. One of `"none"`, `"e"`, `"E"`, `"power"`, `"SI"`,
  `"B"`, `"SI extended"`.

- labelalias:

  Replacement text for specific tick or hover labels. For example using
  {US: 'USA', CA: 'Canada'} changes US to USA and CA to Canada. The
  labels we would have shown must match the keys exactly, after adding
  any tickprefix or ticksuffix. For negative numbers the minus sign
  symbol used (U+2212) is wider than the regular ascii dash. That means
  you need to use -1 instead of -1. labelalias can be used with any axis
  type, and both keys (if needed) and values (if desired) can include
  html-like tags or MathJax. Any value.

- len:

  Sets the length of the color bar This measure excludes the padding of
  both ends. That is, the color bar length is this length minus the
  padding on both ends. Number in the interval \[0, Inf\].

- lenmode:

  Determines whether this color bar's length (i.e. the measure in the
  color variation direction) is set in units of plot "fraction" or in
  \*pixels. Use \`len\` to set the value. One of `"fraction"`,
  `"pixels"`.

- minexponent:

  Hide SI prefix for 10^n if \|n\| is below this number. This only has
  an effect when \`tickformat\` is "SI" or "B". Number in the interval
  \[0, Inf\].

- nticks:

  Specifies the maximum number of ticks for the particular axis. The
  actual number of ticks will be chosen automatically to be less than or
  equal to \`nticks\`. Has an effect only if \`tickmode\` is set to
  "auto". Integer in the interval \[0, Inf\].

- orientation:

  Sets the orientation of the colorbar. One of `"h"`, `"v"`.

- outlinecolor:

  Sets the axis line color. Color: a CSS color string or R color name.

- outlinewidth:

  Sets the width (in px) of the axis line. Number in the interval \[0,
  Inf\].

- separatethousands:

  If "true", even 4-digit integers are separated Logical.

- showexponent:

  If "all", all exponents are shown besides their significands. If
  "first", only the exponent of the first tick is shown. If "last", only
  the exponent of the last tick is shown. If "none", no exponents
  appear. One of `"all"`, `"first"`, `"last"`, `"none"`.

- showticklabels:

  Determines whether or not the tick labels are drawn. Logical.

- showtickprefix:

  If "all", all tick labels are displayed with a prefix. If "first",
  only the first tick is displayed with a prefix. If "last", only the
  last tick is displayed with a suffix. If "none", tick prefixes are
  hidden. One of `"all"`, `"first"`, `"last"`, `"none"`.

- showticksuffix:

  Same as \`showtickprefix\` but for tick suffixes. One of `"all"`,
  `"first"`, `"last"`, `"none"`.

- thickness:

  **`go_treemap_marker_colorbar()`**: Sets the thickness of the color
  bar This measure excludes the size of the padding, ticks and labels.
  Number in the interval \[0, Inf\].

  **`go_treemap_pathbar()`**: Sets the thickness of \`pathbar\` (in px).
  If not specified the \`pathbar.textfont.size\` is used with 3 pixles
  extra padding on each side. Number in the interval \[12, Inf\].

- thicknessmode:

  Determines whether this color bar's thickness (i.e. the measure in the
  constant color direction) is set in units of plot "fraction" or in
  "pixels". Use \`thickness\` to set the value. One of `"fraction"`,
  `"pixels"`.

- tick0:

  Sets the placement of the first tick on this axis. Use with \`dtick\`.
  If the axis \`type\` is "log", then you must take the log of your
  starting tick (e.g. to set the starting tick to 100, set the \`tick0\`
  to 2) except when \`dtick\`="L\<f\>" (see \`dtick\` for more info). If
  the axis \`type\` is "date", it should be a date string, like date
  data. If the axis \`type\` is "category", it should be a number, using
  the scale where each category is assigned a serial number from zero in
  the order it appears. Any value.

- tickangle:

  Sets the angle of the tick labels with respect to the horizontal. For
  example, a \`tickangle\` of -90 draws the tick labels vertically.
  Angle in degrees.

- tickcolor:

  Sets the tick color. Color: a CSS color string or R color name.

- tickfont:

  Sets the color bar's tick label font Named list or
  `go_treemap_marker_colorbar_tickfont()` object.

- tickformat:

  Sets the tick label formatting rule using d3 formatting mini-languages
  which are very similar to those in Python. For numbers, see:
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for dates
  see: https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format.
  We add two items to d3's date formatter: "%h" for half of the year as
  a decimal number as well as "%{n}f" for fractional seconds with n
  digits. For example, "2016-10-13 09:15:23.456" with tickformat
  "%H~%M~%S.%2f" would display "09~15~23.46" String.

- tickformatstops:

  List of named lists or `go_treemap_marker_colorbar_tickformatstop()`
  objects.

- ticklabeloverflow:

  Determines how we handle tick labels that would overflow either the
  graph div or the domain of the axis. The default value for inside tick
  labels is "hide past domain". In other cases the default is "hide past
  div". One of `"allow"`, `"hide past div"`, `"hide past domain"`.

- ticklabelposition:

  Determines where tick labels are drawn relative to the ticks. Left and
  right options are used when \`orientation\` is "h", top and bottom
  when \`orientation\` is "v". One of `"outside"`, `"inside"`,
  `"outside top"`, `"inside top"`, `"outside left"`, `"inside left"`,
  `"outside right"`, `"inside right"`, `"outside bottom"`,
  `"inside bottom"`.

- ticklabelstep:

  Sets the spacing between tick labels as compared to the spacing
  between ticks. A value of 1 (default) means each tick gets a label. A
  value of 2 means shows every 2nd label. A larger value n means only
  every nth tick is labeled. \`tick0\` determines which labels are
  shown. Not implemented for axes with \`type\` "log" or
  "multicategory", or when \`tickmode\` is "array". Integer in the
  interval \[1, Inf\].

- ticklen:

  Sets the tick length (in px). Number in the interval \[0, Inf\].

- tickmode:

  Sets the tick mode for this axis. If "auto", the number of ticks is
  set via \`nticks\`. If "linear", the placement of the ticks is
  determined by a starting position \`tick0\` and a tick step \`dtick\`
  ("linear" is the default value if \`tick0\` and \`dtick\` are
  provided). If "array", the placement of the ticks is set via
  \`tickvals\` and the tick text is \`ticktext\`. ("array" is the
  default value if \`tickvals\` is provided). One of `"auto"`,
  `"linear"`, `"array"`.

- tickprefix:

  Sets a tick label prefix. String.

- ticks:

  Determines whether ticks are drawn or not. If \*\*, this axis' ticks
  are not drawn. If "outside" ("inside"), this axis' are drawn outside
  (inside) the axis lines. One of `"outside"`, `"inside"`, `""`.

- ticksuffix:

  Sets a tick label suffix. String.

- ticktext:

  Sets the text displayed at the ticks position via \`tickvals\`. Only
  has an effect if \`tickmode\` is set to "array". Used with
  \`tickvals\`. Data array: a vector, factor, Date/POSIXct vector,
  matrix or list.

- tickvals:

  Sets the values at which ticks on this axis appear. Only has an effect
  if \`tickmode\` is set to "array". Used with \`ticktext\`. Data array:
  a vector, factor, Date/POSIXct vector, matrix or list.

- tickwidth:

  Sets the tick width (in px). Number in the interval \[0, Inf\].

- title:

  String (the title text), named list or
  `go_treemap_marker_colorbar_title()` object.

- xanchor:

  Sets this color bar's horizontal position anchor. This anchor binds
  the \`x\` position to the "left", "center" or "right" of the color
  bar. Defaults to "left" when \`orientation\` is "v" and "center" when
  \`orientation\` is "h". One of `"left"`, `"center"`, `"right"`.

- xpad:

  Sets the amount of padding (in px) along the x direction. Number in
  the interval \[0, Inf\].

- xref:

  Sets the container \`x\` refers to. "container" spans the entire
  \`width\` of the plot. "paper" refers to the width of the plotting
  area only. One of `"container"`, `"paper"`.

- yanchor:

  Sets this color bar's vertical position anchor This anchor binds the
  \`y\` position to the "top", "middle" or "bottom" of the color bar.
  Defaults to "middle" when \`orientation\` is "v" and "bottom" when
  \`orientation\` is "h". One of `"top"`, `"middle"`, `"bottom"`.

- ypad:

  Sets the amount of padding (in px) along the y direction. Number in
  the interval \[0, Inf\].

- yref:

  Sets the container \`y\` refers to. "container" spans the entire
  \`height\` of the plot. "paper" refers to the height of the plotting
  area only. One of `"container"`, `"paper"`.

- dtickrange:

  range \["min", "max"\], where "min", "max" - dtick values which
  describe some zoom level, it is possible to omit "min" or "max" value
  by passing "null" Vector or list of 2 element(s).

- enabled:

  Determines whether or not this stop is used. If \`false\`, this stop
  is ignored even within its \`dtickrange\`. Logical.

- templateitemname:

  Used to refer to a named item in this array in the template. Named
  items from the template will be created even without a matching item
  in the input figure, but you can modify one by making an item with
  \`templateitemname\` matching its \`name\`, alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). If there is no template or no matching item, this item will
  be hidden unless you explicitly show it with \`visible: true\`.
  String.

- value:

  string - dtickformat for described zoom level, the same as
  "tickformat" String.

- side:

  **`go_treemap_marker_colorbar_title()`**: Determines the location of
  color bar's title with respect to the color bar. Defaults to "top"
  when \`orientation\` is "v" and defaults to "right" when
  \`orientation\` is "h". One of `"right"`, `"top"`, `"bottom"`.

  **`go_treemap_pathbar()`**: Determines on which side of the treemap
  the \`pathbar\` should be presented. One of `"top"`, `"bottom"`.

- width:

  Sets the width (in px) of the line enclosing each sector. Number in
  the interval \[0, Inf\], or a vector of these.

- b:

  Sets the padding form the bottom (in px). Number in the interval \[0,
  Inf\].

- l:

  Sets the padding form the left (in px). Number in the interval \[0,
  Inf\].

- r:

  Sets the padding form the right (in px). Number in the interval \[0,
  Inf\].

- t:

  Sets the padding form the top (in px). Number in the interval \[0,
  Inf\].

- fgcolor:

  When there is no colorscale sets the color of foreground pattern fill.
  Defaults to a \`marker.color\` background when \`fillmode\` is
  "replace". Otherwise, defaults to dark grey or white to increase
  contrast with the \`bgcolor\`. Color: a CSS color string or R color
  name, or a vector of these.

- fgopacity:

  Sets the opacity of the foreground pattern fill. Defaults to a 0.5
  when \`fillmode\` is "overlay". Otherwise, defaults to 1. Number in
  the interval \[0, 1\].

- fillmode:

  Determines whether \`marker.color\` should be used as a default to
  \`bgcolor\` or a \`fgcolor\`. One of `"replace"`, `"overlay"`.

- path:

  Sets a custom path for pattern fill. Use with no \`shape\` or
  \`solidity\`, provide an SVG path string for the regions of the square
  from (0,0) to (\`size\`,\`size\`) to color. String, or a vector of
  these.

- shape:

  Sets the shape of the pattern fill. By default, no pattern is used for
  filling the area. One of `""`, `"/"`, `"\\"`, `"x"`, `"-"`, `"|"`,
  `"+"`, `"."`, or a vector of these.

- solidity:

  Sets the solidity of the pattern fill. Solidity is roughly the
  fraction of the area filled by the pattern. Solidity of 0 shows only
  the background color without pattern and solidty of 1 shows only the
  foreground color without pattern. Number in the interval \[0, 1\], or
  a vector of these.

- edgeshape:

  Determines which shape is used for edges between \`barpath\` labels.
  One of `">"`, `"<"`, `"|"`, `"/"`, `"\\"`.

- flip:

  Determines if the positions obtained from solver are flipped on each
  axis. Any combination of `"x"`, `"y"` joined with `"+"`.

- packing:

  Determines d3 treemap solver. For more info please refer to
  https://github.com/d3/d3-hierarchy#treemap-tiling One of `"squarify"`,
  `"binary"`, `"dice"`, `"slice"`, `"slice-dice"`, `"dice-slice"`.

- squarifyratio:

  When using "squarify" \`packing\` algorithm, according to
  https://github.com/d3/d3-hierarchy/blob/v3.1.1/README.md#squarify_ratio
  this option specifies the desired aspect ratio of the generated
  rectangles. The ratio must be specified as a number greater than or
  equal to one. Note that the orientation of the generated rectangles
  (tall or wide) is not implied by the ratio; for example, a ratio of
  two will attempt to produce a mixture of rectangles whose width:height
  ratio is either 2:1 or 1:2. When using "squarify", unlike d3 which
  uses the Golden Ratio i.e. 1.618034, Plotly applies 1 to increase
  squares in treemap layouts. Number in the interval \[1, Inf\].

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_treemap()` and the nested object constructors below create validated
graph objects (named lists). Every property is checked against the
plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
`add_treemap()` creates an object and adds it to a figure.

Nested objects documented here:

- `go_treemap_domain()`:

  `treemap.domain`

- `go_treemap_hoverlabel()`:

  `treemap.hoverlabel`

- `go_treemap_hoverlabel_font()`:

  `treemap.hoverlabel.font`: Sets the font used in hover labels.

- `go_treemap_insidetextfont()`:

  `treemap.insidetextfont`: Sets the font used for \`textinfo\` lying
  inside the sector.

- `go_treemap_legendgrouptitle()`:

  `treemap.legendgrouptitle`

- `go_treemap_legendgrouptitle_font()`:

  `treemap.legendgrouptitle.font`: Sets this legend group's title font.

- `go_treemap_marker()`:

  `treemap.marker`

- `go_treemap_marker_colorbar()`:

  `treemap.marker.colorbar`

- `go_treemap_marker_colorbar_tickfont()`:

  `treemap.marker.colorbar.tickfont`: Sets the color bar's tick label
  font

- `go_treemap_marker_colorbar_tickformatstop()`:

  `treemap.marker.colorbar.tickformatstop`

- `go_treemap_marker_colorbar_title()`:

  `treemap.marker.colorbar.title`

- `go_treemap_marker_colorbar_title_font()`:

  `treemap.marker.colorbar.title.font`: Sets this color bar's title
  font.

- `go_treemap_marker_line()`:

  `treemap.marker.line`

- `go_treemap_marker_pad()`:

  `treemap.marker.pad`

- `go_treemap_marker_pattern()`:

  `treemap.marker.pattern`: Sets the pattern within the marker.

- `go_treemap_outsidetextfont()`:

  `treemap.outsidetextfont`: Sets the font used for \`textinfo\` lying
  outside the sector. This option refers to the root of the hierarchy
  presented on top left corner of a treemap graph. Please note that if a
  hierarchy has multiple root nodes, this option won't have any effect
  and \`insidetextfont\` would be used.

- `go_treemap_pathbar()`:

  `treemap.pathbar`

- `go_treemap_pathbar_textfont()`:

  `treemap.pathbar.textfont`: Sets the font used inside \`pathbar\`.

- `go_treemap_root()`:

  `treemap.root`

- `go_treemap_textfont()`:

  `treemap.textfont`: Sets the font used for \`textinfo\`.

- `go_treemap_tiling()`:

  `treemap.tiling`

## See also

[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)

## Examples

``` r
go_treemap()
#> <go_treemap>
#> {
#>   "type": "treemap"
#> }
#> 
```
