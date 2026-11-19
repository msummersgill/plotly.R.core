# Treemap marker objects

The object for the `marker` of a treemap trace
([`go_treemap()`](https://msummersgill.github.io/plotly.R.core/reference/go_treemap.md)).
`go_treemap_marker()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_treemap_marker(
  arg = NULL,
  ...,
  autocolorscale = NULL,
  cauto = NULL,
  cmax = NULL,
  cmid = NULL,
  cmin = NULL,
  coloraxis = NULL,
  colorbar = NULL,
  colors = NULL,
  colorscale = NULL,
  cornerradius = NULL,
  depthfade = NULL,
  line = NULL,
  pad = NULL,
  pattern = NULL,
  reversescale = NULL,
  showscale = NULL,
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
  \`marker.colorscale\`. Has an effect only if colors is set to a
  numerical array. In case \`colorscale\` is unspecified or
  \`autocolorscale\` is true, the default palette will be chosen
  according to whether numbers in the \`color\` array are all positive,
  all negative or mixed. Logical.

- cauto:

  Determines whether or not the color domain is computed with respect to
  the input data (here colors) or the bounds set in \`marker.cmin\` and
  \`marker.cmax\` Has an effect only if colors is set to a numerical
  array. Defaults to \`false\` when \`marker.cmin\` and \`marker.cmax\`
  are set by the user. Logical.

- cmax:

  Sets the upper bound of the color domain. Has an effect only if colors
  is set to a numerical array. Value should have the same units as
  colors and if set, \`marker.cmin\` must be set as well. Number.

- cmid:

  Sets the mid-point of the color domain by scaling \`marker.cmin\`
  and/or \`marker.cmax\` to be equidistant to this point. Has an effect
  only if colors is set to a numerical array. Value should have the same
  units as colors. Has no effect when \`marker.cauto\` is \`false\`.
  Number.

- cmin:

  Sets the lower bound of the color domain. Has an effect only if colors
  is set to a numerical array. Value should have the same units as
  colors and if set, \`marker.cmax\` must be set as well. Number.

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

- colors:

  Sets the color of each sector of this trace. If not specified, the
  default trace color set is used to pick the sector colors. Data array:
  a vector, factor, Date/POSIXct vector, matrix or list.

- colorscale:

  Sets the colorscale. Has an effect only if colors is set to a
  numerical array. The colorscale must be an array containing arrays
  mapping a normalized value to an rgb, rgba, hex, hsl, hsla, hwb, or
  named color string. At minimum, a mapping for the lowest (0) and
  highest (1) values are required. For example, \`\[\[0,
  'rgb(0,0,255)'\], \[1, 'rgb(255,0,0)'\]\]\`. To control the bounds of
  the colorscale in color space, use \`marker.cmin\` and
  \`marker.cmax\`. Alternatively, \`colorscale\` may be a palette name
  string of the following list:
  Blackbody,Bluered,Blues,Cividis,Earth,Electric,Greens,Greys,Hot,Jet,Picnic,Portland,Rainbow,RdBu,Reds,Viridis,YlGnBu,YlOrRd.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

- cornerradius:

  Sets the maximum rounding of corners (in px). Number in the interval
  \[0, Inf\].

- depthfade:

  Determines if the sector colors are faded towards the background from
  the leaves up to the headers. This option is unavailable when a
  \`colorscale\` is present, defaults to false when \`marker.colors\` is
  set, but otherwise defaults to true. When set to "reversed", the
  fading direction is inverted, that is the top elements within
  hierarchy are drawn with fully saturated colors while the leaves are
  faded towards the background color. One of `"reversed"`, `TRUE`,
  `FALSE`.

- line:

  A
  [`go_treemap_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_treemap_marker_line.md)
  object or named list, with properties `color` and `width` (see
  [`go_treemap_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_treemap_marker_line.md)).

- pad:

  A
  [`go_treemap_marker_pad()`](https://msummersgill.github.io/plotly.R.core/reference/go_treemap_marker_pad.md)
  object or named list, with properties `b`, `l`, `r` and `t` (see
  [`go_treemap_marker_pad()`](https://msummersgill.github.io/plotly.R.core/reference/go_treemap_marker_pad.md)).

- pattern:

  Sets the pattern within the marker. A
  [`go_pattern()`](https://msummersgill.github.io/plotly.R.core/reference/go_pattern.md)
  object or named list, with properties `bgcolor`, `fgcolor`,
  `fgopacity`, `fillmode`, `path`, `shape`, `size` and `solidity` (see
  [`go_pattern()`](https://msummersgill.github.io/plotly.R.core/reference/go_pattern.md)).

- reversescale:

  Reverses the color mapping if true. Has an effect only if colors is
  set to a numerical array. If true, \`marker.cmin\` will correspond to
  the last color in the array and \`marker.cmax\` will correspond to the
  first color. Logical.

- showscale:

  Determines whether or not a colorbar is displayed for this trace. Has
  an effect only if colors is set to a numerical array. Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_treemap_marker` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
cyl <- table(paste(mtcars$cyl, "cylinders"))
d <- data.frame(
  labels = c("all cars", names(cyl)),
  parents = c("", rep("all cars", length(cyl))),
  values = c(0, as.vector(cyl))
)
d |>
  go_figure() |>
  add_treemap(
    labels = ~labels,
    parents = ~parents,
    values = ~values,
    marker = go_treemap_marker(colors = c("red", "blue"))
  )
```
