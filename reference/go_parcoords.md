# Parcoords traces

Parallel coordinates for multidimensional exploratory data analysis. The
samples are specified in \`dimensions\`. The colors are set in
\`line.color\`.

## Usage

``` r
add_parcoords(fig, ...)

# Default S3 method
add_parcoords(
  fig,
  ...,
  data = NULL,
  customdata = NULL,
  dimensions = NULL,
  domain = NULL,
  ids = NULL,
  labelangle = NULL,
  labelfont = NULL,
  labelside = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  line = NULL,
  meta = NULL,
  name = NULL,
  rangefont = NULL,
  tickfont = NULL,
  uid = NULL,
  uirevision = NULL,
  unselected = NULL,
  visible = NULL,
  row = NULL,
  col = NULL,
  skip_invalid = FALSE
)

go_parcoords(
  arg = NULL,
  ...,
  customdata = NULL,
  dimensions = NULL,
  domain = NULL,
  ids = NULL,
  labelangle = NULL,
  labelfont = NULL,
  labelside = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  line = NULL,
  meta = NULL,
  name = NULL,
  rangefont = NULL,
  tickfont = NULL,
  uid = NULL,
  uirevision = NULL,
  unselected = NULL,
  visible = NULL,
  skip_invalid = FALSE
)

go_parcoords_dimension(
  arg = NULL,
  ...,
  constraintrange = NULL,
  label = NULL,
  multiselect = NULL,
  name = NULL,
  range = NULL,
  templateitemname = NULL,
  tickformat = NULL,
  ticktext = NULL,
  tickvals = NULL,
  values = NULL,
  visible = NULL,
  skip_invalid = FALSE
)

go_parcoords_domain(
  arg = NULL,
  ...,
  column = NULL,
  row = NULL,
  x = NULL,
  y = NULL,
  skip_invalid = FALSE
)

