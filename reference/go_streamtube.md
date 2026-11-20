# Streamtube traces

Use a streamtube trace to visualize flow in a vector field. Specify a
vector field using 6 1D arrays of equal length, 3 position arrays \`x\`,
\`y\` and \`z\` and 3 vector component arrays \`u\`, \`v\`, and \`w\`.
By default, the tubes' starting positions will be cut from the vector
field's x-z plane at its minimum y value. To specify your own starting
position, use attributes \`starts.x\`, \`starts.y\` and \`starts.z\`.
The color is encoded by the norm of (u, v, w), and the local radius by
the divergence of (u, v, w).

## Usage

``` r
add_streamtube(fig, ...)

# Default S3 method
add_streamtube(
  fig,
  ...,
  data = NULL,
  autocolorscale = NULL,
  cauto = NULL,
  cmax = NULL,
  cmid = NULL,
  cmin = NULL,
  coloraxis = NULL,
  colorbar = NULL,
  colorscale = NULL,
  customdata = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  lighting = NULL,
  lightposition = NULL,
  maxdisplayed = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  reversescale = NULL,
  scene = NULL,
  showlegend = NULL,
  showscale = NULL,
  sizeref = NULL,
  starts = NULL,
  text = NULL,
  u = NULL,
  uhoverformat = NULL,
  uid = NULL,
  uirevision = NULL,
  v = NULL,
  vhoverformat = NULL,
  visible = NULL,
  w = NULL,
  whoverformat = NULL,
  x = NULL,
  xhoverformat = NULL,
  y = NULL,
  yhoverformat = NULL,
  z = NULL,
  zhoverformat = NULL,
  row = NULL,
  col = NULL,
  skip_invalid = FALSE
)

