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

add_box(fig, ...)

# Default S3 method
add_box(
  fig,
  ...,
  data = NULL,
  split = NULL,
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

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

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

  A
  [`go_hoverlabel()`](https://msummersgill.github.io/plotly.R.core/reference/go_hoverlabel.md)
  object or named list, with properties `align`, `bgcolor`,
  `bordercolor`, `font`, `namelength` and `showarrow` (see
  [`go_hoverlabel()`](https://msummersgill.github.io/plotly.R.core/reference/go_hoverlabel.md)).

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

  A
  [`go_legendgrouptitle()`](https://msummersgill.github.io/plotly.R.core/reference/go_legendgrouptitle.md)
  object or named list, with properties `font` and `text` (see
  [`go_legendgrouptitle()`](https://msummersgill.github.io/plotly.R.core/reference/go_legendgrouptitle.md)).

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

  A
  [`go_box_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_box_line.md)
  object or named list, with properties `color` and `width` (see
  [`go_box_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_box_line.md)).

- lowerfence:

  Sets the lower fence values. There should be as many items as the
  number of boxes desired. This attribute has effect only under the
  q1/median/q3 signature. If \`lowerfence\` is not provided but a sample
  (in \`y\` or \`x\`) is set, we compute the lower as the last sample
  point below 1.5 times the IQR. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

- marker:

  A
  [`go_box_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_box_marker.md)
  object or named list, with properties `angle`, `color`, `line`,
  `opacity`, `outliercolor`, `size` and `symbol` (see
  [`go_box_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_box_marker.md)).

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

  Sets the opacity of the trace. Number in the interval \[0, 1\].

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

  A
  [`go_selected()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected.md)
  object or named list, with properties `marker` (see
  [`go_selected()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected.md)).

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

  Sets the text elements associated with each sample value. If a single
  string, the same string appears over all the data points. If an array
  of string, the items are mapped in order to the this trace's (x,y)
  coordinates. To be seen, trace \`hoverinfo\` must contain a "text"
  flag. String, or a vector of these.

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

  A
  [`go_unselected()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected.md)
  object or named list, with properties `marker` (see
  [`go_unselected()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected.md)).

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

  Sets the width of the box in data coordinate If 0 (default value) the
  width is automatically selected based on the positions of other box
  traces in the same subplot. Number in the interval \[0, Inf\].

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

- fig:

  A `go_figure` object.

- data:

  A data frame in which formula properties (e.g. `x = ~col`) are
  evaluated. Default: the data given to
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md).
  Only the evaluated values are added to the trace. A
  [`crosstalk::SharedData`](https://rdrr.io/pkg/crosstalk/man/SharedData.html)
  works the same way, and links the trace to its crosstalk group (see
  [`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)).

- split:

  A column (`~col`) or vector with one value per point (per row of the
  data, or of the vectors formulas refer to without data): one trace is
  added per value, named after it, with the per-point values split
  accordingly. Colour properties given a discrete column (a factor,
  character or logical, e.g.
  `marker = go_scatter_marker(color = ~group)`) split the data the same
  way, each trace getting its own colour: evenly spaced viridis colours
  for an ordered factor, otherwise the figure's colorway.

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

`go_*()` functions return a graph object; `add_*()` functions return the
modified figure.

## Details

`go_box()` creates a validated graph object (a named list). `add_box()`
creates one and adds it to a figure.

Nested objects are given as named lists or with their constructors,
which are linked from the arguments below. Every property is checked
against the plotly.js schema when the object is created or modified (see
[`plotly_obj-modify`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
One-sided formulas (`~col`) are evaluated in the data, and then checked,
when the trace is added with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## See also

[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)

## Examples

``` r
mtcars |>
  go_figure() |>
  add_box(x = ~factor(cyl), y = ~mpg)
```
