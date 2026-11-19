# Scattergl marker objects

The object for the `marker` of a scattergl trace
([`go_scattergl()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattergl.md)).
`go_scattergl_marker()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_scattergl_marker(
  ...,
  angle = NULL,
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

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- angle:

  Sets the marker angle in respect to \`angleref\`. Angle in degrees, or
  a vector of these.

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
  a number mapped to a color by `scattergl.marker.colorscale`, or a
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
  [`plotly_colors()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_colors.md)
  (append `"_r"` to reverse).

- line:

  A
  [`go_scattergl_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattergl_marker_line.md)
  object or named list, with properties `autocolorscale`, `cauto`,
  `cmax`, `cmid`, `cmin`, `color`, `coloraxis`, `colorscale`,
  `reversescale` and `width` (see
  [`go_scattergl_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattergl_marker_line.md)).

- opacity:

  Sets the marker opacity. Number in the interval \[0, 1\], or a vector
  of these.

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

  Sets the marker symbol type. Adding 100 is equivalent to appending
  "-open" to a symbol name. Adding 200 is equivalent to appending "-dot"
  to a symbol name. Adding 300 is equivalent to appending "-open-dot" or
  "dot-open" to a symbol name. One of `"0"`, `"circle"`, `"100"`,
  `"circle-open"`, `"200"`, `"circle-dot"`, `"300"`,
  `"circle-open-dot"`, `"1"`, `"square"`, `"101"`, `"square-open"`,
  `"201"`, `"square-dot"`, `"301"`, `"square-open-dot"`, `"2"`,
  `"diamond"`, `"102"`, `"diamond-open"`, `"202"`, `"diamond-dot"`,
  `"302"`, `"diamond-open-dot"`, `"3"`, `"cross"`, `"103"`,
  `"cross-open"`, `"203"`, `"cross-dot"`, `"303"`, `"cross-open-dot"`,
  `"4"`, `"x"`, `"104"`, `"x-open"`, `"204"`, `"x-dot"`, `"304"`,
  `"x-open-dot"`, `"5"`, `"triangle-up"`, `"105"`, `"triangle-up-open"`,
  `"205"`, `"triangle-up-dot"`, `"305"`, `"triangle-up-open-dot"`,
  `"6"`, `"triangle-down"`, `"106"`, `"triangle-down-open"`, `"206"`,
  `"triangle-down-dot"`, `"306"`, `"triangle-down-open-dot"`, `"7"`,
  `"triangle-left"`, `"107"`, `"triangle-left-open"`, `"207"`,
  `"triangle-left-dot"`, `"307"`, `"triangle-left-open-dot"`, `"8"`,
  `"triangle-right"`, `"108"`, `"triangle-right-open"`, `"208"`,
  `"triangle-right-dot"`, `"308"`, `"triangle-right-open-dot"`, `"9"`,
  `"triangle-ne"`, `"109"`, `"triangle-ne-open"`, `"209"`,
  `"triangle-ne-dot"`, `"309"`, `"triangle-ne-open-dot"`, `"10"`,
  `"triangle-se"`, `"110"`, `"triangle-se-open"`, `"210"`,
  `"triangle-se-dot"`, `"310"`, `"triangle-se-open-dot"`, `"11"`,
  `"triangle-sw"`, `"111"`, `"triangle-sw-open"`, `"211"`,
  `"triangle-sw-dot"`, `"311"`, `"triangle-sw-open-dot"`, `"12"`,
  `"triangle-nw"`, `"112"`, `"triangle-nw-open"`, `"212"`,
  `"triangle-nw-dot"`, `"312"`, `"triangle-nw-open-dot"`, `"13"`,
  `"pentagon"`, `"113"`, `"pentagon-open"`, `"213"`, `"pentagon-dot"`,
  `"313"`, `"pentagon-open-dot"`, `"14"`, `"hexagon"`, `"114"`,
  `"hexagon-open"`, `"214"`, `"hexagon-dot"`, `"314"`,
  `"hexagon-open-dot"`, `"15"`, `"hexagon2"`, `"115"`,
  `"hexagon2-open"`, `"215"`, `"hexagon2-dot"`, `"315"`,
  `"hexagon2-open-dot"`, `"16"`, `"octagon"`, `"116"`, `"octagon-open"`,
  `"216"`, `"octagon-dot"`, `"316"`, `"octagon-open-dot"`, `"17"`,
  `"star"`, `"117"`, `"star-open"`, `"217"`, `"star-dot"`, `"317"`,
  `"star-open-dot"`, `"18"`, `"hexagram"`, `"118"`, `"hexagram-open"`,
  `"218"`, `"hexagram-dot"`, `"318"`, `"hexagram-open-dot"`, `"19"`,
  `"star-triangle-up"`, `"119"`, `"star-triangle-up-open"`, `"219"`,
  `"star-triangle-up-dot"`, `"319"`, `"star-triangle-up-open-dot"`,
  `"20"`, `"star-triangle-down"`, `"120"`, `"star-triangle-down-open"`,
  `"220"`, `"star-triangle-down-dot"`, `"320"`,
  `"star-triangle-down-open-dot"`, `"21"`, `"star-square"`, `"121"`,
  `"star-square-open"`, `"221"`, `"star-square-dot"`, `"321"`,
  `"star-square-open-dot"`, `"22"`, `"star-diamond"`, `"122"`,
  `"star-diamond-open"`, `"222"`, `"star-diamond-dot"`, `"322"`,
  `"star-diamond-open-dot"`, `"23"`, `"diamond-tall"`, `"123"`,
  `"diamond-tall-open"`, `"223"`, `"diamond-tall-dot"`, `"323"`,
  `"diamond-tall-open-dot"`, `"24"`, `"diamond-wide"`, `"124"`,
  `"diamond-wide-open"`, `"224"`, `"diamond-wide-dot"`, `"324"`,
  `"diamond-wide-open-dot"`, `"25"`, `"hourglass"`, `"125"`,
  `"hourglass-open"`, `"26"`, `"bowtie"`, `"126"`, `"bowtie-open"`,
  `"27"`, `"circle-cross"`, `"127"`, `"circle-cross-open"`, `"28"`,
  `"circle-x"`, `"128"`, `"circle-x-open"`, `"29"`, `"square-cross"`,
  `"129"`, `"square-cross-open"`, `"30"`, `"square-x"`, `"130"`,
  `"square-x-open"`, `"31"`, `"diamond-cross"`, `"131"`,
  `"diamond-cross-open"`, `"32"`, `"diamond-x"`, `"132"`,
  `"diamond-x-open"`, `"33"`, `"cross-thin"`, `"133"`,
  `"cross-thin-open"`, `"34"`, `"x-thin"`, `"134"`, `"x-thin-open"`,
  `"35"`, `"asterisk"`, `"135"`, `"asterisk-open"`, `"36"`, `"hash"`,
  `"136"`, `"hash-open"`, `"236"`, `"hash-dot"`, `"336"`,
  `"hash-open-dot"`, `"37"`, `"y-up"`, `"137"`, `"y-up-open"`, `"38"`,
  `"y-down"`, `"138"`, `"y-down-open"`, `"39"`, `"y-left"`, `"139"`,
  `"y-left-open"`, `"40"`, `"y-right"`, `"140"`, `"y-right-open"`,
  `"41"`, `"line-ew"`, `"141"`, `"line-ew-open"`, `"42"`, `"line-ns"`,
  `"142"`, `"line-ns-open"`, `"43"`, `"line-ne"`, `"143"`,
  `"line-ne-open"`, `"44"`, `"line-nw"`, `"144"`, `"line-nw-open"`,
  `"45"`, `"arrow-up"`, `"145"`, `"arrow-up-open"`, `"46"`,
  `"arrow-down"`, `"146"`, `"arrow-down-open"`, `"47"`, `"arrow-left"`,
  `"147"`, `"arrow-left-open"`, `"48"`, `"arrow-right"`, `"148"`,
  `"arrow-right-open"`, `"49"`, `"arrow-bar-up"`, `"149"`,
  `"arrow-bar-up-open"`, `"50"`, `"arrow-bar-down"`, `"150"`,
  `"arrow-bar-down-open"`, `"51"`, `"arrow-bar-left"`, `"151"`,
  `"arrow-bar-left-open"`, `"52"`, `"arrow-bar-right"`, `"152"`,
  `"arrow-bar-right-open"`, `"53"`, `"arrow"`, `"153"`, `"arrow-open"`,
  `"54"`, `"arrow-wide"`, `"154"`, `"arrow-wide-open"`, `0`, `100`,
  `200`, `300`, `1`, `101`, `201`, `301`, `2`, `102`, `202`, `302`, `3`,
  `103`, `203`, `303`, `4`, `104`, `204`, `304`, `5`, `105`, `205`,
  `305`, `6`, `106`, `206`, `306`, `7`, `107`, `207`, `307`, `8`, `108`,
  `208`, `308`, `9`, `109`, `209`, `309`, `10`, `110`, `210`, `310`,
  `11`, `111`, `211`, `311`, `12`, `112`, `212`, `312`, `13`, `113`,
  `213`, `313`, `14`, `114`, `214`, `314`, `15`, `115`, `215`, `315`,
  `16`, `116`, `216`, `316`, `17`, `117`, `217`, `317`, `18`, `118`,
  `218`, `318`, `19`, `119`, `219`, `319`, `20`, `120`, `220`, `320`,
  `21`, `121`, `221`, `321`, `22`, `122`, `222`, `322`, `23`, `123`,
  `223`, `323`, `24`, `124`, `224`, `324`, `25`, `125`, `26`, `126`,
  `27`, `127`, `28`, `128`, `29`, `129`, `30`, `130`, `31`, `131`, `32`,
  `132`, `33`, `133`, `34`, `134`, `35`, `135`, `36`, `136`, `236`,
  `336`, `37`, `137`, `38`, `138`, `39`, `139`, `40`, `140`, `41`,
  `141`, `42`, `142`, `43`, `143`, `44`, `144`, `45`, `145`, `46`,
  `146`, `47`, `147`, `48`, `148`, `49`, `149`, `50`, `150`, `51`,
  `151`, `52`, `152`, `53`, `153`, `54`, `154`, or a vector of these.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_scattergl_marker` object (a named list).

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
  add_scattergl(
    x = ~wt,
    y = ~mpg,
    mode = "markers",
    marker = go_scattergl_marker(color = "red")
  )
```
