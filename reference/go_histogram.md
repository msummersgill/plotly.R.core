# Histogram traces

The sample data from which statistics are computed is set in \`x\` for
vertically spanning histograms and in \`y\` for horizontally spanning
histograms. Binning options are set \`xbins\` and \`ybins\` respectively
if no aggregation data is provided.

## Usage

``` r
add_histogram(fig, ...)

# Default S3 method
add_histogram(
  fig,
  ...,
  data = NULL,
  split = NULL,
  alignmentgroup = NULL,
  autobinx = NULL,
  autobiny = NULL,
  bingroup = NULL,
  cliponaxis = NULL,
  constraintext = NULL,
  cumulative = NULL,
  customdata = NULL,
  error_x = NULL,
  error_y = NULL,
  histfunc = NULL,
  histnorm = NULL,
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
  nbinsx = NULL,
  nbinsy = NULL,
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
  x = NULL,
  xaxis = NULL,
  xbins = NULL,
  xcalendar = NULL,
  xhoverformat = NULL,
  y = NULL,
  yaxis = NULL,
  ybins = NULL,
  ycalendar = NULL,
  yhoverformat = NULL,
  zorder = NULL,
  row = NULL,
  col = NULL,
  secondary_y = NULL,
  skip_invalid = FALSE
)

