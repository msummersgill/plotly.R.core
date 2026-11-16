# Layout smith objects

Properties of `layout.smith`.

## Usage

``` r
go_layout_smith(
  arg = NULL,
  ...,
  bgcolor = NULL,
  domain = NULL,
  imaginaryaxis = NULL,
  realaxis = NULL,
  skip_invalid = FALSE
)

go_layout_smith_domain(
  arg = NULL,
  ...,
  column = NULL,
  row = NULL,
  x = NULL,
  y = NULL,
  skip_invalid = FALSE
)

go_layout_smith_imaginaryaxis(
  arg = NULL,
  ...,
  color = NULL,
  gridcolor = NULL,
  griddash = NULL,
  gridwidth = NULL,
  hoverformat = NULL,
  labelalias = NULL,
  layer = NULL,
  linecolor = NULL,
  linewidth = NULL,
  showgrid = NULL,
  showline = NULL,
  showticklabels = NULL,
  showtickprefix = NULL,
  showticksuffix = NULL,
  tickcolor = NULL,
  tickfont = NULL,
  tickformat = NULL,
  ticklen = NULL,
  tickprefix = NULL,
  ticks = NULL,
  ticksuffix = NULL,
  tickvals = NULL,
  tickwidth = NULL,
  visible = NULL,
  skip_invalid = FALSE
)

go_layout_smith_imaginaryaxis_tickfont(
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

go_layout_smith_realaxis(
  arg = NULL,
  ...,
  color = NULL,
  gridcolor = NULL,
  griddash = NULL,
  gridwidth = NULL,
  hoverformat = NULL,
  labelalias = NULL,
  layer = NULL,
  linecolor = NULL,
  linewidth = NULL,
  showgrid = NULL,
  showline = NULL,
  showticklabels = NULL,
  showtickprefix = NULL,
  showticksuffix = NULL,
  side = NULL,
  tickangle = NULL,
  tickcolor = NULL,
  tickfont = NULL,
  tickformat = NULL,
  ticklen = NULL,
  tickprefix = NULL,
  ticks = NULL,
  ticksuffix = NULL,
  tickvals = NULL,
  tickwidth = NULL,
  visible = NULL,
  skip_invalid = FALSE
)

go_layout_smith_realaxis_tickfont(
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

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from (constructors). Named arguments take precedence.

- ...:

  Further properties, including nested properties in "magic underscore"
  form, e.g. `marker_size = 10` for `marker = list(size = 10)`. Property
  values may be one-sided formulas, evaluated in `data` for `add_*()`
  functions.

- bgcolor:

  Set the background color of the subplot Color: a CSS color string or R
  color name.

- domain:

  Named list or `go_layout_smith_domain()` object.

- imaginaryaxis:

  Named list or `go_layout_smith_imaginaryaxis()` object.

- realaxis:

  Named list or `go_layout_smith_realaxis()` object.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- column:

  If there is a layout grid, use the domain for this column in the grid
  for this smith subplot. Integer in the interval \[0, Inf\].

- row:

  If there is a layout grid, use the domain for this row in the grid for
  this smith subplot. Integer in the interval \[0, Inf\].

- x:

  Sets the horizontal domain of this smith subplot (in plot fraction).
  Vector or list of 2 element(s).

- y:

  Sets the vertical domain of this smith subplot (in plot fraction).
  Vector or list of 2 element(s).

- color:

  **`go_layout_smith_imaginaryaxis()`, `go_layout_smith_realaxis()`**:
  Sets default for all colors associated with this axis all at once:
  line, font, tick, and grid colors. Grid color is lightened by blending
  this with the plot background Individual pieces can override this.
  Color: a CSS color string or R color name.

  **`go_layout_smith_imaginaryaxis_tickfont()`,
  `go_layout_smith_realaxis_tickfont()`**: Color: a CSS color string or
  R color name.

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

- showgrid:

  Determines whether or not grid lines are drawn. If TRUE, the grid
  lines are drawn at every tick mark. Logical.

- showline:

  Determines whether or not a line bounding this axis is drawn. Logical.

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

- tickcolor:

  Sets the tick color. Color: a CSS color string or R color name.

- tickfont:

  **`go_layout_smith_imaginaryaxis()`**: Sets the tick font. Named list
  or `go_layout_smith_imaginaryaxis_tickfont()` object.

  **`go_layout_smith_realaxis()`**: Sets the tick font. Named list or
  `go_layout_smith_realaxis_tickfont()` object.

- tickformat:

  Sets the tick label formatting rule using d3 formatting mini-languages
  which are very similar to those in Python. For numbers, see:
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for dates
  see: https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format.
  We add two items to d3's date formatter: "%h" for half of the year as
  a decimal number as well as "%{n}f" for fractional seconds with n
  digits. For example, "2016-10-13 09:15:23.456" with tickformat
  "%H~%M~%S.%2f" would display "09~15~23.46" String.

- ticklen:

  Sets the tick length (in px). Number in the interval \[0, Inf\].

- tickprefix:

  Sets a tick label prefix. String.

- ticks:

  **`go_layout_smith_imaginaryaxis()`**: Determines whether ticks are
  drawn or not. If \*\*, this axis' ticks are not drawn. If "outside"
  ("inside"), this axis' are drawn outside (inside) the axis lines. One
  of `"outside"`, `"inside"`, `""`.

  **`go_layout_smith_realaxis()`**: Determines whether ticks are drawn
  or not. If \*\*, this axis' ticks are not drawn. If "top" ("bottom"),
  this axis' are drawn above (below) the axis line. One of `"top"`,
  `"bottom"`, `""`.

- ticksuffix:

  Sets a tick label suffix. String.

- tickvals:

  **`go_layout_smith_imaginaryaxis()`**: Sets the values at which ticks
  on this axis appear. Defaults to \`realaxis.tickvals\` plus the same
  as negatives and zero. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

  **`go_layout_smith_realaxis()`**: Sets the values at which ticks on
  this axis appear. Data array: a vector, factor, Date/POSIXct vector,
  matrix or list.

- tickwidth:

  Sets the tick width (in px). Number in the interval \[0, Inf\].

- visible:

  A single toggle to hide the axis while preserving interaction like
  dragging. Default is true when a cheater plot is present on the axis,
  otherwise false Logical.

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

- side:

  Determines on which side of real axis line the tick and tick labels
  appear. One of `"top"`, `"bottom"`.

- tickangle:

  Sets the angle of the tick labels with respect to the horizontal. For
  example, a \`tickangle\` of -90 draws the tick labels vertically.
  Angle in degrees.

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_smith()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

Nested objects documented here:

- `go_layout_smith_domain()`:

  `layout.smith.domain`

- `go_layout_smith_imaginaryaxis()`:

  `layout.smith.imaginaryaxis`

- `go_layout_smith_imaginaryaxis_tickfont()`:

  `layout.smith.imaginaryaxis.tickfont`: Sets the tick font.

- `go_layout_smith_realaxis()`:

  `layout.smith.realaxis`

- `go_layout_smith_realaxis_tickfont()`:

  `layout.smith.realaxis.tickfont`: Sets the tick font.

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
