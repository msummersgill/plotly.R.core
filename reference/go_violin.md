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
  split = NULL,
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
```

## Arguments

- fig:

  A `go_figure` object.

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

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

- alignmentgroup:

  Set several traces linked to the same position axis or matching axes
  to the same alignmentgroup. This controls whether bars compute their
  positional range dependently or independently. String.

- bandwidth:

  Sets the bandwidth used to compute the kernel density estimate. By
  default, the bandwidth is determined by Silverman's rule of thumb.
  Number in the interval \[0, Inf\].

- box:

  A
  [`go_violin_box()`](https://msummersgill.github.io/plotly.R.core/reference/go_violin_box.md)
  object or named list, with properties `fillcolor`, `line`, `visible`
  and `width` (see
  [`go_violin_box()`](https://msummersgill.github.io/plotly.R.core/reference/go_violin_box.md)).

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

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
  [`go_violin_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_violin_line.md)
  object or named list, with properties `color` and `width` (see
  [`go_violin_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_violin_line.md)).

- marker:

  A
  [`go_violin_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_violin_marker.md)
  object or named list, with properties `angle`, `color`, `line`,
  `opacity`, `outliercolor`, `size` and `symbol` (see
  [`go_violin_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_violin_marker.md)).

- meanline:

  A
  [`go_violin_meanline()`](https://msummersgill.github.io/plotly.R.core/reference/go_violin_meanline.md)
  object or named list, with properties `color`, `visible` and `width`
  (see
  [`go_violin_meanline()`](https://msummersgill.github.io/plotly.R.core/reference/go_violin_meanline.md)).

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

  Sets the opacity of the trace. Number in the interval \[0, 1\].

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

- visible:

  Determines whether or not this trace is visible. If "legendonly", the
  trace is not drawn, but can appear as a legend item (provided that the
  legend itself is visible). One of `"legendonly"`, `TRUE`, `FALSE`.

- width:

  Sets the width of the violin in data coordinates. If 0 (default value)
  the width is automatically selected based on the positions of other
  violin traces in the same subplot. Number in the interval \[0, Inf\].

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

## Value

`go_*()` functions return a graph object; `add_*()` functions return the
modified figure.

## Details

`go_violin()` creates a validated graph object (a named list).
`add_violin()` creates one and adds it to a figure.

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
  add_violin(x = ~factor(cyl), y = ~mpg)
```
