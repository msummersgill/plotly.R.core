# Scatterpolargl traces

The scatterpolargl trace type encompasses line charts, scatter charts,
and bubble charts in polar coordinates using the WebGL plotting engine.
The data visualized as scatter point or lines is set in \`r\` (radial)
and \`theta\` (angular) coordinates Bubble charts are achieved by
setting \`marker.size\` and/or \`marker.color\` to numerical arrays.

## Usage

``` r
add_scatterpolargl(fig, ...)

# Default S3 method
add_scatterpolargl(
  fig,
  ...,
  data = NULL,
  connectgaps = NULL,
  customdata = NULL,
  dr = NULL,
  dtheta = NULL,
  fill = NULL,
  fillcolor = NULL,
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
  line = NULL,
  marker = NULL,
  meta = NULL,
  mode = NULL,
  name = NULL,
  opacity = NULL,
  r = NULL,
  r0 = NULL,
  selected = NULL,
  selectedpoints = NULL,
  showlegend = NULL,
  subplot = NULL,
  text = NULL,
  textfont = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  theta = NULL,
  theta0 = NULL,
  thetaunit = NULL,
  uid = NULL,
  uirevision = NULL,
  unselected = NULL,
  visible = NULL,
  row = NULL,
  col = NULL,
  skip_invalid = FALSE
)

