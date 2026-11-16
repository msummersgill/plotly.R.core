# Violin traces

In vertical (horizontal) violin plots, statistics are computed using
\`y\` (\`x\`) values. By supplying an \`x\` (\`y\`) array, one violin
per distinct x (y) value is drawn If no \`x\` (\`y\`) vector is
provided, a single violin is drawn. That violin position is then
positioned with \`name\` or with \`x0\` (\`y0\`) if provided.

## Usage

``` r
add_violin(fig, ...)

# Default S3 method
add_violin(
  fig,
  ...,
  data = NULL,
  alignmentgroup = NULL,
  bandwidth = NULL,
  box = NULL,
  customdata = NULL,
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
  marker = NULL,
  meanline = NULL,
  meta = NULL,
  name = NULL,
  offsetgroup = NULL,
  opacity = NULL,
  orientation = NULL,
  pointpos = NULL,
  points = NULL,
  quartilemethod = NULL,
  scalegroup = NULL,
  scalemode = NULL,
  selected = NULL,
  selectedpoints = NULL,
  showlegend = NULL,
  side = NULL,
  span = NULL,
  spanmode = NULL,
  text = NULL,
  uid = NULL,
  uirevision = NULL,
  unselected = NULL,
  visible = NULL,
  width = NULL,
  x = NULL,
  x0 = NULL,
  xaxis = NULL,
  xhoverformat = NULL,
  y = NULL,
  y0 = NULL,
  yaxis = NULL,
  yhoverformat = NULL,
  zorder = NULL,
  row = NULL,
  col = NULL,
  secondary_y = NULL,
  skip_invalid = FALSE
)

go_violin(
  arg = NULL,
  ...,
  alignmentgroup = NULL,
  bandwidth = NULL,
  box = NULL,
  customdata = NULL,
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
  marker = NULL,
  meanline = NULL,
  meta = NULL,
  name = NULL,
  offsetgroup = NULL,
  opacity = NULL,
  orientation = NULL,
  pointpos = NULL,
  points = NULL,
  quartilemethod = NULL,
  scalegroup = NULL,
  scalemode = NULL,
  selected = NULL,
  selectedpoints = NULL,
  showlegend = NULL,
  side = NULL,
  span = NULL,
  spanmode = NULL,
  text = NULL,
  uid = NULL,
  uirevision = NULL,
  unselected = NULL,
  visible = NULL,
  width = NULL,
  x = NULL,
  x0 = NULL,
  xaxis = NULL,
  xhoverformat = NULL,
  y = NULL,
  y0 = NULL,
  yaxis = NULL,
  yhoverformat = NULL,
  zorder = NULL,
  skip_invalid = FALSE
)

