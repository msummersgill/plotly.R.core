# Scatter traces

The scatter trace type encompasses line charts, scatter charts, text
charts, and bubble charts. The data visualized as scatter point or lines
is set in \`x\` and \`y\`. Text (appearing either on the chart or on
hover only) is via \`text\`. Bubble charts are achieved by setting
\`marker.size\` and/or \`marker.color\` to numerical arrays.

## Usage

``` r
add_scatter(fig, ...)

# Default S3 method
add_scatter(
  fig,
  ...,
  data = NULL,
  alignmentgroup = NULL,
  cliponaxis = NULL,
  connectgaps = NULL,
  customdata = NULL,
  dx = NULL,
  dy = NULL,
  error_x = NULL,
  error_y = NULL,
  fill = NULL,
  fillcolor = NULL,
  fillgradient = NULL,
  fillpattern = NULL,
  groupnorm = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hoveron = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  line = NULL,
  marker = NULL,
  meta = NULL,
  mode = NULL,
  name = NULL,
  offsetgroup = NULL,
  opacity = NULL,
  orientation = NULL,
  selected = NULL,
  selectedpoints = NULL,
  showlegend = NULL,
  stackgaps = NULL,
  stackgroup = NULL,
  text = NULL,
  textfont = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  uid = NULL,
  uirevision = NULL,
  unselected = NULL,
  visible = NULL,
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

go_scatter(
  arg = NULL,
  ...,
  alignmentgroup = NULL,
  cliponaxis = NULL,
  connectgaps = NULL,
  customdata = NULL,
  dx = NULL,
  dy = NULL,
  error_x = NULL,
  error_y = NULL,
  fill = NULL,
  fillcolor = NULL,
  fillgradient = NULL,
  fillpattern = NULL,
  groupnorm = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hoveron = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  line = NULL,
  marker = NULL,
  meta = NULL,
  mode = NULL,
  name = NULL,
  offsetgroup = NULL,
  opacity = NULL,
  orientation = NULL,
  selected = NULL,
  selectedpoints = NULL,
  showlegend = NULL,
  stackgaps = NULL,
  stackgroup = NULL,
  text = NULL,
  textfont = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  uid = NULL,
  uirevision = NULL,
  unselected = NULL,
  visible = NULL,
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

go_scatter_error_x(
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

go_scatter_error_y(
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

go_scatter_fillgradient(
  arg = NULL,
  ...,
  colorscale = NULL,
  start = NULL,
  stop = NULL,
  type = NULL,
  skip_invalid = FALSE
)

go_scatter_fillpattern(
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

go_scatter_hoverlabel(
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

go_scatter_hoverlabel_font(
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

go_scatter_legendgrouptitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_scatter_legendgrouptitle_font(
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

go_scatter_line(
  arg = NULL,
  ...,
  backoff = NULL,
  color = NULL,
  dash = NULL,
  shape = NULL,
  simplify = NULL,
  smoothing = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_scatter_marker(
  arg = NULL,
  ...,
  angle = NULL,
  angleref = NULL,
  autocolorscale = NULL,
  cauto = NULL,
  cmax = NULL,
  cmid = NULL,
  cmin = NULL,
  color = NULL,
  coloraxis = NULL,
  colorbar = NULL,
  colorscale = NULL,
  gradient = NULL,
  line = NULL,
  maxdisplayed = NULL,
  opacity = NULL,
  reversescale = NULL,
  showscale = NULL,
  size = NULL,
  sizemin = NULL,
  sizemode = NULL,
  sizeref = NULL,
  standoff = NULL,
  symbol = NULL,
  skip_invalid = FALSE
)

go_scatter_marker_colorbar(
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

go_scatter_marker_colorbar_tickfont(
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

go_scatter_marker_colorbar_tickformatstop(
  arg = NULL,
  ...,
  dtickrange = NULL,
  enabled = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  skip_invalid = FALSE
)

go_scatter_marker_colorbar_title(
  arg = NULL,
  ...,
  font = NULL,
  side = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_scatter_marker_colorbar_title_font(
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

go_scatter_marker_gradient(
  arg = NULL,
  ...,
  color = NULL,
  type = NULL,
  skip_invalid = FALSE
)

go_scatter_marker_line(
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
  dash = NULL,
  reversescale = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_scatter_selected(
  arg = NULL,
  ...,
  marker = NULL,
  textfont = NULL,
  skip_invalid = FALSE
)

go_scatter_selected_marker(
  arg = NULL,
  ...,
  color = NULL,
  opacity = NULL,
  size = NULL,
  skip_invalid = FALSE
)

go_scatter_selected_textfont(
  arg = NULL,
  ...,
  color = NULL,
  skip_invalid = FALSE
)

go_scatter_textfont(
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

go_scatter_unselected(
  arg = NULL,
  ...,
  marker = NULL,
  textfont = NULL,
  skip_invalid = FALSE
)

go_scatter_unselected_marker(
  arg = NULL,
  ...,
  color = NULL,
  opacity = NULL,
  size = NULL,
  skip_invalid = FALSE
)

go_scatter_unselected_textfont(
  arg = NULL,
  ...,
  color = NULL,
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

- alignmentgroup:

  Set several traces linked to the same position axis or matching axes
  to the same alignmentgroup. This controls whether bars compute their
  positional range dependently or independently. String.

- cliponaxis:

  Determines whether or not markers and text nodes are clipped about the
  subplot axes. To show markers and text nodes above axis lines and tick
  labels, make sure to set \`xaxis.layer\` and \`yaxis.layer\` to "below
  traces". Logical.

- connectgaps:

  Determines whether or not gaps (i.e. {nan} or missing values) in the
  provided data arrays are connected. Logical.

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

  Named list or `go_scatter_error_x()` object.

- error_y:

  Named list or `go_scatter_error_y()` object.

- fill:

  Sets the area to fill with a solid color. Defaults to "none" unless
  this trace is stacked, then it gets "tonexty" ("tonextx") if
  \`orientation\` is "v" ("h") Use with \`fillcolor\` if not "none".
  "tozerox" and "tozeroy" fill to x=0 and y=0 respectively. "tonextx"
  and "tonexty" fill between the endpoints of this trace and the
  endpoints of the trace before it, connecting those endpoints with
  straight lines (to make a stacked area graph); if there is no trace
  before it, they behave like "tozerox" and "tozeroy". "toself" connects
  the endpoints of the trace (or each segment of the trace if it has
  gaps) into a closed shape. "tonext" fills the space between two traces
  if one completely encloses the other (eg consecutive contour lines),
  and behaves like "toself" if there is no trace before it. "tonext"
  should not be used if one trace does not enclose the other. Traces in
  a \`stackgroup\` will only fill to (or be filled to) other traces in
  the same group. With multiple \`stackgroup\`s or some traces stacked
  and some not, if fill-linked traces are not already consecutive, the
  later ones will be pushed down in the drawing order. One of `"none"`,
  `"tozeroy"`, `"tozerox"`, `"tonexty"`, `"tonextx"`, `"toself"`,
  `"tonext"`.

- fillcolor:

  Sets the fill color. Defaults to a half-transparent variant of the
  line color, marker color, or marker line color, whichever is
  available. If fillgradient is specified, fillcolor is ignored except
  for setting the background color of the hover label, if any. Color: a
  CSS color string or R color name.

- fillgradient:

  Sets a fill gradient. If not specified, the fillcolor is used instead.
  Named list or `go_scatter_fillgradient()` object.

- fillpattern:

  Sets the pattern within the marker. Named list or
  `go_scatter_fillpattern()` object.

- groupnorm:

  Only relevant when \`stackgroup\` is used, and only the first
  \`groupnorm\` found in the \`stackgroup\` will be used - including if
  \`visible\` is "legendonly" but not if it is \`false\`. Sets the
  normalization for the sum of this \`stackgroup\`. With "fraction", the
  value of each trace at each location is divided by the sum of all
  trace values at that location. "percent" is the same but multiplied by
  100 to show percentages. If there are multiple subplots, or multiple
  \`stackgroup\`s on one subplot, each will be normalized within its own
  set. One of `""`, `"fraction"`, `"percent"`.

- hoverinfo:

  Determines what trace information appears on hover. If \`none\` or
  \`skip\` are set, no information is displayed upon hovering. But, if
  \`none\` is set, click and hover events are still fired. Any
  combination of `"x"`, `"y"`, `"z"`, `"text"`, `"name"` joined with
  `"+"`, or one of `"all"`, `"none"`, `"skip"`, or a vector of these.

- hoverlabel:

  Named list or `go_scatter_hoverlabel()` object.

- hoveron:

  Do the hover effects highlight individual points (markers or line
  points) or do they highlight filled regions? If the fill is "toself"
  or "tonext" and there are no markers or text, then the default is
  "fills", otherwise it is "points". Any combination of `"points"`,
  `"fills"` joined with `"+"`.

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
  that are \`arrayOk: true\`) are available. Anything contained in tag
  \`\<extra\>\` is displayed in the secondary box, for example
  \`\<extra\>%{fullData.name}\</extra\>\`. To hide the secondary box
  completely, use an empty tag \`\<extra\>\</extra\>\`. String, or a
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

  Named list or `go_scatter_legendgrouptitle()` object.

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

- line:

  **`go_scatter()`**: Named list or `go_scatter_line()` object.

  **`go_scatter_marker()`**: Named list or `go_scatter_marker_line()`
  object.

- marker:

  **`go_scatter()`**: Named list or `go_scatter_marker()` object.

  **`go_scatter_selected()`**: Named list or
  `go_scatter_selected_marker()` object.

  **`go_scatter_unselected()`**: Named list or
  `go_scatter_unselected_marker()` object.

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

- mode:

  Determines the drawing mode for this scatter trace. If the provided
  \`mode\` includes "text" then the \`text\` elements appear at the
  coordinates. Otherwise, the \`text\` elements appear on hover. If
  there are less than 20 points and the trace is not stacked then the
  default is "lines+markers". Otherwise, "lines". Any combination of
  `"lines"`, `"markers"`, `"text"` joined with `"+"`, or one of
  `"none"`.

- name:

  **`go_scatter()`**: Sets the trace name. The trace name appears as the
  legend item and on hover. String.

  **`go_scatter_marker_colorbar_tickformatstop()`**: When used in a
  template, named items are created in the output figure in addition to
  any items the figure already has in this array. You can modify these
  items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- offsetgroup:

  Set several traces linked to the same position axis or matching axes
  to the same offsetgroup where bars of the same position coordinate
  will line up. String.

- opacity:

  **`go_scatter()`**: Sets the opacity of the trace. Number in the
  interval \[0, 1\].

  **`go_scatter_marker()`**: Sets the marker opacity. Number in the
  interval \[0, 1\], or a vector of these.

  **`go_scatter_selected_marker()`**: Sets the marker opacity of
  selected points. Number in the interval \[0, 1\].

  **`go_scatter_unselected_marker()`**: Sets the marker opacity of
  unselected points, applied only when a selection exists. Number in the
  interval \[0, 1\].

- orientation:

  **`go_scatter()`**: Only relevant in the following cases: 1. when
  \`scattermode\` is set to "group". 2. when \`stackgroup\` is used, and
  only the first \`orientation\` found in the \`stackgroup\` will be
  used - including if \`visible\` is "legendonly" but not if it is
  \`false\`. Sets the stacking direction. With "v" ("h"), the y (x)
  values of subsequent traces are added. Also affects the default value
  of \`fill\`. One of `"v"`, `"h"`.

  **`go_scatter_marker_colorbar()`**: Sets the orientation of the
  colorbar. One of `"h"`, `"v"`.

- selected:

  Named list or `go_scatter_selected()` object.

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

- stackgaps:

  Only relevant when \`stackgroup\` is used, and only the first
  \`stackgaps\` found in the \`stackgroup\` will be used - including if
  \`visible\` is "legendonly" but not if it is \`false\`. Determines how
  we handle locations at which other traces in this group have data but
  this one does not. With "infer zero" we insert a zero at these
  locations. With "interpolate" we linearly interpolate between existing
  values, and extrapolate a constant beyond the existing values. One of
  `"infer zero"`, `"interpolate"`.

- stackgroup:

  Set several scatter traces (on the same subplot) to the same
  stackgroup in order to add their y values (or their x values if
  \`orientation\` is "h"). If blank or omitted this trace will not be
  stacked. Stacking also turns \`fill\` on by default, using "tonexty"
  ("tonextx") if \`orientation\` is "h" ("v") and sets the default
  \`mode\` to "lines" irrespective of point count. You can only stack on
  a numeric (linear or log) axis. Traces in a \`stackgroup\` will only
  fill to (or be filled to) other traces in the same group. With
  multiple \`stackgroup\`s or some traces stacked and some not, if
  fill-linked traces are not already consecutive, the later ones will be
  pushed down in the drawing order. String.

- text:

  **`go_scatter()`**: Sets text elements associated with each (x,y)
  pair. If a single string, the same string appears over all the data
  points. If an array of string, the items are mapped in order to the
  this trace's (x,y) coordinates. If trace \`hoverinfo\` contains a
  "text" flag and "hovertext" is not set, these elements will be seen in
  the hover labels. String, or a vector of these.

  **`go_scatter_legendgrouptitle()`**: Sets the title of the legend
  group. String.

  **`go_scatter_marker_colorbar_title()`**: Sets the title of the color
  bar. String.

- textfont:

  **`go_scatter()`**: Sets the text font. Named list or
  `go_scatter_textfont()` object.

  **`go_scatter_selected()`**: Named list or
  `go_scatter_selected_textfont()` object.

  **`go_scatter_unselected()`**: Named list or
  `go_scatter_unselected_textfont()` object.

- textposition:

  Sets the positions of the \`text\` elements with respects to the (x,y)
  coordinates. One of `"top left"`, `"top center"`, `"top right"`,
  `"middle left"`, `"middle center"`, `"middle right"`, `"bottom left"`,
  `"bottom center"`, `"bottom right"`, or a vector of these.

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
  (the ones that are \`arrayOk: true\`) are available. String, or a
  vector of these.

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

  Named list or `go_scatter_unselected()` object.

- visible:

  **`go_scatter()`**: Determines whether or not this trace is visible.
  If "legendonly", the trace is not drawn, but can appear as a legend
  item (provided that the legend itself is visible). One of
  `"legendonly"`, `TRUE`, `FALSE`.

  **`go_scatter_error_x()`, `go_scatter_error_y()`**: Determines whether
  or not this set of error bars is visible. Logical.

- x:

  **`go_scatter()`**: Sets the x coordinates. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

  **`go_scatter_marker_colorbar()`**: Sets the x position with respect
  to \`xref\` of the color bar (in plot fraction). When \`xref\` is
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

  **`go_scatter()`**: Sets the y coordinates. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

  **`go_scatter_marker_colorbar()`**: Sets the y position with respect
  to \`yref\` of the color bar (in plot fraction). When \`yref\` is
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

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from (constructors). Named arguments take precedence.

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

  **`go_scatter_error_x()`, `go_scatter_error_y()`**: Sets the stroke
  color of the error bars. Color: a CSS color string or R color name.

  **`go_scatter_hoverlabel_font()`, `go_scatter_textfont()`**: Color: a
  CSS color string or R color name, or a vector of these.

  **`go_scatter_legendgrouptitle_font()`,
  `go_scatter_marker_colorbar_tickfont()`,
  `go_scatter_marker_colorbar_title_font()`**: Color: a CSS color string
  or R color name.

  **`go_scatter_line()`**: Sets the line color. Color: a CSS color
  string or R color name.

  **`go_scatter_marker()`**: Sets the marker color. It accepts either a
  specific color or an array of numbers that are mapped to the
  colorscale relative to the max and min values of the array or relative
  to \`marker.cmin\` and \`marker.cmax\` if set. Color: a CSS color
  string or R color name, or a number mapped to a color by
  `scatter.marker.colorscale`, or a vector of these.

  **`go_scatter_marker_gradient()`**: Sets the final color of the
  gradient fill: the center color for radial, the right for horizontal,
  or the bottom for vertical. Color: a CSS color string or R color name,
  or a vector of these.

  **`go_scatter_marker_line()`**: Sets the marker.line color. It accepts
  either a specific color or an array of numbers that are mapped to the
  colorscale relative to the max and min values of the array or relative
  to \`marker.line.cmin\` and \`marker.line.cmax\` if set. Color: a CSS
  color string or R color name, or a number mapped to a color by
  `scatter.marker.line.colorscale`, or a vector of these.

  **`go_scatter_selected_marker()`**: Sets the marker color of selected
  points. Color: a CSS color string or R color name.

  **`go_scatter_selected_textfont()`**: Sets the text font color of
  selected points. Color: a CSS color string or R color name.

  **`go_scatter_unselected_marker()`**: Sets the marker color of
  unselected points, applied only when a selection exists. Color: a CSS
  color string or R color name.

  **`go_scatter_unselected_textfont()`**: Sets the text font color of
  unselected points, applied only when a selection exists. Color: a CSS
  color string or R color name.

- copy_ystyle:

  Logical.

- symmetric:

  Determines whether or not the error bars have the same length in both
  direction (top/bottom for vertical bars, left/right for horizontal
  bars. Logical.

- thickness:

  **`go_scatter_error_x()`, `go_scatter_error_y()`**: Sets the thickness
  (in px) of the error bars. Number in the interval \[0, Inf\].

  **`go_scatter_marker_colorbar()`**: Sets the thickness of the color
  bar This measure excludes the size of the padding, ticks and labels.
  Number in the interval \[0, Inf\].

- traceref:

  Integer in the interval \[0, Inf\].

- tracerefminus:

  Integer in the interval \[0, Inf\].

- type:

  **`go_scatter_error_x()`, `go_scatter_error_y()`**: Determines the
  rule used to generate the error bars. If "constant", the bar lengths
  are of a constant value. Set this constant in \`value\`. If "percent",
  the bar lengths correspond to a percentage of underlying data. Set
  this percentage in \`value\`. If "sqrt", the bar lengths correspond to
  the square of the underlying data. If "data", the bar lengths are set
  with data set \`array\`. One of `"percent"`, `"constant"`, `"sqrt"`,
  `"data"`.

  **`go_scatter_fillgradient()`**: Sets the type/orientation of the
  color gradient for the fill. Defaults to "none". One of `"radial"`,
  `"horizontal"`, `"vertical"`, `"none"`.

  **`go_scatter_marker_gradient()`**: Sets the type of gradient used to
  fill the markers One of `"radial"`, `"horizontal"`, `"vertical"`,
  `"none"`, or a vector of these.

- value:

  **`go_scatter_error_x()`, `go_scatter_error_y()`**: Sets the value of
  either the percentage (if \`type\` is set to "percent") or the
  constant (if \`type\` is set to "constant") corresponding to the
  lengths of the error bars. Number in the interval \[0, Inf\].

  **`go_scatter_marker_colorbar_tickformatstop()`**: string -
  dtickformat for described zoom level, the same as "tickformat" String.

- valueminus:

  Sets the value of either the percentage (if \`type\` is set to
  "percent") or the constant (if \`type\` is set to "constant")
  corresponding to the lengths of the error bars in the bottom (left)
  direction for vertical (horizontal) bars Number in the interval \[0,
  Inf\].

- width:

  **`go_scatter_error_x()`, `go_scatter_error_y()`**: Sets the width (in
  px) of the cross-bar at both ends of the error bars. Number in the
  interval \[0, Inf\].

  **`go_scatter_line()`**: Sets the line width (in px). Number in the
  interval \[0, Inf\].

  **`go_scatter_marker_line()`**: Sets the width (in px) of the lines
  bounding the marker points. Number in the interval \[0, Inf\], or a
  vector of these.

- colorscale:

  **`go_scatter_fillgradient()`**: Sets the fill gradient colors as a
  color scale. The color scale is interpreted as a gradient applied in
  the direction specified by "orientation", from the lowest to the
  highest value of the scatter plot along that axis, or from the center
  to the most distant point from it, if orientation is "radial".
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

  **`go_scatter_marker()`**: Sets the colorscale. Has an effect only if
  in \`marker.color\` is set to a numerical array. The colorscale must
  be an array containing arrays mapping a normalized value to an rgb,
  rgba, hex, hsl, hsla, hwb, or named color string. At minimum, a
  mapping for the lowest (0) and highest (1) values are required. For
  example, \`\[\[0, 'rgb(0,0,255)'\], \[1, 'rgb(255,0,0)'\]\]\`. To
  control the bounds of the colorscale in color space, use
  \`marker.cmin\` and \`marker.cmax\`. Alternatively, \`colorscale\` may
  be a palette name string of the following list:
  Blackbody,Bluered,Blues,Cividis,Earth,Electric,Greens,Greys,Hot,Jet,Picnic,Portland,Rainbow,RdBu,Reds,Viridis,YlGnBu,YlOrRd.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

  **`go_scatter_marker_line()`**: Sets the colorscale. Has an effect
  only if in \`marker.line.color\` is set to a numerical array. The
  colorscale must be an array containing arrays mapping a normalized
  value to an rgb, rgba, hex, hsl, hsla, hwb, or named color string. At
  minimum, a mapping for the lowest (0) and highest (1) values are
  required. For example, \`\[\[0, 'rgb(0,0,255)'\], \[1,
  'rgb(255,0,0)'\]\]\`. To control the bounds of the colorscale in color
  space, use \`marker.line.cmin\` and \`marker.line.cmax\`.
  Alternatively, \`colorscale\` may be a palette name string of the
  following list:
  Blackbody,Bluered,Blues,Cividis,Earth,Electric,Greens,Greys,Hot,Jet,Picnic,Portland,Rainbow,RdBu,Reds,Viridis,YlGnBu,YlOrRd.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

- start:

  Sets the gradient start value. It is given as the absolute position on
  the axis determined by the orientiation. E.g., if orientation is
  "horizontal", the gradient will be horizontal and start from the
  x-position given by start. If omitted, the gradient starts at the
  lowest value of the trace along the respective axis. Ignored if
  orientation is "radial". Number.

- stop:

  Sets the gradient end value. It is given as the absolute position on
  the axis determined by the orientiation. E.g., if orientation is
  "horizontal", the gradient will be horizontal and end at the
  x-position given by end. If omitted, the gradient ends at the highest
  value of the trace along the respective axis. Ignored if orientation
  is "radial". Number.

- bgcolor:

  **`go_scatter_fillpattern()`**: When there is no colorscale sets the
  color of background pattern fill. Defaults to a \`marker.color\`
  background when \`fillmode\` is "overlay". Otherwise, defaults to a
  transparent background. Color: a CSS color string or R color name, or
  a vector of these.

  **`go_scatter_hoverlabel()`**: Sets the background color of the hover
  labels for this trace Color: a CSS color string or R color name, or a
  vector of these.

  **`go_scatter_marker_colorbar()`**: Sets the color of padded area.
  Color: a CSS color string or R color name.

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

  **`go_scatter_fillpattern()`**: Sets the shape of the pattern fill. By
  default, no pattern is used for filling the area. One of `""`, `"/"`,
  `"\\"`, `"x"`, `"-"`, `"|"`, `"+"`, `"."`, or a vector of these.

  **`go_scatter_line()`**: Determines the line shape. With "spline" the
  lines are drawn using spline interpolation. The other available values
  correspond to step-wise line shapes. One of `"linear"`, `"spline"`,
  `"hv"`, `"vh"`, `"hvh"`, `"vhv"`.

- size:

  **`go_scatter_fillpattern()`**: Sets the size of unit squares of the
  pattern fill in pixels, which corresponds to the interval of
  repetition of the pattern. Number in the interval \[0, Inf\], or a
  vector of these.

  **`go_scatter_hoverlabel_font()`, `go_scatter_textfont()`**: Number in
  the interval \[1, Inf\], or a vector of these.

  **`go_scatter_legendgrouptitle_font()`,
  `go_scatter_marker_colorbar_tickfont()`,
  `go_scatter_marker_colorbar_title_font()`**: Number in the interval
  \[1, Inf\].

  **`go_scatter_marker()`**: Sets the marker size (in px). Number in the
  interval \[0, Inf\], or a vector of these.

  **`go_scatter_selected_marker()`**: Sets the marker size of selected
  points. Number in the interval \[0, Inf\].

  **`go_scatter_unselected_marker()`**: Sets the marker size of
  unselected points, applied only when a selection exists. Number in the
  interval \[0, Inf\].

- solidity:

  Sets the solidity of the pattern fill. Solidity is roughly the
  fraction of the area filled by the pattern. Solidity of 0 shows only
  the background color without pattern and solidty of 1 shows only the
  foreground color without pattern. Number in the interval \[0, 1\], or
  a vector of these.

- align:

  Sets the horizontal alignment of the text content within hover label
  box. Has an effect only if the hover label text spans two or more
  lines One of `"left"`, `"right"`, `"auto"`, or a vector of these.

- bordercolor:

  **`go_scatter_hoverlabel()`**: Sets the border color of the hover
  labels for this trace. Color: a CSS color string or R color name, or a
  vector of these.

  **`go_scatter_marker_colorbar()`**: Sets the axis line color. Color: a
  CSS color string or R color name.

- font:

  **`go_scatter_hoverlabel()`**: Sets the font used in hover labels.
  Named list or `go_scatter_hoverlabel_font()` object.

  **`go_scatter_legendgrouptitle()`**: Sets this legend group's title
  font. Named list or `go_scatter_legendgrouptitle_font()` object.

  **`go_scatter_marker_colorbar_title()`**: Sets this color bar's title
  font. Named list or `go_scatter_marker_colorbar_title_font()` object.

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

  **`go_scatter_hoverlabel_font()`, `go_scatter_textfont()`**: HTML font
  family - the typeface that will be applied by the web browser. The web
  browser can only apply a font if it is available on the system where
  it runs. Provide multiple font families, separated by commas, to
  indicate the order in which to apply fonts if they aren't available.
  String, or a vector of these.

  **`go_scatter_legendgrouptitle_font()`,
  `go_scatter_marker_colorbar_tickfont()`,
  `go_scatter_marker_colorbar_title_font()`**: HTML font family - the
  typeface that will be applied by the web browser. The web browser can
  only apply a font if it is available on the system where it runs.
  Provide multiple font families, separated by commas, to indicate the
  order in which to apply fonts if they aren't available. String.

- lineposition:

  **`go_scatter_hoverlabel_font()`, `go_scatter_textfont()`**: Sets the
  kind of decoration line(s) with text, such as an "under", "over" or
  "through" as well as combinations e.g. "under+over", etc. Any
  combination of `"under"`, `"over"`, `"through"` joined with `"+"`, or
  one of `"none"`, or a vector of these.

  **`go_scatter_legendgrouptitle_font()`,
  `go_scatter_marker_colorbar_tickfont()`,
  `go_scatter_marker_colorbar_title_font()`**: Sets the kind of
  decoration line(s) with text, such as an "under", "over" or "through"
  as well as combinations e.g. "under+over", etc. Any combination of
  `"under"`, `"over"`, `"through"` joined with `"+"`, or one of
  `"none"`.

- shadow:

  **`go_scatter_hoverlabel_font()`, `go_scatter_textfont()`**: Sets the
  shape and color of the shadow behind text. "auto" places minimal
  shadow and applies contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String, or a vector of these.

  **`go_scatter_legendgrouptitle_font()`,
  `go_scatter_marker_colorbar_tickfont()`,
  `go_scatter_marker_colorbar_title_font()`**: Sets the shape and color
  of the shadow behind text. "auto" places minimal shadow and applies
  contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String.

- style:

  **`go_scatter_hoverlabel_font()`, `go_scatter_textfont()`**: Sets
  whether a font should be styled with a normal or italic face from its
  family. One of `"normal"`, `"italic"`, or a vector of these.

  **`go_scatter_legendgrouptitle_font()`,
  `go_scatter_marker_colorbar_tickfont()`,
  `go_scatter_marker_colorbar_title_font()`**: Sets whether a font
  should be styled with a normal or italic face from its family. One of
  `"normal"`, `"italic"`.

- textcase:

  **`go_scatter_hoverlabel_font()`, `go_scatter_textfont()`**: Sets
  capitalization of text. It can be used to make text appear in
  all-uppercase or all-lowercase, or with each word capitalized. One of
  `"normal"`, `"word caps"`, `"upper"`, `"lower"`, or a vector of these.

  **`go_scatter_legendgrouptitle_font()`,
  `go_scatter_marker_colorbar_tickfont()`,
  `go_scatter_marker_colorbar_title_font()`**: Sets capitalization of
  text. It can be used to make text appear in all-uppercase or
  all-lowercase, or with each word capitalized. One of `"normal"`,
  `"word caps"`, `"upper"`, `"lower"`.

- variant:

  **`go_scatter_hoverlabel_font()`, `go_scatter_textfont()`**: Sets the
  variant of the font. One of `"normal"`, `"small-caps"`,
  `"all-small-caps"`, `"all-petite-caps"`, `"petite-caps"`, `"unicase"`,
  or a vector of these.

  **`go_scatter_legendgrouptitle_font()`,
  `go_scatter_marker_colorbar_tickfont()`,
  `go_scatter_marker_colorbar_title_font()`**: Sets the variant of the
  font. One of `"normal"`, `"small-caps"`, `"all-small-caps"`,
  `"all-petite-caps"`, `"petite-caps"`, `"unicase"`.

- weight:

  **`go_scatter_hoverlabel_font()`, `go_scatter_textfont()`**: Sets the
  weight (or boldness) of the font. Integer in the interval \[1, 1000\],
  or a vector of these.

  **`go_scatter_legendgrouptitle_font()`,
  `go_scatter_marker_colorbar_tickfont()`,
  `go_scatter_marker_colorbar_title_font()`**: Sets the weight (or
  boldness) of the font. Integer in the interval \[1, 1000\].

- backoff:

  Sets the line back off from the end point of the nth line segment (in
  px). This option is useful e.g. to avoid overlap with arrowhead
  markers. With "auto" the lines would trim before markers if
  \`marker.angleref\` is set to "previous". Number in the interval \[0,
  Inf\], or a vector of these.

- dash:

  **`go_scatter_line()`**: Sets the dash style of lines. Set to a dash
  type string ("solid", "dot", "dash", "longdash", "dashdot", or
  "longdashdot") or a dash length list in px (eg "5px,10px,2px,2px").
  One of `"solid"`, `"dot"`, `"dash"`, `"longdash"`, `"dashdot"`,
  `"longdashdot"`, or a string matching
  `"^\\d+(\\.\\d+)?(px|%)?((,|\\s)\\s*\\d+(\\.\\d+)?(px|%)?)*$"`.

  **`go_scatter_marker_line()`**: Sets the dash style of lines. Set to a
  dash type string ("solid", "dot", "dash", "longdash", "dashdot", or
  "longdashdot") or a dash length list in px (eg "5px,10px,2px,2px").
  One of `"solid"`, `"dot"`, `"dash"`, `"longdash"`, `"dashdot"`,
  `"longdashdot"`, or a string matching
  `"^\\d+(\\.\\d+)?(px|%)?((,|\\s)\\s*\\d+(\\.\\d+)?(px|%)?)*$"`, or a
  vector of these.

- simplify:

  Simplifies lines by removing nearly-collinear points. When
  transitioning lines, it may be desirable to disable this so that the
  number of points along the resulting SVG path is unaffected. Logical.

- smoothing:

  Has an effect only if \`shape\` is set to "spline" Sets the amount of
  smoothing. 0 corresponds to no smoothing (equivalent to a "linear"
  shape). Number in the interval \[0, 1.3\].

- angle:

  Sets the marker angle in respect to \`angleref\`. Angle in degrees, or
  a vector of these.

- angleref:

  Sets the reference for marker angle. With "previous", angle 0 points
  along the line from the previous point to this one. With "up", angle 0
  points toward the top of the screen. One of `"previous"`, `"up"`.

- autocolorscale:

  **`go_scatter_marker()`**: Determines whether the colorscale is a
  default palette (\`autocolorscale: true\`) or the palette determined
  by \`marker.colorscale\`. Has an effect only if in \`marker.color\` is
  set to a numerical array. In case \`colorscale\` is unspecified or
  \`autocolorscale\` is true, the default palette will be chosen
  according to whether numbers in the \`color\` array are all positive,
  all negative or mixed. Logical.

  **`go_scatter_marker_line()`**: Determines whether the colorscale is a
  default palette (\`autocolorscale: true\`) or the palette determined
  by \`marker.line.colorscale\`. Has an effect only if in
  \`marker.line.color\` is set to a numerical array. In case
  \`colorscale\` is unspecified or \`autocolorscale\` is true, the
  default palette will be chosen according to whether numbers in the
  \`color\` array are all positive, all negative or mixed. Logical.

- cauto:

  **`go_scatter_marker()`**: Determines whether or not the color domain
  is computed with respect to the input data (here in \`marker.color\`)
  or the bounds set in \`marker.cmin\` and \`marker.cmax\` Has an effect
  only if in \`marker.color\` is set to a numerical array. Defaults to
  \`false\` when \`marker.cmin\` and \`marker.cmax\` are set by the
  user. Logical.

  **`go_scatter_marker_line()`**: Determines whether or not the color
  domain is computed with respect to the input data (here in
  \`marker.line.color\`) or the bounds set in \`marker.line.cmin\` and
  \`marker.line.cmax\` Has an effect only if in \`marker.line.color\` is
  set to a numerical array. Defaults to \`false\` when
  \`marker.line.cmin\` and \`marker.line.cmax\` are set by the user.
  Logical.

- cmax:

  **`go_scatter_marker()`**: Sets the upper bound of the color domain.
  Has an effect only if in \`marker.color\` is set to a numerical array.
  Value should have the same units as in \`marker.color\` and if set,
  \`marker.cmin\` must be set as well. Number.

  **`go_scatter_marker_line()`**: Sets the upper bound of the color
  domain. Has an effect only if in \`marker.line.color\` is set to a
  numerical array. Value should have the same units as in
  \`marker.line.color\` and if set, \`marker.line.cmin\` must be set as
  well. Number.

- cmid:

  **`go_scatter_marker()`**: Sets the mid-point of the color domain by
  scaling \`marker.cmin\` and/or \`marker.cmax\` to be equidistant to
  this point. Has an effect only if in \`marker.color\` is set to a
  numerical array. Value should have the same units as in
  \`marker.color\`. Has no effect when \`marker.cauto\` is \`false\`.
  Number.

  **`go_scatter_marker_line()`**: Sets the mid-point of the color domain
  by scaling \`marker.line.cmin\` and/or \`marker.line.cmax\` to be
  equidistant to this point. Has an effect only if in
  \`marker.line.color\` is set to a numerical array. Value should have
  the same units as in \`marker.line.color\`. Has no effect when
  \`marker.line.cauto\` is \`false\`. Number.

- cmin:

  **`go_scatter_marker()`**: Sets the lower bound of the color domain.
  Has an effect only if in \`marker.color\` is set to a numerical array.
  Value should have the same units as in \`marker.color\` and if set,
  \`marker.cmax\` must be set as well. Number.

  **`go_scatter_marker_line()`**: Sets the lower bound of the color
  domain. Has an effect only if in \`marker.line.color\` is set to a
  numerical array. Value should have the same units as in
  \`marker.line.color\` and if set, \`marker.line.cmax\` must be set as
  well. Number.

- coloraxis:

  Sets a reference to a shared color axis. References to these shared
  color axes are "coloraxis", "coloraxis2", "coloraxis3", etc. Settings
  for these shared color axes are set in the layout, under
  \`layout.coloraxis\`, \`layout.coloraxis2\`, etc. Note that multiple
  color scales can be linked to the same color axis. Subplot id:
  `"coloraxis"`, `"coloraxis2"`, `"coloraxis3"`, ....

- colorbar:

  Named list or `go_scatter_marker_colorbar()` object.

- gradient:

  Named list or `go_scatter_marker_gradient()` object.

- maxdisplayed:

  Sets a maximum number of points to be drawn on the graph. 0
  corresponds to no limit. Number in the interval \[0, Inf\].

- reversescale:

  **`go_scatter_marker()`**: Reverses the color mapping if true. Has an
  effect only if in \`marker.color\` is set to a numerical array. If
  true, \`marker.cmin\` will correspond to the last color in the array
  and \`marker.cmax\` will correspond to the first color. Logical.

  **`go_scatter_marker_line()`**: Reverses the color mapping if true.
  Has an effect only if in \`marker.line.color\` is set to a numerical
  array. If true, \`marker.line.cmin\` will correspond to the last color
  in the array and \`marker.line.cmax\` will correspond to the first
  color. Logical.

- showscale:

  Determines whether or not a colorbar is displayed for this trace. Has
  an effect only if in \`marker.color\` is set to a numerical array.
  Logical.

- sizemin:

  Has an effect only if \`marker.size\` is set to a numerical array.
  Sets the minimum size (in px) of the rendered marker points. Number in
  the interval \[0, Inf\].

- sizemode:

  Has an effect only if \`marker.size\` is set to a numerical array.
  Sets the rule for which the data in \`size\` is converted to pixels.
  One of `"diameter"`, `"area"`.

- sizeref:

  Has an effect only if \`marker.size\` is set to a numerical array.
  Sets the scale factor used to determine the rendered size of marker
  points. Use with \`sizemin\` and \`sizemode\`. Number.

- standoff:

  Moves the marker away from the data point in the direction of
  \`angle\` (in px). This can be useful for example if you have another
  marker at this location and you want to point an arrowhead marker at
  it. Number in the interval \[0, Inf\], or a vector of these.

- symbol:

  Sets the marker symbol type. Adding 100 is equivalent to appending
  "-open" to a symbol name. Adding 200 is equivalent to appending "-dot"
  to a symbol name. Adding 300 is equivalent to appending "-open-dot" or
  "dot-open" to a symbol name. One of `"0"`, `"circle"`, `"100"`,
  `"circle-open"`, `"200"`, `"circle-dot"`, `"300"`,
  `"circle-open-dot"`, `"1"`, `"square"`, `"101"`, `"square-open"`,
  `"201"`, `"square-dot"`, `"301"`, `"square-open-dot"`, `"2"`,
  `"diamond"`, `"102"`, `"diamond-open"`, `"202"`, `"diamond-dot"`,
  `"302"`, `"diamond-open-dot"`, `"3"`, `"cross"`, `"103"`,
  `"cross-open"`, `"203"`, `"cross-dot"`, `"303"`, `"cross-open-dot"`,
  `"4"`, `"x"`, `"104"`, `"x-open"`, `"204"`, `"x-dot"`, `"304"`,
  `"x-open-dot"`, `"5"`, `"triangle-up"`, `"105"`, `"triangle-up-open"`,
  `"205"`, `"triangle-up-dot"`, `"305"`, `"triangle-up-open-dot"`,
  `"6"`, `"triangle-down"`, `"106"`, `"triangle-down-open"`, `"206"`,
  `"triangle-down-dot"`, `"306"`, `"triangle-down-open-dot"`, `"7"`,
  `"triangle-left"`, `"107"`, `"triangle-left-open"`, `"207"`,
  `"triangle-left-dot"`, `"307"`, `"triangle-left-open-dot"`, `"8"`,
  `"triangle-right"`, `"108"`, `"triangle-right-open"`, `"208"`,
  `"triangle-right-dot"`, `"308"`, `"triangle-right-open-dot"`, `"9"`,
  `"triangle-ne"`, `"109"`, `"triangle-ne-open"`, `"209"`,
  `"triangle-ne-dot"`, `"309"`, `"triangle-ne-open-dot"`, `"10"`,
  `"triangle-se"`, `"110"`, `"triangle-se-open"`, `"210"`,
  `"triangle-se-dot"`, `"310"`, `"triangle-se-open-dot"`, `"11"`,
  `"triangle-sw"`, `"111"`, `"triangle-sw-open"`, `"211"`,
  `"triangle-sw-dot"`, `"311"`, `"triangle-sw-open-dot"`, `"12"`,
  `"triangle-nw"`, `"112"`, `"triangle-nw-open"`, `"212"`,
  `"triangle-nw-dot"`, `"312"`, `"triangle-nw-open-dot"`, `"13"`,
  `"pentagon"`, `"113"`, `"pentagon-open"`, `"213"`, `"pentagon-dot"`,
  `"313"`, `"pentagon-open-dot"`, `"14"`, `"hexagon"`, `"114"`,
  `"hexagon-open"`, `"214"`, `"hexagon-dot"`, `"314"`,
  `"hexagon-open-dot"`, `"15"`, `"hexagon2"`, `"115"`,
  `"hexagon2-open"`, `"215"`, `"hexagon2-dot"`, `"315"`,
  `"hexagon2-open-dot"`, `"16"`, `"octagon"`, `"116"`, `"octagon-open"`,
  `"216"`, `"octagon-dot"`, `"316"`, `"octagon-open-dot"`, `"17"`,
  `"star"`, `"117"`, `"star-open"`, `"217"`, `"star-dot"`, `"317"`,
  `"star-open-dot"`, `"18"`, `"hexagram"`, `"118"`, `"hexagram-open"`,
  `"218"`, `"hexagram-dot"`, `"318"`, `"hexagram-open-dot"`, `"19"`,
  `"star-triangle-up"`, `"119"`, `"star-triangle-up-open"`, `"219"`,
  `"star-triangle-up-dot"`, `"319"`, `"star-triangle-up-open-dot"`,
  `"20"`, `"star-triangle-down"`, `"120"`, `"star-triangle-down-open"`,
  `"220"`, `"star-triangle-down-dot"`, `"320"`,
  `"star-triangle-down-open-dot"`, `"21"`, `"star-square"`, `"121"`,
  `"star-square-open"`, `"221"`, `"star-square-dot"`, `"321"`,
  `"star-square-open-dot"`, `"22"`, `"star-diamond"`, `"122"`,
  `"star-diamond-open"`, `"222"`, `"star-diamond-dot"`, `"322"`,
  `"star-diamond-open-dot"`, `"23"`, `"diamond-tall"`, `"123"`,
  `"diamond-tall-open"`, `"223"`, `"diamond-tall-dot"`, `"323"`,
  `"diamond-tall-open-dot"`, `"24"`, `"diamond-wide"`, `"124"`,
  `"diamond-wide-open"`, `"224"`, `"diamond-wide-dot"`, `"324"`,
  `"diamond-wide-open-dot"`, `"25"`, `"hourglass"`, `"125"`,
  `"hourglass-open"`, `"26"`, `"bowtie"`, `"126"`, `"bowtie-open"`,
  `"27"`, `"circle-cross"`, `"127"`, `"circle-cross-open"`, `"28"`,
  `"circle-x"`, `"128"`, `"circle-x-open"`, `"29"`, `"square-cross"`,
  `"129"`, `"square-cross-open"`, `"30"`, `"square-x"`, `"130"`,
  `"square-x-open"`, `"31"`, `"diamond-cross"`, `"131"`,
  `"diamond-cross-open"`, `"32"`, `"diamond-x"`, `"132"`,
  `"diamond-x-open"`, `"33"`, `"cross-thin"`, `"133"`,
  `"cross-thin-open"`, `"34"`, `"x-thin"`, `"134"`, `"x-thin-open"`,
  `"35"`, `"asterisk"`, `"135"`, `"asterisk-open"`, `"36"`, `"hash"`,
  `"136"`, `"hash-open"`, `"236"`, `"hash-dot"`, `"336"`,
  `"hash-open-dot"`, `"37"`, `"y-up"`, `"137"`, `"y-up-open"`, `"38"`,
  `"y-down"`, `"138"`, `"y-down-open"`, `"39"`, `"y-left"`, `"139"`,
  `"y-left-open"`, `"40"`, `"y-right"`, `"140"`, `"y-right-open"`,
  `"41"`, `"line-ew"`, `"141"`, `"line-ew-open"`, `"42"`, `"line-ns"`,
  `"142"`, `"line-ns-open"`, `"43"`, `"line-ne"`, `"143"`,
  `"line-ne-open"`, `"44"`, `"line-nw"`, `"144"`, `"line-nw-open"`,
  `"45"`, `"arrow-up"`, `"145"`, `"arrow-up-open"`, `"46"`,
  `"arrow-down"`, `"146"`, `"arrow-down-open"`, `"47"`, `"arrow-left"`,
  `"147"`, `"arrow-left-open"`, `"48"`, `"arrow-right"`, `"148"`,
  `"arrow-right-open"`, `"49"`, `"arrow-bar-up"`, `"149"`,
  `"arrow-bar-up-open"`, `"50"`, `"arrow-bar-down"`, `"150"`,
  `"arrow-bar-down-open"`, `"51"`, `"arrow-bar-left"`, `"151"`,
  `"arrow-bar-left-open"`, `"52"`, `"arrow-bar-right"`, `"152"`,
  `"arrow-bar-right-open"`, `"53"`, `"arrow"`, `"153"`, `"arrow-open"`,
  `"54"`, `"arrow-wide"`, `"154"`, `"arrow-wide-open"`, `0`, `100`,
  `200`, `300`, `1`, `101`, `201`, `301`, `2`, `102`, `202`, `302`, `3`,
  `103`, `203`, `303`, `4`, `104`, `204`, `304`, `5`, `105`, `205`,
  `305`, `6`, `106`, `206`, `306`, `7`, `107`, `207`, `307`, `8`, `108`,
  `208`, `308`, `9`, `109`, `209`, `309`, `10`, `110`, `210`, `310`,
  `11`, `111`, `211`, `311`, `12`, `112`, `212`, `312`, `13`, `113`,
  `213`, `313`, `14`, `114`, `214`, `314`, `15`, `115`, `215`, `315`,
  `16`, `116`, `216`, `316`, `17`, `117`, `217`, `317`, `18`, `118`,
  `218`, `318`, `19`, `119`, `219`, `319`, `20`, `120`, `220`, `320`,
  `21`, `121`, `221`, `321`, `22`, `122`, `222`, `322`, `23`, `123`,
  `223`, `323`, `24`, `124`, `224`, `324`, `25`, `125`, `26`, `126`,
  `27`, `127`, `28`, `128`, `29`, `129`, `30`, `130`, `31`, `131`, `32`,
  `132`, `33`, `133`, `34`, `134`, `35`, `135`, `36`, `136`, `236`,
  `336`, `37`, `137`, `38`, `138`, `39`, `139`, `40`, `140`, `41`,
  `141`, `42`, `142`, `43`, `143`, `44`, `144`, `45`, `145`, `46`,
  `146`, `47`, `147`, `48`, `148`, `49`, `149`, `50`, `150`, `51`,
  `151`, `52`, `152`, `53`, `153`, `54`, `154`, or a vector of these.

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
  `go_scatter_marker_colorbar_tickfont()` object.

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

  List of named lists or `go_scatter_marker_colorbar_tickformatstop()`
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
  `go_scatter_marker_colorbar_title()` object.

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

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_scatter()` and the nested object constructors below create validated
graph objects (named lists). Every property is checked against the
plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
`add_scatter()` creates an object and adds it to a figure.

Nested objects documented here:

- `go_scatter_error_x()`:

  `scatter.error_x`

- `go_scatter_error_y()`:

  `scatter.error_y`

- `go_scatter_fillgradient()`:

  `scatter.fillgradient`: Sets a fill gradient. If not specified, the
  fillcolor is used instead.

- `go_scatter_fillpattern()`:

  `scatter.fillpattern`: Sets the pattern within the marker.

- `go_scatter_hoverlabel()`:

  `scatter.hoverlabel`

- `go_scatter_hoverlabel_font()`:

  `scatter.hoverlabel.font`: Sets the font used in hover labels.

- `go_scatter_legendgrouptitle()`:

  `scatter.legendgrouptitle`

- `go_scatter_legendgrouptitle_font()`:

  `scatter.legendgrouptitle.font`: Sets this legend group's title font.

- `go_scatter_line()`:

  `scatter.line`

- `go_scatter_marker()`:

  `scatter.marker`

- `go_scatter_marker_colorbar()`:

  `scatter.marker.colorbar`

- `go_scatter_marker_colorbar_tickfont()`:

  `scatter.marker.colorbar.tickfont`: Sets the color bar's tick label
  font

- `go_scatter_marker_colorbar_tickformatstop()`:

  `scatter.marker.colorbar.tickformatstop`

- `go_scatter_marker_colorbar_title()`:

  `scatter.marker.colorbar.title`

- `go_scatter_marker_colorbar_title_font()`:

  `scatter.marker.colorbar.title.font`: Sets this color bar's title
  font.

- `go_scatter_marker_gradient()`:

  `scatter.marker.gradient`

- `go_scatter_marker_line()`:

  `scatter.marker.line`

- `go_scatter_selected()`:

  `scatter.selected`

- `go_scatter_selected_marker()`:

  `scatter.selected.marker`

- `go_scatter_selected_textfont()`:

  `scatter.selected.textfont`

- `go_scatter_textfont()`:

  `scatter.textfont`: Sets the text font.

- `go_scatter_unselected()`:

  `scatter.unselected`

- `go_scatter_unselected_marker()`:

  `scatter.unselected.marker`

- `go_scatter_unselected_textfont()`:

  `scatter.unselected.textfont`

## See also

[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)

## Examples

``` r
go_scatter(x = 1:3, y = c(2, 1, 3), mode = "markers", marker_color = "red")
#> <go_scatter>
#> {
#>   "type": "scatter",
#>   "mode": "markers",
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