go_histogram(
  ...,
  alignmentgroup = NULL,
  autobinx = NULL,
  autobiny = NULL,
  bingroup = NULL,
  cliponaxis = NULL,
  constraintext = NULL,
  cumulative = NULL,
  customdata = NULL,
  error_x = NULL,
  error_y = NULL,
  histfunc = NULL,
  histnorm = NULL,
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
  nbinsx = NULL,
  nbinsy = NULL,
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
  x = NULL,
  xaxis = NULL,
  xbins = NULL,
  xcalendar = NULL,
  xhoverformat = NULL,
  y = NULL,
  yaxis = NULL,
  ybins = NULL,
  ycalendar = NULL,
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

  A data frame in which formula properties (e.g. `x = ~col`,
  `marker = go_histogram_marker(color = ~col)`) are evaluated. Default:
  the data given to
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

- autobinx:

  Obsolete: since v1.42 each bin attribute is auto-determined separately
  and \`autobinx\` is not needed. However, we accept \`autobinx: true\`
  or \`false\` and will update \`xbins\` accordingly before deleting
  \`autobinx\` from the trace. Logical.

- autobiny:

  Obsolete: since v1.42 each bin attribute is auto-determined separately
  and \`autobiny\` is not needed. However, we accept \`autobiny: true\`
  or \`false\` and will update \`ybins\` accordingly before deleting
  \`autobiny\` from the trace. Logical.

- bingroup:

  Set a group of histogram traces which will have compatible bin
  settings. Note that traces on the same subplot and with the same
  "orientation" under \`barmode\` "stack", "relative" and "group" are
  forced into the same bingroup, Using \`bingroup\`, traces under
  \`barmode\` "overlay" and on different axes (of the same axis type)
  can have compatible bin settings. Note that histogram and
  histogram2d\* trace can share the same \`bingroup\` String.

- cliponaxis:

  Determines whether the text nodes are clipped about the subplot axes.
  To show the text nodes above axis lines and tick labels, make sure to
  set \`xaxis.layer\` and \`yaxis.layer\` to "below traces". Logical.

- constraintext:

  Constrain the size of text inside or outside a bar to be no larger
  than the bar itself. One of `"inside"`, `"outside"`, `"both"`,
  `"none"`.

- cumulative:

  A
  [`go_histogram_cumulative()`](https://msummersgill.github.io/plotly.R.core/reference/go_histogram_cumulative.md)
  object or named list, with properties `currentbin`, `direction` and
  `enabled` (see
  [`go_histogram_cumulative()`](https://msummersgill.github.io/plotly.R.core/reference/go_histogram_cumulative.md)).

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

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

- histfunc:

  Specifies the binning function used for this histogram trace. If
  "count", the histogram values are computed by counting the number of
  values lying inside each bin. If "sum", "avg", "min", "max", the
  histogram values are computed using the sum, the average, the minimum
  or the maximum of the values lying inside each bin respectively. One
  of `"count"`, `"sum"`, `"avg"`, `"min"`, `"max"`.

- histnorm:

  Specifies the type of normalization used for this histogram trace. If
  \*", the span of each bar corresponds to the number of occurrences
  (i.e. the number of data points lying inside the bins). If "percent" /
  "probability", the span of each bar corresponds to the percentage /
  fraction of occurrences with respect to the total number of sample
  points (here, the sum of all bin HEIGHTS equals 100% / 1). If
  "density", the span of each bar corresponds to the number of
  occurrences in a bin divided by the size of the bin interval (here,
  the sum of all bin AREAS equals the total number of sample points). If
  "probability density\*, the area of each bar corresponds to the
  probability that an event will fall into the corresponding bin (here,
  the sum of all bin AREAS equals 1). One of `""`, `"percent"`,
  `"probability"`, `"density"`, `"probability density"`.

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
  string has access to variable \`binNumber\` Anything contained in tag
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

- insidetextanchor:

  Determines if texts are kept at center or start/end points in
  \`textposition\` "inside" mode. One of `"end"`, `"middle"`, `"start"`.

- insidetextfont:

  Sets the font used for \`text\` lying inside the bar. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

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

- marker:

  A
  [`go_histogram_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_histogram_marker.md)
  object or named list, with properties `autocolorscale`, `cauto`,
  `cmax`, `cmid`, `cmin`, `color`, `coloraxis`, `colorbar`,
  `colorscale`, `cornerradius`, `line`, `opacity`, `pattern`,
  `reversescale` and `showscale` (see
  [`go_histogram_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_histogram_marker.md)).

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

- nbinsx:

  Specifies the maximum number of desired bins. This value will be used
  in an algorithm that will decide the optimal bin size such that the
  histogram best visualizes the distribution of the data. Ignored if
  \`xbins.size\` is provided. Integer in the interval \[0, Inf\].

- nbinsy:

  Specifies the maximum number of desired bins. This value will be used
  in an algorithm that will decide the optimal bin size such that the
  histogram best visualizes the distribution of the data. Ignored if
  \`ybins.size\` is provided. Integer in the interval \[0, Inf\].

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

  Sets the font used for \`text\` lying outside the bar. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

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

- text:

  Sets hover text elements associated with each bar. If a single string,
  the same string appears over all bars. If an array of string, the
  items are mapped in order to the this trace's coordinates. String, or
  a vector of these.

- textangle:

  Sets the angle of the tick labels with respect to the bar. For
  example, a \`tickangle\` of -90 draws the tick labels vertically. With
  "auto" the texts may automatically be rotated to fit with the maximum
  size in bars. Angle in degrees.

- textfont:

  Sets the text font. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- textposition:

  Specifies the location of the \`text\`. "inside" positions \`text\`
  inside, next to the bar end (rotated and scaled if needed). "outside"
  positions \`text\` outside, next to the bar end (scaled if needed),
  unless there is another bar stacked on this one, then the text gets
  pushed inside. "auto" tries to position \`text\` inside the bar, but
  if the bar is too small and no bar is stacked on this one the text is
  moved outside. If "none", no text appears. One of `"inside"`,
  `"outside"`, `"auto"`, `"none"`.

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
  template string has access to variables \`label\` and \`value\`.
  String.

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

  Sets the sample data to be binned on the x axis. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

- xaxis:

  Sets a reference between this trace's x coordinates and a 2D cartesian
  x axis. If "x" (the default value), the x coordinates refer to
  \`layout.xaxis\`. If "x2", the x coordinates refer to
  \`layout.xaxis2\`, and so on. Subplot id: `"x"`, `"x2"`, `"x3"`, ....

- xbins:

  A
  [`go_bins()`](https://msummersgill.github.io/plotly.R.core/reference/go_bins.md)
  object or named list, with properties `end`, `size` and `start` (see
  [`go_bins()`](https://msummersgill.github.io/plotly.R.core/reference/go_bins.md)).

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

- y:

  Sets the sample data to be binned on the y axis. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

- yaxis:

  Sets a reference between this trace's y coordinates and a 2D cartesian
  y axis. If "y" (the default value), the y coordinates refer to
  \`layout.yaxis\`. If "y2", the y coordinates refer to
  \`layout.yaxis2\`, and so on. Subplot id: `"y"`, `"y2"`, `"y3"`, ....

- ybins:

  A
  [`go_bins()`](https://msummersgill.github.io/plotly.R.core/reference/go_bins.md)
  object or named list, with properties `end`, `size` and `start` (see
  [`go_bins()`](https://msummersgill.github.io/plotly.R.core/reference/go_bins.md)).

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

`go_histogram()` creates a validated graph object (a named list).
`add_histogram()` creates one and adds it to a figure.

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
  add_histogram(x = ~mpg)
```
