# Indicator traces

An indicator is used to visualize a single \`value\` along with some
contextual information such as \`steps\` or a \`threshold\`, using a
combination of three visual elements: a number, a delta, and/or a gauge.
Deltas are taken with respect to a \`reference\`. Gauges can be either
angular or bullet (aka linear) gauges.

## Usage

``` r
add_indicator(fig, ...)

# Default S3 method
add_indicator(
  fig,
  ...,
  data = NULL,
  align = NULL,
  customdata = NULL,
  delta = NULL,
  domain = NULL,
  gauge = NULL,
  ids = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  meta = NULL,
  mode = NULL,
  name = NULL,
  number = NULL,
  title = NULL,
  uid = NULL,
  uirevision = NULL,
  value = NULL,
  visible = NULL,
  row = NULL,
  col = NULL,
  skip_invalid = FALSE
)

go_indicator(
  arg = NULL,
  ...,
  align = NULL,
  customdata = NULL,
  delta = NULL,
  domain = NULL,
  gauge = NULL,
  ids = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  meta = NULL,
  mode = NULL,
  name = NULL,
  number = NULL,
  title = NULL,
  uid = NULL,
  uirevision = NULL,
  value = NULL,
  visible = NULL,
  skip_invalid = FALSE
)

go_indicator_delta(
  arg = NULL,
  ...,
  decreasing = NULL,
  font = NULL,
  increasing = NULL,
  position = NULL,
  prefix = NULL,
  reference = NULL,
  relative = NULL,
  suffix = NULL,
  valueformat = NULL,
  skip_invalid = FALSE
)

go_indicator_delta_decreasing(
  arg = NULL,
  ...,
  color = NULL,
  symbol = NULL,
  skip_invalid = FALSE
)

