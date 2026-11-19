# Layout smith imaginaryaxis objects

The object for the layout's `smith.imaginaryaxis`
([`go_smith()`](https://msummersgill.github.io/plotly.R.core/reference/go_smith.md)).
`go_smith_imaginaryaxis()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_smith_imaginaryaxis(
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
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- color:

  Sets default for all colors associated with this axis all at once:
  line, font, tick, and grid colors. Grid color is lightened by blending
  this with the plot background Individual pieces can override this.
  Color: a CSS color string or R color name.

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

- ticklen:

  Sets the tick length (in px). Number in the interval \[0, Inf\].

- tickprefix:

  Sets a tick label prefix. String.

- ticks:

  Determines whether ticks are drawn or not. If \*\*, this axis' ticks
  are not drawn. If "outside" ("inside"), this axis' are drawn outside
  (inside) the axis lines. One of `"outside"`, `"inside"`, `""`.

- ticksuffix:

  Sets a tick label suffix. String.

- tickvals:

  Sets the values at which ticks on this axis appear. Defaults to
  \`realaxis.tickvals\` plus the same as negatives and zero. Data array:
  a vector, factor, Date/POSIXct vector, matrix or list.

- tickwidth:

  Sets the tick width (in px). Number in the interval \[0, Inf\].

- visible:

  A single toggle to hide the axis while preserving interaction like
  dragging. Default is true when a cheater plot is present on the axis,
  otherwise false Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_smith_imaginaryaxis` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scattersmith(real = ~wt, imag = ~drat) |>
  update_layout(
    smith = go_smith(
      imaginaryaxis = go_smith_imaginaryaxis(color = "red")
    )
  )
```