go_violin_box(
  arg = NULL,
  ...,
  fillcolor = NULL,
  line = NULL,
  visible = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_violin_box_line(
  arg = NULL,
  ...,
  color = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_violin_hoverlabel(
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

go_violin_hoverlabel_font(
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

go_violin_legendgrouptitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_violin_legendgrouptitle_font(
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

go_violin_line(
  arg = NULL,
  ...,
  color = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_violin_marker(
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

go_violin_marker_line(
  arg = NULL,
  ...,
  color = NULL,
  outliercolor = NULL,
  outlierwidth = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_violin_meanline(
  arg = NULL,
  ...,
  color = NULL,
  visible = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_violin_selected(arg = NULL, ..., marker = NULL, skip_invalid = FALSE)

go_violin_selected_marker(
  arg = NULL,
  ...,
  color = NULL,
  opacity = NULL,
  size = NULL,
  skip_invalid = FALSE
)

go_violin_unselected(arg = NULL, ..., marker = NULL, skip_invalid = FALSE)

go_violin_unselected_marker(
  arg = NULL,
  ...,
  color = NULL,
  opacity = NULL,
  size = NULL,
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

- bandwidth:

  Sets the bandwidth used to compute the kernel density estimate. By
  default, the bandwidth is determined by Silverman's rule of thumb.
  Number in the interval \[0, Inf\].

- box:

  Named list or `go_violin_box()` object.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- fillcolor:

  **`go_violin()`**: Sets the fill color. Defaults to a half-transparent
  variant of the line color, marker color, or marker line color,
  whichever is available. Color: a CSS color string or R color name.

  **`go_violin_box()`**: Sets the inner box plot fill color. Color: a
  CSS color string or R color name.

- hoverinfo:

  Determines what trace information appears on hover. If \`none\` or
  \`skip\` are set, no information is displayed upon hovering. But, if
  \`none\` is set, click and hover events are still fired. Any
  combination of `"x"`, `"y"`, `"z"`, `"text"`, `"name"` joined with
  `"+"`, or one of `"all"`, `"none"`, `"skip"`, or a vector of these.

- hoverlabel:

  Named list or `go_violin_hoverlabel()` object.

- hoveron:

  Do the hover effects highlight individual violins or sample points or
  the kernel density estimate or any combination of them? Any
  combination of `"violins"`, `"points"`, `"kde"` joined with `"+"`, or
  one of `"all"`.

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
  drawn in a random jitter of width equal to the width of the violins.
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

  Named list or `go_violin_legendgrouptitle()` object.

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

  **`go_violin()`**: Named list or `go_violin_line()` object.

  **`go_violin_box()`**: Named list or `go_violin_box_line()` object.

  **`go_violin_marker()`**: Named list or `go_violin_marker_line()`
  object.

- marker:

  **`go_violin()`**: Named list or `go_violin_marker()` object.

  **`go_violin_selected()`**: Named list or
  `go_violin_selected_marker()` object.

  **`go_violin_unselected()`**: Named list or
  `go_violin_unselected_marker()` object.

- meanline:

  Named list or `go_violin_meanline()` object.

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
  hover. For violin traces, the name will also be used for the position
  coordinate, if \`x\` and \`x0\` (\`y\` and \`y0\` if horizontal) are
  missing and the position axis is categorical. Note that the trace name
  is also used as a default value for attribute \`scalegroup\` (please
  see its description for details). String.

- offsetgroup:

  Set several traces linked to the same position axis or matching axes
  to the same offsetgroup where bars of the same position coordinate
  will line up. String.

- opacity:

  **`go_violin()`**: Sets the opacity of the trace. Number in the
  interval \[0, 1\].

  **`go_violin_marker()`**: Sets the marker opacity. Number in the
  interval \[0, 1\].

  **`go_violin_selected_marker()`**: Sets the marker opacity of selected
  points. Number in the interval \[0, 1\].

  **`go_violin_unselected_marker()`**: Sets the marker opacity of
  unselected points, applied only when a selection exists. Number in the
  interval \[0, 1\].

- orientation:

  Sets the orientation of the violin(s). If "v" ("h"), the distribution
  is visualized along the vertical (horizontal). One of `"v"`, `"h"`.

- pointpos:

  Sets the position of the sample points in relation to the violins. If
  0, the sample points are places over the center of the violins.
  Positive (negative) values correspond to positions to the right (left)
  for vertical violins and above (below) for horizontal violins. Number
  in the interval \[-2, 2\].

- points:

  If "outliers", only the sample points lying outside the whiskers are
  shown If "suspectedoutliers", the outlier points are shown and points
  either less than 4"Q1-3"Q3 or greater than 4"Q3-3"Q1 are highlighted
  (see \`outliercolor\`) If "all", all sample points are shown If FALSE,
  only the violins are shown with no sample points. Defaults to
  "suspectedoutliers" when \`marker.outliercolor\` or
  \`marker.line.outliercolor\` is set, otherwise defaults to "outliers".
  One of `"all"`, `"outliers"`, `"suspectedoutliers"`, `FALSE`.

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

- scalegroup:

  If there are multiple violins that should be sized according to some
  metric (see \`scalemode\`), link them by providing a non-empty group
  id here shared by every trace in the same group. If a violin's
  \`width\` is undefined, \`scalegroup\` will default to the trace's
  name. In this case, violins with the same names will be linked
  together String.

- scalemode:

  Sets the metric by which the width of each violin is determined.
  "width" means each violin has the same (max) width "count" means the
  violins are scaled by the number of sample points making up each
  violin. One of `"width"`, `"count"`.

- selected:

  Named list or `go_violin_selected()` object.

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

- side:

  Determines on which side of the position value the density function
  making up one half of a violin is plotted. Useful when comparing two
  violin traces under "overlay" mode, where one trace has \`side\` set
  to "positive" and the other to "negative". One of `"both"`,
  `"positive"`, `"negative"`.

- span:

  Sets the span in data space for which the density function will be
  computed. Has an effect only when \`spanmode\` is set to "manual".
  Vector or list of 2 element(s).

- spanmode:

  Sets the method by which the span in data space where the density
  function will be computed. "soft" means the span goes from the
  sample's minimum value minus two bandwidths to the sample's maximum
  value plus two bandwidths. "hard" means the span goes from the
  sample's minimum to its maximum value. For custom span settings, use
  mode "manual" and fill in the \`span\` attribute. One of `"soft"`,
  `"hard"`, `"manual"`.

- text:

  **`go_violin()`**: Sets the text elements associated with each sample
  value. If a single string, the same string appears over all the data
  points. If an array of string, the items are mapped in order to the
  this trace's (x,y) coordinates. To be seen, trace \`hoverinfo\` must
  contain a "text" flag. String, or a vector of these.

  **`go_violin_legendgrouptitle()`**: Sets the title of the legend
  group. String.

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

  Named list or `go_violin_unselected()` object.

- visible:

  **`go_violin()`**: Determines whether or not this trace is visible. If
  "legendonly", the trace is not drawn, but can appear as a legend item
  (provided that the legend itself is visible). One of `"legendonly"`,
  `TRUE`, `FALSE`.

  **`go_violin_box()`**: Determines if an miniature box plot is drawn
  inside the violins. Logical.

  **`go_violin_meanline()`**: Determines if a line corresponding to the
  sample's mean is shown inside the violins. If \`box.visible\` is
  turned on, the mean line is drawn inside the inner box. Otherwise, the
  mean line is drawn from one side of the violin to other. Logical.

- width:

  **`go_violin()`**: Sets the width of the violin in data coordinates.
  If 0 (default value) the width is automatically selected based on the
  positions of other violin traces in the same subplot. Number in the
  interval \[0, Inf\].

  **`go_violin_box()`**: Sets the width of the inner box plots relative
  to the violins' width. For example, with 1, the inner box plots are as
  wide as the violins. Number in the interval \[0, 1\].

  **`go_violin_box_line()`**: Sets the inner box plot bounding line
  width. Number in the interval \[0, Inf\].

  **`go_violin_line()`**: Sets the width (in px) of line bounding the
  violin(s). Number in the interval \[0, Inf\].

  **`go_violin_marker_line()`**: Sets the width (in px) of the lines
  bounding the marker points. Number in the interval \[0, Inf\].

  **`go_violin_meanline()`**: Sets the mean line width. Number in the
  interval \[0, Inf\].

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

- color:

  **`go_violin_box_line()`**: Sets the inner box plot bounding line
  color. Color: a CSS color string or R color name.

  **`go_violin_hoverlabel_font()`**: Color: a CSS color string or R
  color name, or a vector of these.

  **`go_violin_legendgrouptitle_font()`**: Color: a CSS color string or
  R color name.

  **`go_violin_line()`**: Sets the color of line bounding the violin(s).
  Color: a CSS color string or R color name.

  **`go_violin_marker()`**: Sets the marker color. It accepts either a
  specific color or an array of numbers that are mapped to the
  colorscale relative to the max and min values of the array or relative
  to \`marker.cmin\` and \`marker.cmax\` if set. Color: a CSS color
  string or R color name.

  **`go_violin_marker_line()`**: Sets the marker.line color. It accepts
  either a specific color or an array of numbers that are mapped to the
  colorscale relative to the max and min values of the array or relative
  to \`marker.line.cmin\` and \`marker.line.cmax\` if set. Color: a CSS
  color string or R color name.

  **`go_violin_meanline()`**: Sets the mean line color. Color: a CSS
  color string or R color name.

  **`go_violin_selected_marker()`**: Sets the marker color of selected
  points. Color: a CSS color string or R color name.

  **`go_violin_unselected_marker()`**: Sets the marker color of
  unselected points, applied only when a selection exists. Color: a CSS
  color string or R color name.

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

  **`go_violin_hoverlabel()`**: Sets the font used in hover labels.
  Named list or `go_violin_hoverlabel_font()` object.

  **`go_violin_legendgrouptitle()`**: Sets this legend group's title
  font. Named list or `go_violin_legendgrouptitle_font()` object.

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

  **`go_violin_hoverlabel_font()`**: HTML font family - the typeface
  that will be applied by the web browser. The web browser can only
  apply a font if it is available on the system where it runs. Provide
  multiple font families, separated by commas, to indicate the order in
  which to apply fonts if they aren't available. String, or a vector of
  these.

  **`go_violin_legendgrouptitle_font()`**: HTML font family - the
  typeface that will be applied by the web browser. The web browser can
  only apply a font if it is available on the system where it runs.
  Provide multiple font families, separated by commas, to indicate the
  order in which to apply fonts if they aren't available. String.

- lineposition:

  **`go_violin_hoverlabel_font()`**: Sets the kind of decoration line(s)
  with text, such as an "under", "over" or "through" as well as
  combinations e.g. "under+over", etc. Any combination of `"under"`,
  `"over"`, `"through"` joined with `"+"`, or one of `"none"`, or a
  vector of these.

  **`go_violin_legendgrouptitle_font()`**: Sets the kind of decoration
  line(s) with text, such as an "under", "over" or "through" as well as
  combinations e.g. "under+over", etc. Any combination of `"under"`,
  `"over"`, `"through"` joined with `"+"`, or one of `"none"`.

- shadow:

  **`go_violin_hoverlabel_font()`**: Sets the shape and color of the
  shadow behind text. "auto" places minimal shadow and applies contrast
  text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String, or a vector of these.

  **`go_violin_legendgrouptitle_font()`**: Sets the shape and color of
  the shadow behind text. "auto" places minimal shadow and applies
  contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String.

- size:

  **`go_violin_hoverlabel_font()`**: Number in the interval \[1, Inf\],
  or a vector of these.

  **`go_violin_legendgrouptitle_font()`**: Number in the interval \[1,
  Inf\].

  **`go_violin_marker()`**: Sets the marker size (in px). Number in the
  interval \[0, Inf\].

  **`go_violin_selected_marker()`**: Sets the marker size of selected
  points. Number in the interval \[0, Inf\].

  **`go_violin_unselected_marker()`**: Sets the marker size of
  unselected points, applied only when a selection exists. Number in the
  interval \[0, Inf\].

- style:

  **`go_violin_hoverlabel_font()`**: Sets whether a font should be
  styled with a normal or italic face from its family. One of
  `"normal"`, `"italic"`, or a vector of these.

  **`go_violin_legendgrouptitle_font()`**: Sets whether a font should be
  styled with a normal or italic face from its family. One of
  `"normal"`, `"italic"`.

- textcase:

  **`go_violin_hoverlabel_font()`**: Sets capitalization of text. It can
  be used to make text appear in all-uppercase or all-lowercase, or with
  each word capitalized. One of `"normal"`, `"word caps"`, `"upper"`,
  `"lower"`, or a vector of these.

  **`go_violin_legendgrouptitle_font()`**: Sets capitalization of text.
  It can be used to make text appear in all-uppercase or all-lowercase,
  or with each word capitalized. One of `"normal"`, `"word caps"`,
  `"upper"`, `"lower"`.

- variant:

  **`go_violin_hoverlabel_font()`**: Sets the variant of the font. One
  of `"normal"`, `"small-caps"`, `"all-small-caps"`,
  `"all-petite-caps"`, `"petite-caps"`, `"unicase"`, or a vector of
  these.

  **`go_violin_legendgrouptitle_font()`**: Sets the variant of the font.
  One of `"normal"`, `"small-caps"`, `"all-small-caps"`,
  `"all-petite-caps"`, `"petite-caps"`, `"unicase"`.

- weight:

  **`go_violin_hoverlabel_font()`**: Sets the weight (or boldness) of
  the font. Integer in the interval \[1, 1000\], or a vector of these.

  **`go_violin_legendgrouptitle_font()`**: Sets the weight (or boldness)
  of the font. Integer in the interval \[1, 1000\].

- angle:

  Sets the marker angle in respect to \`angleref\`. Angle in degrees.

- outliercolor:

  **`go_violin_marker()`**: Sets the color of the outlier sample points.
  Color: a CSS color string or R color name.

  **`go_violin_marker_line()`**: Sets the border line color of the
  outlier sample points. Defaults to marker.color Color: a CSS color
  string or R color name.

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

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_violin()` and the nested object constructors below create validated
graph objects (named lists). Every property is checked against the
plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
`add_violin()` creates an object and adds it to a figure.

Nested objects documented here:

- `go_violin_box()`:

  `violin.box`

- `go_violin_box_line()`:

  `violin.box.line`

- `go_violin_hoverlabel()`:

  `violin.hoverlabel`

- `go_violin_hoverlabel_font()`:

  `violin.hoverlabel.font`: Sets the font used in hover labels.

- `go_violin_legendgrouptitle()`:

  `violin.legendgrouptitle`

- `go_violin_legendgrouptitle_font()`:

  `violin.legendgrouptitle.font`: Sets this legend group's title font.

- `go_violin_line()`:

  `violin.line`

- `go_violin_marker()`:

  `violin.marker`

- `go_violin_marker_line()`:

  `violin.marker.line`

- `go_violin_meanline()`:

  `violin.meanline`

- `go_violin_selected()`:

  `violin.selected`

- `go_violin_selected_marker()`:

  `violin.selected.marker`

- `go_violin_unselected()`:

  `violin.unselected`

- `go_violin_unselected_marker()`:

  `violin.unselected.marker`

## See also

[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)

## Examples

``` r
go_violin(x = 1:3, y = c(2, 1, 3), marker_color = "red")
#> <go_violin>
#> {
#>   "type": "violin",
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
