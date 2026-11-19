# Scatter3d marker objects

The object for the `marker` of a scatter3d trace
([`go_scatter3d()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter3d.md)).
`go_scatter3d_marker()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_scatter3d_marker(
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
  line = NULL,
  opacity = NULL,
  reversescale = NULL,
  showscale = NULL,
  size = NULL,
  sizemin = NULL,
  sizemode = NULL,
  sizeref = NULL,
  symbol = NULL,
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
  \`marker.colorscale\`. Has an effect only if in \`marker.color\` is
  set to a numerical array. In case \`colorscale\` is unspecified or
  \`autocolorscale\` is true, the default palette will be chosen
  according to whether numbers in the \`color\` array are all positive,
  all negative or mixed. Logical.

- cauto:

  Determines whether or not the color domain is computed with respect to
  the input data (here in \`marker.color\`) or the bounds set in
  \`marker.cmin\` and \`marker.cmax\` Has an effect only if in
  \`marker.color\` is set to a numerical array. Defaults to \`false\`
  when \`marker.cmin\` and \`marker.cmax\` are set by the user. Logical.

- cmax:

  Sets the upper bound of the color domain. Has an effect only if in
  \`marker.color\` is set to a numerical array. Value should have the
  same units as in \`marker.color\` and if set, \`marker.cmin\` must be
  set as well. Number.

- cmid:

  Sets the mid-point of the color domain by scaling \`marker.cmin\`
  and/or \`marker.cmax\` to be equidistant to this point. Has an effect
  only if in \`marker.color\` is set to a numerical array. Value should
  have the same units as in \`marker.color\`. Has no effect when
  \`marker.cauto\` is \`false\`. Number.

- cmin:

  Sets the lower bound of the color domain. Has an effect only if in
  \`marker.color\` is set to a numerical array. Value should have the
  same units as in \`marker.color\` and if set, \`marker.cmax\` must be
  set as well. Number.

- color:

  Sets the marker color. It accepts either a specific color or an array
  of numbers that are mapped to the colorscale relative to the max and
  min values of the array or relative to \`marker.cmin\` and
  \`marker.cmax\` if set. Color: a CSS color string or R color name, or
  a number mapped to a color by `scatter3d.marker.colorscale`, or a
  vector of these.

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

  Sets the colorscale. Has an effect only if in \`marker.color\` is set
  to a numerical array. The colorscale must be an array containing
  arrays mapping a normalized value to an rgb, rgba, hex, hsl, hsla,
  hwb, or named color string. At minimum, a mapping for the lowest (0)
  and highest (1) values are required. For example, \`\[\[0,
  'rgb(0,0,255)'\], \[1, 'rgb(255,0,0)'\]\]\`. To control the bounds of
  the colorscale in color space, use \`marker.cmin\` and
  \`marker.cmax\`. Alternatively, \`colorscale\` may be a palette name
  string of the following list:
  Blackbody,Bluered,Blues,Cividis,Earth,Electric,Greens,Greys,Hot,Jet,Picnic,Portland,Rainbow,RdBu,Reds,Viridis,YlGnBu,YlOrRd.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

- line:

  A
  [`go_scatter3d_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter3d_marker_line.md)
  object or named list, with properties `autocolorscale`, `cauto`,
  `cmax`, `cmid`, `cmin`, `color`, `coloraxis`, `colorscale`,
  `reversescale` and `width` (see
  [`go_scatter3d_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter3d_marker_line.md)).

- opacity:

  Sets the marker opacity. Note that the marker opacity for scatter3d
  traces must be a scalar value for performance reasons. To set a
  blending opacity value (i.e. which is not transparent), set
  "marker.color" to an rgba color and use its alpha channel. Number in
  the interval \[0, 1\].

- reversescale:

  Reverses the color mapping if true. Has an effect only if in
  \`marker.color\` is set to a numerical array. If true, \`marker.cmin\`
  will correspond to the last color in the array and \`marker.cmax\`
  will correspond to the first color. Logical.

- showscale:

  Determines whether or not a colorbar is displayed for this trace. Has
  an effect only if in \`marker.color\` is set to a numerical array.
  Logical.

- size:

  Sets the marker size (in px). Number in the interval \[0, Inf\], or a
  vector of these.

- sizemin:

  Has an effect only if \`marker.size\` is set to a numerical array.
  Sets the minimum size (in px) of the rendered marker points. Number in
  the interval \[0, Inf\].

- sizemode:

  Has an effect only if \`marker.size\` is set to a numerical array.
  Sets the rule for which the data in \`size\` is converted to pixels.
  One of `"diameter"`, `"area"`.

- sizeref:

  Has an effect only if \`marker.size\` is set to a numerical array.
  Sets the scale factor used to determine the rendered size of marker
  points. Use with \`sizemin\` and \`sizemode\`. Number.

- symbol:

  Sets the marker symbol type. One of `"circle"`, `"circle-open"`,
  `"cross"`, `"diamond"`, `"diamond-open"`, `"square"`, `"square-open"`,
  `"x"`, or a vector of these.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_scatter3d_marker` object (a named list).

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
    marker = go_scatter3d_marker(color = "red")
  )
```
