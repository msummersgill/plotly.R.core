# Scene axis objects

Used for `xaxis`, `yaxis`, `zaxis` in 3 places in the schema.
`go_scene_axis()` creates one; a named list with the same properties
works too.

## Usage

``` r
go_scene_axis(
  arg = NULL,
  ...,
  autorange = NULL,
  autorangeoptions = NULL,
  autotypenumbers = NULL,
  backgroundcolor = NULL,
  calendar = NULL,
  categoryarray = NULL,
  categoryorder = NULL,
  color = NULL,
  dtick = NULL,
  exponentformat = NULL,
  gridcolor = NULL,
  gridwidth = NULL,
  hoverformat = NULL,
  labelalias = NULL,
  linecolor = NULL,
  linewidth = NULL,
  maxallowed = NULL,
  minallowed = NULL,
  minexponent = NULL,
  mirror = NULL,
  nticks = NULL,
  range = NULL,
  rangemode = NULL,
  separatethousands = NULL,
  showaxeslabels = NULL,
  showbackground = NULL,
  showexponent = NULL,
  showgrid = NULL,
  showline = NULL,
  showspikes = NULL,
  showticklabels = NULL,
  showtickprefix = NULL,
  showticksuffix = NULL,
  spikecolor = NULL,
  spikesides = NULL,
  spikethickness = NULL,
  tick0 = NULL,
  tickangle = NULL,
  tickcolor = NULL,
  tickfont = NULL,
  tickformat = NULL,
  tickformatstops = NULL,
  ticklen = NULL,
  tickmode = NULL,
  tickprefix = NULL,
  ticks = NULL,
  ticksuffix = NULL,
  ticktext = NULL,
  tickvals = NULL,
  tickwidth = NULL,
  title = NULL,
  type = NULL,
  visible = NULL,
  zeroline = NULL,
  zerolinecolor = NULL,
  zerolinewidth = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- autorange:

  Determines whether or not the range of this axis is computed in
  relation to the input data. See \`rangemode\` for more info. If
  \`range\` is provided and it has a value for both the lower and upper
  bound, \`autorange\` is set to FALSE. Using "min" applies autorange
  only to set the minimum. Using "max" applies autorange only to set the
  maximum. Using "min reversed" applies autorange only to set the
  minimum on a reversed axis. Using "max reversed" applies autorange
  only to set the maximum on a reversed axis. Using "reversed" applies
  autorange on both ends and reverses the axis direction. One of
  `"reversed"`, `"min reversed"`, `"max reversed"`, `"min"`, `"max"`,
  `TRUE`, `FALSE`.

- autorangeoptions:

  A
  [`go_autorangeoptions()`](https://msummersgill.github.io/plotly.R.core/reference/go_autorangeoptions.md)
  object or named list, with properties `clipmax`, `clipmin`, `include`,
  `maxallowed` and `minallowed` (see
  [`go_autorangeoptions()`](https://msummersgill.github.io/plotly.R.core/reference/go_autorangeoptions.md)).

- autotypenumbers:

  Using "strict" a numeric string in trace data is not converted to a
  number. Using "convert types" a numeric string in trace data may be
  treated as a number during automatic axis \`type\` detection. Defaults
  to layout.autotypenumbers. One of `"convert types"`, `"strict"`.

- backgroundcolor:

  Sets the background color of this axis' wall. Color: a CSS color
  string or R color name.

- calendar:

  Sets the calendar system to use for \`range\` and \`tick0\` if this is
  a date axis. This does not set the calendar for interpreting data on
  this axis, that's specified in the trace or via the global
  \`layout.calendar\` One of `"chinese"`, `"coptic"`, `"discworld"`,
  `"ethiopian"`, `"gregorian"`, `"hebrew"`, `"islamic"`, `"jalali"`,
  `"julian"`, `"mayan"`, `"nanakshahi"`, `"nepali"`, `"persian"`,
  `"taiwan"`, `"thai"`, `"ummalqura"`.

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
  categories in \`categoryarray\`. Set \`categoryorder\` to "total
  ascending" or "total descending" if order should be determined by the
  numerical order of the values. Similarly, the order can be determined
  by the min, max, sum, mean, geometric mean or median of all the
  values. One of `"trace"`, `"category ascending"`,
  `"category descending"`, `"array"`, `"total ascending"`,
  `"total descending"`, `"min ascending"`, `"min descending"`,
  `"max ascending"`, `"max descending"`, `"sum ascending"`,
  `"sum descending"`, `"mean ascending"`, `"mean descending"`,
  `"geometric mean ascending"`, `"geometric mean descending"`,
  `"median ascending"`, `"median descending"`.

- color:

  Sets default for all colors associated with this axis all at once:
  line, font, tick, and grid colors. Grid color is lightened by blending
  this with the plot background Individual pieces can override this.
  Color: a CSS color string or R color name.

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

- gridcolor:

  Sets the color of the grid lines. Color: a CSS color string or R color
  name.

- gridwidth:

  Sets the width (in px) of the grid lines. Number in the interval \[0,
  Inf\].

- hoverformat:

  Sets the hover text formatting rule using d3 formatting mini-languages
  which are very similar to those in Python. For numbers, see:
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for dates
  see: https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format.
  We add two items to d3's date formatter: "%h" for half of the year as
  a decimal number as well as "%{n}f" for fractional seconds with n
  digits. For example, "2016-10-13 09:15:23.456" with tickformat
  "%H~%M~%S.%2f" would display "09~15~23.46" String.

- labelalias:

  Replacement text for specific tick or hover labels. For example using
  {US: 'USA', CA: 'Canada'} changes US to USA and CA to Canada. The
  labels we would have shown must match the keys exactly, after adding
  any tickprefix or ticksuffix. For negative numbers the minus sign
  symbol used (U+2212) is wider than the regular ascii dash. That means
  you need to use -1 instead of -1. labelalias can be used with any axis
  type, and both keys (if needed) and values (if desired) can include
  html-like tags or MathJax. Any value.

- linecolor:

  Sets the axis line color. Color: a CSS color string or R color name.

- linewidth:

  Sets the width (in px) of the axis line. Number in the interval \[0,
  Inf\].

- maxallowed:

  Determines the maximum range of this axis. Any value.

- minallowed:

  Determines the minimum range of this axis. Any value.

- minexponent:

  Hide SI prefix for 10^n if \|n\| is below this number. This only has
  an effect when \`tickformat\` is "SI" or "B". Number in the interval
  \[0, Inf\].

- mirror:

  Determines if the axis lines or/and ticks are mirrored to the opposite
  side of the plotting area. If TRUE, the axis lines are mirrored. If
  "ticks", the axis lines and ticks are mirrored. If FALSE, mirroring is
  disable. If "all", axis lines are mirrored on all shared-axes
  subplots. If "allticks", axis lines and ticks are mirrored on all
  shared-axes subplots. One of `"ticks"`, `"all"`, `"allticks"`, `TRUE`,
  `FALSE`.

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
  appears. Leaving either or both elements \`null\` impacts the default
  \`autorange\`. Vector or list of 2 element(s).

- rangemode:

  If "normal", the range is computed in relation to the extrema of the
  input data. If "tozero", the range extends to 0, regardless of the
  input data If "nonnegative", the range is non-negative, regardless of
  the input data. Applies only to linear axes. One of `"normal"`,
  `"tozero"`, `"nonnegative"`.

- separatethousands:

  If "true", even 4-digit integers are separated Logical.

- showaxeslabels:

  Sets whether or not this axis is labeled Logical.

- showbackground:

  Sets whether or not this axis' wall has a background color. Logical.

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

- showspikes:

  Sets whether or not spikes starting from data points to this axis'
  wall are shown on hover. Logical.

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

- spikecolor:

  Sets the color of the spikes. Color: a CSS color string or R color
  name.

- spikesides:

  Sets whether or not spikes extending from the projection data points
  to this axis' wall boundaries are shown on hover. Logical.

- spikethickness:

  Sets the thickness (in px) of the spikes. Number in the interval \[0,
  Inf\].

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

  Sets the tick font. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

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

  List, each element a
  [`go_tickformatstop()`](https://msummersgill.github.io/plotly.R.core/reference/go_tickformatstop.md)
  object or named list, with properties `dtickrange`, `enabled`, `name`,
  `templateitemname` and `value` (see
  [`go_tickformatstop()`](https://msummersgill.github.io/plotly.R.core/reference/go_tickformatstop.md)).

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

- title:

  String (the title text), or a
  [`go_scene_axis_title()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_axis_title.md)
  object or named list, with properties `font` and `text` (see
  [`go_scene_axis_title()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_axis_title.md)).

- type:

  Sets the axis type. By default, plotly attempts to determined the axis
  type by looking into the data of the traces that referenced the axis
  in question. One of `"-"`, `"linear"`, `"log"`, `"date"`,
  `"category"`.

- visible:

  A single toggle to hide the axis while preserving interaction like
  dragging. Default is true when a cheater plot is present on the axis,
  otherwise false Logical.

- zeroline:

  Determines whether or not a line is drawn at along the 0 value of this
  axis. If TRUE, the zero line is drawn on top of the grid lines.
  Logical.

- zerolinecolor:

  Sets the line color of the zero line. Color: a CSS color string or R
  color name.

- zerolinewidth:

  Sets the width (in px) of the zero line. Number.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_scene_axis` object (a named list).

## Details

These objects appear in 3 places in the plotly.js schema (properties
named `xaxis`, `yaxis`, `zaxis`), all with the same properties and
rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter3d(x = ~wt, y = ~hp, z = ~mpg) |>
  update_layout(scene = go_scene(xaxis = go_scene_axis(color = "red")))
```
