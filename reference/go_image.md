# Image traces

Display an image, i.e. data on a 2D regular raster. By default, when an
image is displayed in a subplot, its y axis will be reversed (ie.
\`autorange: 'reversed'\`), constrained to the domain (ie. \`constrain:
'domain'\`) and it will have the same scale as its x axis (ie.
\`scaleanchor: 'x,\`) in order for pixels to be rendered as squares.

## Usage

``` r
add_image(fig, ...)

# Default S3 method
add_image(
  fig,
  ...,
  data = NULL,
  colormodel = NULL,
  customdata = NULL,
  dx = NULL,
  dy = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  source = NULL,
  text = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  x0 = NULL,
  xaxis = NULL,
  y0 = NULL,
  yaxis = NULL,
  z = NULL,
  zmax = NULL,
  zmin = NULL,
  zorder = NULL,
  zsmooth = NULL,
  row = NULL,
  col = NULL,
  secondary_y = NULL,
  skip_invalid = FALSE
)

go_image(
  arg = NULL,
  ...,
  colormodel = NULL,
  customdata = NULL,
  dx = NULL,
  dy = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  source = NULL,
  text = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  x0 = NULL,
  xaxis = NULL,
  y0 = NULL,
  yaxis = NULL,
  z = NULL,
  zmax = NULL,
  zmin = NULL,
  zorder = NULL,
  zsmooth = NULL,
  skip_invalid = FALSE
)

go_image_hoverlabel(
  arg = NULL,
  ...,
  align = NULL,
  bgcolor = NULL,
  bordercolor = NULL,
  font = NULL,
  namelength = NULL,
  showarrow = NULL,
  skip_invalid = FALSE
)

go_image_hoverlabel_font(
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

go_image_legendgrouptitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_image_legendgrouptitle_font(
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

- colormodel:

  Color model used to map the numerical color components described in
  \`z\` into colors. If \`source\` is specified, this attribute will be
  set to \`rgba256\` otherwise it defaults to \`rgb\`. One of `"rgb"`,
  `"rgba"`, `"rgba256"`, `"hsl"`, `"hsla"`.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- dx:

  Set the pixel's horizontal size. Number.

- dy:

  Set the pixel's vertical size Number.

- hoverinfo:

  Determines what trace information appears on hover. If \`none\` or
  \`skip\` are set, no information is displayed upon hovering. But, if
  \`none\` is set, click and hover events are still fired. Any
  combination of `"x"`, `"y"`, `"z"`, `"color"`, `"name"`, `"text"`
  joined with `"+"`, or one of `"all"`, `"none"`, `"skip"`, or a vector
  of these.

- hoverlabel:

  Named list or `go_image_hoverlabel()` object.

- hovertemplate:

  Template string used for rendering the information that appear on
  hover box. Note that this will override \`hoverinfo\`. Variables are
  inserted using %{variable}, for example "y: %{y}" as well as
  %{xother}, {%\_xother}, {%\_xother\_}, {%xother\_}. When showing info
  for several points, "xother" will be added to those with different x
  positions from the first point. An underscore before or after
  "(x\|y)other" will add a space on that side, only when this field is
  shown. Numbers are formatted using d3-format's syntax
  %{variable:d3-format}, for example "Price: %{y:\$.2f}".
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format for details on
  the formatting syntax. Dates are formatted using d3-time-format's
  syntax %{variable\|d3-time-format}, for example "Day:
  %{2019-01-01\|%A}".
  https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format for
  details on the date formatting syntax. Variables that can't be found
  will be replaced with the specifier. For example, a template of "data:
  %{x}, %{y}" will result in a value of "data: 1, %{y}" if x is 1 and y
  is missing. Variables with an undefined value will be replaced with
  the fallback value. The variables available in \`hovertemplate\` are
  the ones emitted as event data described at this link
  https://plotly.com/javascript/plotlyjs-events/#event-data.
  Additionally, all attributes that can be specified per-point (the ones
  that are \`arrayOk: true\`) are available. Finally, the template
  string has access to variables \`z\`, \`color\` and \`colormodel\`.
  Anything contained in tag \`\<extra\>\` is displayed in the secondary
  box, for example \`\<extra\>%{fullData.name}\</extra\>\`. To hide the
  secondary box completely, use an empty tag \`\<extra\>\</extra\>\`.
  String, or a vector of these.

- hovertemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- hovertext:

  Same as \`text\`. Data array: a vector, factor, Date/POSIXct vector,
  matrix or list.

- ids:

  Assigns id labels to each datum. These ids for object constancy of
  data points during animation. Should be an array of strings, not
  numbers or any other type. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- legend:

  Sets the reference to a legend to show this trace in. References to
  these legends are "legend", "legend2", "legend3", etc. Settings for
  these legends are set in the layout, under \`layout.legend\`,
  \`layout.legend2\`, etc. Subplot id: `"legend"`, `"legend2"`,
  `"legend3"`, ....

- legendgrouptitle:

  Named list or `go_image_legendgrouptitle()` object.

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

  Sets the trace name. The trace name appears as the legend item and on
  hover. String.

- opacity:

  Sets the opacity of the trace. Number in the interval \[0, 1\].

- source:

  Specifies the data URI of the image to be visualized. The URI consists
  of "data:image/\[\<media subtype\\\>\]\[;base64\\\],\<data\\\>"
  String.

- text:

  **`go_image()`**: Sets the text elements associated with each z value.
  Data array: a vector, factor, Date/POSIXct vector, matrix or list.

  **`go_image_legendgrouptitle()`**: Sets the title of the legend group.
  String.

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

- visible:

  Determines whether or not this trace is visible. If "legendonly", the
  trace is not drawn, but can appear as a legend item (provided that the
  legend itself is visible). One of `"legendonly"`, `TRUE`, `FALSE`.

- x0:

  Set the image's x position. The left edge of the image (or the right
  edge if the x axis is reversed or dx is negative) will be found at
  xmin=x0-dx/2 Any value.

- xaxis:

  Sets a reference between this trace's x coordinates and a 2D cartesian
  x axis. If "x" (the default value), the x coordinates refer to
  \`layout.xaxis\`. If "x2", the x coordinates refer to
  \`layout.xaxis2\`, and so on. Subplot id: `"x"`, `"x2"`, `"x3"`, ....

- y0:

  Set the image's y position. The top edge of the image (or the bottom
  edge if the y axis is NOT reversed or if dy is negative) will be found
  at ymin=y0-dy/2. By default when an image trace is included, the y
  axis will be reversed so that the image is right-side-up, but you can
  disable this by setting yaxis.autorange=true or by providing an
  explicit y axis range. Any value.

- yaxis:

  Sets a reference between this trace's y coordinates and a 2D cartesian
  y axis. If "y" (the default value), the y coordinates refer to
  \`layout.yaxis\`. If "y2", the y coordinates refer to
  \`layout.yaxis2\`, and so on. Subplot id: `"y"`, `"y2"`, `"y3"`, ....

- z:

  A 2-dimensional array in which each element is an array of 3 or 4
  numbers representing a color. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

- zmax:

  Array defining the higher bound for each color component. Note that
  the default value will depend on the colormodel. For the \`rgb\`
  colormodel, it is \[255, 255, 255\]. For the \`rgba\` colormodel, it
  is \[255, 255, 255, 1\]. For the \`rgba256\` colormodel, it is \[255,
  255, 255, 255\]. For the \`hsl\` colormodel, it is \[360, 100, 100\].
  For the \`hsla\` colormodel, it is \[360, 100, 100, 1\]. Vector or
  list of 4 element(s).

- zmin:

  Array defining the lower bound for each color component. Note that the
  default value will depend on the colormodel. For the \`rgb\`
  colormodel, it is \[0, 0, 0\]. For the \`rgba\` colormodel, it is \[0,
  0, 0, 0\]. For the \`rgba256\` colormodel, it is \[0, 0, 0, 0\]. For
  the \`hsl\` colormodel, it is \[0, 0, 0\]. For the \`hsla\`
  colormodel, it is \[0, 0, 0, 0\]. Vector or list of 4 element(s).

- zorder:

  Sets the layer on which this trace is displayed, relative to other SVG
  traces on the same subplot. SVG traces with higher \`zorder\` appear
  in front of those with lower \`zorder\`. Integer.

- zsmooth:

  Picks a smoothing algorithm used to smooth \`z\` data. This only
  applies for image traces that use the \`source\` attribute. One of
  `"fast"`, `FALSE`.

- row:

  Subplot grid row (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

- col:

  Subplot grid column (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

- secondary_y:

  If `TRUE`, use the secondary y axis of the subplot.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from (constructors). Named arguments take precedence.

- align:

  Sets the horizontal alignment of the text content within hover label
  box. Has an effect only if the hover label text spans two or more
  lines One of `"left"`, `"right"`, `"auto"`, or a vector of these.

- bgcolor:

  Sets the background color of the hover labels for this trace Color: a
  CSS color string or R color name, or a vector of these.

- bordercolor:

  Sets the border color of the hover labels for this trace. Color: a CSS
  color string or R color name, or a vector of these.

- font:

  **`go_image_hoverlabel()`**: Sets the font used in hover labels. Named
  list or `go_image_hoverlabel_font()` object.

  **`go_image_legendgrouptitle()`**: Sets this legend group's title
  font. Named list or `go_image_legendgrouptitle_font()` object.

- namelength:

  Sets the default length (in number of characters) of the trace name in
  the hover labels for all traces. -1 shows the whole name regardless of
  length. 0-3 shows the first 0-3 characters, and an integer \>3 will
  show the whole name if it is less than that many characters, but if it
  is longer, will truncate to \`namelength - 3\` characters and add an
  ellipsis. Integer in the interval \[-1, Inf\], or a vector of these.

- showarrow:

  Sets whether or not to show the hover label arrow/triangle pointing to
  the data point. Logical.

- color:

  **`go_image_hoverlabel_font()`**: Color: a CSS color string or R color
  name, or a vector of these.

  **`go_image_legendgrouptitle_font()`**: Color: a CSS color string or R
  color name.

- family:

  **`go_image_hoverlabel_font()`**: HTML font family - the typeface that
  will be applied by the web browser. The web browser can only apply a
  font if it is available on the system where it runs. Provide multiple
  font families, separated by commas, to indicate the order in which to
  apply fonts if they aren't available. String, or a vector of these.

  **`go_image_legendgrouptitle_font()`**: HTML font family - the
  typeface that will be applied by the web browser. The web browser can
  only apply a font if it is available on the system where it runs.
  Provide multiple font families, separated by commas, to indicate the
  order in which to apply fonts if they aren't available. String.

- lineposition:

  **`go_image_hoverlabel_font()`**: Sets the kind of decoration line(s)
  with text, such as an "under", "over" or "through" as well as
  combinations e.g. "under+over", etc. Any combination of `"under"`,
  `"over"`, `"through"` joined with `"+"`, or one of `"none"`, or a
  vector of these.

  **`go_image_legendgrouptitle_font()`**: Sets the kind of decoration
  line(s) with text, such as an "under", "over" or "through" as well as
  combinations e.g. "under+over", etc. Any combination of `"under"`,
  `"over"`, `"through"` joined with `"+"`, or one of `"none"`.

- shadow:

  **`go_image_hoverlabel_font()`**: Sets the shape and color of the
  shadow behind text. "auto" places minimal shadow and applies contrast
  text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String, or a vector of these.

  **`go_image_legendgrouptitle_font()`**: Sets the shape and color of
  the shadow behind text. "auto" places minimal shadow and applies
  contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String.

- size:

  **`go_image_hoverlabel_font()`**: Number in the interval \[1, Inf\],
  or a vector of these.

  **`go_image_legendgrouptitle_font()`**: Number in the interval \[1,
  Inf\].

- style:

  **`go_image_hoverlabel_font()`**: Sets whether a font should be styled
  with a normal or italic face from its family. One of `"normal"`,
  `"italic"`, or a vector of these.

  **`go_image_legendgrouptitle_font()`**: Sets whether a font should be
  styled with a normal or italic face from its family. One of
  `"normal"`, `"italic"`.

- textcase:

  **`go_image_hoverlabel_font()`**: Sets capitalization of text. It can
  be used to make text appear in all-uppercase or all-lowercase, or with
  each word capitalized. One of `"normal"`, `"word caps"`, `"upper"`,
  `"lower"`, or a vector of these.

  **`go_image_legendgrouptitle_font()`**: Sets capitalization of text.
  It can be used to make text appear in all-uppercase or all-lowercase,
  or with each word capitalized. One of `"normal"`, `"word caps"`,
  `"upper"`, `"lower"`.

- variant:

  **`go_image_hoverlabel_font()`**: Sets the variant of the font. One of
  `"normal"`, `"small-caps"`, `"all-small-caps"`, `"all-petite-caps"`,
  `"petite-caps"`, `"unicase"`, or a vector of these.

  **`go_image_legendgrouptitle_font()`**: Sets the variant of the font.
  One of `"normal"`, `"small-caps"`, `"all-small-caps"`,
  `"all-petite-caps"`, `"petite-caps"`, `"unicase"`.

- weight:

  **`go_image_hoverlabel_font()`**: Sets the weight (or boldness) of the
  font. Integer in the interval \[1, 1000\], or a vector of these.

  **`go_image_legendgrouptitle_font()`**: Sets the weight (or boldness)
  of the font. Integer in the interval \[1, 1000\].

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_image()` and the nested object constructors below create validated
graph objects (named lists). Every property is checked against the
plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
`add_image()` creates an object and adds it to a figure.

Nested objects documented here:

- `go_image_hoverlabel()`:

  `image.hoverlabel`

- `go_image_hoverlabel_font()`:

  `image.hoverlabel.font`: Sets the font used in hover labels.

- `go_image_legendgrouptitle()`:

  `image.legendgrouptitle`

- `go_image_legendgrouptitle_font()`:

  `image.legendgrouptitle.font`: Sets this legend group's title font.

## See also

[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)

## Examples

``` r
go_image()
#> <go_image>
#> {
#>   "type": "image"
#> }
#> 
```
