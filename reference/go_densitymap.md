# Densitymap traces

Draws a bivariate kernel density estimation with a Gaussian kernel from
\`lon\` and \`lat\` coordinates and optional \`z\` values using a
colorscale.

## Usage

``` r
go_densitymap(
  ...,
  autocolorscale = NULL,
  below = NULL,
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
  lat = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  lon = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  radius = NULL,
  reversescale = NULL,
  showlegend = NULL,
  showscale = NULL,
  subplot = NULL,
  text = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  z = NULL,
  zauto = NULL,
  zmax = NULL,
  zmid = NULL,
  zmin = NULL,
  skip_invalid = FALSE
)

add_densitymap(fig, ...)

# Default S3 method
add_densitymap(
  fig,
  ...,
  data = NULL,
  split = NULL,
  autocolorscale = NULL,
  below = NULL,
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
  lat = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  lon = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  radius = NULL,
  reversescale = NULL,
  showlegend = NULL,
  showscale = NULL,
  subplot = NULL,
  text = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  z = NULL,
  zauto = NULL,
  zmax = NULL,
  zmid = NULL,
  zmin = NULL,
  row = NULL,
  col = NULL,
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

- below:

  Determines if the densitymap trace will be inserted before the layer
  with the specified ID. By default, densitymap traces are placed below
  the first layer of type symbol If set to ”, the layer will be inserted
  above every existing layer. String.

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
  the colorscale in color space, use \`zmin\` and \`zmax\`.
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
  combination of `"lon"`, `"lat"`, `"z"`, `"text"`, `"name"` joined with
  `"+"`, or one of `"all"`, `"none"`, `"skip"`, or a vector of these.

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
  that are \`arrayOk: true\`) are available. Anything contained in tag
  \`\<extra\>\` is displayed in the secondary box, for example
  \`\<extra\>%{fullData.name}\</extra\>\`. To hide the secondary box
  completely, use an empty tag \`\<extra\>\</extra\>\`. String, or a
  vector of these.

- hovertemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- hovertext:

  Sets hover text elements associated with each (lon,lat) pair If a
  single string, the same string appears over all the data points. If an
  array of string, the items are mapped in order to the this trace's
  (lon,lat) coordinates. To be seen, trace \`hoverinfo\` must contain a
  "text" flag. String, or a vector of these.

- ids:

  Assigns id labels to each datum. These ids for object constancy of
  data points during animation. Should be an array of strings, not
  numbers or any other type. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- lat:

  Sets the latitude coordinates (in degrees North). Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

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

- lon:

  Sets the longitude coordinates (in degrees East). Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

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

- radius:

  Sets the radius of influence of one \`lon\` / \`lat\` point in pixels.
  Increasing the value makes the densitymap trace smoother, but less
  detailed. Number in the interval \[1, Inf\], or a vector of these.

- reversescale:

  Reverses the color mapping if true. If true, \`zmin\` will correspond
  to the last color in the array and \`zmax\` will correspond to the
  first color. Logical.

- showlegend:

  Determines whether or not an item corresponding to this trace is shown
  in the legend. Logical.

- showscale:

  Determines whether or not a colorbar is displayed for this trace.
  Logical.

- subplot:

  Sets a reference between this trace's data coordinates and a map
  subplot. If "map" (the default value), the data refer to
  \`layout.map\`. If "map2", the data refer to \`layout.map2\`, and so
  on. Subplot id: `"map"`, `"map2"`, `"map3"`, ....

- text:

  Sets text elements associated with each (lon,lat) pair If a single
  string, the same string appears over all the data points. If an array
  of string, the items are mapped in order to the this trace's (lon,lat)
  coordinates. If trace \`hoverinfo\` contains a "text" flag and
  "hovertext" is not set, these elements will be seen in the hover
  labels. String, or a vector of these.

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

- z:

  Sets the points' weight. For example, a value of 10 would be
  equivalent to having 10 points of weight 1 in the same spot Data
  array: a vector, factor, Date/POSIXct vector, matrix or list.

- zauto:

  Determines whether or not the color domain is computed with respect to
  the input data (here in \`z\`) or the bounds set in \`zmin\` and
  \`zmax\` Defaults to \`false\` when \`zmin\` and \`zmax\` are set by
  the user. Logical.

- zmax:

  Sets the upper bound of the color domain. Value should have the same
  units as in \`z\` and if set, \`zmin\` must be set as well. Number.

- zmid:

  Sets the mid-point of the color domain by scaling \`zmin\` and/or
  \`zmax\` to be equidistant to this point. Value should have the same
  units as in \`z\`. Has no effect when \`zauto\` is \`false\`. Number.

- zmin:

  Sets the lower bound of the color domain. Value should have the same
  units as in \`z\` and if set, \`zmax\` must be set as well. Number.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- fig:

  A `go_figure` object.

- data:

  A data frame in which formula properties (e.g. `z = ~col`) are
  evaluated. Default: the data given to
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md).
  Only the evaluated values are added to the trace. A
  [`crosstalk::SharedData`](https://rdrr.io/pkg/crosstalk/man/SharedData.html)
  works the same way, and links the trace to its crosstalk group (see
  [`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)).

- split:

  A column (`~col`) or vector with one value per point (per row of the
  data, or of the vectors formulas refer to without data): one trace is
  added per value, named after it, with the per-point values split
  accordingly. Colour properties given a discrete column (a factor,
  character or logical, e.g.
  `marker = go_scatter_marker(color = ~group)`) split the data the same
  way, each trace getting its own colour: evenly spaced viridis colours
  for an ordered factor, otherwise the figure's colorway.

- row:

  Subplot grid row (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

- col:

  Subplot grid column (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

## Value

`go_*()` functions return a graph object; `add_*()` functions return the
modified figure.

## Details

`go_densitymap()` creates a validated graph object (a named list).
`add_densitymap()` creates one and adds it to a figure.

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
quakes |>
  go_figure() |>
  add_densitymap(lat = ~lat, lon = ~long, z = ~mag)
```
