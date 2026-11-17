# Carpet traces

The data describing carpet axis layout is set in \`y\` and (optionally)
also \`x\`. If only \`y\` is present, \`x\` the plot is interpreted as a
cheater plot and is filled in using the \`y\` values. \`x\` and \`y\`
may either be 2D arrays matching with each dimension matching that of
\`a\` and \`b\`, or they may be 1D arrays with total length equal to
that of \`a\` and \`b\`.

## Usage

``` r
go_carpet(
  arg = NULL,
  ...,
  a = NULL,
  a0 = NULL,
  aaxis = NULL,
  b = NULL,
  b0 = NULL,
  baxis = NULL,
  carpet = NULL,
  cheaterslope = NULL,
  color = NULL,
  customdata = NULL,
  da = NULL,
  db = NULL,
  font = NULL,
  ids = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  x = NULL,
  xaxis = NULL,
  y = NULL,
  yaxis = NULL,
  zorder = NULL,
  skip_invalid = FALSE
)

go_carpet_aaxis(
  arg = NULL,
  ...,
  arraydtick = NULL,
  arraytick0 = NULL,
  autorange = NULL,
  autotypenumbers = NULL,
  categoryarray = NULL,
  categoryorder = NULL,
  cheatertype = NULL,
  color = NULL,
  dtick = NULL,
  endline = NULL,
  endlinecolor = NULL,
  endlinewidth = NULL,
  exponentformat = NULL,
  fixedrange = NULL,
  gridcolor = NULL,
  griddash = NULL,
  gridwidth = NULL,
  labelalias = NULL,
  labelpadding = NULL,
  labelprefix = NULL,
  labelsuffix = NULL,
  linecolor = NULL,
  linewidth = NULL,
  minexponent = NULL,
  minorgridcolor = NULL,
  minorgridcount = NULL,
  minorgriddash = NULL,
  minorgridwidth = NULL,
  nticks = NULL,
  range = NULL,
  rangemode = NULL,
  separatethousands = NULL,
  showexponent = NULL,
  showgrid = NULL,
  showline = NULL,
  showticklabels = NULL,
  showtickprefix = NULL,
  showticksuffix = NULL,
  smoothing = NULL,
  startline = NULL,
  startlinecolor = NULL,
  startlinewidth = NULL,
  tick0 = NULL,
  tickangle = NULL,
  tickfont = NULL,
  tickformat = NULL,
  tickformatstops = NULL,
  tickmode = NULL,
  tickprefix = NULL,
  ticksuffix = NULL,
  ticktext = NULL,
  tickvals = NULL,
  title = NULL,
  type = NULL,
  skip_invalid = FALSE
)