go_parcoords_labelfont(
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

go_parcoords_legendgrouptitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_parcoords_legendgrouptitle_font(
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

go_parcoords_line(
  arg = NULL,
  ...,
  autocolorscale = NULL,
  cauto = NULL,
  cmax = NULL,
  cmid = NULL,
  cmin = NULL,
  color = NULL,
  coloraxis = NULL,
  colorbar = NULL,
  colorscale = NULL,
  reversescale = NULL,
  showscale = NULL,
  skip_invalid = FALSE
)

go_parcoords_line_colorbar(
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

go_parcoords_line_colorbar_tickfont(
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

go_parcoords_line_colorbar_tickformatstop(
  arg = NULL,
  ...,
  dtickrange = NULL,
  enabled = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  skip_invalid = FALSE
)

go_parcoords_line_colorbar_title(
  arg = NULL,
  ...,
  font = NULL,
  side = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_parcoords_line_colorbar_title_font(
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

go_parcoords_rangefont(
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

go_parcoords_tickfont(
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

go_parcoords_unselected(arg = NULL, ..., line = NULL, skip_invalid = FALSE)

go_parcoords_unselected_line(
  arg = NULL,
  ...,
  color = NULL,
  opacity = NULL,
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
  Only the evaluated values are added to the trace. A
  [`crosstalk::SharedData`](https://rdrr.io/pkg/crosstalk/man/SharedData.html)
  works the same way, and links the trace to its crosstalk group (see
  [`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)).

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- dimensions:

  List of named lists or `go_parcoords_dimension()` objects.

- domain:

  Named list or `go_parcoords_domain()` object.

- ids:

  Assigns id labels to each datum. These ids for object constancy of
  data points during animation. Should be an array of strings, not
  numbers or any other type. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- labelangle:

  Sets the angle of the labels with respect to the horizontal. For
  example, a \`tickangle\` of -90 draws the labels vertically. Tilted
  labels with "labelangle" may be positioned better inside margins when
  \`labelposition\` is set to "bottom". Angle in degrees.

- labelfont:

  Sets the font for the \`dimension\` labels. Named list or
  `go_parcoords_labelfont()` object.

- labelside:

  Specifies the location of the \`label\`. "top" positions labels above,
  next to the title "bottom" positions labels below the graph Tilted
  labels with "labelangle" may be positioned better inside margins when
  \`labelposition\` is set to "bottom". One of `"top"`, `"bottom"`.

- legend:

  Sets the reference to a legend to show this trace in. References to
  these legends are "legend", "legend2", "legend3", etc. Settings for
  these legends are set in the layout, under \`layout.legend\`,
  \`layout.legend2\`, etc. Subplot id: `"legend"`, `"legend2"`,
  `"legend3"`, ....

- legendgrouptitle:

  Named list or `go_parcoords_legendgrouptitle()` object.

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

  **`go_parcoords()`**: Named list or `go_parcoords_line()` object.

  **`go_parcoords_unselected()`**: Named list or
  `go_parcoords_unselected_line()` object.

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

  **`go_parcoords()`**: Sets the trace name. The trace name appears as
  the legend item and on hover. String.

  **`go_parcoords_dimension()`,
  `go_parcoords_line_colorbar_tickformatstop()`**: When used in a
  template, named items are created in the output figure in addition to
  any items the figure already has in this array. You can modify these
  items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- rangefont:

  Sets the font for the \`dimension\` range values. Named list or
  `go_parcoords_rangefont()` object.

- tickfont:

  **`go_parcoords()`**: Sets the font for the \`dimension\` tick values.
  Named list or `go_parcoords_tickfont()` object.

  **`go_parcoords_line_colorbar()`**: Sets the color bar's tick label
  font Named list or `go_parcoords_line_colorbar_tickfont()` object.

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

  Named list or `go_parcoords_unselected()` object.

- visible:

  **`go_parcoords()`**: Determines whether or not this trace is visible.
  If "legendonly", the trace is not drawn, but can appear as a legend
  item (provided that the legend itself is visible). One of
  `"legendonly"`, `TRUE`, `FALSE`.

  **`go_parcoords_dimension()`**: Shows the dimension when set to
  \`true\` (the default). Hides the dimension for \`false\`. Logical.

- row:

  **`add_parcoords()`**: Subplot grid row (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

  **`go_parcoords_domain()`**: If there is a layout grid, use the domain
  for this row in the grid for this parcoords trace. Integer in the
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

- constraintrange:

  The domain range to which the filter on the dimension is constrained.
  Must be an array of \`\[fromValue, toValue\]\` with \`fromValue \<=
  toValue\`, or if \`multiselect\` is not disabled, you may give an
  array of arrays, where each inner array is \`\[fromValue, toValue\]\`.
  Vector or list of up to 2 element(s).

- label:

  The shown name of the dimension. String.

- multiselect:

  Do we allow multiple selection ranges or just a single range? Logical.

- range:

  The domain range that represents the full, shown axis extent. Defaults
  to the \`values\` extent. Must be an array of \`\[fromValue,
  toValue\]\` with finite numbers as elements. Vector or list of 2
  element(s).

- templateitemname:

  Used to refer to a named item in this array in the template. Named
  items from the template will be created even without a matching item
  in the input figure, but you can modify one by making an item with
  \`templateitemname\` matching its \`name\`, alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). If there is no template or no matching item, this item will
  be hidden unless you explicitly show it with \`visible: true\`.
  String.

- tickformat:

  Sets the tick label formatting rule using d3 formatting mini-languages
  which are very similar to those in Python. For numbers, see:
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for dates
  see: https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format.
  We add two items to d3's date formatter: "%h" for half of the year as
  a decimal number as well as "%{n}f" for fractional seconds with n
  digits. For example, "2016-10-13 09:15:23.456" with tickformat
  "%H~%M~%S.%2f" would display "09~15~23.46" String.

- ticktext:

  **`go_parcoords_dimension()`**: Sets the text displayed at the ticks
  position via \`tickvals\`. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

  **`go_parcoords_line_colorbar()`**: Sets the text displayed at the
  ticks position via \`tickvals\`. Only has an effect if \`tickmode\` is
  set to "array". Used with \`tickvals\`. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

- tickvals:

  **`go_parcoords_dimension()`**: Sets the values at which ticks on this
  axis appear. Data array: a vector, factor, Date/POSIXct vector, matrix
  or list.

  **`go_parcoords_line_colorbar()`**: Sets the values at which ticks on
  this axis appear. Only has an effect if \`tickmode\` is set to
  "array". Used with \`ticktext\`. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

- values:

  Dimension values. \`values\[n\]\` represents the value of the \`n\`th
  point in the dataset, therefore the \`values\` vector for all
  dimensions must be the same (longer vectors will be truncated). Each
  value must be a finite number. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

- column:

  If there is a layout grid, use the domain for this column in the grid
  for this parcoords trace. Integer in the interval \[0, Inf\].

- x:

  **`go_parcoords_domain()`**: Sets the horizontal domain of this
  parcoords trace (in plot fraction). Vector or list of 2 element(s).

  **`go_parcoords_line_colorbar()`**: Sets the x position with respect
  to \`xref\` of the color bar (in plot fraction). When \`xref\` is
  "paper", defaults to 1.02 when \`orientation\` is "v" and 0.5 when
  \`orientation\` is "h". When \`xref\` is "container", defaults to 1
  when \`orientation\` is "v" and 0.5 when \`orientation\` is "h". Must
  be between 0 and 1 if \`xref\` is "container" and between "-2" and 3
  if \`xref\` is "paper". Number.

- y:

  **`go_parcoords_domain()`**: Sets the vertical domain of this
  parcoords trace (in plot fraction). Vector or list of 2 element(s).

  **`go_parcoords_line_colorbar()`**: Sets the y position with respect
  to \`yref\` of the color bar (in plot fraction). When \`yref\` is
  "paper", defaults to 0.5 when \`orientation\` is "v" and 1.02 when
  \`orientation\` is "h". When \`yref\` is "container", defaults to 0.5
  when \`orientation\` is "v" and 1 when \`orientation\` is "h". Must be
  between 0 and 1 if \`yref\` is "container" and between "-2" and 3 if
  \`yref\` is "paper". Number.

- color:

  **`go_parcoords_labelfont()`, `go_parcoords_legendgrouptitle_font()`,
  `go_parcoords_line_colorbar_tickfont()`,
  `go_parcoords_line_colorbar_title_font()`, `go_parcoords_rangefont()`,
  `go_parcoords_tickfont()`**: Color: a CSS color string or R color
  name.

  **`go_parcoords_line()`**: Sets the line color. It accepts either a
  specific color or an array of numbers that are mapped to the
  colorscale relative to the max and min values of the array or relative
  to \`line.cmin\` and \`line.cmax\` if set. Color: a CSS color string
  or R color name, or a number mapped to a color by
  `parcoords.line.colorscale`, or a vector of these.

  **`go_parcoords_unselected_line()`**: Sets the base color of
  unselected lines. in connection with \`unselected.line.opacity\`.
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

- font:

  **`go_parcoords_legendgrouptitle()`**: Sets this legend group's title
  font. Named list or `go_parcoords_legendgrouptitle_font()` object.

  **`go_parcoords_line_colorbar_title()`**: Sets this color bar's title
  font. Named list or `go_parcoords_line_colorbar_title_font()` object.

- text:

  **`go_parcoords_legendgrouptitle()`**: Sets the title of the legend
  group. String.

  **`go_parcoords_line_colorbar_title()`**: Sets the title of the color
  bar. String.

- autocolorscale:

  Determines whether the colorscale is a default palette
  (\`autocolorscale: true\`) or the palette determined by
  \`line.colorscale\`. Has an effect only if in \`line.color\` is set to
  a numerical array. In case \`colorscale\` is unspecified or
  \`autocolorscale\` is true, the default palette will be chosen
  according to whether numbers in the \`color\` array are all positive,
  all negative or mixed. Logical.

- cauto:

  Determines whether or not the color domain is computed with respect to
  the input data (here in \`line.color\`) or the bounds set in
  \`line.cmin\` and \`line.cmax\` Has an effect only if in
  \`line.color\` is set to a numerical array. Defaults to \`false\` when
  \`line.cmin\` and \`line.cmax\` are set by the user. Logical.

- cmax:

  Sets the upper bound of the color domain. Has an effect only if in
  \`line.color\` is set to a numerical array. Value should have the same
  units as in \`line.color\` and if set, \`line.cmin\` must be set as
  well. Number.

- cmid:

  Sets the mid-point of the color domain by scaling \`line.cmin\` and/or
  \`line.cmax\` to be equidistant to this point. Has an effect only if
  in \`line.color\` is set to a numerical array. Value should have the
  same units as in \`line.color\`. Has no effect when \`line.cauto\` is
  \`false\`. Number.

- cmin:

  Sets the lower bound of the color domain. Has an effect only if in
  \`line.color\` is set to a numerical array. Value should have the same
  units as in \`line.color\` and if set, \`line.cmax\` must be set as
  well. Number.

- coloraxis:

  Sets a reference to a shared color axis. References to these shared
  color axes are "coloraxis", "coloraxis2", "coloraxis3", etc. Settings
  for these shared color axes are set in the layout, under
  \`layout.coloraxis\`, \`layout.coloraxis2\`, etc. Note that multiple
  color scales can be linked to the same color axis. Subplot id:
  `"coloraxis"`, `"coloraxis2"`, `"coloraxis3"`, ....

- colorbar:

  Named list or `go_parcoords_line_colorbar()` object.

- colorscale:

  Sets the colorscale. Has an effect only if in \`line.color\` is set to
  a numerical array. The colorscale must be an array containing arrays
  mapping a normalized value to an rgb, rgba, hex, hsl, hsla, hwb, or
  named color string. At minimum, a mapping for the lowest (0) and
  highest (1) values are required. For example, \`\[\[0,
  'rgb(0,0,255)'\], \[1, 'rgb(255,0,0)'\]\]\`. To control the bounds of
  the colorscale in color space, use \`line.cmin\` and \`line.cmax\`.
  Alternatively, \`colorscale\` may be a palette name string of the
  following list:
  Blackbody,Bluered,Blues,Cividis,Earth,Electric,Greens,Greys,Hot,Jet,Picnic,Portland,Rainbow,RdBu,Reds,Viridis,YlGnBu,YlOrRd.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

- reversescale:

  Reverses the color mapping if true. Has an effect only if in
  \`line.color\` is set to a numerical array. If true, \`line.cmin\`
  will correspond to the last color in the array and \`line.cmax\` will
  correspond to the first color. Logical.

- showscale:

  Determines whether or not a colorbar is displayed for this trace. Has
  an effect only if in \`line.color\` is set to a numerical array.
  Logical.

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

- tickformatstops:

  List of named lists or `go_parcoords_line_colorbar_tickformatstop()`
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

- tickwidth:

  Sets the tick width (in px). Number in the interval \[0, Inf\].

- title:

  String (the title text), named list or
  `go_parcoords_line_colorbar_title()` object.

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

- dtickrange:

  range \["min", "max"\], where "min", "max" - dtick values which
  describe some zoom level, it is possible to omit "min" or "max" value
  by passing "null" Vector or list of 2 element(s).

- enabled:

  Determines whether or not this stop is used. If \`false\`, this stop
  is ignored even within its \`dtickrange\`. Logical.

- value:

  string - dtickformat for described zoom level, the same as
  "tickformat" String.

- side:

  Determines the location of color bar's title with respect to the color
  bar. Defaults to "top" when \`orientation\` is "v" and defaults to
  "right" when \`orientation\` is "h". One of `"right"`, `"top"`,
  `"bottom"`.

- opacity:

  Sets the opacity of unselected lines. The default "auto" decreases the
  opacity smoothly as the number of lines increases. Use 1 to achieve
  exact \`unselected.line.color\`. Number in the interval \[0, 1\].

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_parcoords()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
`add_parcoords()` creates an object and adds it to a figure.

Nested objects documented here:

- `go_parcoords_dimension()`:

  `parcoords.dimension`: The dimensions (variables) of the parallel
  coordinates chart. 2..60 dimensions are supported.

- `go_parcoords_domain()`:

  `parcoords.domain`

- `go_parcoords_labelfont()`:

  `parcoords.labelfont`: Sets the font for the \`dimension\` labels.

- `go_parcoords_legendgrouptitle()`:

  `parcoords.legendgrouptitle`

- `go_parcoords_legendgrouptitle_font()`:

  `parcoords.legendgrouptitle.font`: Sets this legend group's title
  font.

- `go_parcoords_line()`:

  `parcoords.line`

- `go_parcoords_line_colorbar()`:

  `parcoords.line.colorbar`

- `go_parcoords_line_colorbar_tickfont()`:

  `parcoords.line.colorbar.tickfont`: Sets the color bar's tick label
  font

- `go_parcoords_line_colorbar_tickformatstop()`:

  `parcoords.line.colorbar.tickformatstop`

- `go_parcoords_line_colorbar_title()`:

  `parcoords.line.colorbar.title`

- `go_parcoords_line_colorbar_title_font()`:

  `parcoords.line.colorbar.title.font`: Sets this color bar's title
  font.

- `go_parcoords_rangefont()`:

  `parcoords.rangefont`: Sets the font for the \`dimension\` range
  values.

- `go_parcoords_tickfont()`:

  `parcoords.tickfont`: Sets the font for the \`dimension\` tick values.

- `go_parcoords_unselected()`:

  `parcoords.unselected`

- `go_parcoords_unselected_line()`:

  `parcoords.unselected.line`

## See also

[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)

## Examples

``` r
go_parcoords()
#> <go_parcoords>
#> {
#>   "type": "parcoords"
#> }
#> 
```
