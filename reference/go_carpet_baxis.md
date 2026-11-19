# Carpet baxis objects

The object for the `baxis` of a carpet trace
([`go_carpet()`](https://msummersgill.github.io/plotly.R.core/reference/go_carpet.md)).
`go_carpet_baxis()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_carpet_baxis(
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
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

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

- color:

  Sets default for all colors associated with this axis all at once:
  line, font, tick, and grid colors. Grid color is lightened by blending
  this with the plot background Individual pieces can override this.
  Color: a CSS color string or R color name.

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

  String (the title text), or a
  [`go_carpet_baxis_title()`](https://msummersgill.github.io/plotly.R.core/reference/go_carpet_baxis_title.md)
  object or named list, with properties `font`, `offset` and `text` (see
  [`go_carpet_baxis_title()`](https://msummersgill.github.io/plotly.R.core/reference/go_carpet_baxis_title.md)).

- type:

  Sets the axis type. By default, plotly attempts to determined the axis
  type by looking into the data of the traces that referenced the axis
  in question. One of `"-"`, `"linear"`, `"date"`, `"category"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_carpet_baxis` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
d <- expand.grid(a = c(4, 5, 6), b = c(1, 2, 3))
d$y <- d$a * d$b
d |>
  go_figure() |>
  add_carpet(
    a = ~a,
    b = ~b,
    y = ~y,
    baxis = go_carpet_baxis(color = "red")
  )
```
