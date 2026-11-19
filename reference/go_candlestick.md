# Candlestick traces

The candlestick is a style of financial chart describing open, high, low
and close for a given \`x\` coordinate (most likely time). The boxes
represent the spread between the \`open\` and \`close\` values and the
lines represent the spread between the \`low\` and \`high\` values
Sample points where the close value is higher (lower) than the open
value are called increasing (decreasing). By default, increasing candles
are drawn in green whereas decreasing are drawn in red.

## Usage

``` r
go_candlestick(
  arg = NULL,
  ...,
  close = NULL,
  customdata = NULL,
  decreasing = NULL,
  high = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  increasing = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  line = NULL,
  low = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  open = NULL,
  selectedpoints = NULL,
  showlegend = NULL,
  text = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  whiskerwidth = NULL,
  x = NULL,
  xaxis = NULL,
  xcalendar = NULL,
  xhoverformat = NULL,
  xperiod = NULL,
  xperiod0 = NULL,
  xperiodalignment = NULL,
  yaxis = NULL,
  yhoverformat = NULL,
  zorder = NULL,
  skip_invalid = FALSE
)

add_candlestick(fig, ...)

# Default S3 method
add_candlestick(
  fig,
  ...,
  data = NULL,
  close = NULL,
  customdata = NULL,
  decreasing = NULL,
  high = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  increasing = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  line = NULL,
  low = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  open = NULL,
  selectedpoints = NULL,
  showlegend = NULL,
  text = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  whiskerwidth = NULL,
  x = NULL,
  xaxis = NULL,
  xcalendar = NULL,
  xhoverformat = NULL,
  xperiod = NULL,
  xperiod0 = NULL,
  xperiodalignment = NULL,
  yaxis = NULL,
  yhoverformat = NULL,
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

  Not used: properties must be named in full.

- close:

  Sets the close values. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- decreasing:

  A
  [`go_candlestick_decreasing()`](https://msummersgill.github.io/plotly.R.core/reference/go_candlestick_decreasing.md)
  object or named list, with properties `fillcolor` and `line` (see
  [`go_candlestick_decreasing()`](https://msummersgill.github.io/plotly.R.core/reference/go_candlestick_decreasing.md)).

- high:

  Sets the high values. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

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
  `bordercolor`, `font`, `namelength`, `showarrow` and `split` (see
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
  string has access to variables \`open\`, \`high\`, \`low\` and
  \`close\`. Anything contained in tag \`\<extra\>\` is displayed in the
  secondary box, for example \`\<extra\>%{fullData.name}\</extra\>\`. To
  hide the secondary box completely, use an empty tag
  \`\<extra\>\</extra\>\`. String, or a vector of these.

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

- increasing:

  A
  [`go_candlestick_increasing()`](https://msummersgill.github.io/plotly.R.core/reference/go_candlestick_increasing.md)
  object or named list, with properties `fillcolor` and `line` (see
  [`go_candlestick_increasing()`](https://msummersgill.github.io/plotly.R.core/reference/go_candlestick_increasing.md)).

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
  [`go_candlestick_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_candlestick_line.md)
  object or named list, with properties `width` (see
  [`go_candlestick_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_candlestick_line.md)).

- low:

  Sets the low values. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

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

- opacity:

  Sets the opacity of the trace. Number in the interval \[0, 1\].

- open:

  Sets the open values. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

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

  Sets hover text elements associated with each sample point. If a
  single string, the same string appears over all the data points. If an
  array of string, the items are mapped in order to this trace's sample
  points. String, or a vector of these.

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

  Determines whether or not this trace is visible. If "legendonly", the
  trace is not drawn, but can appear as a legend item (provided that the
  legend itself is visible). One of `"legendonly"`, `TRUE`, `FALSE`.

- whiskerwidth:

  Sets the width of the whiskers relative to the box width. For example,
  with 1, the whiskers are as wide as the box(es). Number in the
  interval \[0, 1\].

- x:

  Sets the x coordinates. If absent, linear coordinate will be
  generated. Data array: a vector, factor, Date/POSIXct vector, matrix
  or list.

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

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- fig:

  A `go_figure` object.

- data:

  A data frame in which formula properties (e.g. `x = ~col`,
  `marker = list(size = ~col)`,
  `marker = go_scatter_marker(size = ~col)`) are evaluated. Default: the
  data given to
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md).
  Only the evaluated values are added to the trace. A
  [`crosstalk::SharedData`](https://rdrr.io/pkg/crosstalk/man/SharedData.html)
  works the same way, and links the trace to its crosstalk group (see
  [`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)).

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

`go_candlestick()` creates a validated graph object (a named list).
`add_candlestick()` creates one and adds it to a figure.

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
d <- data.frame(day = 1:30, close = EuStockMarkets[1:30, "DAX"])
d$open <- c(d$close[1], head(d$close, -1))
d$high <- pmax(d$open, d$close) + 5
d$low <- pmin(d$open, d$close) - 5
d |>
  go_figure() |>
  add_candlestick(
    x = ~day,
    open = ~open,
    high = ~high,
    low = ~low,
    close = ~close
  )
```
