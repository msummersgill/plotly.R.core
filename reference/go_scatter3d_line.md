# Scatter3d line objects

The object for the `line` of a scatter3d trace
([`go_scatter3d()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter3d.md)).
`go_scatter3d_line()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_scatter3d_line(
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
  dash = NULL,
  reversescale = NULL,
  showscale = NULL,
  width = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

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

- color:

  Sets the line color. It accepts either a specific color or an array of
  numbers that are mapped to the colorscale relative to the max and min
  values of the array or relative to \`line.cmin\` and \`line.cmax\` if
  set. Color: a CSS color string or R color name, or a number mapped to
  a color by `scatter3d.line.colorscale`, or a vector of these.

- coloraxis:

  Sets a reference to a shared color axis. References to these shared
  color axes are "coloraxis", "coloraxis2", "coloraxis3", etc. Settings
  for these shared color axes are set in the layout, under
  \`layout.coloraxis\`, \`layout.coloraxis2\`, etc. Note that multiple
  color scales can be linked to the same color axis. Subplot id:
  `"coloraxis"`, `"coloraxis2"`, `"coloraxis3"`, ....

- colorbar:

  A
  [`go_colorbar()`](https://msummersgill.github.io/plotly.R.core/reference/go_colorbar.md)
  object or named list, with properties `bgcolor`, `bordercolor`,
  `borderwidth`, `dtick`, `exponentformat`, `labelalias`, `len`,
  `lenmode`, `minexponent`, `nticks`, `orientation`, `outlinecolor` and
  34 more (see
  [`go_colorbar()`](https://msummersgill.github.io/plotly.R.core/reference/go_colorbar.md)).

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
  [`plotly_colors()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_colors.md)
  (append `"_r"` to reverse).

- dash:

  Sets the dash style of the lines. One of `"dash"`, `"dashdot"`,
  `"dot"`, `"longdash"`, `"longdashdot"`, `"solid"`.

- reversescale:

  Reverses the color mapping if true. Has an effect only if in
  \`line.color\` is set to a numerical array. If true, \`line.cmin\`
  will correspond to the last color in the array and \`line.cmax\` will
  correspond to the first color. Logical.

- showscale:

  Determines whether or not a colorbar is displayed for this trace. Has
  an effect only if in \`line.color\` is set to a numerical array.
  Logical.

- width:

  Sets the line width (in px). Number in the interval \[0, Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_scatter3d_line` object (a named list).

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
  add_scatter3d(
    x = ~wt,
    y = ~hp,
    z = ~mpg,
    line = go_scatter3d_line(color = "red")
  )
```
