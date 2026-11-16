# Bar traces

The data visualized by the span of the bars is set in \`y\` if
\`orientation\` is set to "v" (the default) and the labels are set in
\`x\`. By setting \`orientation\` to "h", the roles are interchanged.

## Usage

``` r
go_bar(
  arg = NULL,
  ...,
  alignmentgroup = NULL,
  base = NULL,
  cliponaxis = NULL,
  constraintext = NULL,
  customdata = NULL,
  dx = NULL,
  dy = NULL,
  error_x = NULL,
  error_y = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  insidetextanchor = NULL,
  insidetextfont = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  marker = NULL,
  meta = NULL,
  name = NULL,
  offset = NULL,
  offsetgroup = NULL,
  opacity = NULL,
  orientation = NULL,
  outsidetextfont = NULL,
  selected = NULL,
  selectedpoints = NULL,
  showlegend = NULL,
  text = NULL,
  textangle = NULL,
  textfont = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  uid = NULL,
  uirevision = NULL,
  unselected = NULL,
  visible = NULL,
  width = NULL,
  x = NULL,
  x0 = NULL,
  xaxis = NULL,
  xcalendar = NULL,
  xhoverformat = NULL,
  xperiod = NULL,
  xperiod0 = NULL,
  xperiodalignment = NULL,
  y = NULL,
  y0 = NULL,
  yaxis = NULL,
  ycalendar = NULL,
  yhoverformat = NULL,
  yperiod = NULL,
  yperiod0 = NULL,
  yperiodalignment = NULL,
  zorder = NULL,
  skip_invalid = FALSE
)