go_carpet_aaxis_tickfont(
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

go_carpet_aaxis_tickformatstop(
  arg = NULL,
  ...,
  dtickrange = NULL,
  enabled = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  skip_invalid = FALSE
)

go_carpet_aaxis_title(
  arg = NULL,
  ...,
  font = NULL,
  offset = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_carpet_aaxis_title_font(
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

go_carpet_baxis(
  arg = NULL,
  ...,
  arraydtick = NULL,
  arraytick0 = NULL,
  autorange = NULL,
  autotypenumbers = NULL,
  categoryarray = NULL,
  categoryorder = NULL,
  cheatertype = NULL,
  color = NULL,
  dtick = NULL,
  endline = NULL,
  endlinecolor = NULL,
  endlinewidth = NULL,
  exponentformat = NULL,
  fixedrange = NULL,
  gridcolor = NULL,
  griddash = NULL,
  gridwidth = NULL,
  labelalias = NULL,
  labelpadding = NULL,
  labelprefix = NULL,
  labelsuffix = NULL,
  linecolor = NULL,
  linewidth = NULL,
  minexponent = NULL,
  minorgridcolor = NULL,
  minorgridcount = NULL,
  minorgriddash = NULL,
  minorgridwidth = NULL,
  nticks = NULL,
  range = NULL,
  rangemode = NULL,
  separatethousands = NULL,
  showexponent = NULL,
  showgrid = NULL,
  showline = NULL,
  showticklabels = NULL,
  showtickprefix = NULL,
  showticksuffix = NULL,
  smoothing = NULL,
  startline = NULL,
  startlinecolor = NULL,
  startlinewidth = NULL,
  tick0 = NULL,
  tickangle = NULL,
  tickfont = NULL,
  tickformat = NULL,
  tickformatstops = NULL,
  tickmode = NULL,
  tickprefix = NULL,
  ticksuffix = NULL,
  ticktext = NULL,
  tickvals = NULL,
  title = NULL,
  type = NULL,
  skip_invalid = FALSE
)

go_carpet_baxis_tickfont(
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

go_carpet_baxis_tickformatstop(
  arg = NULL,
  ...,
  dtickrange = NULL,
  enabled = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  skip_invalid = FALSE
)

go_carpet_baxis_title(
  arg = NULL,
  ...,
  font = NULL,
  offset = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_carpet_baxis_title_font(
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

go_carpet_font(
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

go_carpet_legendgrouptitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_carpet_legendgrouptitle_font(
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

add_carpet(fig, ...)

# Default S3 method
add_carpet(
  fig,
  ...,
  data = NULL,
  a = NULL,
  a0 = NULL,
  aaxis = NULL,
  b = NULL,
  b0 = NULL,
  baxis = NULL,
  carpet = NULL,
  cheaterslope = NULL,
  color = NULL,
  customdata = NULL,
  da = NULL,
  db = NULL,
  font = NULL,
  ids = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  x = NULL,
  xaxis = NULL,
  y = NULL,
  yaxis = NULL,
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

- a:

  An array containing values of the first parameter value Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- a0:

  Alternate to \`a\`. Builds a linear space of a coordinates. Use with
  \`da\` where \`a0\` is the starting coordinate and \`da\` the step.
  Number.

- aaxis:

  Named list or `go_carpet_aaxis()` object.

- b:

  A two dimensional array of y coordinates at each carpet point. Data
  array: a vector, factor, Date/POSIXct vector, matrix or list.

- b0:

  Alternate to \`b\`. Builds a linear space of a coordinates. Use with
  \`db\` where \`b0\` is the starting coordinate and \`db\` the step.
  Number.

- baxis:

  Named list or `go_carpet_baxis()` object.

- carpet:

  An identifier for this carpet, so that \`scattercarpet\` and
  \`contourcarpet\` traces can specify a carpet plot on which they lie
  String.

- cheaterslope:

  The shift applied to each successive row of data in creating a cheater
  plot. Only used if \`x\` is been omitted. Number.

- color:

  **`go_carpet()`, `go_carpet_aaxis()`, `go_carpet_baxis()`**: Sets
  default for all colors associated with this axis all at once: line,
  font, tick, and grid colors. Grid color is lightened by blending this
  with the plot background Individual pieces can override this. Color: a
  CSS color string or R color name.

  **`go_carpet_aaxis_tickfont()`, `go_carpet_aaxis_title_font()`,
  `go_carpet_baxis_tickfont()`, `go_carpet_baxis_title_font()`,
  `go_carpet_font()`, `go_carpet_legendgrouptitle_font()`**: Color: a
  CSS color string or R color name.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- da:

  Sets the a coordinate step. See \`a0\` for more info. Number.

- db:

  Sets the b coordinate step. See \`b0\` for more info. Number.

- font:

  **`go_carpet()`**: The default font used for axis & tick labels on
  this carpet Named list or `go_carpet_font()` object.

  **`go_carpet_aaxis_title()`**: Sets this axis' title font. Named list
  or `go_carpet_aaxis_title_font()` object.

  **`go_carpet_baxis_title()`**: Sets this axis' title font. Named list
  or `go_carpet_baxis_title_font()` object.

  **`go_carpet_legendgrouptitle()`**: Sets this legend group's title
  font. Named list or `go_carpet_legendgrouptitle_font()` object.

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

  Named list or `go_carpet_legendgrouptitle()` object.

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

- name:

  **`go_carpet()`**: Sets the trace name. The trace name appears as the
  legend item and on hover. String.

  **`go_carpet_aaxis_tickformatstop()`,
  `go_carpet_baxis_tickformatstop()`**: When used in a template, named
  items are created in the output figure in addition to any items the
  figure already has in this array. You can modify these items in the
  output figure by making your own item with \`templateitemname\`
  matching this \`name\` alongside your modifications (including
  \`visible: false\` or \`enabled: false\` to hide it). Has no effect
  outside of a template. String.

- opacity:

  Sets the opacity of the trace. Number in the interval \[0, 1\].

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

- x:

  A two dimensional array of x coordinates at each carpet point. If
  omitted, the plot is a cheater plot and the xaxis is hidden by
  default. Data array: a vector, factor, Date/POSIXct vector, matrix or
  list.

- xaxis:

  Sets a reference between this trace's x coordinates and a 2D cartesian
  x axis. If "x" (the default value), the x coordinates refer to
  \`layout.xaxis\`. If "x2", the x coordinates refer to
  \`layout.xaxis2\`, and so on. Subplot id: `"x"`, `"x2"`, `"x3"`, ....

- y:

  A two dimensional array of y coordinates at each carpet point. Data
  array: a vector, factor, Date/POSIXct vector, matrix or list.

- yaxis:

  Sets a reference between this trace's y coordinates and a 2D cartesian
  y axis. If "y" (the default value), the y coordinates refer to
  \`layout.yaxis\`. If "y2", the y coordinates refer to
  \`layout.yaxis2\`, and so on. Subplot id: `"y"`, `"y2"`, `"y3"`, ....

- zorder:

  Sets the layer on which this trace is displayed, relative to other SVG
  traces on the same subplot. SVG traces with higher \`zorder\` appear
  in front of those with lower \`zorder\`. Integer.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- arraydtick:

  The stride between grid lines along the axis Integer in the interval
  \[1, Inf\].

- arraytick0:

  The starting index of grid lines along the axis Integer in the
  interval \[0, Inf\].

- autorange:

  Determines whether or not the range of this axis is computed in
  relation to the input data. See \`rangemode\` for more info. If
  \`range\` is provided, then \`autorange\` is set to FALSE. One of
  `"reversed"`, `TRUE`, `FALSE`.

- autotypenumbers:

  Using "strict" a numeric string in trace data is not converted to a
  number. Using "convert types" a numeric string in trace data may be
  treated as a number during automatic axis \`type\` detection. Defaults
  to layout.autotypenumbers. One of `"convert types"`, `"strict"`.

- categoryarray:

  Sets the order in which categories on this axis appear. Only has an
  effect if \`categoryorder\` is set to "array". Used with
  \`categoryorder\`. Data array: a vector, factor, Date/POSIXct vector,
  matrix or list.

- categoryorder:

  Specifies the ordering logic for the case of categorical variables. By
  default, plotly uses "trace", which specifies the order that is
  present in the data supplied. Set \`categoryorder\` to "category
  ascending" or "category descending" if order should be determined by
  the alphanumerical order of the category names. Set \`categoryorder\`
  to "array" to derive the ordering from the attribute
  \`categoryarray\`. If a category is not found in the \`categoryarray\`
  array, the sorting behavior for that attribute will be identical to
  the "trace" mode. The unspecified categories will follow the
  categories in \`categoryarray\`. One of `"trace"`,
  `"category ascending"`, `"category descending"`, `"array"`.

- cheatertype:

  One of `"index"`, `"value"`.

- dtick:

  The stride between grid lines along the axis Number in the interval
  \[0, Inf\].

- endline:

  Determines whether or not a line is drawn at along the final value of
  this axis. If TRUE, the end line is drawn on top of the grid lines.
  Logical.

- endlinecolor:

  Sets the line color of the end line. Color: a CSS color string or R
  color name.

- endlinewidth:

  Sets the width (in px) of the end line. Number.

- exponentformat:

  Determines a formatting rule for the tick exponents. For example,
  consider the number 1,000,000,000. If "none", it appears as
  1,000,000,000. If "e", 1e+9. If "E", 1E+9. If "power", 1x10^9 (with 9
  in a super script). If "SI", 1G. If "B", 1B. One of `"none"`, `"e"`,
  `"E"`, `"power"`, `"SI"`, `"B"`, `"SI extended"`.

- fixedrange:

  Determines whether or not this axis is zoom-able. If true, then zoom
  is disabled. Logical.

- gridcolor:

  Sets the axis line color. Color: a CSS color string or R color name.

- griddash:

  Sets the dash style of lines. Set to a dash type string ("solid",
  "dot", "dash", "longdash", "dashdot", or "longdashdot") or a dash
  length list in px (eg "5px,10px,2px,2px"). One of `"solid"`, `"dot"`,
  `"dash"`, `"longdash"`, `"dashdot"`, `"longdashdot"`, or a string
  matching
  `"^\\d+(\\.\\d+)?(px|%)?((,|\\s)\\s*\\d+(\\.\\d+)?(px|%)?)*$"`.

- gridwidth:

  Sets the width (in px) of the axis line. Number in the interval \[0,
  Inf\].

- labelalias:

  Replacement text for specific tick or hover labels. For example using
  {US: 'USA', CA: 'Canada'} changes US to USA and CA to Canada. The
  labels we would have shown must match the keys exactly, after adding
  any tickprefix or ticksuffix. For negative numbers the minus sign
  symbol used (U+2212) is wider than the regular ascii dash. That means
  you need to use -1 instead of -1. labelalias can be used with any axis
  type, and both keys (if needed) and values (if desired) can include
  html-like tags or MathJax. Any value.

- labelpadding:

  Extra padding between label and the axis Integer.

- labelprefix:

  Sets a axis label prefix. String.

- labelsuffix:

  Sets a axis label suffix. String.

- linecolor:

  Sets the axis line color. Color: a CSS color string or R color name.

- linewidth:

  Sets the width (in px) of the axis line. Number in the interval \[0,
  Inf\].

- minexponent:

  Hide SI prefix for 10^n if \|n\| is below this number Number in the
  interval \[0, Inf\].

- minorgridcolor:

  Sets the color of the grid lines. Color: a CSS color string or R color
  name.

- minorgridcount:

  Sets the number of minor grid ticks per major grid tick Integer in the
  interval \[0, Inf\].

- minorgriddash:

  Sets the dash style of lines. Set to a dash type string ("solid",
  "dot", "dash", "longdash", "dashdot", or "longdashdot") or a dash
  length list in px (eg "5px,10px,2px,2px"). One of `"solid"`, `"dot"`,
  `"dash"`, `"longdash"`, `"dashdot"`, `"longdashdot"`, or a string
  matching
  `"^\\d+(\\.\\d+)?(px|%)?((,|\\s)\\s*\\d+(\\.\\d+)?(px|%)?)*$"`.

- minorgridwidth:

  Sets the width (in px) of the grid lines. Number in the interval \[0,
  Inf\].

- nticks:

  Specifies the maximum number of ticks for the particular axis. The
  actual number of ticks will be chosen automatically to be less than or
  equal to \`nticks\`. Has an effect only if \`tickmode\` is set to
  "auto". Integer in the interval \[0, Inf\].

- range:

  Sets the range of this axis. If the axis \`type\` is "log", then you
  must take the log of your desired range (e.g. to set the range from 1
  to 100, set the range from 0 to 2). If the axis \`type\` is "date", it
  should be date strings, like date data, though Date objects and unix
  milliseconds will be accepted and converted to strings. If the axis
  \`type\` is "category", it should be numbers, using the scale where
  each category is assigned a serial number from zero in the order it
  appears. Vector or list of 2 element(s).

- rangemode:

  If "normal", the range is computed in relation to the extrema of the
  input data. If "tozero", the range extends to 0, regardless of the
  input data If "nonnegative", the range is non-negative, regardless of
  the input data. One of `"normal"`, `"tozero"`, `"nonnegative"`.

- separatethousands:

  If "true", even 4-digit integers are separated Logical.

- showexponent:

  If "all", all exponents are shown besides their significands. If
  "first", only the exponent of the first tick is shown. If "last", only
  the exponent of the last tick is shown. If "none", no exponents
  appear. One of `"all"`, `"first"`, `"last"`, `"none"`.

- showgrid:

  Determines whether or not grid lines are drawn. If TRUE, the grid
  lines are drawn at every tick mark. Logical.

- showline:

  Determines whether or not a line bounding this axis is drawn. Logical.

- showticklabels:

  Determines whether axis labels are drawn on the low side, the high
  side, both, or neither side of the axis. One of `"start"`, `"end"`,
  `"both"`, `"none"`.

- showtickprefix:

  If "all", all tick labels are displayed with a prefix. If "first",
  only the first tick is displayed with a prefix. If "last", only the
  last tick is displayed with a suffix. If "none", tick prefixes are
  hidden. One of `"all"`, `"first"`, `"last"`, `"none"`.

- showticksuffix:

  Same as \`showtickprefix\` but for tick suffixes. One of `"all"`,
  `"first"`, `"last"`, `"none"`.

- smoothing:

  Number in the interval \[0, 1.3\].

- startline:

  Determines whether or not a line is drawn at along the starting value
  of this axis. If TRUE, the start line is drawn on top of the grid
  lines. Logical.

- startlinecolor:

  Sets the line color of the start line. Color: a CSS color string or R
  color name.

- startlinewidth:

  Sets the width (in px) of the start line. Number.

- tick0:

  The starting index of grid lines along the axis Number in the interval
  \[0, Inf\].

- tickangle:

  Sets the angle of the tick labels with respect to the horizontal. For
  example, a \`tickangle\` of -90 draws the tick labels vertically.
  Angle in degrees.

- tickfont:

  **`go_carpet_aaxis()`**: Sets the tick font. Named list or
  `go_carpet_aaxis_tickfont()` object.

  **`go_carpet_baxis()`**: Sets the tick font. Named list or
  `go_carpet_baxis_tickfont()` object.

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

  **`go_carpet_aaxis()`**: List of named lists or
  `go_carpet_aaxis_tickformatstop()` objects.

  **`go_carpet_baxis()`**: List of named lists or
  `go_carpet_baxis_tickformatstop()` objects.

- tickmode:

  One of `"linear"`, `"array"`.

- tickprefix:

  Sets a tick label prefix. String.

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

- title:

  **`go_carpet_aaxis()`**: String (the title text), named list or
  `go_carpet_aaxis_title()` object.

  **`go_carpet_baxis()`**: String (the title text), named list or
  `go_carpet_baxis_title()` object.

- type:

  Sets the axis type. By default, plotly attempts to determined the axis
  type by looking into the data of the traces that referenced the axis
  in question. One of `"-"`, `"linear"`, `"date"`, `"category"`.

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

- value:

  string - dtickformat for described zoom level, the same as
  "tickformat" String.

- offset:

  An additional amount by which to offset the title from the tick
  labels, given in pixels. Number.

- text:

  **`go_carpet_aaxis_title()`, `go_carpet_baxis_title()`**: Sets the
  title of this axis. String.

  **`go_carpet_legendgrouptitle()`**: Sets the title of the legend
  group. String.

- fig:

  A `go_figure` object.

- data:

  A data frame in which formula properties (e.g. `x = ~col`,
  `marker_size = ~col`) are evaluated. Default: the data given to
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

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_carpet()` and the nested object constructors below create validated
graph objects (named lists). Every property is checked against the
plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
`add_carpet()` creates an object and adds it to a figure.

Nested objects documented here:

- `go_carpet_aaxis()`:

  `carpet.aaxis`

- `go_carpet_aaxis_tickfont()`:

  `carpet.aaxis.tickfont`: Sets the tick font.

- `go_carpet_aaxis_tickformatstop()`:

  `carpet.aaxis.tickformatstop`

- `go_carpet_aaxis_title()`:

  `carpet.aaxis.title`

- `go_carpet_aaxis_title_font()`:

  `carpet.aaxis.title.font`: Sets this axis' title font.

- `go_carpet_baxis()`:

  `carpet.baxis`

- `go_carpet_baxis_tickfont()`:

  `carpet.baxis.tickfont`: Sets the tick font.

- `go_carpet_baxis_tickformatstop()`:

  `carpet.baxis.tickformatstop`

- `go_carpet_baxis_title()`:

  `carpet.baxis.title`

- `go_carpet_baxis_title_font()`:

  `carpet.baxis.title.font`: Sets this axis' title font.

- `go_carpet_font()`:

  `carpet.font`: The default font used for axis & tick labels on this
  carpet

- `go_carpet_legendgrouptitle()`:

  `carpet.legendgrouptitle`

- `go_carpet_legendgrouptitle_font()`:

  `carpet.legendgrouptitle.font`: Sets this legend group's title font.

## See also

[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)

## Examples

``` r
go_carpet(x = 1:3, y = c(2, 1, 3))
#> <go_carpet>
#> {
#>   "type": "carpet",
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
