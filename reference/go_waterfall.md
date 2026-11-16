# Waterfall traces

Draws waterfall trace which is useful graph to displays the contribution
of various elements (either positive or negative) in a bar chart. The
data visualized by the span of the bars is set in \`y\` if
\`orientation\` is set to "v" (the default) and the labels are set in
\`x\`. By setting \`orientation\` to "h", the roles are interchanged.

## Usage

``` r
add_waterfall(fig, ...)

# Default S3 method
add_waterfall(
  fig,
  ...,
  data = NULL,
  alignmentgroup = NULL,
  base = NULL,
  cliponaxis = NULL,
  connector = NULL,
  constraintext = NULL,
  customdata = NULL,
  decreasing = NULL,
  dx = NULL,
  dy = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  increasing = NULL,
  insidetextanchor = NULL,
  insidetextfont = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  measure = NULL,
  meta = NULL,
  name = NULL,
  offset = NULL,
  offsetgroup = NULL,
  opacity = NULL,
  orientation = NULL,
  outsidetextfont = NULL,
  selectedpoints = NULL,
  showlegend = NULL,
  text = NULL,
  textangle = NULL,
  textfont = NULL,
  textinfo = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  totals = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  width = NULL,
  x = NULL,
  x0 = NULL,
  xaxis = NULL,
  xhoverformat = NULL,
  xperiod = NULL,
  xperiod0 = NULL,
  xperiodalignment = NULL,
  y = NULL,
  y0 = NULL,
  yaxis = NULL,
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

go_waterfall(
  arg = NULL,
  ...,
  alignmentgroup = NULL,
  base = NULL,
  cliponaxis = NULL,
  connector = NULL,
  constraintext = NULL,
  customdata = NULL,
  decreasing = NULL,
  dx = NULL,
  dy = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  increasing = NULL,
  insidetextanchor = NULL,
  insidetextfont = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  measure = NULL,
  meta = NULL,
  name = NULL,
  offset = NULL,
  offsetgroup = NULL,
  opacity = NULL,
  orientation = NULL,
  outsidetextfont = NULL,
  selectedpoints = NULL,
  showlegend = NULL,
  text = NULL,
  textangle = NULL,
  textfont = NULL,
  textinfo = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  totals = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  width = NULL,
  x = NULL,
  x0 = NULL,
  xaxis = NULL,
  xhoverformat = NULL,
  xperiod = NULL,
  xperiod0 = NULL,
  xperiodalignment = NULL,
  y = NULL,
  y0 = NULL,
  yaxis = NULL,
  yhoverformat = NULL,
  yperiod = NULL,
  yperiod0 = NULL,
  yperiodalignment = NULL,
  zorder = NULL,
  skip_invalid = FALSE
)

go_waterfall_connector(
  arg = NULL,
  ...,
  line = NULL,
  mode = NULL,
  visible = NULL,
  skip_invalid = FALSE
)

go_waterfall_connector_line(
  arg = NULL,
  ...,
  color = NULL,
  dash = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_waterfall_decreasing(arg = NULL, ..., marker = NULL, skip_invalid = FALSE)

go_waterfall_decreasing_marker(
  arg = NULL,
  ...,
  color = NULL,
  line = NULL,
  skip_invalid = FALSE
)

go_waterfall_decreasing_marker_line(
  arg = NULL,
  ...,
  color = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_waterfall_hoverlabel(
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

go_waterfall_hoverlabel_font(
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

go_waterfall_increasing(arg = NULL, ..., marker = NULL, skip_invalid = FALSE)

go_waterfall_increasing_marker(
  arg = NULL,
  ...,
  color = NULL,
  line = NULL,
  skip_invalid = FALSE
)

go_waterfall_increasing_marker_line(
  arg = NULL,
  ...,
  color = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_waterfall_insidetextfont(
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

go_waterfall_legendgrouptitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_waterfall_legendgrouptitle_font(
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

go_waterfall_outsidetextfont(
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

go_waterfall_textfont(
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

go_waterfall_totals(arg = NULL, ..., marker = NULL, skip_invalid = FALSE)

go_waterfall_totals_marker(
  arg = NULL,
  ...,
  color = NULL,
  line = NULL,
  skip_invalid = FALSE
)

go_waterfall_totals_marker_line(
  arg = NULL,
  ...,
  color = NULL,
  width = NULL,
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

- base:

  Sets where the bar base is drawn (in position axis units). Number.

- cliponaxis:

  Determines whether the text nodes are clipped about the subplot axes.
  To show the text nodes above axis lines and tick labels, make sure to
  set \`xaxis.layer\` and \`yaxis.layer\` to "below traces". Logical.

- connector:

  Named list or `go_waterfall_connector()` object.

- constraintext:

  Constrain the size of text inside or outside a bar to be no larger
  than the bar itself. One of `"inside"`, `"outside"`, `"both"`,
  `"none"`.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- decreasing:

  Named list or `go_waterfall_decreasing()` object.

- dx:

  Sets the x coordinate step. See \`x0\` for more info. Number.

- dy:

  Sets the y coordinate step. See \`y0\` for more info. Number.

- hoverinfo:

  Determines what trace information appears on hover. If \`none\` or
  \`skip\` are set, no information is displayed upon hovering. But, if
  \`none\` is set, click and hover events are still fired. Any
  combination of `"name"`, `"x"`, `"y"`, `"text"`, `"initial"`,
  `"delta"`, `"final"` joined with `"+"`, or one of `"all"`, `"none"`,
  `"skip"`, or a vector of these.

- hoverlabel:

  Named list or `go_waterfall_hoverlabel()` object.

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
  string has access to variables \`initial\`, \`delta\` and \`final\`.
  Anything contained in tag \`\<extra\>\` is displayed in the secondary
  box, for example \`\<extra\>%{fullData.name}\</extra\>\`. To hide the
  secondary box completely, use an empty tag \`\<extra\>\</extra\>\`.
  String, or a vector of these.

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

- increasing:

  Named list or `go_waterfall_increasing()` object.

- insidetextanchor:

  Determines if texts are kept at center or start/end points in
  \`textposition\` "inside" mode. One of `"end"`, `"middle"`, `"start"`.

- insidetextfont:

  Sets the font used for \`text\` lying inside the bar. Named list or
  `go_waterfall_insidetextfont()` object.

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

  Named list or `go_waterfall_legendgrouptitle()` object.

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

- measure:

  An array containing types of values. By default the values are
  considered as 'relative'. However; it is possible to use 'total' to
  compute the sums. Also 'absolute' could be applied to reset the
  computed total or to declare an initial value where needed. Data
  array: a vector, factor, Date/POSIXct vector, matrix or list.

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

  Sets the trace name. The trace name appears as the legend item and on
  hover. String.

- offset:

  Shifts the position where the bar is drawn (in position axis units).
  In "group" barmode, traces that set "offset" will be excluded and
  drawn in "overlay" mode instead. Number, or a vector of these.

- offsetgroup:

  Set several traces linked to the same position axis or matching axes
  to the same offsetgroup where bars of the same position coordinate
  will line up. String.

- opacity:

  Sets the opacity of the trace. Number in the interval \[0, 1\].

- orientation:

  Sets the orientation of the bars. With "v" ("h"), the value of the
  each bar spans along the vertical (horizontal). One of `"v"`, `"h"`.

- outsidetextfont:

  Sets the font used for \`text\` lying outside the bar. Named list or
  `go_waterfall_outsidetextfont()` object.

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

  **`go_waterfall()`**: Sets text elements associated with each (x,y)
  pair. If a single string, the same string appears over all the data
  points. If an array of string, the items are mapped in order to the
  this trace's (x,y) coordinates. If trace \`hoverinfo\` contains a
  "text" flag and "hovertext" is not set, these elements will be seen in
  the hover labels. String, or a vector of these.

  **`go_waterfall_legendgrouptitle()`**: Sets the title of the legend
  group. String.

- textangle:

  Sets the angle of the tick labels with respect to the bar. For
  example, a \`tickangle\` of -90 draws the tick labels vertically. With
  "auto" the texts may automatically be rotated to fit with the maximum
  size in bars. Angle in degrees.

- textfont:

  Sets the font used for \`text\`. Named list or
  `go_waterfall_textfont()` object.

- textinfo:

  Determines what trace information appears on the graph. In the case of
  having multiple waterfalls, totals are computed separately (per
  trace). Flags are rendered in a fixed order; use \`texttemplate\` if
  you need explicit control over the rendered string, including the
  order of fields and surrounding text. Any combination of `"label"`,
  `"text"`, `"initial"`, `"delta"`, `"final"` joined with `"+"`, or one
  of `"none"`.

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
  template string has access to variables \`initial\`, \`delta\`,
  \`final\` and \`label\`. String, or a vector of these.

- texttemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- totals:

  Named list or `go_waterfall_totals()` object.

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

- visible:

  **`go_waterfall()`**: Determines whether or not this trace is visible.
  If "legendonly", the trace is not drawn, but can appear as a legend
  item (provided that the legend itself is visible). One of
  `"legendonly"`, `TRUE`, `FALSE`.

  **`go_waterfall_connector()`**: Determines if connector lines are
  drawn. Logical.

- width:

  **`go_waterfall()`**: Sets the bar width (in position axis units).
  Number in the interval \[0, Inf\], or a vector of these.

  **`go_waterfall_connector_line()`**: Sets the line width (in px).
  Number in the interval \[0, Inf\].

  **`go_waterfall_decreasing_marker_line()`**: Sets the line width of
  all decreasing values. Number in the interval \[0, Inf\].

  **`go_waterfall_increasing_marker_line()`**: Sets the line width of
  all increasing values. Number in the interval \[0, Inf\].

  **`go_waterfall_totals_marker_line()`**: Sets the line width of all
  intermediate sums and total values. Number in the interval \[0, Inf\].

- x:

  Sets the x coordinates. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- x0:

  Alternate to \`x\`. Builds a linear space of x coordinates. Use with
  \`dx\` where \`x0\` is the starting coordinate and \`dx\` the step.
  Any value.

- xaxis:

  Sets a reference between this trace's x coordinates and a 2D cartesian
  x axis. If "x" (the default value), the x coordinates refer to
  \`layout.xaxis\`. If "x2", the x coordinates refer to
  \`layout.xaxis2\`, and so on. Subplot id: `"x"`, `"x2"`, `"x3"`, ....

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

  Sets the y coordinates. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- y0:

  Alternate to \`y\`. Builds a linear space of y coordinates. Use with
  \`dy\` where \`y0\` is the starting coordinate and \`dy\` the step.
  Any value.

- yaxis:

  Sets a reference between this trace's y coordinates and a 2D cartesian
  y axis. If "y" (the default value), the y coordinates refer to
  \`layout.yaxis\`. If "y2", the y coordinates refer to
  \`layout.yaxis2\`, and so on. Subplot id: `"y"`, `"y2"`, `"y3"`, ....

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

- line:

  **`go_waterfall_connector()`**: Named list or
  `go_waterfall_connector_line()` object.

  **`go_waterfall_decreasing_marker()`**: Named list or
  `go_waterfall_decreasing_marker_line()` object.

  **`go_waterfall_increasing_marker()`**: Named list or
  `go_waterfall_increasing_marker_line()` object.

  **`go_waterfall_totals_marker()`**: Named list or
  `go_waterfall_totals_marker_line()` object.

- mode:

  Sets the shape of connector lines. One of `"spanning"`, `"between"`.

- color:

  **`go_waterfall_connector_line()`**: Sets the line color. Color: a CSS
  color string or R color name.

  **`go_waterfall_decreasing_marker()`**: Sets the marker color of all
  decreasing values. Color: a CSS color string or R color name.

  **`go_waterfall_decreasing_marker_line()`**: Sets the line color of
  all decreasing values. Color: a CSS color string or R color name.

  **`go_waterfall_hoverlabel_font()`, `go_waterfall_insidetextfont()`,
  `go_waterfall_outsidetextfont()`, `go_waterfall_textfont()`**: Color:
  a CSS color string or R color name, or a vector of these.

  **`go_waterfall_increasing_marker()`**: Sets the marker color of all
  increasing values. Color: a CSS color string or R color name.

  **`go_waterfall_increasing_marker_line()`**: Sets the line color of
  all increasing values. Color: a CSS color string or R color name.

  **`go_waterfall_legendgrouptitle_font()`**: Color: a CSS color string
  or R color name.

  **`go_waterfall_totals_marker()`**: Sets the marker color of all
  intermediate sums and total values. Color: a CSS color string or R
  color name.

  **`go_waterfall_totals_marker_line()`**: Sets the line color of all
  intermediate sums and total values. Color: a CSS color string or R
  color name.

- dash:

  Sets the dash style of lines. Set to a dash type string ("solid",
  "dot", "dash", "longdash", "dashdot", or "longdashdot") or a dash
  length list in px (eg "5px,10px,2px,2px"). One of `"solid"`, `"dot"`,
  `"dash"`, `"longdash"`, `"dashdot"`, `"longdashdot"`, or a string
  matching
  `"^\\d+(\\.\\d+)?(px|%)?((,|\\s)\\s*\\d+(\\.\\d+)?(px|%)?)*$"`.

- marker:

  **`go_waterfall_decreasing()`**: Named list or
  `go_waterfall_decreasing_marker()` object.

  **`go_waterfall_increasing()`**: Named list or
  `go_waterfall_increasing_marker()` object.

  **`go_waterfall_totals()`**: Named list or
  `go_waterfall_totals_marker()` object.

- align:

  Sets the horizontal alignment of the text content within hover label
  box. Has an effect only if the hover label text spans two or more
  lines One of `"left"`, `"right"`, `"auto"`, or a vector of these.

- bgcolor:

  Sets the background color of the hover labels for this trace Color: a
  CSS color string or R color name, or a vector of these.

- bordercolor:

  Sets the border color of the hover labels for this trace. Color: a CSS
  color string or R color name, or a vector of these.

- font:

  **`go_waterfall_hoverlabel()`**: Sets the font used in hover labels.
  Named list or `go_waterfall_hoverlabel_font()` object.

  **`go_waterfall_legendgrouptitle()`**: Sets this legend group's title
  font. Named list or `go_waterfall_legendgrouptitle_font()` object.

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

  **`go_waterfall_hoverlabel_font()`, `go_waterfall_insidetextfont()`,
  `go_waterfall_outsidetextfont()`, `go_waterfall_textfont()`**: HTML
  font family - the typeface that will be applied by the web browser.
  The web browser can only apply a font if it is available on the system
  where it runs. Provide multiple font families, separated by commas, to
  indicate the order in which to apply fonts if they aren't available.
  String, or a vector of these.

  **`go_waterfall_legendgrouptitle_font()`**: HTML font family - the
  typeface that will be applied by the web browser. The web browser can
  only apply a font if it is available on the system where it runs.
  Provide multiple font families, separated by commas, to indicate the
  order in which to apply fonts if they aren't available. String.

- lineposition:

  **`go_waterfall_hoverlabel_font()`, `go_waterfall_insidetextfont()`,
  `go_waterfall_outsidetextfont()`, `go_waterfall_textfont()`**: Sets
  the kind of decoration line(s) with text, such as an "under", "over"
  or "through" as well as combinations e.g. "under+over", etc. Any
  combination of `"under"`, `"over"`, `"through"` joined with `"+"`, or
  one of `"none"`, or a vector of these.

  **`go_waterfall_legendgrouptitle_font()`**: Sets the kind of
  decoration line(s) with text, such as an "under", "over" or "through"
  as well as combinations e.g. "under+over", etc. Any combination of
  `"under"`, `"over"`, `"through"` joined with `"+"`, or one of
  `"none"`.

- shadow:

  **`go_waterfall_hoverlabel_font()`, `go_waterfall_insidetextfont()`,
  `go_waterfall_outsidetextfont()`, `go_waterfall_textfont()`**: Sets
  the shape and color of the shadow behind text. "auto" places minimal
  shadow and applies contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String, or a vector of these.

  **`go_waterfall_legendgrouptitle_font()`**: Sets the shape and color
  of the shadow behind text. "auto" places minimal shadow and applies
  contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String.

- size:

  **`go_waterfall_hoverlabel_font()`, `go_waterfall_insidetextfont()`,
  `go_waterfall_outsidetextfont()`, `go_waterfall_textfont()`**: Number
  in the interval \[1, Inf\], or a vector of these.

  **`go_waterfall_legendgrouptitle_font()`**: Number in the interval
  \[1, Inf\].

- style:

  **`go_waterfall_hoverlabel_font()`, `go_waterfall_insidetextfont()`,
  `go_waterfall_outsidetextfont()`, `go_waterfall_textfont()`**: Sets
  whether a font should be styled with a normal or italic face from its
  family. One of `"normal"`, `"italic"`, or a vector of these.

  **`go_waterfall_legendgrouptitle_font()`**: Sets whether a font should
  be styled with a normal or italic face from its family. One of
  `"normal"`, `"italic"`.

- textcase:

  **`go_waterfall_hoverlabel_font()`, `go_waterfall_insidetextfont()`,
  `go_waterfall_outsidetextfont()`, `go_waterfall_textfont()`**: Sets
  capitalization of text. It can be used to make text appear in
  all-uppercase or all-lowercase, or with each word capitalized. One of
  `"normal"`, `"word caps"`, `"upper"`, `"lower"`, or a vector of these.

  **`go_waterfall_legendgrouptitle_font()`**: Sets capitalization of
  text. It can be used to make text appear in all-uppercase or
  all-lowercase, or with each word capitalized. One of `"normal"`,
  `"word caps"`, `"upper"`, `"lower"`.

- variant:

  **`go_waterfall_hoverlabel_font()`, `go_waterfall_insidetextfont()`,
  `go_waterfall_outsidetextfont()`, `go_waterfall_textfont()`**: Sets
  the variant of the font. One of `"normal"`, `"small-caps"`,
  `"all-small-caps"`, `"all-petite-caps"`, `"petite-caps"`, `"unicase"`,
  or a vector of these.

  **`go_waterfall_legendgrouptitle_font()`**: Sets the variant of the
  font. One of `"normal"`, `"small-caps"`, `"all-small-caps"`,
  `"all-petite-caps"`, `"petite-caps"`, `"unicase"`.

- weight:

  **`go_waterfall_hoverlabel_font()`, `go_waterfall_insidetextfont()`,
  `go_waterfall_outsidetextfont()`, `go_waterfall_textfont()`**: Sets
  the weight (or boldness) of the font. Integer in the interval \[1,
  1000\], or a vector of these.

  **`go_waterfall_legendgrouptitle_font()`**: Sets the weight (or
  boldness) of the font. Integer in the interval \[1, 1000\].

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_waterfall()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
`add_waterfall()` creates an object and adds it to a figure.

Nested objects documented here:

- `go_waterfall_connector()`:

  `waterfall.connector`

- `go_waterfall_connector_line()`:

  `waterfall.connector.line`

- `go_waterfall_decreasing()`:

  `waterfall.decreasing`

- `go_waterfall_decreasing_marker()`:

  `waterfall.decreasing.marker`

- `go_waterfall_decreasing_marker_line()`:

  `waterfall.decreasing.marker.line`

- `go_waterfall_hoverlabel()`:

  `waterfall.hoverlabel`

- `go_waterfall_hoverlabel_font()`:

  `waterfall.hoverlabel.font`: Sets the font used in hover labels.

- `go_waterfall_increasing()`:

  `waterfall.increasing`

- `go_waterfall_increasing_marker()`:

  `waterfall.increasing.marker`

- `go_waterfall_increasing_marker_line()`:

  `waterfall.increasing.marker.line`

- `go_waterfall_insidetextfont()`:

  `waterfall.insidetextfont`: Sets the font used for \`text\` lying
  inside the bar.

- `go_waterfall_legendgrouptitle()`:

  `waterfall.legendgrouptitle`

- `go_waterfall_legendgrouptitle_font()`:

  `waterfall.legendgrouptitle.font`: Sets this legend group's title
  font.

- `go_waterfall_outsidetextfont()`:

  `waterfall.outsidetextfont`: Sets the font used for \`text\` lying
  outside the bar.

- `go_waterfall_textfont()`:

  `waterfall.textfont`: Sets the font used for \`text\`.

- `go_waterfall_totals()`:

  `waterfall.totals`

- `go_waterfall_totals_marker()`:

  `waterfall.totals.marker`

- `go_waterfall_totals_marker_line()`:

  `waterfall.totals.marker.line`

## See also

[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)

## Examples

``` r
go_waterfall(x = 1:3, y = c(2, 1, 3))
#> <go_waterfall>
#> {
#>   "type": "waterfall",
#>   "x": [
#>     1,
#>     2,
#>     3
#>   ],
#>   "y": [
#>     2,
#>     1,
#>     3
#>   ]
#> }
#> 
```
