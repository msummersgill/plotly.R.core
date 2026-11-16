# Layout ternary objects

Properties of `layout.ternary`.

## Usage

``` r
go_layout_ternary(
  arg = NULL,
  ...,
  aaxis = NULL,
  baxis = NULL,
  bgcolor = NULL,
  caxis = NULL,
  domain = NULL,
  sum = NULL,
  uirevision = NULL,
  skip_invalid = FALSE
)

go_layout_ternary_aaxis(
  arg = NULL,
  ...,
  color = NULL,
  dtick = NULL,
  exponentformat = NULL,
  gridcolor = NULL,
  griddash = NULL,
  gridwidth = NULL,
  hoverformat = NULL,
  labelalias = NULL,
  layer = NULL,
  linecolor = NULL,
  linewidth = NULL,
  min = NULL,
  minexponent = NULL,
  nticks = NULL,
  separatethousands = NULL,
  showexponent = NULL,
  showgrid = NULL,
  showline = NULL,
  showspikes = NULL,
  showticklabels = NULL,
  showtickprefix = NULL,
  showticksuffix = NULL,
  spikecolor = NULL,
  spikedash = NULL,
  spikemode = NULL,
  spikesnap = NULL,
  spikethickness = NULL,
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
  title = NULL,
  uirevision = NULL,
  skip_invalid = FALSE
)

go_layout_ternary_aaxis_tickfont(
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

go_layout_ternary_aaxis_tickformatstop(
  arg = NULL,
  ...,
  dtickrange = NULL,
  enabled = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  skip_invalid = FALSE
)

go_layout_ternary_aaxis_title(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_layout_ternary_aaxis_title_font(
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

go_layout_ternary_baxis(
  arg = NULL,
  ...,
  color = NULL,
  dtick = NULL,
  exponentformat = NULL,
  gridcolor = NULL,
  griddash = NULL,
  gridwidth = NULL,
  hoverformat = NULL,
  labelalias = NULL,
  layer = NULL,
  linecolor = NULL,
  linewidth = NULL,
  min = NULL,
  minexponent = NULL,
  nticks = NULL,
  separatethousands = NULL,
  showexponent = NULL,
  showgrid = NULL,
  showline = NULL,
  showspikes = NULL,
  showticklabels = NULL,
  showtickprefix = NULL,
  showticksuffix = NULL,
  spikecolor = NULL,
  spikedash = NULL,
  spikemode = NULL,
  spikesnap = NULL,
  spikethickness = NULL,
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
  title = NULL,
  uirevision = NULL,
  skip_invalid = FALSE
)

go_layout_ternary_baxis_tickfont(
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

go_layout_ternary_baxis_tickformatstop(
  arg = NULL,
  ...,
  dtickrange = NULL,
  enabled = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  skip_invalid = FALSE
)

go_layout_ternary_baxis_title(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_layout_ternary_baxis_title_font(
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

go_layout_ternary_caxis(
  arg = NULL,
  ...,
  color = NULL,
  dtick = NULL,
  exponentformat = NULL,
  gridcolor = NULL,
  griddash = NULL,
  gridwidth = NULL,
  hoverformat = NULL,
  labelalias = NULL,
  layer = NULL,
  linecolor = NULL,
  linewidth = NULL,
  min = NULL,
  minexponent = NULL,
  nticks = NULL,
  separatethousands = NULL,
  showexponent = NULL,
  showgrid = NULL,
  showline = NULL,
  showspikes = NULL,
  showticklabels = NULL,
  showtickprefix = NULL,
  showticksuffix = NULL,
  spikecolor = NULL,
  spikedash = NULL,
  spikemode = NULL,
  spikesnap = NULL,
  spikethickness = NULL,
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
  title = NULL,
  uirevision = NULL,
  skip_invalid = FALSE
)

go_layout_ternary_caxis_tickfont(
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

go_layout_ternary_caxis_tickformatstop(
  arg = NULL,
  ...,
  dtickrange = NULL,
  enabled = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  skip_invalid = FALSE
)

go_layout_ternary_caxis_title(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_layout_ternary_caxis_title_font(
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

go_layout_ternary_domain(
  arg = NULL,
  ...,
  column = NULL,
  row = NULL,
  x = NULL,
  y = NULL,
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

- aaxis:

  Named list or `go_layout_ternary_aaxis()` object.

- baxis:

  Named list or `go_layout_ternary_baxis()` object.

- bgcolor:

  Set the background color of the subplot Color: a CSS color string or R
  color name.

- caxis:

  Named list or `go_layout_ternary_caxis()` object.

- domain:

  Named list or `go_layout_ternary_domain()` object.

- sum:

  The number each triplet should sum to, and the maximum range of each
  axis Number in the interval \[0, Inf\].

- uirevision:

  **`go_layout_ternary()`**: Controls persistence of user-driven changes
  in axis \`min\` and \`title\`, if not overridden in the individual
  axes. Defaults to \`layout.uirevision\`. Any value.

  **`go_layout_ternary_aaxis()`, `go_layout_ternary_baxis()`,
  `go_layout_ternary_caxis()`**: Controls persistence of user-driven
  changes in axis \`min\`, and \`title\` if in \`editable: true\`
  configuration. Defaults to \`ternary\<N\>.uirevision\`. Any value.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- color:

  **`go_layout_ternary_aaxis()`, `go_layout_ternary_baxis()`,
  `go_layout_ternary_caxis()`**: Sets default for all colors associated
  with this axis all at once: line, font, tick, and grid colors. Grid
  color is lightened by blending this with the plot background
  Individual pieces can override this. Color: a CSS color string or R
  color name.

  **`go_layout_ternary_aaxis_tickfont()`,
  `go_layout_ternary_aaxis_title_font()`,
  `go_layout_ternary_baxis_tickfont()`,
  `go_layout_ternary_baxis_title_font()`,
  `go_layout_ternary_caxis_tickfont()`,
  `go_layout_ternary_caxis_title_font()`**: Color: a CSS color string or
  R color name.

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

- griddash:

  Sets the dash style of lines. Set to a dash type string ("solid",
  "dot", "dash", "longdash", "dashdot", or "longdashdot") or a dash
  length list in px (eg "5px,10px,2px,2px"). One of `"solid"`, `"dot"`,
  `"dash"`, `"longdash"`, `"dashdot"`, `"longdashdot"`, or a string
  matching
  `"^\\d+(\\.\\d+)?(px|%)?((,|\\s)\\s*\\d+(\\.\\d+)?(px|%)?)*$"`.

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

- layer:

  Sets the layer on which this axis is displayed. If "above traces",
  this axis is displayed above all the subplot's traces If "below
  traces", this axis is displayed below all the subplot's traces, but
  above the grid lines. Useful when used together with scatter-like
  traces with \`cliponaxis\` set to FALSE to show markers and/or text
  nodes above this axis. One of `"above traces"`, `"below traces"`.

- linecolor:

  Sets the axis line color. Color: a CSS color string or R color name.

- linewidth:

  Sets the width (in px) of the axis line. Number in the interval \[0,
  Inf\].

- min:

  The minimum value visible on this axis. The maximum is determined by
  the sum minus the minimum values of the other two axes. The full view
  corresponds to all the minima set to zero. Number in the interval \[0,
  Inf\].

- minexponent:

  Hide SI prefix for 10^n if \|n\| is below this number. This only has
  an effect when \`tickformat\` is "SI" or "B". Number in the interval
  \[0, Inf\].

- nticks:

  Specifies the maximum number of ticks for the particular axis. The
  actual number of ticks will be chosen automatically to be less than or
  equal to \`nticks\`. Has an effect only if \`tickmode\` is set to
  "auto". Integer in the interval \[1, Inf\].

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

- showspikes:

  Determines whether or not spikes (aka droplines) are drawn for this
  axis. Ternary spikes are accompanied by axis value labels formatted
  according to \`hoverformat\`. Logical.

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

  Sets the spike color. If undefined, will use the series color Color: a
  CSS color string or R color name.

- spikedash:

  Sets the dash style of lines. Set to a dash type string ("solid",
  "dot", "dash", "longdash", "dashdot", or "longdashdot") or a dash
  length list in px (eg "5px,10px,2px,2px"). One of `"solid"`, `"dot"`,
  `"dash"`, `"longdash"`, `"dashdot"`, `"longdashdot"`, or a string
  matching
  `"^\\d+(\\.\\d+)?(px|%)?((,|\\s)\\s*\\d+(\\.\\d+)?(px|%)?)*$"`.

- spikemode:

  Determines the drawing mode for the spike line If "toaxis", the line
  is drawn from the data point to the axis the series is plotted on. If
  "across", the line is drawn across the entire plot area, and
  supercedes "toaxis". If "marker", then a marker dot is drawn on the
  axis the series is plotted on Any combination of `"toaxis"`,
  `"across"`, `"marker"` joined with `"+"`.

- spikesnap:

  Determines whether spikelines are stuck to the cursor or to the
  closest datapoints. One of `"data"`, `"cursor"`, `"hovered data"`.

- spikethickness:

  Sets the spike line width in pixels. Number.

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

  **`go_layout_ternary_aaxis()`**: Sets the tick font. Named list or
  `go_layout_ternary_aaxis_tickfont()` object.

  **`go_layout_ternary_baxis()`**: Sets the tick font. Named list or
  `go_layout_ternary_baxis_tickfont()` object.

  **`go_layout_ternary_caxis()`**: Sets the tick font. Named list or
  `go_layout_ternary_caxis_tickfont()` object.

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

  **`go_layout_ternary_aaxis()`**: List of named lists or
  `go_layout_ternary_aaxis_tickformatstop()` objects.

  **`go_layout_ternary_baxis()`**: List of named lists or
  `go_layout_ternary_baxis_tickformatstop()` objects.

  **`go_layout_ternary_caxis()`**: List of named lists or
  `go_layout_ternary_caxis_tickformatstop()` objects.

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

- title:

  **`go_layout_ternary_aaxis()`**: String (the title text), named list
  or `go_layout_ternary_aaxis_title()` object.

  **`go_layout_ternary_baxis()`**: String (the title text), named list
  or `go_layout_ternary_baxis_title()` object.

  **`go_layout_ternary_caxis()`**: String (the title text), named list
  or `go_layout_ternary_caxis_title()` object.

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

- name:

  When used in a template, named items are created in the output figure
  in addition to any items the figure already has in this array. You can
  modify these items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

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

- font:

  **`go_layout_ternary_aaxis_title()`**: Sets this axis' title font.
  Named list or `go_layout_ternary_aaxis_title_font()` object.

  **`go_layout_ternary_baxis_title()`**: Sets this axis' title font.
  Named list or `go_layout_ternary_baxis_title_font()` object.

  **`go_layout_ternary_caxis_title()`**: Sets this axis' title font.
  Named list or `go_layout_ternary_caxis_title_font()` object.

- text:

  Sets the title of this axis. String.

- column:

  If there is a layout grid, use the domain for this column in the grid
  for this ternary subplot. Integer in the interval \[0, Inf\].

- row:

  If there is a layout grid, use the domain for this row in the grid for
  this ternary subplot. Integer in the interval \[0, Inf\].

- x:

  Sets the horizontal domain of this ternary subplot (in plot fraction).
  Vector or list of 2 element(s).

- y:

  Sets the vertical domain of this ternary subplot (in plot fraction).
  Vector or list of 2 element(s).

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_ternary()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

Nested objects documented here:

- `go_layout_ternary_aaxis()`:

  `layout.ternary.aaxis`

- `go_layout_ternary_aaxis_tickfont()`:

  `layout.ternary.aaxis.tickfont`: Sets the tick font.

- `go_layout_ternary_aaxis_tickformatstop()`:

  `layout.ternary.aaxis.tickformatstop`

- `go_layout_ternary_aaxis_title()`:

  `layout.ternary.aaxis.title`

- `go_layout_ternary_aaxis_title_font()`:

  `layout.ternary.aaxis.title.font`: Sets this axis' title font.

- `go_layout_ternary_baxis()`:

  `layout.ternary.baxis`

- `go_layout_ternary_baxis_tickfont()`:

  `layout.ternary.baxis.tickfont`: Sets the tick font.

- `go_layout_ternary_baxis_tickformatstop()`:

  `layout.ternary.baxis.tickformatstop`

- `go_layout_ternary_baxis_title()`:

  `layout.ternary.baxis.title`

- `go_layout_ternary_baxis_title_font()`:

  `layout.ternary.baxis.title.font`: Sets this axis' title font.

- `go_layout_ternary_caxis()`:

  `layout.ternary.caxis`

- `go_layout_ternary_caxis_tickfont()`:

  `layout.ternary.caxis.tickfont`: Sets the tick font.

- `go_layout_ternary_caxis_tickformatstop()`:

  `layout.ternary.caxis.tickformatstop`

- `go_layout_ternary_caxis_title()`:

  `layout.ternary.caxis.title`

- `go_layout_ternary_caxis_title_font()`:

  `layout.ternary.caxis.title.font`: Sets this axis' title font.

- `go_layout_ternary_domain()`:

  `layout.ternary.domain`

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