go_streamtube(
  ...,
  autocolorscale = NULL,
  cauto = NULL,
  cmax = NULL,
  cmid = NULL,
  cmin = NULL,
  coloraxis = NULL,
  colorbar = NULL,
  colorscale = NULL,
  customdata = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  lighting = NULL,
  lightposition = NULL,
  maxdisplayed = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  reversescale = NULL,
  scene = NULL,
  showlegend = NULL,
  showscale = NULL,
  sizeref = NULL,
  starts = NULL,
  text = NULL,
  u = NULL,
  uhoverformat = NULL,
  uid = NULL,
  uirevision = NULL,
  v = NULL,
  vhoverformat = NULL,
  visible = NULL,
  w = NULL,
  whoverformat = NULL,
  x = NULL,
  xhoverformat = NULL,
  y = NULL,
  yhoverformat = NULL,
  z = NULL,
  zhoverformat = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- fig:

  A `go_figure` object.

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- data:

  A data frame in which formula properties (e.g. `x = ~col`) are
  evaluated. Default: the data given to
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md).
  Only the evaluated values are added to the trace. A
  [`crosstalk::SharedData`](https://rdrr.io/pkg/crosstalk/man/SharedData.html)
  works the same way, and links the trace to its crosstalk group (see
  [`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)).

- autocolorscale:

  Determines whether the colorscale is a default palette
  (\`autocolorscale: true\`) or the palette determined by
  \`colorscale\`. In case \`colorscale\` is unspecified or
  \`autocolorscale\` is true, the default palette will be chosen
  according to whether numbers in the \`color\` array are all positive,
  all negative or mixed. Logical.

- cauto:

  Determines whether or not the color domain is computed with respect to
  the input data (here u/v/w norm) or the bounds set in \`cmin\` and
  \`cmax\` Defaults to \`false\` when \`cmin\` and \`cmax\` are set by
  the user. Logical.

- cmax:

  Sets the upper bound of the color domain. Value should have the same
  units as u/v/w norm and if set, \`cmin\` must be set as well. Number.

- cmid:

  Sets the mid-point of the color domain by scaling \`cmin\` and/or
  \`cmax\` to be equidistant to this point. Value should have the same
  units as u/v/w norm. Has no effect when \`cauto\` is \`false\`.
  Number.

- cmin:

  Sets the lower bound of the color domain. Value should have the same
  units as u/v/w norm and if set, \`cmax\` must be set as well. Number.

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

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- hoverinfo:

  Determines what trace information appears on hover. If \`none\` or
  \`skip\` are set, no information is displayed upon hovering. But, if
  \`none\` is set, click and hover events are still fired. Any
  combination of `"x"`, `"y"`, `"z"`, `"u"`, `"v"`, `"w"`, `"norm"`,
  `"divergence"`, `"text"`, `"name"` joined with `"+"`, or one of
  `"all"`, `"none"`, `"skip"`, or a vector of these.

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
  string has access to variables \`tubex\`, \`tubey\`, \`tubez\`,
  \`tubeu\`, \`tubev\`, \`tubew\`, \`norm\` and \`divergence\`. Anything
  contained in tag \`\<extra\>\` is displayed in the secondary box, for
  example \`\<extra\>%{fullData.name}\</extra\>\`. To hide the secondary
  box completely, use an empty tag \`\<extra\>\</extra\>\`. String, or a
  vector of these.

- hovertemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- hovertext:

  Same as \`text\`. String.

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

- legendgroup:

  Sets the legend group for this trace. Traces and shapes part of the
  same legend group hide/show at the same time when toggling legend
  items. String.

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

- lighting:

  A
  [`go_streamtube_lighting()`](https://msummersgill.github.io/plotly.R.core/reference/go_streamtube_lighting.md)
  object or named list, with properties `ambient`, `diffuse`,
  `facenormalsepsilon`, `fresnel`, `roughness`, `specular` and
  `vertexnormalsepsilon` (see
  [`go_streamtube_lighting()`](https://msummersgill.github.io/plotly.R.core/reference/go_streamtube_lighting.md)).

- lightposition:

  A
  [`go_lightposition()`](https://msummersgill.github.io/plotly.R.core/reference/go_lightposition.md)
  object or named list, with properties `x`, `y` and `z` (see
  [`go_lightposition()`](https://msummersgill.github.io/plotly.R.core/reference/go_lightposition.md)).

- maxdisplayed:

  The maximum number of displayed segments in a streamtube. Integer in
  the interval \[0, Inf\].

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

  Sets the opacity of the surface. Please note that in the case of using
  high \`opacity\` values for example a value greater than or equal to
  0.5 on two surfaces (and 0.25 with four surfaces), an overlay of
  multiple transparent surfaces may not perfectly be sorted in depth by
  the webgl API. This behavior may be improved in the near future and is
  subject to change. Number in the interval \[0, 1\].

- reversescale:

  Reverses the color mapping if true. If true, \`cmin\` will correspond
  to the last color in the array and \`cmax\` will correspond to the
  first color. Logical.

- scene:

  Sets a reference between this trace's 3D coordinate system and a 3D
  scene. If "scene" (the default value), the (x,y,z) coordinates refer
  to \`layout.scene\`. If "scene2", the (x,y,z) coordinates refer to
  \`layout.scene2\`, and so on. Subplot id: `"scene"`, `"scene2"`,
  `"scene3"`, ....

- showlegend:

  Determines whether or not an item corresponding to this trace is shown
  in the legend. Logical.

- showscale:

  Determines whether or not a colorbar is displayed for this trace.
  Logical.

- sizeref:

  The scaling factor for the streamtubes. The default is 1, which avoids
  two max divergence tubes from touching at adjacent starting positions.
  Number in the interval \[0, Inf\].

- starts:

  A
  [`go_streamtube_starts()`](https://msummersgill.github.io/plotly.R.core/reference/go_streamtube_starts.md)
  object or named list, with properties `x`, `y` and `z` (see
  [`go_streamtube_starts()`](https://msummersgill.github.io/plotly.R.core/reference/go_streamtube_starts.md)).

- text:

  Sets a text element associated with this trace. If trace \`hoverinfo\`
  contains a "text" flag, this text element will be seen in all hover
  labels. Note that streamtube traces do not support array \`text\`
  values. String.

- u:

  Sets the x components of the vector field. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

- uhoverformat:

  Sets the hover text formatting rule for \`u\` using d3 formatting
  mini-languages which are very similar to those in Python. For numbers,
  see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format.By default
  the values are formatted using generic number format. String.

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

- v:

  Sets the y components of the vector field. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

- vhoverformat:

  Sets the hover text formatting rule for \`v\` using d3 formatting
  mini-languages which are very similar to those in Python. For numbers,
  see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format.By default
  the values are formatted using generic number format. String.

- visible:

  Determines whether or not this trace is visible. If "legendonly", the
  trace is not drawn, but can appear as a legend item (provided that the
  legend itself is visible). One of `"legendonly"`, `TRUE`, `FALSE`.

- w:

  Sets the z components of the vector field. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

- whoverformat:

  Sets the hover text formatting rule for \`w\` using d3 formatting
  mini-languages which are very similar to those in Python. For numbers,
  see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format.By default
  the values are formatted using generic number format. String.

- x:

  Sets the x coordinates of the vector field. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

- xhoverformat:

  Sets the hover text formatting rule for \`x\` using d3 formatting
  mini-languages which are very similar to those in Python. For numbers,
  see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for
  dates see:
  https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format. We add
  two items to d3's date formatter: "%h" for half of the year as a
  decimal number as well as "%{n}f" for fractional seconds with n
  digits. For example, "2016-10-13 09:15:23.456" with tickformat
  "%H~%M~%S.%2f" would display "09~15~23.46"By default the values are
  formatted using \`xaxis.hoverformat\`. String.

- y:

  Sets the y coordinates of the vector field. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

- yhoverformat:

  Sets the hover text formatting rule for \`y\` using d3 formatting
  mini-languages which are very similar to those in Python. For numbers,
  see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for
  dates see:
  https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format. We add
  two items to d3's date formatter: "%h" for half of the year as a
  decimal number as well as "%{n}f" for fractional seconds with n
  digits. For example, "2016-10-13 09:15:23.456" with tickformat
  "%H~%M~%S.%2f" would display "09~15~23.46"By default the values are
  formatted using \`yaxis.hoverformat\`. String.

- z:

  Sets the z coordinates of the vector field. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

- zhoverformat:

  Sets the hover text formatting rule for \`z\` using d3 formatting
  mini-languages which are very similar to those in Python. For numbers,
  see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for
  dates see:
  https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format. We add
  two items to d3's date formatter: "%h" for half of the year as a
  decimal number as well as "%{n}f" for fractional seconds with n
  digits. For example, "2016-10-13 09:15:23.456" with tickformat
  "%H~%M~%S.%2f" would display "09~15~23.46"By default the values are
  formatted using \`zaxis.hoverformat\`. String.

- row:

  Subplot grid row (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

- col:

  Subplot grid column (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

`go_*()` functions return a graph object; `add_*()` functions return the
modified figure.

## Details

`go_streamtube()` creates a validated graph object (a named list).
`add_streamtube()` creates one and adds it to a figure.

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
d <- expand.grid(x = 1:3, y = 1:3, z = 1:3)
d |>
  go_figure() |>
  add_streamtube(x = ~x, y = ~y, z = ~z, u = ~y, v = ~-x, w = ~z)
```