go_indicator_delta_font(
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

go_indicator_delta_increasing(
  arg = NULL,
  ...,
  color = NULL,
  symbol = NULL,
  skip_invalid = FALSE
)

go_indicator_domain(
  arg = NULL,
  ...,
  column = NULL,
  row = NULL,
  x = NULL,
  y = NULL,
  skip_invalid = FALSE
)

go_indicator_gauge(
  arg = NULL,
  ...,
  axis = NULL,
  bar = NULL,
  bgcolor = NULL,
  bordercolor = NULL,
  borderwidth = NULL,
  shape = NULL,
  steps = NULL,
  threshold = NULL,
  skip_invalid = FALSE
)

go_indicator_gauge_axis(
  arg = NULL,
  ...,
  dtick = NULL,
  exponentformat = NULL,
  labelalias = NULL,
  minexponent = NULL,
  nticks = NULL,
  range = NULL,
  separatethousands = NULL,
  showexponent = NULL,
  showticklabels = NULL,
  showtickprefix = NULL,
  showticksuffix = NULL,
  tick0 = NULL,
  tickangle = NULL,
  tickcolor = NULL,
  tickfont = NULL,
  tickformat = NULL,
  tickformatstops = NULL,
  ticklabelstep = NULL,
  ticklen = NULL,
  tickmode = NULL,
  tickprefix = NULL,
  ticks = NULL,
  ticksuffix = NULL,
  ticktext = NULL,
  tickvals = NULL,
  tickwidth = NULL,
  visible = NULL,
  skip_invalid = FALSE
)

go_indicator_gauge_axis_tickfont(
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

go_indicator_gauge_axis_tickformatstop(
  arg = NULL,
  ...,
  dtickrange = NULL,
  enabled = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  skip_invalid = FALSE
)

go_indicator_gauge_bar(
  arg = NULL,
  ...,
  color = NULL,
  line = NULL,
  thickness = NULL,
  skip_invalid = FALSE
)

go_indicator_gauge_bar_line(
  arg = NULL,
  ...,
  color = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_indicator_gauge_step(
  arg = NULL,
  ...,
  color = NULL,
  line = NULL,
  name = NULL,
  range = NULL,
  templateitemname = NULL,
  thickness = NULL,
  skip_invalid = FALSE
)

go_indicator_gauge_step_line(
  arg = NULL,
  ...,
  color = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_indicator_gauge_threshold(
  arg = NULL,
  ...,
  line = NULL,
  thickness = NULL,
  value = NULL,
  skip_invalid = FALSE
)

go_indicator_gauge_threshold_line(
  arg = NULL,
  ...,
  color = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_indicator_legendgrouptitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_indicator_legendgrouptitle_font(
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

go_indicator_number(
  arg = NULL,
  ...,
  font = NULL,
  prefix = NULL,
  suffix = NULL,
  valueformat = NULL,
  skip_invalid = FALSE
)

go_indicator_number_font(
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

go_indicator_title(
  arg = NULL,
  ...,
  align = NULL,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_indicator_title_font(
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

- align:

  **`go_indicator()`**: Sets the horizontal alignment of the \`text\`
  within the box. Note that this attribute has no effect if an angular
  gauge is displayed: in this case, it is always centered One of
  `"left"`, `"center"`, `"right"`.

  **`go_indicator_title()`**: Sets the horizontal alignment of the
  title. It defaults to \`center\` except for bullet charts for which it
  defaults to right. One of `"left"`, `"center"`, `"right"`.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- delta:

  Named list or `go_indicator_delta()` object.

- domain:

  Named list or `go_indicator_domain()` object.

- gauge:

  The gauge of the Indicator plot. Named list or `go_indicator_gauge()`
  object.

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

- legendgrouptitle:

  Named list or `go_indicator_legendgrouptitle()` object.

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

  Determines how the value is displayed on the graph. \`number\`
  displays the value numerically in text. \`delta\` displays the
  difference to a reference value in text. Finally, \`gauge\` displays
  the value graphically on an axis. Any combination of `"number"`,
  `"delta"`, `"gauge"` joined with `"+"`.

- name:

  **`go_indicator()`**: Sets the trace name. The trace name appears as
  the legend item and on hover. String.

  **`go_indicator_gauge_axis_tickformatstop()`,
  `go_indicator_gauge_step()`**: When used in a template, named items
  are created in the output figure in addition to any items the figure
  already has in this array. You can modify these items in the output
  figure by making your own item with \`templateitemname\` matching this
  \`name\` alongside your modifications (including \`visible: false\` or
  \`enabled: false\` to hide it). Has no effect outside of a template.
  String.

- number:

  Named list or `go_indicator_number()` object.

- title:

  String (the title text), named list or `go_indicator_title()` object.

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

- value:

  **`go_indicator()`**: Sets the number to be displayed. Number.

  **`go_indicator_gauge_axis_tickformatstop()`**: string - dtickformat
  for described zoom level, the same as "tickformat" String.

  **`go_indicator_gauge_threshold()`**: Sets a treshold value drawn as a
  line. Number.

- visible:

  **`go_indicator()`**: Determines whether or not this trace is visible.
  If "legendonly", the trace is not drawn, but can appear as a legend
  item (provided that the legend itself is visible). One of
  `"legendonly"`, `TRUE`, `FALSE`.

  **`go_indicator_gauge_axis()`**: A single toggle to hide the axis
  while preserving interaction like dragging. Default is true when a
  cheater plot is present on the axis, otherwise false Logical.

- row:

  **`add_indicator()`**: Subplot grid row (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

  **`go_indicator_domain()`**: If there is a layout grid, use the domain
  for this row in the grid for this indicator trace. Integer in the
  interval \[0, Inf\].

- col:

  Subplot grid column (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from (constructors). Named arguments take precedence.

- decreasing:

  Named list or `go_indicator_delta_decreasing()` object.

- font:

  **`go_indicator_delta()`**: Set the font used to display the delta
  Named list or `go_indicator_delta_font()` object.

  **`go_indicator_legendgrouptitle()`**: Sets this legend group's title
  font. Named list or `go_indicator_legendgrouptitle_font()` object.

  **`go_indicator_number()`**: Set the font used to display main number
  Named list or `go_indicator_number_font()` object.

  **`go_indicator_title()`**: Set the font used to display the title
  Named list or `go_indicator_title_font()` object.

- increasing:

  Named list or `go_indicator_delta_increasing()` object.

- position:

  Sets the position of delta with respect to the number. One of `"top"`,
  `"bottom"`, `"left"`, `"right"`.

- prefix:

  **`go_indicator_delta()`**: Sets a prefix appearing before the delta.
  String.

  **`go_indicator_number()`**: Sets a prefix appearing before the
  number. String.

- reference:

  Sets the reference value to compute the delta. By default, it is set
  to the current value. Number.

- relative:

  Show relative change Logical.

- suffix:

  **`go_indicator_delta()`**: Sets a suffix appearing next to the delta.
  String.

  **`go_indicator_number()`**: Sets a suffix appearing next to the
  number. String.

- valueformat:

  Sets the value formatting rule using d3 formatting mini-languages
  which are very similar to those in Python. For numbers, see:
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format. String.

- color:

  **`go_indicator_delta_decreasing()`,
  `go_indicator_delta_increasing()`**: Sets the color for increasing
  value. Color: a CSS color string or R color name.

  **`go_indicator_delta_font()`, `go_indicator_gauge_axis_tickfont()`,
  `go_indicator_legendgrouptitle_font()`, `go_indicator_number_font()`,
  `go_indicator_title_font()`**: Color: a CSS color string or R color
  name.

  **`go_indicator_gauge_bar()`, `go_indicator_gauge_step()`**: Sets the
  background color of the arc. Color: a CSS color string or R color
  name.

  **`go_indicator_gauge_bar_line()`, `go_indicator_gauge_step_line()`**:
  Sets the color of the line enclosing each sector. Color: a CSS color
  string or R color name.

  **`go_indicator_gauge_threshold_line()`**: Sets the color of the
  threshold line. Color: a CSS color string or R color name.

- symbol:

  Sets the symbol to display for increasing value String.

- family:

  HTML font family - the typeface that will be applied by the web
  browser. The web browser can only apply a font if it is available on
  the system where it runs. Provide multiple font families, separated by
  commas, to indicate the order in which to apply fonts if they aren't
  available. String.

- lineposition:

  Sets the kind of decoration line(s) with text, such as an "under",
  "over" or "through" as well as combinations e.g. "under+over", etc.
  Any combination of `"under"`, `"over"`, `"through"` joined with `"+"`,
  or one of `"none"`.

- shadow:

  Sets the shape and color of the shadow behind text. "auto" places
  minimal shadow and applies contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String.

- size:

  Number in the interval \[1, Inf\].

- style:

  Sets whether a font should be styled with a normal or italic face from
  its family. One of `"normal"`, `"italic"`.

- textcase:

  Sets capitalization of text. It can be used to make text appear in
  all-uppercase or all-lowercase, or with each word capitalized. One of
  `"normal"`, `"word caps"`, `"upper"`, `"lower"`.

- variant:

  Sets the variant of the font. One of `"normal"`, `"small-caps"`,
  `"all-small-caps"`, `"all-petite-caps"`, `"petite-caps"`, `"unicase"`.

- weight:

  Sets the weight (or boldness) of the font. Integer in the interval
  \[1, 1000\].

- column:

  If there is a layout grid, use the domain for this column in the grid
  for this indicator trace. Integer in the interval \[0, Inf\].

- x:

  Sets the horizontal domain of this indicator trace (in plot fraction).
  Vector or list of 2 element(s).

- y:

  Sets the vertical domain of this indicator trace (in plot fraction).
  Vector or list of 2 element(s).

- axis:

  Named list or `go_indicator_gauge_axis()` object.

- bar:

  Set the appearance of the gauge's value Named list or
  `go_indicator_gauge_bar()` object.

- bgcolor:

  Sets the gauge background color. Color: a CSS color string or R color
  name.

- bordercolor:

  Sets the color of the border enclosing the gauge. Color: a CSS color
  string or R color name.

- borderwidth:

  Sets the width (in px) of the border enclosing the gauge. Number in
  the interval \[0, Inf\].

- shape:

  Set the shape of the gauge One of `"angular"`, `"bullet"`.

- steps:

  List of named lists or `go_indicator_gauge_step()` objects.

- threshold:

  Named list or `go_indicator_gauge_threshold()` object.

- dtick:

  Sets the step in-between ticks on this axis. Use with \`tick0\`. Must
  be a positive number, or special strings available to "log" and "date"
  axes. If the axis \`type\` is "log", then ticks are set every
  10^(n\*dtick) where n is the tick number. For example, to set a tick
  mark at 1, 10, 100, 1000, ... set dtick to 1. To set tick marks at 1,
  100, 10000, ... set dtick to 2. To set tick marks at 1, 5, 25, 125,
  625, 3125, ... set dtick to log_10(5), or 0.69897000433. "log" has
  several special values; "L\<f\>", where \`f\` is a positive number,
  gives ticks linearly spaced in value (but not position). For example
  \`tick0\` = 0.1, \`dtick\` = "L0.5" will put ticks at 0.1, 0.6, 1.1,
  1.6 etc. To show powers of 10 plus small digits between, use "D1" (all
  digits) or "D2" (only 2 and 5). \`tick0\` is ignored for "D1" and
  "D2". If the axis \`type\` is "date", then you must convert the time
  to milliseconds. For example, to set the interval between ticks to one
  day, set \`dtick\` to 86400000.0. "date" also has special values
  "M\<n\>" gives ticks spaced by a number of months. \`n\` must be a
  positive integer. To set ticks on the 15th of every third month, set
  \`tick0\` to "2000-01-15" and \`dtick\` to "M3". To set ticks every 4
  years, set \`dtick\` to "M48" Any value.

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

- minexponent:

  Hide SI prefix for 10^n if \|n\| is below this number. This only has
  an effect when \`tickformat\` is "SI" or "B". Number in the interval
  \[0, Inf\].

- nticks:

  Specifies the maximum number of ticks for the particular axis. The
  actual number of ticks will be chosen automatically to be less than or
  equal to \`nticks\`. Has an effect only if \`tickmode\` is set to
  "auto". Integer in the interval \[0, Inf\].

- range:

  Sets the range of this axis. Vector or list of 2 element(s).

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
  `go_indicator_gauge_axis_tickfont()` object.

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

  List of named lists or `go_indicator_gauge_axis_tickformatstop()`
  objects.

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

- line:

  **`go_indicator_gauge_bar()`**: Named list or
  `go_indicator_gauge_bar_line()` object.

  **`go_indicator_gauge_step()`**: Named list or
  `go_indicator_gauge_step_line()` object.

  **`go_indicator_gauge_threshold()`**: Named list or
  `go_indicator_gauge_threshold_line()` object.

- thickness:

  **`go_indicator_gauge_bar()`, `go_indicator_gauge_step()`**: Sets the
  thickness of the bar as a fraction of the total thickness of the
  gauge. Number in the interval \[0, 1\].

  **`go_indicator_gauge_threshold()`**: Sets the thickness of the
  threshold line as a fraction of the thickness of the gauge. Number in
  the interval \[0, 1\].

- width:

  **`go_indicator_gauge_bar_line()`, `go_indicator_gauge_step_line()`**:
  Sets the width (in px) of the line enclosing each sector. Number in
  the interval \[0, Inf\].

  **`go_indicator_gauge_threshold_line()`**: Sets the width (in px) of
  the threshold line. Number in the interval \[0, Inf\].

- text:

  **`go_indicator_legendgrouptitle()`**: Sets the title of the legend
  group. String.

  **`go_indicator_title()`**: Sets the title of this indicator. String.

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_indicator()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
`add_indicator()` creates an object and adds it to a figure.

Nested objects documented here:

- `go_indicator_delta()`:

  `indicator.delta`

- `go_indicator_delta_decreasing()`:

  `indicator.delta.decreasing`

- `go_indicator_delta_font()`:

  `indicator.delta.font`: Set the font used to display the delta

- `go_indicator_delta_increasing()`:

  `indicator.delta.increasing`

- `go_indicator_domain()`:

  `indicator.domain`

- `go_indicator_gauge()`:

  `indicator.gauge`: The gauge of the Indicator plot.

- `go_indicator_gauge_axis()`:

  `indicator.gauge.axis`

- `go_indicator_gauge_axis_tickfont()`:

  `indicator.gauge.axis.tickfont`: Sets the color bar's tick label font

- `go_indicator_gauge_axis_tickformatstop()`:

  `indicator.gauge.axis.tickformatstop`

- `go_indicator_gauge_bar()`:

  `indicator.gauge.bar`: Set the appearance of the gauge's value

- `go_indicator_gauge_bar_line()`:

  `indicator.gauge.bar.line`

- `go_indicator_gauge_step()`:

  `indicator.gauge.step`

- `go_indicator_gauge_step_line()`:

  `indicator.gauge.step.line`

- `go_indicator_gauge_threshold()`:

  `indicator.gauge.threshold`

- `go_indicator_gauge_threshold_line()`:

  `indicator.gauge.threshold.line`

- `go_indicator_legendgrouptitle()`:

  `indicator.legendgrouptitle`

- `go_indicator_legendgrouptitle_font()`:

  `indicator.legendgrouptitle.font`: Sets this legend group's title
  font.

- `go_indicator_number()`:

  `indicator.number`

- `go_indicator_number_font()`:

  `indicator.number.font`: Set the font used to display main number

- `go_indicator_title()`:

  `indicator.title`

- `go_indicator_title_font()`:

  `indicator.title.font`: Set the font used to display the title

## See also

[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)

## Examples

``` r
go_indicator()
#> <go_indicator>
#> {
#>   "type": "indicator"
#> }
#> 
```
