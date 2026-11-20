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
  split = NULL,
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
```

## Arguments

- fig:

  A `go_figure` object.

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- data:

  A data frame in which formula properties (e.g. `x = ~col`,
  `marker = go_scatter_marker(color = ~col)`) are evaluated. Default:
  the data given to
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md).
  Only the evaluated values are added to the trace. A
  [`crosstalk::SharedData`](https://rdrr.io/pkg/crosstalk/man/SharedData.html)
  works the same way, and links the trace to its crosstalk group (see
  [`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)).

- split:

  A column (`~col`) or vector, one value per row of the data: one trace
  is added per value, named after it. Colour properties given a discrete
  column (a factor, character or logical, e.g.
  `marker = go_scatter_marker(color = ~group)`) split the data the same
  way, each trace getting its own colour: evenly spaced viridis colours
  for an ordered factor, otherwise the figure's colorway.

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

  A
  [`go_error_bar()`](https://msummersgill.github.io/plotly.R.core/reference/go_error_bar.md)
  object or named list, with properties `array`, `arrayminus`, `color`,
  `copy_ystyle`, `symmetric`, `thickness`, `traceref`, `tracerefminus`,
  `type`, `value`, `valueminus`, `visible` and `width` (see
  [`go_error_bar()`](https://msummersgill.github.io/plotly.R.core/reference/go_error_bar.md)).

- error_y:

  A
  [`go_error_bar()`](https://msummersgill.github.io/plotly.R.core/reference/go_error_bar.md)
  object or named list, with properties `array`, `arrayminus`, `color`,
  `symmetric`, `thickness`, `traceref`, `tracerefminus`, `type`,
  `value`, `valueminus`, `visible` and `width` (see
  [`go_error_bar()`](https://msummersgill.github.io/plotly.R.core/reference/go_error_bar.md)).

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
  A
  [`go_scatter_fillgradient()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter_fillgradient.md)
  object or named list, with properties `colorscale`, `start`, `stop`
  and `type` (see
  [`go_scatter_fillgradient()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter_fillgradient.md)).

- fillpattern:

  Sets the pattern within the marker. A
  [`go_pattern()`](https://msummersgill.github.io/plotly.R.core/reference/go_pattern.md)
  object or named list, with properties `bgcolor`, `fgcolor`,
  `fgopacity`, `fillmode`, `path`, `shape`, `size` and `solidity` (see
  [`go_pattern()`](https://msummersgill.github.io/plotly.R.core/reference/go_pattern.md)).

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

  A
  [`go_hoverlabel()`](https://msummersgill.github.io/plotly.R.core/reference/go_hoverlabel.md)
  object or named list, with properties `align`, `bgcolor`,
  `bordercolor`, `font`, `namelength` and `showarrow` (see
  [`go_hoverlabel()`](https://msummersgill.github.io/plotly.R.core/reference/go_hoverlabel.md)).

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
  [`go_scatter_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter_line.md)
  object or named list, with properties `backoff`, `color`, `dash`,
  `shape`, `simplify`, `smoothing` and `width` (see
  [`go_scatter_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter_line.md)).

- marker:

  A
  [`go_scatter_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter_marker.md)
  object or named list, with properties `angle`, `angleref`,
  `autocolorscale`, `cauto`, `cmax`, `cmid`, `cmin`, `color`,
  `coloraxis`, `colorbar`, `colorscale`, `gradient` and 11 more (see
  [`go_scatter_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter_marker.md)).

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

  Sets the trace name. The trace name appears as the legend item and on
  hover. String.

- offsetgroup:

  Set several traces linked to the same position axis or matching axes
  to the same offsetgroup where bars of the same position coordinate
  will line up. String.

- opacity:

  Sets the opacity of the trace. Number in the interval \[0, 1\].

- orientation:

  Only relevant in the following cases: 1. when \`scattermode\` is set
  to "group". 2. when \`stackgroup\` is used, and only the first
  \`orientation\` found in the \`stackgroup\` will be used - including
  if \`visible\` is "legendonly" but not if it is \`false\`. Sets the
  stacking direction. With "v" ("h"), the y (x) values of subsequent
  traces are added. Also affects the default value of \`fill\`. One of
  `"v"`, `"h"`.

- selected:

  A
  [`go_selected()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected.md)
  object or named list, with properties `marker` and `textfont` (see
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

  Sets text elements associated with each (x,y) pair. If a single
  string, the same string appears over all the data points. If an array
  of string, the items are mapped in order to the this trace's (x,y)
  coordinates. If trace \`hoverinfo\` contains a "text" flag and
  "hovertext" is not set, these elements will be seen in the hover
  labels. String, or a vector of these.

- textfont:

  Sets the text font. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

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

  A
  [`go_unselected()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected.md)
  object or named list, with properties `marker` and `textfont` (see
  [`go_unselected()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected.md)).

- visible:

  Determines whether or not this trace is visible. If "legendonly", the
  trace is not drawn, but can appear as a legend item (provided that the
  legend itself is visible). One of `"legendonly"`, `TRUE`, `FALSE`.

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

## Value

`go_*()` functions return a graph object; `add_*()` functions return the
modified figure.

## Details

`go_scatter()` creates a validated graph object (a named list).
`add_scatter()` creates one and adds it to a figure.

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
  add_scatter(x = ~wt, y = ~mpg, mode = "markers")
```