go_bar_error_x(
  arg = NULL,
  ...,
  array = NULL,
  arrayminus = NULL,
  color = NULL,
  copy_ystyle = NULL,
  symmetric = NULL,
  thickness = NULL,
  traceref = NULL,
  tracerefminus = NULL,
  type = NULL,
  value = NULL,
  valueminus = NULL,
  visible = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_bar_error_y(
  arg = NULL,
  ...,
  array = NULL,
  arrayminus = NULL,
  color = NULL,
  symmetric = NULL,
  thickness = NULL,
  traceref = NULL,
  tracerefminus = NULL,
  type = NULL,
  value = NULL,
  valueminus = NULL,
  visible = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_bar_hoverlabel(
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

go_bar_hoverlabel_font(
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

go_bar_insidetextfont(
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

go_bar_legendgrouptitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_bar_legendgrouptitle_font(
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

go_bar_marker(
  arg = NULL,
  ...,
  autocolorscale = NULL,
  cauto = NULL,
  cmax = NULL,
  cmid = NULL,
  cmin = NULL,
  color = NULL,
  coloraxis = NULL,
  colorbar = NULL,
  colorscale = NULL,
  cornerradius = NULL,
  line = NULL,
  opacity = NULL,
  pattern = NULL,
  reversescale = NULL,
  showscale = NULL,
  skip_invalid = FALSE
)

go_bar_marker_colorbar(
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

go_bar_marker_colorbar_tickfont(
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

go_bar_marker_colorbar_tickformatstop(
  arg = NULL,
  ...,
  dtickrange = NULL,
  enabled = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  skip_invalid = FALSE
)

go_bar_marker_colorbar_title(
  arg = NULL,
  ...,
  font = NULL,
  side = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_bar_marker_colorbar_title_font(
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

go_bar_marker_line(
  arg = NULL,
  ...,
  autocolorscale = NULL,
  cauto = NULL,
  cmax = NULL,
  cmid = NULL,
  cmin = NULL,
  color = NULL,
  coloraxis = NULL,
  colorscale = NULL,
  reversescale = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_bar_marker_pattern(
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

go_bar_outsidetextfont(
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

go_bar_selected(
  arg = NULL,
  ...,
  marker = NULL,
  textfont = NULL,
  skip_invalid = FALSE
)

go_bar_selected_marker(
  arg = NULL,
  ...,
  color = NULL,
  opacity = NULL,
  skip_invalid = FALSE
)

go_bar_selected_textfont(arg = NULL, ..., color = NULL, skip_invalid = FALSE)

go_bar_textfont(
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

go_bar_unselected(
  arg = NULL,
  ...,
  marker = NULL,
  textfont = NULL,
  skip_invalid = FALSE
)

go_bar_unselected_marker(
  arg = NULL,
  ...,
  color = NULL,
  opacity = NULL,
  skip_invalid = FALSE
)

go_bar_unselected_textfont(arg = NULL, ..., color = NULL, skip_invalid = FALSE)

add_bar(fig, ...)

# Default S3 method
add_bar(
  fig,
  ...,
  data = NULL,
  alignmentgroup = NULL,
  base = NULL,
  cliponaxis = NULL,
  constraintext = NULL,
  customdata = NULL,
  dx = NULL,
  dy = NULL,
  error_x = NULL,
  error_y = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  insidetextanchor = NULL,
  insidetextfont = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  marker = NULL,
  meta = NULL,
  name = NULL,
  offset = NULL,
  offsetgroup = NULL,
  opacity = NULL,
  orientation = NULL,
  outsidetextfont = NULL,
  selected = NULL,
  selectedpoints = NULL,
  showlegend = NULL,
  text = NULL,
  textangle = NULL,
  textfont = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  uid = NULL,
  uirevision = NULL,
  unselected = NULL,
  visible = NULL,
  width = NULL,
  x = NULL,
  x0 = NULL,
  xaxis = NULL,
  xcalendar = NULL,
  xhoverformat = NULL,
  xperiod = NULL,
  xperiod0 = NULL,
  xperiodalignment = NULL,
  y = NULL,
  y0 = NULL,
  yaxis = NULL,
  ycalendar = NULL,
  yhoverformat = NULL,
  yperiod = NULL,
  yperiod0 = NULL,
  yperiodalignment = NULL,
  zorder = NULL,
  row = NULL,
  col = NULL,
  secondary_y = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from (constructors). Named arguments take precedence.

- ...:

  Further properties, including nested properties in "magic underscore"
  form, e.g. `marker_size = 10` for `marker = list(size = 10)`. Property
  values may be one-sided formulas, evaluated in `data` for `add_*()`
  functions.

- alignmentgroup:

  Set several traces linked to the same position axis or matching axes
  to the same alignmentgroup. This controls whether bars compute their
  positional range dependently or independently. String.

- base:

  Sets where the bar base is drawn (in position axis units). In "stack"
  or "relative" barmode, traces that set "base" will be excluded and
  drawn in "overlay" mode instead. Any value.

- cliponaxis:

  Determines whether the text nodes are clipped about the subplot axes.
  To show the text nodes above axis lines and tick labels, make sure to
  set \`xaxis.layer\` and \`yaxis.layer\` to "below traces". Logical.

- constraintext:

  Constrain the size of text inside or outside a bar to be no larger
  than the bar itself. One of `"inside"`, `"outside"`, `"both"`,
  `"none"`.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- dx:

  Sets the x coordinate step. See \`x0\` for more info. Number.

- dy:

  Sets the y coordinate step. See \`y0\` for more info. Number.

- error_x:

  Named list or `go_bar_error_x()` object.

- error_y:

  Named list or `go_bar_error_y()` object.

- hoverinfo:

  Determines what trace information appears on hover. If \`none\` or
  \`skip\` are set, no information is displayed upon hovering. But, if
  \`none\` is set, click and hover events are still fired. Any
  combination of `"x"`, `"y"`, `"z"`, `"text"`, `"name"` joined with
  `"+"`, or one of `"all"`, `"none"`, `"skip"`, or a vector of these.

- hoverlabel:

  Named list or `go_bar_hoverlabel()` object.

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

- hovertext:

  Sets hover text elements associated with each (x,y) pair. If a single
  string, the same string appears over all the data points. If an array
  of string, the items are mapped in order to the this trace's (x,y)
  coordinates. To be seen, trace \`hoverinfo\` must contain a "text"
  flag. String, or a vector of these.

- ids:

  Assigns id labels to each datum. These ids for object constancy of
  data points during animation. Should be an array of strings, not
  numbers or any other type. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- insidetextanchor:

  Determines if texts are kept at center or start/end points in
  \`textposition\` "inside" mode. One of `"end"`, `"middle"`, `"start"`.

- insidetextfont:

  Sets the font used for \`text\` lying inside the bar. Named list or
  `go_bar_insidetextfont()` object.

- legend:

  Sets the reference to a legend to show this trace in. References to
  these legends are "legend", "legend2", "legend3", etc. Settings for
  these legends are set in the layout, under \`layout.legend\`,
  \`layout.legend2\`, etc. Subplot id: `"legend"`, `"legend2"`,
  `"legend3"`, ....

- legendgroup:

  Sets the legend group for this trace. Traces and shapes part of the
  same legend group hide/show at the same time when toggling legend
  items. String.

- legendgrouptitle:

  Named list or `go_bar_legendgrouptitle()` object.

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

- marker:

  **`go_bar()`**: Named list or `go_bar_marker()` object.

  **`go_bar_selected()`**: Named list or `go_bar_selected_marker()`
  object.

  **`go_bar_unselected()`**: Named list or `go_bar_unselected_marker()`
  object.

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

  **`go_bar()`**: Sets the trace name. The trace name appears as the
  legend item and on hover. String.

  **`go_bar_marker_colorbar_tickformatstop()`**: When used in a
  template, named items are created in the output figure in addition to
  any items the figure already has in this array. You can modify these
  items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- offset:

  Shifts the position where the bar is drawn (in position axis units).
  In "group" barmode, traces that set "offset" will be excluded and
  drawn in "overlay" mode instead. Number, or a vector of these.

- offsetgroup:

  Set several traces linked to the same position axis or matching axes
  to the same offsetgroup where bars of the same position coordinate
  will line up. String.

- opacity:

  **`go_bar()`**: Sets the opacity of the trace. Number in the interval
  \[0, 1\].

  **`go_bar_marker()`**: Sets the opacity of the bars. Number in the
  interval \[0, 1\], or a vector of these.

  **`go_bar_selected_marker()`**: Sets the marker opacity of selected
  points. Number in the interval \[0, 1\].

  **`go_bar_unselected_marker()`**: Sets the marker opacity of
  unselected points, applied only when a selection exists. Number in the
  interval \[0, 1\].

- orientation:

  **`go_bar()`**: Sets the orientation of the bars. With "v" ("h"), the
  value of the each bar spans along the vertical (horizontal). One of
  `"v"`, `"h"`.

  **`go_bar_marker_colorbar()`**: Sets the orientation of the colorbar.
  One of `"h"`, `"v"`.

- outsidetextfont:

  Sets the font used for \`text\` lying outside the bar. Named list or
  `go_bar_outsidetextfont()` object.

- selected:

  Named list or `go_bar_selected()` object.

- selectedpoints:

  Array containing integer indices of selected points. Has an effect
  only for traces that support selections. Note that an empty array
  means an empty selection where the \`unselected\` are turned on for
  all points, whereas, any other non-array values means no selection all
  where the \`selected\` and \`unselected\` styles have no effect. Any
  value.

- showlegend:

  Determines whether or not an item corresponding to this trace is shown
  in the legend. Logical.

- text:

  **`go_bar()`**: Sets text elements associated with each (x,y) pair. If
  a single string, the same string appears over all the data points. If
  an array of string, the items are mapped in order to the this trace's
  (x,y) coordinates. If trace \`hoverinfo\` contains a "text" flag and
  "hovertext" is not set, these elements will be seen in the hover
  labels. String, or a vector of these.

  **`go_bar_legendgrouptitle()`**: Sets the title of the legend group.
  String.

  **`go_bar_marker_colorbar_title()`**: Sets the title of the color bar.
  String.

- textangle:

  Sets the angle of the tick labels with respect to the bar. For
  example, a \`tickangle\` of -90 draws the tick labels vertically. With
  "auto" the texts may automatically be rotated to fit with the maximum
  size in bars. Angle in degrees.

- textfont:

  **`go_bar()`**: Sets the font used for \`text\`. Named list or
  `go_bar_textfont()` object.

  **`go_bar_selected()`**: Named list or `go_bar_selected_textfont()`
  object.

  **`go_bar_unselected()`**: Named list or
  `go_bar_unselected_textfont()` object.

- textposition:

  Specifies the location of the \`text\`. "inside" positions \`text\`
  inside, next to the bar end (rotated and scaled if needed). "outside"
  positions \`text\` outside, next to the bar end (scaled if needed),
  unless there is another bar stacked on this one, then the text gets
  pushed inside. "auto" tries to position \`text\` inside the bar, but
  if the bar is too small and no bar is stacked on this one the text is
  moved outside. If "none", no text appears. One of `"inside"`,
  `"outside"`, `"auto"`, `"none"`, or a vector of these.

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
  template string has access to variables \`value\` and \`label\`.
  String, or a vector of these.

- texttemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

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

- unselected:

  Named list or `go_bar_unselected()` object.

- visible:

  **`go_bar()`**: Determines whether or not this trace is visible. If
  "legendonly", the trace is not drawn, but can appear as a legend item
  (provided that the legend itself is visible). One of `"legendonly"`,
  `TRUE`, `FALSE`.

  **`go_bar_error_x()`, `go_bar_error_y()`**: Determines whether or not
  this set of error bars is visible. Logical.

- width:

  **`go_bar()`**: Sets the bar width (in position axis units). Number in
  the interval \[0, Inf\], or a vector of these.

  **`go_bar_error_x()`, `go_bar_error_y()`**: Sets the width (in px) of
  the cross-bar at both ends of the error bars. Number in the interval
  \[0, Inf\].

  **`go_bar_marker_line()`**: Sets the width (in px) of the lines
  bounding the marker points. Number in the interval \[0, Inf\], or a
  vector of these.

- x:

  **`go_bar()`**: Sets the x coordinates. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

  **`go_bar_marker_colorbar()`**: Sets the x position with respect to
  \`xref\` of the color bar (in plot fraction). When \`xref\` is
  "paper", defaults to 1.02 when \`orientation\` is "v" and 0.5 when
  \`orientation\` is "h". When \`xref\` is "container", defaults to 1
  when \`orientation\` is "v" and 0.5 when \`orientation\` is "h". Must
  be between 0 and 1 if \`xref\` is "container" and between "-2" and 3
  if \`xref\` is "paper". Number.

- x0:

  Alternate to \`x\`. Builds a linear space of x coordinates. Use with
  \`dx\` where \`x0\` is the starting coordinate and \`dx\` the step.
  Any value.

- xaxis:

  Sets a reference between this trace's x coordinates and a 2D cartesian
  x axis. If "x" (the default value), the x coordinates refer to
  \`layout.xaxis\`. If "x2", the x coordinates refer to
  \`layout.xaxis2\`, and so on. Subplot id: `"x"`, `"x2"`, `"x3"`, ....

- xcalendar:

  Sets the calendar system to use with \`x\` date data. One of
  `"chinese"`, `"coptic"`, `"discworld"`, `"ethiopian"`, `"gregorian"`,
  `"hebrew"`, `"islamic"`, `"jalali"`, `"julian"`, `"mayan"`,
  `"nanakshahi"`, `"nepali"`, `"persian"`, `"taiwan"`, `"thai"`,
  `"ummalqura"`.

- xhoverformat:

  Sets the hover text formatting rule for \`x\` using d3 formatting
  mini-languages which are very similar to those in Python. For numbers,
  see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for
  dates see:
  https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format. We add
  two items to d3's date formatter: "%h" for half of the year as a
  decimal number as well as "%{n}f" for fractional seconds with n
  digits. For example, "2016-10-13 09:15:23.456" with tickformat
  "%H~%M~%S.%2f" would display "09~15~23.46"By default the values are
  formatted using \`xaxis.hoverformat\`. String.

- xperiod:

  Only relevant when the axis \`type\` is "date". Sets the period
  positioning in milliseconds or "M\<n\>" on the x axis. Special values
  in the form of "M\<n\>" could be used to declare the number of months.
  In this case \`n\` must be a positive integer. Any value.

- xperiod0:

  Only relevant when the axis \`type\` is "date". Sets the base for
  period positioning in milliseconds or date string on the x0 axis. When
  \`x0period\` is round number of weeks, the \`x0period0\` by default
  would be on a Sunday i.e. 2000-01-02, otherwise it would be at
  2000-01-01. Any value.

- xperiodalignment:

  Only relevant when the axis \`type\` is "date". Sets the alignment of
  data points on the x axis. One of `"start"`, `"middle"`, `"end"`.

- y:

  **`go_bar()`**: Sets the y coordinates. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

  **`go_bar_marker_colorbar()`**: Sets the y position with respect to
  \`yref\` of the color bar (in plot fraction). When \`yref\` is
  "paper", defaults to 0.5 when \`orientation\` is "v" and 1.02 when
  \`orientation\` is "h". When \`yref\` is "container", defaults to 0.5
  when \`orientation\` is "v" and 1 when \`orientation\` is "h". Must be
  between 0 and 1 if \`yref\` is "container" and between "-2" and 3 if
  \`yref\` is "paper". Number.

- y0:

  Alternate to \`y\`. Builds a linear space of y coordinates. Use with
  \`dy\` where \`y0\` is the starting coordinate and \`dy\` the step.
  Any value.

- yaxis:

  Sets a reference between this trace's y coordinates and a 2D cartesian
  y axis. If "y" (the default value), the y coordinates refer to
  \`layout.yaxis\`. If "y2", the y coordinates refer to
  \`layout.yaxis2\`, and so on. Subplot id: `"y"`, `"y2"`, `"y3"`, ....

- ycalendar:

  Sets the calendar system to use with \`y\` date data. One of
  `"chinese"`, `"coptic"`, `"discworld"`, `"ethiopian"`, `"gregorian"`,
  `"hebrew"`, `"islamic"`, `"jalali"`, `"julian"`, `"mayan"`,
  `"nanakshahi"`, `"nepali"`, `"persian"`, `"taiwan"`, `"thai"`,
  `"ummalqura"`.

- yhoverformat:

  Sets the hover text formatting rule for \`y\` using d3 formatting
  mini-languages which are very similar to those in Python. For numbers,
  see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for
  dates see:
  https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format. We add
  two items to d3's date formatter: "%h" for half of the year as a
  decimal number as well as "%{n}f" for fractional seconds with n
  digits. For example, "2016-10-13 09:15:23.456" with tickformat
  "%H~%M~%S.%2f" would display "09~15~23.46"By default the values are
  formatted using \`yaxis.hoverformat\`. String.

- yperiod:

  Only relevant when the axis \`type\` is "date". Sets the period
  positioning in milliseconds or "M\<n\>" on the y axis. Special values
  in the form of "M\<n\>" could be used to declare the number of months.
  In this case \`n\` must be a positive integer. Any value.

- yperiod0:

  Only relevant when the axis \`type\` is "date". Sets the base for
  period positioning in milliseconds or date string on the y0 axis. When
  \`y0period\` is round number of weeks, the \`y0period0\` by default
  would be on a Sunday i.e. 2000-01-02, otherwise it would be at
  2000-01-01. Any value.

- yperiodalignment:

  Only relevant when the axis \`type\` is "date". Sets the alignment of
  data points on the y axis. One of `"start"`, `"middle"`, `"end"`.

- zorder:

  Sets the layer on which this trace is displayed, relative to other SVG
  traces on the same subplot. SVG traces with higher \`zorder\` appear
  in front of those with lower \`zorder\`. Integer.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- array:

  Sets the data corresponding the length of each error bar. Values are
  plotted relative to the underlying data. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

- arrayminus:

  Sets the data corresponding the length of each error bar in the bottom
  (left) direction for vertical (horizontal) bars Values are plotted
  relative to the underlying data. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

- color:

  **`go_bar_error_x()`, `go_bar_error_y()`**: Sets the stroke color of
  the error bars. Color: a CSS color string or R color name.

  **`go_bar_hoverlabel_font()`, `go_bar_insidetextfont()`,
  `go_bar_outsidetextfont()`, `go_bar_textfont()`**: Color: a CSS color
  string or R color name, or a vector of these.

  **`go_bar_legendgrouptitle_font()`,
  `go_bar_marker_colorbar_tickfont()`,
  `go_bar_marker_colorbar_title_font()`**: Color: a CSS color string or
  R color name.

  **`go_bar_marker()`**: Sets the marker color. It accepts either a
  specific color or an array of numbers that are mapped to the
  colorscale relative to the max and min values of the array or relative
  to \`marker.cmin\` and \`marker.cmax\` if set. Color: a CSS color
  string or R color name, or a number mapped to a color by
  `bar.marker.colorscale`, or a vector of these.

  **`go_bar_marker_line()`**: Sets the marker.line color. It accepts
  either a specific color or an array of numbers that are mapped to the
  colorscale relative to the max and min values of the array or relative
  to \`marker.line.cmin\` and \`marker.line.cmax\` if set. Color: a CSS
  color string or R color name, or a number mapped to a color by
  `bar.marker.line.colorscale`, or a vector of these.

  **`go_bar_selected_marker()`**: Sets the marker color of selected
  points. Color: a CSS color string or R color name.

  **`go_bar_selected_textfont()`**: Sets the text font color of selected
  points. Color: a CSS color string or R color name.

  **`go_bar_unselected_marker()`**: Sets the marker color of unselected
  points, applied only when a selection exists. Color: a CSS color
  string or R color name.

  **`go_bar_unselected_textfont()`**: Sets the text font color of
  unselected points, applied only when a selection exists. Color: a CSS
  color string or R color name.

- copy_ystyle:

  Logical.

- symmetric:

  Determines whether or not the error bars have the same length in both
  direction (top/bottom for vertical bars, left/right for horizontal
  bars. Logical.

- thickness:

  **`go_bar_error_x()`, `go_bar_error_y()`**: Sets the thickness (in px)
  of the error bars. Number in the interval \[0, Inf\].

  **`go_bar_marker_colorbar()`**: Sets the thickness of the color bar
  This measure excludes the size of the padding, ticks and labels.
  Number in the interval \[0, Inf\].

- traceref:

  Integer in the interval \[0, Inf\].

- tracerefminus:

  Integer in the interval \[0, Inf\].

- type:

  Determines the rule used to generate the error bars. If "constant",
  the bar lengths are of a constant value. Set this constant in
  \`value\`. If "percent", the bar lengths correspond to a percentage of
  underlying data. Set this percentage in \`value\`. If "sqrt", the bar
  lengths correspond to the square of the underlying data. If "data",
  the bar lengths are set with data set \`array\`. One of `"percent"`,
  `"constant"`, `"sqrt"`, `"data"`.

- value:

  **`go_bar_error_x()`, `go_bar_error_y()`**: Sets the value of either
  the percentage (if \`type\` is set to "percent") or the constant (if
  \`type\` is set to "constant") corresponding to the lengths of the
  error bars. Number in the interval \[0, Inf\].

  **`go_bar_marker_colorbar_tickformatstop()`**: string - dtickformat
  for described zoom level, the same as "tickformat" String.

- valueminus:

  Sets the value of either the percentage (if \`type\` is set to
  "percent") or the constant (if \`type\` is set to "constant")
  corresponding to the lengths of the error bars in the bottom (left)
  direction for vertical (horizontal) bars Number in the interval \[0,
  Inf\].

- align:

  Sets the horizontal alignment of the text content within hover label
  box. Has an effect only if the hover label text spans two or more
  lines One of `"left"`, `"right"`, `"auto"`, or a vector of these.

- bgcolor:

  **`go_bar_hoverlabel()`**: Sets the background color of the hover
  labels for this trace Color: a CSS color string or R color name, or a
  vector of these.

  **`go_bar_marker_colorbar()`**: Sets the color of padded area. Color:
  a CSS color string or R color name.

  **`go_bar_marker_pattern()`**: When there is no colorscale sets the
  color of background pattern fill. Defaults to a \`marker.color\`
  background when \`fillmode\` is "overlay". Otherwise, defaults to a
  transparent background. Color: a CSS color string or R color name, or
  a vector of these.

- bordercolor:

  **`go_bar_hoverlabel()`**: Sets the border color of the hover labels
  for this trace. Color: a CSS color string or R color name, or a vector
  of these.

  **`go_bar_marker_colorbar()`**: Sets the axis line color. Color: a CSS
  color string or R color name.

- font:

  **`go_bar_hoverlabel()`**: Sets the font used in hover labels. Named
  list or `go_bar_hoverlabel_font()` object.

  **`go_bar_legendgrouptitle()`**: Sets this legend group's title font.
  Named list or `go_bar_legendgrouptitle_font()` object.

  **`go_bar_marker_colorbar_title()`**: Sets this color bar's title
  font. Named list or `go_bar_marker_colorbar_title_font()` object.

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

- family:

  **`go_bar_hoverlabel_font()`, `go_bar_insidetextfont()`,
  `go_bar_outsidetextfont()`, `go_bar_textfont()`**: HTML font family -
  the typeface that will be applied by the web browser. The web browser
  can only apply a font if it is available on the system where it runs.
  Provide multiple font families, separated by commas, to indicate the
  order in which to apply fonts if they aren't available. String, or a
  vector of these.

  **`go_bar_legendgrouptitle_font()`,
  `go_bar_marker_colorbar_tickfont()`,
  `go_bar_marker_colorbar_title_font()`**: HTML font family - the
  typeface that will be applied by the web browser. The web browser can
  only apply a font if it is available on the system where it runs.
  Provide multiple font families, separated by commas, to indicate the
  order in which to apply fonts if they aren't available. String.

- lineposition:

  **`go_bar_hoverlabel_font()`, `go_bar_insidetextfont()`,
  `go_bar_outsidetextfont()`, `go_bar_textfont()`**: Sets the kind of
  decoration line(s) with text, such as an "under", "over" or "through"
  as well as combinations e.g. "under+over", etc. Any combination of
  `"under"`, `"over"`, `"through"` joined with `"+"`, or one of
  `"none"`, or a vector of these.

  **`go_bar_legendgrouptitle_font()`,
  `go_bar_marker_colorbar_tickfont()`,
  `go_bar_marker_colorbar_title_font()`**: Sets the kind of decoration
  line(s) with text, such as an "under", "over" or "through" as well as
  combinations e.g. "under+over", etc. Any combination of `"under"`,
  `"over"`, `"through"` joined with `"+"`, or one of `"none"`.

- shadow:

  **`go_bar_hoverlabel_font()`, `go_bar_insidetextfont()`,
  `go_bar_outsidetextfont()`, `go_bar_textfont()`**: Sets the shape and
  color of the shadow behind text. "auto" places minimal shadow and
  applies contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String, or a vector of these.

  **`go_bar_legendgrouptitle_font()`,
  `go_bar_marker_colorbar_tickfont()`,
  `go_bar_marker_colorbar_title_font()`**: Sets the shape and color of
  the shadow behind text. "auto" places minimal shadow and applies
  contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String.

- size:

  **`go_bar_hoverlabel_font()`, `go_bar_insidetextfont()`,
  `go_bar_outsidetextfont()`, `go_bar_textfont()`**: Number in the
  interval \[1, Inf\], or a vector of these.

  **`go_bar_legendgrouptitle_font()`,
  `go_bar_marker_colorbar_tickfont()`,
  `go_bar_marker_colorbar_title_font()`**: Number in the interval \[1,
  Inf\].

  **`go_bar_marker_pattern()`**: Sets the size of unit squares of the
  pattern fill in pixels, which corresponds to the interval of
  repetition of the pattern. Number in the interval \[0, Inf\], or a
  vector of these.

- style:

  **`go_bar_hoverlabel_font()`, `go_bar_insidetextfont()`,
  `go_bar_outsidetextfont()`, `go_bar_textfont()`**: Sets whether a font
  should be styled with a normal or italic face from its family. One of
  `"normal"`, `"italic"`, or a vector of these.

  **`go_bar_legendgrouptitle_font()`,
  `go_bar_marker_colorbar_tickfont()`,
  `go_bar_marker_colorbar_title_font()`**: Sets whether a font should be
  styled with a normal or italic face from its family. One of
  `"normal"`, `"italic"`.

- textcase:

  **`go_bar_hoverlabel_font()`, `go_bar_insidetextfont()`,
  `go_bar_outsidetextfont()`, `go_bar_textfont()`**: Sets capitalization
  of text. It can be used to make text appear in all-uppercase or
  all-lowercase, or with each word capitalized. One of `"normal"`,
  `"word caps"`, `"upper"`, `"lower"`, or a vector of these.

  **`go_bar_legendgrouptitle_font()`,
  `go_bar_marker_colorbar_tickfont()`,
  `go_bar_marker_colorbar_title_font()`**: Sets capitalization of text.
  It can be used to make text appear in all-uppercase or all-lowercase,
  or with each word capitalized. One of `"normal"`, `"word caps"`,
  `"upper"`, `"lower"`.

- variant:

  **`go_bar_hoverlabel_font()`, `go_bar_insidetextfont()`,
  `go_bar_outsidetextfont()`, `go_bar_textfont()`**: Sets the variant of
  the font. One of `"normal"`, `"small-caps"`, `"all-small-caps"`,
  `"all-petite-caps"`, `"petite-caps"`, `"unicase"`, or a vector of
  these.

  **`go_bar_legendgrouptitle_font()`,
  `go_bar_marker_colorbar_tickfont()`,
  `go_bar_marker_colorbar_title_font()`**: Sets the variant of the font.
  One of `"normal"`, `"small-caps"`, `"all-small-caps"`,
  `"all-petite-caps"`, `"petite-caps"`, `"unicase"`.

- weight:

  **`go_bar_hoverlabel_font()`, `go_bar_insidetextfont()`,
  `go_bar_outsidetextfont()`, `go_bar_textfont()`**: Sets the weight (or
  boldness) of the font. Integer in the interval \[1, 1000\], or a
  vector of these.

  **`go_bar_legendgrouptitle_font()`,
  `go_bar_marker_colorbar_tickfont()`,
  `go_bar_marker_colorbar_title_font()`**: Sets the weight (or boldness)
  of the font. Integer in the interval \[1, 1000\].

- autocolorscale:

  **`go_bar_marker()`**: Determines whether the colorscale is a default
  palette (\`autocolorscale: true\`) or the palette determined by
  \`marker.colorscale\`. Has an effect only if in \`marker.color\` is
  set to a numerical array. In case \`colorscale\` is unspecified or
  \`autocolorscale\` is true, the default palette will be chosen
  according to whether numbers in the \`color\` array are all positive,
  all negative or mixed. Logical.

  **`go_bar_marker_line()`**: Determines whether the colorscale is a
  default palette (\`autocolorscale: true\`) or the palette determined
  by \`marker.line.colorscale\`. Has an effect only if in
  \`marker.line.color\` is set to a numerical array. In case
  \`colorscale\` is unspecified or \`autocolorscale\` is true, the
  default palette will be chosen according to whether numbers in the
  \`color\` array are all positive, all negative or mixed. Logical.

- cauto:

  **`go_bar_marker()`**: Determines whether or not the color domain is
  computed with respect to the input data (here in \`marker.color\`) or
  the bounds set in \`marker.cmin\` and \`marker.cmax\` Has an effect
  only if in \`marker.color\` is set to a numerical array. Defaults to
  \`false\` when \`marker.cmin\` and \`marker.cmax\` are set by the
  user. Logical.

  **`go_bar_marker_line()`**: Determines whether or not the color domain
  is computed with respect to the input data (here in
  \`marker.line.color\`) or the bounds set in \`marker.line.cmin\` and
  \`marker.line.cmax\` Has an effect only if in \`marker.line.color\` is
  set to a numerical array. Defaults to \`false\` when
  \`marker.line.cmin\` and \`marker.line.cmax\` are set by the user.
  Logical.

- cmax:

  **`go_bar_marker()`**: Sets the upper bound of the color domain. Has
  an effect only if in \`marker.color\` is set to a numerical array.
  Value should have the same units as in \`marker.color\` and if set,
  \`marker.cmin\` must be set as well. Number.

  **`go_bar_marker_line()`**: Sets the upper bound of the color domain.
  Has an effect only if in \`marker.line.color\` is set to a numerical
  array. Value should have the same units as in \`marker.line.color\`
  and if set, \`marker.line.cmin\` must be set as well. Number.

- cmid:

  **`go_bar_marker()`**: Sets the mid-point of the color domain by
  scaling \`marker.cmin\` and/or \`marker.cmax\` to be equidistant to
  this point. Has an effect only if in \`marker.color\` is set to a
  numerical array. Value should have the same units as in
  \`marker.color\`. Has no effect when \`marker.cauto\` is \`false\`.
  Number.

  **`go_bar_marker_line()`**: Sets the mid-point of the color domain by
  scaling \`marker.line.cmin\` and/or \`marker.line.cmax\` to be
  equidistant to this point. Has an effect only if in
  \`marker.line.color\` is set to a numerical array. Value should have
  the same units as in \`marker.line.color\`. Has no effect when
  \`marker.line.cauto\` is \`false\`. Number.

- cmin:

  **`go_bar_marker()`**: Sets the lower bound of the color domain. Has
  an effect only if in \`marker.color\` is set to a numerical array.
  Value should have the same units as in \`marker.color\` and if set,
  \`marker.cmax\` must be set as well. Number.

  **`go_bar_marker_line()`**: Sets the lower bound of the color domain.
  Has an effect only if in \`marker.line.color\` is set to a numerical
  array. Value should have the same units as in \`marker.line.color\`
  and if set, \`marker.line.cmax\` must be set as well. Number.

- coloraxis:

  Sets a reference to a shared color axis. References to these shared
  color axes are "coloraxis", "coloraxis2", "coloraxis3", etc. Settings
  for these shared color axes are set in the layout, under
  \`layout.coloraxis\`, \`layout.coloraxis2\`, etc. Note that multiple
  color scales can be linked to the same color axis. Subplot id:
  `"coloraxis"`, `"coloraxis2"`, `"coloraxis3"`, ....

- colorbar:

  Named list or `go_bar_marker_colorbar()` object.

- colorscale:

  **`go_bar_marker()`**: Sets the colorscale. Has an effect only if in
  \`marker.color\` is set to a numerical array. The colorscale must be
  an array containing arrays mapping a normalized value to an rgb, rgba,
  hex, hsl, hsla, hwb, or named color string. At minimum, a mapping for
  the lowest (0) and highest (1) values are required. For example,
  \`\[\[0, 'rgb(0,0,255)'\], \[1, 'rgb(255,0,0)'\]\]\`. To control the
  bounds of the colorscale in color space, use \`marker.cmin\` and
  \`marker.cmax\`. Alternatively, \`colorscale\` may be a palette name
  string of the following list:
  Blackbody,Bluered,Blues,Cividis,Earth,Electric,Greens,Greys,Hot,Jet,Picnic,Portland,Rainbow,RdBu,Reds,Viridis,YlGnBu,YlOrRd.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

  **`go_bar_marker_line()`**: Sets the colorscale. Has an effect only if
  in \`marker.line.color\` is set to a numerical array. The colorscale
  must be an array containing arrays mapping a normalized value to an
  rgb, rgba, hex, hsl, hsla, hwb, or named color string. At minimum, a
  mapping for the lowest (0) and highest (1) values are required. For
  example, \`\[\[0, 'rgb(0,0,255)'\], \[1, 'rgb(255,0,0)'\]\]\`. To
  control the bounds of the colorscale in color space, use
  \`marker.line.cmin\` and \`marker.line.cmax\`. Alternatively,
  \`colorscale\` may be a palette name string of the following list:
  Blackbody,Bluered,Blues,Cividis,Earth,Electric,Greens,Greys,Hot,Jet,Picnic,Portland,Rainbow,RdBu,Reds,Viridis,YlGnBu,YlOrRd.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

- cornerradius:

  Sets the rounding of corners. May be an integer number of pixels, or a
  percentage of bar width (as a string ending in %). Defaults to
  \`layout.barcornerradius\`. In stack or relative barmode, the first
  trace to set cornerradius is used for the whole stack. Any value.

- line:

  Named list or `go_bar_marker_line()` object.

- pattern:

  Sets the pattern within the marker. Named list or
  `go_bar_marker_pattern()` object.

- reversescale:

  **`go_bar_marker()`**: Reverses the color mapping if true. Has an
  effect only if in \`marker.color\` is set to a numerical array. If
  true, \`marker.cmin\` will correspond to the last color in the array
  and \`marker.cmax\` will correspond to the first color. Logical.

  **`go_bar_marker_line()`**: Reverses the color mapping if true. Has an
  effect only if in \`marker.line.color\` is set to a numerical array.
  If true, \`marker.line.cmin\` will correspond to the last color in the
  array and \`marker.line.cmax\` will correspond to the first color.
  Logical.

- showscale:

  Determines whether or not a colorbar is displayed for this trace. Has
  an effect only if in \`marker.color\` is set to a numerical array.
  Logical.

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
  `go_bar_marker_colorbar_tickfont()` object.

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

  List of named lists or `go_bar_marker_colorbar_tickformatstop()`
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
  `go_bar_marker_colorbar_title()` object.

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

- side:

  Determines the location of color bar's title with respect to the color
  bar. Defaults to "top" when \`orientation\` is "v" and defaults to
  "right" when \`orientation\` is "h". One of `"right"`, `"top"`,
  `"bottom"`.

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

- fig:

  A `go_figure` object.

- data:

  A data frame in which formula properties (e.g. `x = ~col`,
  `marker_size = ~col`) are evaluated. Default: the data given to
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md).
  Only the evaluated values are added to the trace.

- row:

  Subplot grid row (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

- col:

  Subplot grid column (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

- secondary_y:

  If `TRUE`, use the secondary y axis of the subplot.

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_bar()` and the nested object constructors below create validated
graph objects (named lists). Every property is checked against the
plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
`add_bar()` creates an object and adds it to a figure.

Nested objects documented here:

- `go_bar_error_x()`:

  `bar.error_x`

- `go_bar_error_y()`:

  `bar.error_y`

- `go_bar_hoverlabel()`:

  `bar.hoverlabel`

- `go_bar_hoverlabel_font()`:

  `bar.hoverlabel.font`: Sets the font used in hover labels.

- `go_bar_insidetextfont()`:

  `bar.insidetextfont`: Sets the font used for \`text\` lying inside the
  bar.

- `go_bar_legendgrouptitle()`:

  `bar.legendgrouptitle`

- `go_bar_legendgrouptitle_font()`:

  `bar.legendgrouptitle.font`: Sets this legend group's title font.

- `go_bar_marker()`:

  `bar.marker`

- `go_bar_marker_colorbar()`:

  `bar.marker.colorbar`

- `go_bar_marker_colorbar_tickfont()`:

  `bar.marker.colorbar.tickfont`: Sets the color bar's tick label font

- `go_bar_marker_colorbar_tickformatstop()`:

  `bar.marker.colorbar.tickformatstop`

- `go_bar_marker_colorbar_title()`:

  `bar.marker.colorbar.title`

- `go_bar_marker_colorbar_title_font()`:

  `bar.marker.colorbar.title.font`: Sets this color bar's title font.

- `go_bar_marker_line()`:

  `bar.marker.line`

- `go_bar_marker_pattern()`:

  `bar.marker.pattern`: Sets the pattern within the marker.

- `go_bar_outsidetextfont()`:

  `bar.outsidetextfont`: Sets the font used for \`text\` lying outside
  the bar.

- `go_bar_selected()`:

  `bar.selected`

- `go_bar_selected_marker()`:

  `bar.selected.marker`

- `go_bar_selected_textfont()`:

  `bar.selected.textfont`

- `go_bar_textfont()`:

  `bar.textfont`: Sets the font used for \`text\`.

- `go_bar_unselected()`:

  `bar.unselected`

- `go_bar_unselected_marker()`:

  `bar.unselected.marker`

- `go_bar_unselected_textfont()`:

  `bar.unselected.textfont`

## See also

[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)

## Examples

``` r
go_bar(x = 1:3, y = c(2, 1, 3), marker_color = "red")
#> <go_bar>
#> {
#>   "type": "bar",
#>   "x": [
#>     1,
#>     2,
#>     3
#>   ],
#>   "y": [
#>     2,
#>     1,
#>     3
#>   ],
#>   "marker": {
#>     "color": "red"
#>   }
#> }
#> 
```
