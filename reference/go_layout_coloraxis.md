# Layout coloraxis objects

Properties of `layout.coloraxis`.

## Usage

``` r
go_layout_coloraxis(
  arg = NULL,
  ...,
  autocolorscale = NULL,
  cauto = NULL,
  cmax = NULL,
  cmid = NULL,
  cmin = NULL,
  colorbar = NULL,
  colorscale = NULL,
  reversescale = NULL,
  showscale = NULL,
  skip_invalid = FALSE
)

go_layout_coloraxis_colorbar(
  arg = NULL,
  ...,
  bgcolor = NULL,
  bordercolor = NULL,
  borderwidth = NULL,
  dtick = NULL,
  exponentformat = NULL,
  labelalias = NULL,
  len = NULL,
  lenmode = NULL,
  minexponent = NULL,
  nticks = NULL,
  orientation = NULL,
  outlinecolor = NULL,
  outlinewidth = NULL,
  separatethousands = NULL,
  showexponent = NULL,
  showticklabels = NULL,
  showtickprefix = NULL,
  showticksuffix = NULL,
  thickness = NULL,
  thicknessmode = NULL,
  tick0 = NULL,
  tickangle = NULL,
  tickcolor = NULL,
  tickfont = NULL,
  tickformat = NULL,
  tickformatstops = NULL,
  ticklabeloverflow = NULL,
  ticklabelposition = NULL,
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
  x = NULL,
  xanchor = NULL,
  xpad = NULL,
  xref = NULL,
  y = NULL,
  yanchor = NULL,
  ypad = NULL,
  yref = NULL,
  skip_invalid = FALSE
)

go_layout_coloraxis_colorbar_tickfont(
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

go_layout_coloraxis_colorbar_tickformatstop(
  arg = NULL,
  ...,
  dtickrange = NULL,
  enabled = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  skip_invalid = FALSE
)

go_layout_coloraxis_colorbar_title(
  arg = NULL,
  ...,
  font = NULL,
  side = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_layout_coloraxis_colorbar_title_font(
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

- autocolorscale:

  Determines whether the colorscale is a default palette
  (\`autocolorscale: true\`) or the palette determined by
  \`colorscale\`. In case \`colorscale\` is unspecified or
  \`autocolorscale\` is true, the default palette will be chosen
  according to whether numbers in the \`color\` array are all positive,
  all negative or mixed. Logical.

- cauto:

  Determines whether or not the color domain is computed with respect to
  the input data (here corresponding trace color array(s)) or the bounds
  set in \`cmin\` and \`cmax\` Defaults to \`false\` when \`cmin\` and
  \`cmax\` are set by the user. Logical.

- cmax:

  Sets the upper bound of the color domain. Value should have the same
  units as corresponding trace color array(s) and if set, \`cmin\` must
  be set as well. Number.

- cmid:

  Sets the mid-point of the color domain by scaling \`cmin\` and/or
  \`cmax\` to be equidistant to this point. Value should have the same
  units as corresponding trace color array(s). Has no effect when
  \`cauto\` is \`false\`. Number.

- cmin:

  Sets the lower bound of the color domain. Value should have the same
  units as corresponding trace color array(s) and if set, \`cmax\` must
  be set as well. Number.

- colorbar:

  Named list or `go_layout_coloraxis_colorbar()` object.

- colorscale:

  Sets the colorscale. The colorscale must be an array containing arrays
  mapping a normalized value to an rgb, rgba, hex, hsl, hsla, hwb, or
  named color string. At minimum, a mapping for the lowest (0) and
  highest (1) values are required. For example, \`\[\[0,
  'rgb(0,0,255)'\], \[1, 'rgb(255,0,0)'\]\]\`. To control the bounds of
  the colorscale in color space, use \`cmin\` and \`cmax\`.
  Alternatively, \`colorscale\` may be a palette name string of the
  following list:
  Blackbody,Bluered,Blues,Cividis,Earth,Electric,Greens,Greys,Hot,Jet,Picnic,Portland,Rainbow,RdBu,Reds,Viridis,YlGnBu,YlOrRd.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

- reversescale:

  Reverses the color mapping if true. If true, \`cmin\` will correspond
  to the last color in the array and \`cmax\` will correspond to the
  first color. Logical.

- showscale:

  Determines whether or not a colorbar is displayed for this trace.
  Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- bgcolor:

  Sets the color of padded area. Color: a CSS color string or R color
  name.

- bordercolor:

  Sets the axis line color. Color: a CSS color string or R color name.

- borderwidth:

  Sets the width (in px) or the border enclosing this color bar. Number
  in the interval \[0, Inf\].

- dtick:

  Sets the step in-between ticks on this color bar. Use with \`tick0\`.
  Must be a positive number. Note: unlike on x/y axes, the special "log"
  and "date" string forms ("L\<f\>", "D1", "D2", "M\<n\>") are not
  supported here: this axis is always linear, so such strings are
  silently ignored and the step is set to 1. Any value.

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

- len:

  Sets the length of the color bar This measure excludes the padding of
  both ends. That is, the color bar length is this length minus the
  padding on both ends. Number in the interval \[0, Inf\].

- lenmode:

  Determines whether this color bar's length (i.e. the measure in the
  color variation direction) is set in units of plot "fraction" or in
  \*pixels. Use \`len\` to set the value. One of `"fraction"`,
  `"pixels"`.

- minexponent:

  Hide SI prefix for 10^n if \|n\| is below this number. This only has
  an effect when \`tickformat\` is "SI" or "B". Number in the interval
  \[0, Inf\].

- nticks:

  Specifies the maximum number of ticks for the particular axis. The
  actual number of ticks will be chosen automatically to be less than or
  equal to \`nticks\`. Has an effect only if \`tickmode\` is set to
  "auto". Integer in the interval \[0, Inf\].

- orientation:

  Sets the orientation of the colorbar. One of `"h"`, `"v"`.

- outlinecolor:

  Sets the axis line color. Color: a CSS color string or R color name.

- outlinewidth:

  Sets the width (in px) of the axis line. Number in the interval \[0,
  Inf\].

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

- thickness:

  Sets the thickness of the color bar This measure excludes the size of
  the padding, ticks and labels. Number in the interval \[0, Inf\].

- thicknessmode:

  Determines whether this color bar's thickness (i.e. the measure in the
  constant color direction) is set in units of plot "fraction" or in
  "pixels". Use \`thickness\` to set the value. One of `"fraction"`,
  `"pixels"`.

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
  `go_layout_coloraxis_colorbar_tickfont()` object.

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

  List of named lists or `go_layout_coloraxis_colorbar_tickformatstop()`
  objects.

- ticklabeloverflow:

  Determines how we handle tick labels that would overflow either the
  graph div or the domain of the axis. The default value for inside tick
  labels is "hide past domain". In other cases the default is "hide past
  div". One of `"allow"`, `"hide past div"`, `"hide past domain"`.

- ticklabelposition:

  Determines where tick labels are drawn relative to the ticks. Left and
  right options are used when \`orientation\` is "h", top and bottom
  when \`orientation\` is "v". One of `"outside"`, `"inside"`,
  `"outside top"`, `"inside top"`, `"outside left"`, `"inside left"`,
  `"outside right"`, `"inside right"`, `"outside bottom"`,
  `"inside bottom"`.

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

  String (the title text), named list or
  `go_layout_coloraxis_colorbar_title()` object.

- x:

  Sets the x position with respect to \`xref\` of the color bar (in plot
  fraction). When \`xref\` is "paper", defaults to 1.02 when
  \`orientation\` is "v" and 0.5 when \`orientation\` is "h". When
  \`xref\` is "container", defaults to 1 when \`orientation\` is "v" and
  0.5 when \`orientation\` is "h". Must be between 0 and 1 if \`xref\`
  is "container" and between "-2" and 3 if \`xref\` is "paper". Number.

- xanchor:

  Sets this color bar's horizontal position anchor. This anchor binds
  the \`x\` position to the "left", "center" or "right" of the color
  bar. Defaults to "left" when \`orientation\` is "v" and "center" when
  \`orientation\` is "h". One of `"left"`, `"center"`, `"right"`.

- xpad:

  Sets the amount of padding (in px) along the x direction. Number in
  the interval \[0, Inf\].

- xref:

  Sets the container \`x\` refers to. "container" spans the entire
  \`width\` of the plot. "paper" refers to the width of the plotting
  area only. One of `"container"`, `"paper"`.

- y:

  Sets the y position with respect to \`yref\` of the color bar (in plot
  fraction). When \`yref\` is "paper", defaults to 0.5 when
  \`orientation\` is "v" and 1.02 when \`orientation\` is "h". When
  \`yref\` is "container", defaults to 0.5 when \`orientation\` is "v"
  and 1 when \`orientation\` is "h". Must be between 0 and 1 if \`yref\`
  is "container" and between "-2" and 3 if \`yref\` is "paper". Number.

- yanchor:

  Sets this color bar's vertical position anchor This anchor binds the
  \`y\` position to the "top", "middle" or "bottom" of the color bar.
  Defaults to "middle" when \`orientation\` is "v" and "bottom" when
  \`orientation\` is "h". One of `"top"`, `"middle"`, `"bottom"`.

- ypad:

  Sets the amount of padding (in px) along the y direction. Number in
  the interval \[0, Inf\].

- yref:

  Sets the container \`y\` refers to. "container" spans the entire
  \`height\` of the plot. "paper" refers to the height of the plotting
  area only. One of `"container"`, `"paper"`.

- color:

  Color: a CSS color string or R color name.

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

  Sets this color bar's title font. Named list or
  `go_layout_coloraxis_colorbar_title_font()` object.

- side:

  Determines the location of color bar's title with respect to the color
  bar. Defaults to "top" when \`orientation\` is "v" and defaults to
  "right" when \`orientation\` is "h". One of `"right"`, `"top"`,
  `"bottom"`.

- text:

  Sets the title of the color bar. String.

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_coloraxis()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

Nested objects documented here:

- `go_layout_coloraxis_colorbar()`:

  `layout.coloraxis.colorbar`

- `go_layout_coloraxis_colorbar_tickfont()`:

  `layout.coloraxis.colorbar.tickfont`: Sets the color bar's tick label
  font

- `go_layout_coloraxis_colorbar_tickformatstop()`:

  `layout.coloraxis.colorbar.tickformatstop`

- `go_layout_coloraxis_colorbar_title()`:

  `layout.coloraxis.colorbar.title`

- `go_layout_coloraxis_colorbar_title_font()`:

  `layout.coloraxis.colorbar.title.font`: Sets this color bar's title
  font.

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
