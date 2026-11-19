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
```

## Arguments

- fig:

  A `go_figure` object.

- ...:

  Not used: properties must be named in full.

- data:

  A data frame in which formula properties (e.g. `x = ~col`,
  `marker = list(size = ~col)`,
  `marker = go_scatter_marker(size = ~col)`) are evaluated. Default: the
  data given to
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

  A
  [`go_hoverlabel()`](https://msummersgill.github.io/plotly.R.core/reference/go_hoverlabel.md)
  object or named list, with properties `align`, `bgcolor`,
  `bordercolor`, `font`, `namelength` and `showarrow` (see
  [`go_hoverlabel()`](https://msummersgill.github.io/plotly.R.core/reference/go_hoverlabel.md)).

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

  A
  [`go_legendgrouptitle()`](https://msummersgill.github.io/plotly.R.core/reference/go_legendgrouptitle.md)
  object or named list, with properties `font` and `text` (see
  [`go_legendgrouptitle()`](https://msummersgill.github.io/plotly.R.core/reference/go_legendgrouptitle.md)).

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

  Sets the text elements associated with each z value. Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

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

## Value

`go_*()` functions return a graph object; `add_*()` functions return the
modified figure.

## Details

`go_image()` creates a validated graph object (a named list).
`add_image()` creates one and adds it to a figure.

Nested objects are given as named lists or with their constructors,
which are linked from the arguments below. Every property is checked
against the plotly.js schema when the object is created or modified (see
[`plotly_obj-modify`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
One-sided formulas (`~col`) are evaluated in the data, and then checked,
when the trace is added with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## See also

[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)

## Examples

``` r
rgb <- col2rgb(terrain.colors(100)[cut(volcano, 100)])
z <- array(t(rgb), c(dim(volcano), 3))
go_figure() |>
  add_image(z = z)
```
