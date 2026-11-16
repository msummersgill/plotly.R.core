# Box traces

Each box spans from quartile 1 (Q1) to quartile 3 (Q3). The second
quartile (Q2, i.e. the median) is marked by a line inside the box. The
fences grow outward from the boxes' edges, by default they span +/- 1.5
times the interquartile range (IQR: Q3-Q1), The sample mean and standard
deviation as well as notches and the sample, outlier and suspected
outliers points can be optionally added to the box plot. The values and
positions corresponding to each boxes can be input using two signatures.
The first signature expects users to supply the sample values in the
\`y\` data array for vertical boxes (\`x\` for horizontal boxes). By
supplying an \`x\` (\`y\`) array, one box per distinct \`x\` (\`y\`)
value is drawn If no \`x\` (\`y\`) vector is provided, a single box is
drawn. In this case, the box is positioned with the trace \`name\` or
with \`x0\` (\`y0\`) if provided. The second signature expects users to
supply the boxes corresponding Q1, median and Q3 statistics in the
\`q1\`, \`median\` and \`q3\` data arrays respectively. Other box
features relying on statistics namely \`lowerfence\`, \`upperfence\`,
\`notchspan\` can be set directly by the users. To have plotly compute
them or to show sample points besides the boxes, users can set the \`y\`
data array for vertical boxes (\`x\` for horizontal boxes) to a 2D array
with the outer length corresponding to the number of boxes in the traces
and the inner length corresponding the sample size.

## Usage

``` r
go_box(
  arg = NULL,
  ...,
  alignmentgroup = NULL,
  boxmean = NULL,
  boxpoints = NULL,
  customdata = NULL,
  dx = NULL,
  dy = NULL,
  fillcolor = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hoveron = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  jitter = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  line = NULL,
  lowerfence = NULL,
  marker = NULL,
  mean = NULL,
  median = NULL,
  meta = NULL,
  name = NULL,
  notched = NULL,
  notchspan = NULL,
  notchwidth = NULL,
  offsetgroup = NULL,
  opacity = NULL,
  orientation = NULL,
  pointpos = NULL,
  q1 = NULL,
  q3 = NULL,
  quartilemethod = NULL,
  sd = NULL,
  sdmultiple = NULL,
  selected = NULL,
  selectedpoints = NULL,
  showlegend = NULL,
  showwhiskers = NULL,
  sizemode = NULL,
  text = NULL,
  uid = NULL,
  uirevision = NULL,
  unselected = NULL,
  upperfence = NULL,
  visible = NULL,
  whiskerwidth = NULL,
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

go_box_hoverlabel(
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

go_box_hoverlabel_font(
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

go_box_legendgrouptitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_box_legendgrouptitle_font(
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

go_box_line(arg = NULL, ..., color = NULL, width = NULL, skip_invalid = FALSE)

go_box_marker(
  arg = NULL,
  ...,
  angle = NULL,
  color = NULL,
  line = NULL,
  opacity = NULL,
  outliercolor = NULL,
  size = NULL,
  symbol = NULL,
  skip_invalid = FALSE
)

go_box_marker_line(
  arg = NULL,
  ...,
  color = NULL,
  outliercolor = NULL,
  outlierwidth = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_box_selected(arg = NULL, ..., marker = NULL, skip_invalid = FALSE)

go_box_selected_marker(
  arg = NULL,
  ...,
  color = NULL,
  opacity = NULL,
  size = NULL,
  skip_invalid = FALSE
)

go_box_unselected(arg = NULL, ..., marker = NULL, skip_invalid = FALSE)

go_box_unselected_marker(
  arg = NULL,
  ...,
  color = NULL,
  opacity = NULL,
  size = NULL,
  skip_invalid = FALSE
)

add_box(fig, ...)

# Default S3 method
add_box(
  fig,
  ...,
  data = NULL,
  alignmentgroup = NULL,
  boxmean = NULL,
  boxpoints = NULL,
  customdata = NULL,
  dx = NULL,
  dy = NULL,
  fillcolor = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hoveron = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  jitter = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  line = NULL,
  lowerfence = NULL,
  marker = NULL,
  mean = NULL,
  median = NULL,
  meta = NULL,
  name = NULL,
  notched = NULL,
  notchspan = NULL,
  notchwidth = NULL,
  offsetgroup = NULL,
  opacity = NULL,
  orientation = NULL,
  pointpos = NULL,
  q1 = NULL,
  q3 = NULL,
  quartilemethod = NULL,
  sd = NULL,
  sdmultiple = NULL,
  selected = NULL,
  selectedpoints = NULL,
  showlegend = NULL,
  showwhiskers = NULL,
  sizemode = NULL,
  text = NULL,
  uid = NULL,
  uirevision = NULL,
  unselected = NULL,
  upperfence = NULL,
  visible = NULL,
  whiskerwidth = NULL,
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

- boxmean:

  If TRUE, the mean of the box(es)' underlying distribution is drawn as
  a dashed line inside the box(es). If "sd" the standard deviation is
  also drawn. Defaults to TRUE when \`mean\` is set. Defaults to "sd"
  when \`sd\` is set Otherwise defaults to FALSE. One of `"sd"`, `TRUE`,
  `FALSE`.

- boxpoints:

  If "outliers", only the sample points lying outside the whiskers are
  shown If "suspectedoutliers", the outlier points are shown and points
  either less than 4"Q1-3"Q3 or greater than 4"Q3-3"Q1 are highlighted
  (see \`outliercolor\`) If "all", all sample points are shown If FALSE,
  only the box(es) are shown with no sample points Defaults to
  "suspectedoutliers" when \`marker.outliercolor\` or
  \`marker.line.outliercolor\` is set. Defaults to "all" under the
  q1/median/q3 signature. Otherwise defaults to "outliers". One of
  `"all"`, `"outliers"`, `"suspectedoutliers"`, `FALSE`.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- dx:

  Sets the x coordinate step for multi-box traces set using
  q1/median/q3. Number.

- dy:

  Sets the y coordinate step for multi-box traces set using
  q1/median/q3. Number.

- fillcolor:

  Sets the fill color. Defaults to a half-transparent variant of the
  line color, marker color, or marker line color, whichever is
  available. Color: a CSS color string or R color name.

- hoverinfo:

  Determines what trace information appears on hover. If \`none\` or
  \`skip\` are set, no information is displayed upon hovering. But, if
  \`none\` is set, click and hover events are still fired. Any
  combination of `"x"`, `"y"`, `"z"`, `"text"`, `"name"` joined with
  `"+"`, or one of `"all"`, `"none"`, `"skip"`, or a vector of these.

- hoverlabel:

  Named list or `go_box_hoverlabel()` object.

- hoveron:

  Do the hover effects highlight individual boxes or sample points or
  both? Any combination of `"boxes"`, `"points"` joined with `"+"`.

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

  Same as \`text\`. String, or a vector of these.

- ids:

  Assigns id labels to each datum. These ids for object constancy of
  data points during animation. Should be an array of strings, not
  numbers or any other type. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- jitter:

  Sets the amount of jitter in the sample points drawn. If 0, the sample
  points align along the distribution axis. If 1, the sample points are
  drawn in a random jitter of width equal to the width of the box(es).
  Number in the interval \[0, 1\].

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

  Named list or `go_box_legendgrouptitle()` object.

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

  **`go_box()`**: Named list or `go_box_line()` object.

  **`go_box_marker()`**: Named list or `go_box_marker_line()` object.

- lowerfence:

  Sets the lower fence values. There should be as many items as the
  number of boxes desired. This attribute has effect only under the
  q1/median/q3 signature. If \`lowerfence\` is not provided but a sample
  (in \`y\` or \`x\`) is set, we compute the lower as the last sample
  point below 1.5 times the IQR. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

- marker:

  **`go_box()`**: Named list or `go_box_marker()` object.

  **`go_box_selected()`**: Named list or `go_box_selected_marker()`
  object.

  **`go_box_unselected()`**: Named list or `go_box_unselected_marker()`
  object.

- mean:

  Sets the mean values. There should be as many items as the number of
  boxes desired. This attribute has effect only under the q1/median/q3
  signature. If \`mean\` is not provided but a sample (in \`y\` or
  \`x\`) is set, we compute the mean for each box using the sample
  values. Data array: a vector, factor, Date/POSIXct vector, matrix or
  list.

- median:

  Sets the median values. There should be as many items as the number of
  boxes desired. Data array: a vector, factor, Date/POSIXct vector,
  matrix or list.

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
  hover. For box traces, the name will also be used for the position
  coordinate, if \`x\` and \`x0\` (\`y\` and \`y0\` if horizontal) are
  missing and the position axis is categorical String.

- notched:

  Determines whether or not notches are drawn. Notches displays a
  confidence interval around the median. We compute the confidence
  interval as median +/- 1.57 \* IQR / sqrt(N), where IQR is the
  interquartile range and N is the sample size. If two boxes' notches do
  not overlap there is 95% confidence their medians differ. See
  https://sites.google.com/site/davidsstatistics/home/notched-box-plots
  for more info. Defaults to FALSE unless \`notchwidth\` or
  \`notchspan\` is set. Logical.

- notchspan:

  Sets the notch span from the boxes' \`median\` values. There should be
  as many items as the number of boxes desired. This attribute has
  effect only under the q1/median/q3 signature. If \`notchspan\` is not
  provided but a sample (in \`y\` or \`x\`) is set, we compute it as
  1.57 \* IQR / sqrt(N), where N is the sample size. Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- notchwidth:

  Sets the width of the notches relative to the box width. For example,
  with 0, the notches are as wide as the box(es). Number in the interval
  \[0, 0.5\].

- offsetgroup:

  Set several traces linked to the same position axis or matching axes
  to the same offsetgroup where bars of the same position coordinate
  will line up. String.

- opacity:

  **`go_box()`**: Sets the opacity of the trace. Number in the interval
  \[0, 1\].

  **`go_box_marker()`**: Sets the marker opacity. Number in the interval
  \[0, 1\].

  **`go_box_selected_marker()`**: Sets the marker opacity of selected
  points. Number in the interval \[0, 1\].

  **`go_box_unselected_marker()`**: Sets the marker opacity of
  unselected points, applied only when a selection exists. Number in the
  interval \[0, 1\].

- orientation:

  Sets the orientation of the box(es). If "v" ("h"), the distribution is
  visualized along the vertical (horizontal). One of `"v"`, `"h"`.

- pointpos:

  Sets the position of the sample points in relation to the box(es). If
  0, the sample points are places over the center of the box(es).
  Positive (negative) values correspond to positions to the right (left)
  for vertical boxes and above (below) for horizontal boxes Number in
  the interval \[-2, 2\].

- q1:

  Sets the Quartile 1 values. There should be as many items as the
  number of boxes desired. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- q3:

  Sets the Quartile 3 values. There should be as many items as the
  number of boxes desired. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- quartilemethod:

  Sets the method used to compute the sample's Q1 and Q3 quartiles. The
  "linear" method uses the 25th percentile for Q1 and 75th percentile
  for Q3 as computed using method \#10 (listed on
  http://jse.amstat.org/v14n3/langford.html). The "exclusive" method
  uses the median to divide the ordered dataset into two halves if the
  sample is odd, it does not include the median in either half - Q1 is
  then the median of the lower half and Q3 the median of the upper half.
  The "inclusive" method also uses the median to divide the ordered
  dataset into two halves but if the sample is odd, it includes the
  median in both halves - Q1 is then the median of the lower half and Q3
  the median of the upper half. One of `"linear"`, `"exclusive"`,
  `"inclusive"`.

- sd:

  Sets the standard deviation values. There should be as many items as
  the number of boxes desired. This attribute has effect only under the
  q1/median/q3 signature. If \`sd\` is not provided but a sample (in
  \`y\` or \`x\`) is set, we compute the standard deviation for each box
  using the sample values. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- sdmultiple:

  Scales the box size when sizemode=sd Allowing boxes to be drawn across
  any stddev range For example 1-stddev, 3-stddev, 5-stddev Number in
  the interval \[0, Inf\].

- selected:

  Named list or `go_box_selected()` object.

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

- showwhiskers:

  Determines whether or not whiskers are visible. Defaults to true for
  \`sizemode\` "quartiles", false for "sd". Logical.

- sizemode:

  Sets the upper and lower bound for the boxes quartiles means box is
  drawn between Q1 and Q3 SD means the box is drawn between Mean +-
  Standard Deviation Argument sdmultiple (default 1) to scale the box
  size So it could be drawn 1-stddev, 3-stddev etc One of `"quartiles"`,
  `"sd"`.

- text:

  **`go_box()`**: Sets the text elements associated with each sample
  value. If a single string, the same string appears over all the data
  points. If an array of string, the items are mapped in order to the
  this trace's (x,y) coordinates. To be seen, trace \`hoverinfo\` must
  contain a "text" flag. String, or a vector of these.

  **`go_box_legendgrouptitle()`**: Sets the title of the legend group.
  String.

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

  Named list or `go_box_unselected()` object.

- upperfence:

  Sets the upper fence values. There should be as many items as the
  number of boxes desired. This attribute has effect only under the
  q1/median/q3 signature. If \`upperfence\` is not provided but a sample
  (in \`y\` or \`x\`) is set, we compute the upper as the last sample
  point above 1.5 times the IQR. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

- visible:

  Determines whether or not this trace is visible. If "legendonly", the
  trace is not drawn, but can appear as a legend item (provided that the
  legend itself is visible). One of `"legendonly"`, `TRUE`, `FALSE`.

- whiskerwidth:

  Sets the width of the whiskers relative to the box width. For example,
  with 1, the whiskers are as wide as the box(es). Number in the
  interval \[0, 1\].

- width:

  **`go_box()`**: Sets the width of the box in data coordinate If 0
  (default value) the width is automatically selected based on the
  positions of other box traces in the same subplot. Number in the
  interval \[0, Inf\].

  **`go_box_line()`**: Sets the width (in px) of line bounding the
  box(es). Number in the interval \[0, Inf\].

  **`go_box_marker_line()`**: Sets the width (in px) of the lines
  bounding the marker points. Number in the interval \[0, Inf\].

- x:

  Sets the x sample data or coordinates. See overview for more info.
  Data array: a vector, factor, Date/POSIXct vector, matrix or list.

- x0:

  Sets the x coordinate for single-box traces or the starting coordinate
  for multi-box traces set using q1/median/q3. See overview for more
  info. Any value.

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

  Sets the y sample data or coordinates. See overview for more info.
  Data array: a vector, factor, Date/POSIXct vector, matrix or list.

- y0:

  Sets the y coordinate for single-box traces or the starting coordinate
  for multi-box traces set using q1/median/q3. See overview for more
  info. Any value.

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

  **`go_box_hoverlabel()`**: Sets the font used in hover labels. Named
  list or `go_box_hoverlabel_font()` object.

  **`go_box_legendgrouptitle()`**: Sets this legend group's title font.
  Named list or `go_box_legendgrouptitle_font()` object.

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

  **`go_box_hoverlabel_font()`**: Color: a CSS color string or R color
  name, or a vector of these.

  **`go_box_legendgrouptitle_font()`**: Color: a CSS color string or R
  color name.

  **`go_box_line()`**: Sets the color of line bounding the box(es).
  Color: a CSS color string or R color name.

  **`go_box_marker()`**: Sets the marker color. It accepts either a
  specific color or an array of numbers that are mapped to the
  colorscale relative to the max and min values of the array or relative
  to \`marker.cmin\` and \`marker.cmax\` if set. Color: a CSS color
  string or R color name.

  **`go_box_marker_line()`**: Sets the marker.line color. It accepts
  either a specific color or an array of numbers that are mapped to the
  colorscale relative to the max and min values of the array or relative
  to \`marker.line.cmin\` and \`marker.line.cmax\` if set. Color: a CSS
  color string or R color name.

  **`go_box_selected_marker()`**: Sets the marker color of selected
  points. Color: a CSS color string or R color name.

  **`go_box_unselected_marker()`**: Sets the marker color of unselected
  points, applied only when a selection exists. Color: a CSS color
  string or R color name.

- family:

  **`go_box_hoverlabel_font()`**: HTML font family - the typeface that
  will be applied by the web browser. The web browser can only apply a
  font if it is available on the system where it runs. Provide multiple
  font families, separated by commas, to indicate the order in which to
  apply fonts if they aren't available. String, or a vector of these.

  **`go_box_legendgrouptitle_font()`**: HTML font family - the typeface
  that will be applied by the web browser. The web browser can only
  apply a font if it is available on the system where it runs. Provide
  multiple font families, separated by commas, to indicate the order in
  which to apply fonts if they aren't available. String.

- lineposition:

  **`go_box_hoverlabel_font()`**: Sets the kind of decoration line(s)
  with text, such as an "under", "over" or "through" as well as
  combinations e.g. "under+over", etc. Any combination of `"under"`,
  `"over"`, `"through"` joined with `"+"`, or one of `"none"`, or a
  vector of these.

  **`go_box_legendgrouptitle_font()`**: Sets the kind of decoration
  line(s) with text, such as an "under", "over" or "through" as well as
  combinations e.g. "under+over", etc. Any combination of `"under"`,
  `"over"`, `"through"` joined with `"+"`, or one of `"none"`.

- shadow:

  **`go_box_hoverlabel_font()`**: Sets the shape and color of the shadow
  behind text. "auto" places minimal shadow and applies contrast text
  font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String, or a vector of these.

  **`go_box_legendgrouptitle_font()`**: Sets the shape and color of the
  shadow behind text. "auto" places minimal shadow and applies contrast
  text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String.

- size:

  **`go_box_hoverlabel_font()`**: Number in the interval \[1, Inf\], or
  a vector of these.

  **`go_box_legendgrouptitle_font()`**: Number in the interval \[1,
  Inf\].

  **`go_box_marker()`**: Sets the marker size (in px). Number in the
  interval \[0, Inf\].

  **`go_box_selected_marker()`**: Sets the marker size of selected
  points. Number in the interval \[0, Inf\].

  **`go_box_unselected_marker()`**: Sets the marker size of unselected
  points, applied only when a selection exists. Number in the interval
  \[0, Inf\].

- style:

  **`go_box_hoverlabel_font()`**: Sets whether a font should be styled
  with a normal or italic face from its family. One of `"normal"`,
  `"italic"`, or a vector of these.

  **`go_box_legendgrouptitle_font()`**: Sets whether a font should be
  styled with a normal or italic face from its family. One of
  `"normal"`, `"italic"`.

- textcase:

  **`go_box_hoverlabel_font()`**: Sets capitalization of text. It can be
  used to make text appear in all-uppercase or all-lowercase, or with
  each word capitalized. One of `"normal"`, `"word caps"`, `"upper"`,
  `"lower"`, or a vector of these.

  **`go_box_legendgrouptitle_font()`**: Sets capitalization of text. It
  can be used to make text appear in all-uppercase or all-lowercase, or
  with each word capitalized. One of `"normal"`, `"word caps"`,
  `"upper"`, `"lower"`.

- variant:

  **`go_box_hoverlabel_font()`**: Sets the variant of the font. One of
  `"normal"`, `"small-caps"`, `"all-small-caps"`, `"all-petite-caps"`,
  `"petite-caps"`, `"unicase"`, or a vector of these.

  **`go_box_legendgrouptitle_font()`**: Sets the variant of the font.
  One of `"normal"`, `"small-caps"`, `"all-small-caps"`,
  `"all-petite-caps"`, `"petite-caps"`, `"unicase"`.

- weight:

  **`go_box_hoverlabel_font()`**: Sets the weight (or boldness) of the
  font. Integer in the interval \[1, 1000\], or a vector of these.

  **`go_box_legendgrouptitle_font()`**: Sets the weight (or boldness) of
  the font. Integer in the interval \[1, 1000\].

- angle:

  Sets the marker angle in respect to \`angleref\`. Angle in degrees.

- outliercolor:

  **`go_box_marker()`**: Sets the color of the outlier sample points.
  Color: a CSS color string or R color name.

  **`go_box_marker_line()`**: Sets the border line color of the outlier
  sample points. Defaults to marker.color Color: a CSS color string or R
  color name.

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
  `151`, `52`, `152`, `53`, `153`, `54`, `154`.

- outlierwidth:

  Sets the border line width (in px) of the outlier sample points.
  Number in the interval \[0, Inf\].

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

`go_box()` and the nested object constructors below create validated
graph objects (named lists). Every property is checked against the
plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
`add_box()` creates an object and adds it to a figure.

Nested objects documented here:

- `go_box_hoverlabel()`:

  `box.hoverlabel`

- `go_box_hoverlabel_font()`:

  `box.hoverlabel.font`: Sets the font used in hover labels.

- `go_box_legendgrouptitle()`:

  `box.legendgrouptitle`

- `go_box_legendgrouptitle_font()`:

  `box.legendgrouptitle.font`: Sets this legend group's title font.

- `go_box_line()`:

  `box.line`

- `go_box_marker()`:

  `box.marker`

- `go_box_marker_line()`:

  `box.marker.line`

- `go_box_selected()`:

  `box.selected`

- `go_box_selected_marker()`:

  `box.selected.marker`

- `go_box_unselected()`:

  `box.unselected`

- `go_box_unselected_marker()`:

  `box.unselected.marker`

## See also

[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)

## Examples

``` r
go_box(x = 1:3, y = c(2, 1, 3), marker_color = "red")
#> <go_box>
#> {
#>   "type": "box",
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