go_scatterpolargl(
  arg = NULL,
  ...,
  connectgaps = NULL,
  customdata = NULL,
  dr = NULL,
  dtheta = NULL,
  fill = NULL,
  fillcolor = NULL,
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
  line = NULL,
  marker = NULL,
  meta = NULL,
  mode = NULL,
  name = NULL,
  opacity = NULL,
  r = NULL,
  r0 = NULL,
  selected = NULL,
  selectedpoints = NULL,
  showlegend = NULL,
  subplot = NULL,
  text = NULL,
  textfont = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  theta = NULL,
  theta0 = NULL,
  thetaunit = NULL,
  uid = NULL,
  uirevision = NULL,
  unselected = NULL,
  visible = NULL,
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

- connectgaps:

  Determines whether or not gaps (i.e. {nan} or missing values) in the
  provided data arrays are connected. Logical.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- dr:

  Sets the r coordinate step. Number.

- dtheta:

  Sets the theta coordinate step. By default, the \`dtheta\` step equals
  the subplot's period divided by the length of the \`r\` coordinates.
  Number.

- fill:

  Sets the area to fill with a solid color. Defaults to "none" unless
  this trace is stacked, then it gets "tonexty" ("tonextx") if
  \`orientation\` is "v" ("h") Use with \`fillcolor\` if not "none".
  "tozerox" and "tozeroy" fill to x=0 and y=0 respectively. "tonextx"
  and "tonexty" fill between the endpoints of this trace and the
  endpoints of the trace before it, connecting those endpoints with
  straight lines (to make a stacked area graph); if there is no trace
  before it, they behave like "tozerox" and "tozeroy". "toself" connects
  the endpoints of the trace (or each segment of the trace if it has
  gaps) into a closed shape. "tonext" fills the space between two traces
  if one completely encloses the other (eg consecutive contour lines),
  and behaves like "toself" if there is no trace before it. "tonext"
  should not be used if one trace does not enclose the other. Traces in
  a \`stackgroup\` will only fill to (or be filled to) other traces in
  the same group. With multiple \`stackgroup\`s or some traces stacked
  and some not, if fill-linked traces are not already consecutive, the
  later ones will be pushed down in the drawing order. One of `"none"`,
  `"tozeroy"`, `"tozerox"`, `"tonexty"`, `"tonextx"`, `"toself"`,
  `"tonext"`.

- fillcolor:

  Sets the fill color. Defaults to a half-transparent variant of the
  line color, marker color, or marker line color, whichever is
  available. Color: a CSS color string or R color name.

- hoverinfo:

  Determines what trace information appears on hover. If \`none\` or
  \`skip\` are set, no information is displayed upon hovering. But, if
  \`none\` is set, click and hover events are still fired. Any
  combination of `"r"`, `"theta"`, `"text"`, `"name"` joined with `"+"`,
  or one of `"all"`, `"none"`, `"skip"`, or a vector of these.

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

  Sets hover text elements associated with each (x,y) pair. If a single
  string, the same string appears over all the data points. If an array
  of string, the items are mapped in order to the this trace's (x,y)
  coordinates. To be seen, trace \`hoverinfo\` must contain a "text"
  flag. String, or a vector of these.

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

- line:

  A
  [`go_scatterpolargl_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatterpolargl_line.md)
  object or named list, with properties `color`, `dash` and `width` (see
  [`go_scatterpolargl_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatterpolargl_line.md)).

- marker:

  A
  [`go_scatterpolargl_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatterpolargl_marker.md)
  object or named list, with properties `angle`, `autocolorscale`,
  `cauto`, `cmax`, `cmid`, `cmin`, `color`, `coloraxis`, `colorbar`,
  `colorscale`, `line`, `opacity` and 7 more (see
  [`go_scatterpolargl_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatterpolargl_marker.md)).

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

- mode:

  Determines the drawing mode for this scatter trace. If the provided
  \`mode\` includes "text" then the \`text\` elements appear at the
  coordinates. Otherwise, the \`text\` elements appear on hover. If
  there are less than 20 points and the trace is not stacked then the
  default is "lines+markers". Otherwise, "lines". Any combination of
  `"lines"`, `"markers"`, `"text"` joined with `"+"`, or one of
  `"none"`.

- name:

  Sets the trace name. The trace name appears as the legend item and on
  hover. String.

- opacity:

  Sets the opacity of the trace. Number in the interval \[0, 1\].

- r:

  Sets the radial coordinates Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- r0:

  Alternate to \`r\`. Builds a linear space of r coordinates. Use with
  \`dr\` where \`r0\` is the starting coordinate and \`dr\` the step.
  Any value.

- selected:

  A
  [`go_selected()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected.md)
  object or named list, with properties `marker` and `textfont` (see
  [`go_selected()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected.md)).

- selectedpoints:

  Array containing integer indices of selected points. Has an effect
  only for traces that support selections. Note that an empty array
  means an empty selection where the \`unselected\` are turned on for
  all points, whereas, any other non-array values means no selection all
  where the \`selected\` and \`unselected\` styles have no effect. Any
  value.

- showlegend:

  Determines whether or not an item corresponding to this trace is shown
  in the legend. Logical.

- subplot:

  Sets a reference between this trace's data coordinates and a polar
  subplot. If "polar" (the default value), the data refer to
  \`layout.polar\`. If "polar2", the data refer to \`layout.polar2\`,
  and so on. Subplot id: `"polar"`, `"polar2"`, `"polar3"`, ....

- text:

  Sets text elements associated with each (x,y) pair. If a single
  string, the same string appears over all the data points. If an array
  of string, the items are mapped in order to the this trace's (x,y)
  coordinates. If trace \`hoverinfo\` contains a "text" flag and
  "hovertext" is not set, these elements will be seen in the hover
  labels. String, or a vector of these.

- textfont:

  Sets the text font. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`, `size`,
  `style`, `variant` and `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- textposition:

  Sets the positions of the \`text\` elements with respects to the (x,y)
  coordinates. One of `"top left"`, `"top center"`, `"top right"`,
  `"middle left"`, `"middle center"`, `"middle right"`, `"bottom left"`,
  `"bottom center"`, `"bottom right"`, or a vector of these.

- texttemplate:

  Template string used for rendering the information text that appears
  on points. Note that this will override \`textinfo\`. Variables are
  inserted using %{variable}, for example "y: %{y}". Numbers are
  formatted using d3-format's syntax %{variable:d3-format}, for example
  "Price: %{y:\$.2f}".
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format for details on
  the formatting syntax. Dates are formatted using d3-time-format's
  syntax %{variable\|d3-time-format}, for example "Day:
  %{2019-01-01\|%A}".
  https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format for
  details on the date formatting syntax. Variables that can't be found
  will be replaced with the specifier. For example, a template of "data:
  %{x}, %{y}" will result in a value of "data: 1, %{y}" if x is 1 and y
  is missing. Variables with an undefined value will be replaced with
  the fallback value. All attributes that can be specified per-point
  (the ones that are \`arrayOk: true\`) are available. Finally, the
  template string has access to variables \`r\`, \`theta\` and \`text\`.
  String, or a vector of these.

- texttemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- theta:

  Sets the angular coordinates Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

- theta0:

  Alternate to \`theta\`. Builds a linear space of theta coordinates.
  Use with \`dtheta\` where \`theta0\` is the starting coordinate and
  \`dtheta\` the step. Any value.

- thetaunit:

  Sets the unit of input "theta" values. Has an effect only when on
  "linear" angular axes. One of `"radians"`, `"degrees"`, `"gradians"`.

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

- unselected:

  A
  [`go_unselected()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected.md)
  object or named list, with properties `marker` and `textfont` (see
  [`go_unselected()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected.md)).

- visible:

  Determines whether or not this trace is visible. If "legendonly", the
  trace is not drawn, but can appear as a legend item (provided that the
  legend itself is visible). One of `"legendonly"`, `TRUE`, `FALSE`.

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

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from (constructors). Named arguments take precedence.

## Value

`go_*()` functions return a graph object; `add_*()` functions return the
modified figure.

## Details

`go_scatterpolargl()` creates a validated graph object (a named list).
`add_scatterpolargl()` creates one and adds it to a figure.

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
mtcars |>
  go_figure() |>
  add_scatterpolargl(r = ~mpg, theta = ~hp)
```
