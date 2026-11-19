# Splom marker line objects

The object for the `marker.line` of a splom trace
([`go_splom_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_splom_marker.md)).
`go_splom_marker_line()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_splom_marker_line(
  arg = NULL,
  ...,
  autocolorscale = NULL,
  cauto = NULL,
  cmax = NULL,
  cmid = NULL,
  cmin = NULL,
  color = NULL,
  coloraxis = NULL,
  colorscale = NULL,
  reversescale = NULL,
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
  \`marker.line.colorscale\`. Has an effect only if in
  \`marker.line.color\` is set to a numerical array. In case
  \`colorscale\` is unspecified or \`autocolorscale\` is true, the
  default palette will be chosen according to whether numbers in the
  \`color\` array are all positive, all negative or mixed. Logical.

- cauto:

  Determines whether or not the color domain is computed with respect to
  the input data (here in \`marker.line.color\`) or the bounds set in
  \`marker.line.cmin\` and \`marker.line.cmax\` Has an effect only if in
  \`marker.line.color\` is set to a numerical array. Defaults to
  \`false\` when \`marker.line.cmin\` and \`marker.line.cmax\` are set
  by the user. Logical.

- cmax:

  Sets the upper bound of the color domain. Has an effect only if in
  \`marker.line.color\` is set to a numerical array. Value should have
  the same units as in \`marker.line.color\` and if set,
  \`marker.line.cmin\` must be set as well. Number.

- cmid:

  Sets the mid-point of the color domain by scaling \`marker.line.cmin\`
  and/or \`marker.line.cmax\` to be equidistant to this point. Has an
  effect only if in \`marker.line.color\` is set to a numerical array.
  Value should have the same units as in \`marker.line.color\`. Has no
  effect when \`marker.line.cauto\` is \`false\`. Number.

- cmin:

  Sets the lower bound of the color domain. Has an effect only if in
  \`marker.line.color\` is set to a numerical array. Value should have
  the same units as in \`marker.line.color\` and if set,
  \`marker.line.cmax\` must be set as well. Number.

- color:

  Sets the marker.line color. It accepts either a specific color or an
  array of numbers that are mapped to the colorscale relative to the max
  and min values of the array or relative to \`marker.line.cmin\` and
  \`marker.line.cmax\` if set. Color: a CSS color string or R color
  name, or a number mapped to a color by `splom.marker.line.colorscale`,
  or a vector of these.

- coloraxis:

  Sets a reference to a shared color axis. References to these shared
  color axes are "coloraxis", "coloraxis2", "coloraxis3", etc. Settings
  for these shared color axes are set in the layout, under
  \`layout.coloraxis\`, \`layout.coloraxis2\`, etc. Note that multiple
  color scales can be linked to the same color axis. Subplot id:
  `"coloraxis"`, `"coloraxis2"`, `"coloraxis3"`, ....

- colorscale:

  Sets the colorscale. Has an effect only if in \`marker.line.color\` is
  set to a numerical array. The colorscale must be an array containing
  arrays mapping a normalized value to an rgb, rgba, hex, hsl, hsla,
  hwb, or named color string. At minimum, a mapping for the lowest (0)
  and highest (1) values are required. For example, \`\[\[0,
  'rgb(0,0,255)'\], \[1, 'rgb(255,0,0)'\]\]\`. To control the bounds of
  the colorscale in color space, use \`marker.line.cmin\` and
  \`marker.line.cmax\`. Alternatively, \`colorscale\` may be a palette
  name string of the following list:
  Blackbody,Bluered,Blues,Cividis,Earth,Electric,Greens,Greys,Hot,Jet,Picnic,Portland,Rainbow,RdBu,Reds,Viridis,YlGnBu,YlOrRd.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

- reversescale:

  Reverses the color mapping if true. Has an effect only if in
  \`marker.line.color\` is set to a numerical array. If true,
  \`marker.line.cmin\` will correspond to the last color in the array
  and \`marker.line.cmax\` will correspond to the first color. Logical.

- width:

  Sets the width (in px) of the lines bounding the marker points. Number
  in the interval \[0, Inf\], or a vector of these.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_splom_marker_line` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
iris |>
  go_figure() |>
  add_splom(
    dimensions = list(
      go_splom_dimension(label = "Sepal.Length", values = ~Sepal.Length),
      go_splom_dimension(label = "Sepal.Width", values = ~Sepal.Width),
      go_splom_dimension(label = "Petal.Length", values = ~Petal.Length)
    ),
    marker = go_splom_marker(line = go_splom_marker_line(color = "red"))
  )
```
