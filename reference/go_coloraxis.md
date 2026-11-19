# Layout coloraxis objects

The object for the figure layout's `coloraxis` (and `coloraxis2`,
`coloraxis3`, ...: see
[`update_coloraxes()`](https://msummersgill.github.io/plotly.R.core/reference/update_coloraxes.md)).
`go_coloraxis()` creates one, with exactly its properties; a named list
with the same properties works too.

## Usage

``` r
go_coloraxis(
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
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

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

  A
  [`go_colorbar()`](https://msummersgill.github.io/plotly.R.core/reference/go_colorbar.md)
  object or named list, with properties `bgcolor`, `bordercolor`,
  `borderwidth`, `dtick`, `exponentformat`, `labelalias`, `len`,
  `lenmode`, `minexponent`, `nticks`, `orientation`, `outlinecolor` and
  34 more (see
  [`go_colorbar()`](https://msummersgill.github.io/plotly.R.core/reference/go_colorbar.md)).

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
  [`plotly_colors()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_colors.md)
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

## Value

A `go_layout_coloraxis` object (a named list).

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
  add_scatter(x = ~wt, y = ~mpg, mode = "markers") |>
  update_layout(coloraxis = go_coloraxis())
```
