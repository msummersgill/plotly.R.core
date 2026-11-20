# Update a figure's layout

Updates layout properties, merging nested objects (e.g. `xaxis`) with
any existing values unless `overwrite = TRUE`. Properties can be given
in `patch`, as arguments, or both; arguments are applied last. Nested
properties are given as objects (`xaxis = go_xaxis(title = "x")`) or
named lists, which are merged into the existing objects. `NULL` removes
a property. Numbered subplot properties (`xaxis2`, `scene3`, ...) are
given in `...`.

## Usage

``` r
update_layout(
  fig,
  patch = NULL,
  ...,
  activeselection = NULL,
  activeshape = NULL,
  annotations = NULL,
  autosize = NULL,
  autotypenumbers = NULL,
  barcornerradius = NULL,
  bargap = NULL,
  bargroupgap = NULL,
  barmode = NULL,
  barnorm = NULL,
  boxgap = NULL,
  boxgroupgap = NULL,
  boxmode = NULL,
  calendar = NULL,
  clickanywhere = NULL,
  clickmode = NULL,
  coloraxis = NULL,
  colorscale = NULL,
  colorway = NULL,
  computed = NULL,
  datarevision = NULL,
  dragmode = NULL,
  editrevision = NULL,
  extendfunnelareacolors = NULL,
  extendiciclecolors = NULL,
  extendpiecolors = NULL,
  extendsunburstcolors = NULL,
  extendtreemapcolors = NULL,
  font = NULL,
  funnelareacolorway = NULL,
  funnelgap = NULL,
  funnelgroupgap = NULL,
  funnelmode = NULL,
  geo = NULL,
  grid = NULL,
  height = NULL,
  hiddenlabels = NULL,
  hoveranywhere = NULL,
  hoverdistance = NULL,
  hoverlabel = NULL,
  hovermode = NULL,
  hoversort = NULL,
  hoversubplots = NULL,
  iciclecolorway = NULL,
  images = NULL,
  legend = NULL,
  map = NULL,
  margin = NULL,
  meta = NULL,
  minreducedheight = NULL,
  minreducedwidth = NULL,
  modebar = NULL,
  newselection = NULL,
  newshape = NULL,
  paper_bgcolor = NULL,
  piecolorway = NULL,
  plot_bgcolor = NULL,
  polar = NULL,
  scattergap = NULL,
  scattermode = NULL,
  scene = NULL,
  selectdirection = NULL,
  selectionrevision = NULL,
  selections = NULL,
  separators = NULL,
  shapes = NULL,
  showlegend = NULL,
  sliders = NULL,
  smith = NULL,
  spikedistance = NULL,
  sunburstcolorway = NULL,
  template = NULL,
  ternary = NULL,
  title = NULL,
  transition = NULL,
  treemapcolorway = NULL,
  uirevision = NULL,
  uniformtext = NULL,
  updatemenus = NULL,
  violingap = NULL,
  violingroupgap = NULL,
  violinmode = NULL,
  waterfallgap = NULL,
  waterfallgroupgap = NULL,
  waterfallmode = NULL,
  width = NULL,
  xaxis = NULL,
  yaxis = NULL,
  overwrite = FALSE
)
```

## Arguments

- fig:

  A `go_figure` object.

- patch:

  A named list or
  [`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
  object of updates.

- ...:

  Numbered subplot properties (`xaxis2 = go_xaxis(...)`).

- activeselection:

  A
  [`go_activeselection()`](https://msummersgill.github.io/plotly.R.core/reference/go_activeselection.md)
  object or named list, with properties `fillcolor` and `opacity` (see
  [`go_activeselection()`](https://msummersgill.github.io/plotly.R.core/reference/go_activeselection.md)).

- activeshape:

  A
  [`go_activeshape()`](https://msummersgill.github.io/plotly.R.core/reference/go_activeshape.md)
  object or named list, with properties `fillcolor` and `opacity` (see
  [`go_activeshape()`](https://msummersgill.github.io/plotly.R.core/reference/go_activeshape.md)).

- annotations:

  List, each element a
  [`go_annotation()`](https://msummersgill.github.io/plotly.R.core/reference/go_annotation.md)
  object or named list, with properties `align`, `arrowcolor`,
  `arrowhead`, `arrowside`, `arrowsize`, `arrowwidth`, `ax`, `axref`,
  `ay`, `ayref`, `bgcolor`, `bordercolor` and 31 more (see
  [`go_annotation()`](https://msummersgill.github.io/plotly.R.core/reference/go_annotation.md)).

- autosize:

  Determines whether or not a layout width or height that has been left
  undefined by the user is initialized on each relayout. Note that,
  regardless of this attribute, an undefined layout width or height is
  always initialized on the first call to plot. Logical.

- autotypenumbers:

  Using "strict" a numeric string in trace data is not converted to a
  number. Using "convert types" a numeric string in trace data may be
  treated as a number during automatic axis \`type\` detection. This is
  the default value; however it could be overridden for individual axes.
  One of `"convert types"`, `"strict"`.

- barcornerradius:

  Sets the rounding of bar corners. May be an integer number of pixels,
  or a percentage of bar width (as a string ending in %). Any value.

- bargap:

  Sets the gap (in plot fraction) between bars of adjacent location
  coordinates. Number in the interval \[0, 1\].

- bargroupgap:

  Sets the gap (in plot fraction) between bars of the same location
  coordinate. Number in the interval \[0, 1\].

- barmode:

  Determines how bars at the same location coordinate are displayed on
  the graph. With "stack", the bars are stacked on top of one another
  With "relative", the bars are stacked on top of one another, with
  negative values below the axis, positive values above With "group",
  the bars are plotted next to one another centered around the shared
  location. With "overlay", the bars are plotted over one another, you
  might need to reduce "opacity" to see multiple bars. One of `"stack"`,
  `"group"`, `"overlay"`, `"relative"`.

- barnorm:

  Sets the normalization for bar traces on the graph. With "fraction",
  the value of each bar is divided by the sum of all values at that
  location coordinate. "percent" is the same but multiplied by 100 to
  show percentages. One of `""`, `"fraction"`, `"percent"`.

- boxgap:

  Sets the gap (in plot fraction) between boxes of adjacent location
  coordinates. Has no effect on traces that have "width" set. Number in
  the interval \[0, 1\].

- boxgroupgap:

  Sets the gap (in plot fraction) between boxes of the same location
  coordinate. Has no effect on traces that have "width" set. Number in
  the interval \[0, 1\].

- boxmode:

  Determines how boxes at the same location coordinate are displayed on
  the graph. If "group", the boxes are plotted next to one another
  centered around the shared location. If "overlay", the boxes are
  plotted over one another, you might need to set "opacity" to see them
  multiple boxes. Has no effect on traces that have "width" set. One of
  `"group"`, `"overlay"`.

- calendar:

  Sets the default calendar system to use for interpreting and
  displaying dates throughout the plot. One of `"chinese"`, `"coptic"`,
  `"discworld"`, `"ethiopian"`, `"gregorian"`, `"hebrew"`, `"islamic"`,
  `"jalali"`, `"julian"`, `"mayan"`, `"nanakshahi"`, `"nepali"`,
  `"persian"`, `"taiwan"`, `"thai"`, `"ummalqura"`.

- clickanywhere:

  If true, \`plotly_click\` events will fire for any click position
  within the plot area, not just over traces. When clicking where there
  is no trace data, the event will have an empty \`points\` array but
  will include \`xvals\` and \`yvals\` with click coordinates in data
  space, and \`xPixel\` and \`yPixel\` with click coordinates in pixels,
  relative to the top-left corner of the graph div. Logical.

- clickmode:

  Determines the mode of single click interactions. "event" is the
  default value and emits the \`plotly_click\` event. In addition this
  mode emits the \`plotly_selected\` event in drag modes "lasso" and
  "select", but with no event data attached (kept for compatibility
  reasons). The "select" flag enables selecting single data points via
  click. This mode also supports persistent selections, meaning that
  pressing Shift while clicking, adds to / subtracts from an existing
  selection. "select" with \`hovermode\`: "x" can be confusing, consider
  explicitly setting \`hovermode\`: "closest" when using this feature.
  Selection events are sent accordingly as long as "event" flag is set
  as well. When the "event" flag is missing, \`plotly_click\` and
  \`plotly_selected\` events are not fired. Any combination of
  `"event"`, `"select"` joined with `"+"`, or one of `"none"`.

- coloraxis:

  A
  [`go_coloraxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_coloraxis.md)
  object or named list, with properties `autocolorscale`, `cauto`,
  `cmax`, `cmid`, `cmin`, `colorbar`, `colorscale`, `reversescale` and
  `showscale` (see
  [`go_coloraxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_coloraxis.md)).

- colorscale:

  A
  [`go_layout_colorscale()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_colorscale.md)
  object or named list, with properties `diverging`, `sequential` and
  `sequentialminus` (see
  [`go_layout_colorscale()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_colorscale.md)).

- colorway:

  Sets the default trace colors. Vector of colors.

- computed:

  Placeholder for exporting automargin-impacting values namely
  \`margin.t\`, \`margin.b\`, \`margin.l\` and \`margin.r\` in
  "full-json" mode. Any value.

- datarevision:

  If provided, a changed value tells \`Plotly.react\` that one or more
  data arrays has changed. This way you can modify arrays in-place
  rather than making a complete new copy for an incremental change. If
  NOT provided, \`Plotly.react\` assumes that data arrays are being
  treated as immutable, thus any data array with a different identity
  from its predecessor contains new data. Any value.

- dragmode:

  Determines the mode of drag interactions. "select" and "lasso" apply
  only to scatter traces with markers or text. "orbit" and "turntable"
  apply only to 3D scenes. One of `"zoom"`, `"pan"`, `"select"`,
  `"lasso"`, `"drawclosedpath"`, `"drawopenpath"`, `"drawline"`,
  `"drawrect"`, `"drawcircle"`, `"orbit"`, `"turntable"`, `FALSE`.

- editrevision:

  Controls persistence of user-driven changes in \`editable: true\`
  configuration, other than trace names and axis titles. Defaults to
  \`layout.uirevision\`. Any value.

- extendfunnelareacolors:

  If \`true\`, the funnelarea slice colors (whether given by
  \`funnelareacolorway\` or inherited from \`colorway\`) will be
  extended to three times its original length by first repeating every
  color 20% lighter then each color 20% darker. This is intended to
  reduce the likelihood of reusing the same color when you have many
  slices, but you can set \`false\` to disable. Colors provided in the
  trace, using \`marker.colors\`, are never extended. Logical.

- extendiciclecolors:

  If \`true\`, the icicle slice colors (whether given by
  \`iciclecolorway\` or inherited from \`colorway\`) will be extended to
  three times its original length by first repeating every color 20%
  lighter then each color 20% darker. This is intended to reduce the
  likelihood of reusing the same color when you have many slices, but
  you can set \`false\` to disable. Colors provided in the trace, using
  \`marker.colors\`, are never extended. Logical.

- extendpiecolors:

  If \`true\`, the pie slice colors (whether given by \`piecolorway\` or
  inherited from \`colorway\`) will be extended to three times its
  original length by first repeating every color 20% lighter then each
  color 20% darker. This is intended to reduce the likelihood of reusing
  the same color when you have many slices, but you can set \`false\` to
  disable. Colors provided in the trace, using \`marker.colors\`, are
  never extended. Logical.

- extendsunburstcolors:

  If \`true\`, the sunburst slice colors (whether given by
  \`sunburstcolorway\` or inherited from \`colorway\`) will be extended
  to three times its original length by first repeating every color 20%
  lighter then each color 20% darker. This is intended to reduce the
  likelihood of reusing the same color when you have many slices, but
  you can set \`false\` to disable. Colors provided in the trace, using
  \`marker.colors\`, are never extended. Logical.

- extendtreemapcolors:

  If \`true\`, the treemap slice colors (whether given by
  \`treemapcolorway\` or inherited from \`colorway\`) will be extended
  to three times its original length by first repeating every color 20%
  lighter then each color 20% darker. This is intended to reduce the
  likelihood of reusing the same color when you have many slices, but
  you can set \`false\` to disable. Colors provided in the trace, using
  \`marker.colors\`, are never extended. Logical.

- font:

  Sets the global font. Note that fonts used in traces and other layout
  components inherit from the global font. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- funnelareacolorway:

  Sets the default funnelarea slice colors. Defaults to the main
  \`colorway\` used for trace colors. If you specify a new list here it
  can still be extended with lighter and darker colors, see
  \`extendfunnelareacolors\`. Vector of colors.

- funnelgap:

  Sets the gap (in plot fraction) between bars of adjacent location
  coordinates. Number in the interval \[0, 1\].

- funnelgroupgap:

  Sets the gap (in plot fraction) between bars of the same location
  coordinate. Number in the interval \[0, 1\].

- funnelmode:

  Determines how bars at the same location coordinate are displayed on
  the graph. With "stack", the bars are stacked on top of one another
  With "group", the bars are plotted next to one another centered around
  the shared location. With "overlay", the bars are plotted over one
  another, you might need to reduce "opacity" to see multiple bars. One
  of `"stack"`, `"group"`, `"overlay"`.

- geo:

  A
  [`go_geo()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo.md)
  object or named list, with properties `bgcolor`, `center`,
  `coastlinecolor`, `coastlinewidth`, `countrycolor`, `countrywidth`,
  `domain`, `fitbounds`, `framecolor`, `framewidth`, `lakecolor`,
  `landcolor` and 20 more (see
  [`go_geo()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo.md)).

- grid:

  A
  [`go_grid()`](https://msummersgill.github.io/plotly.R.core/reference/go_grid.md)
  object or named list, with properties `columns`, `domain`, `pattern`,
  `roworder`, `rows`, `subplots`, `xaxes`, `xgap`, `xside`, `yaxes`,
  `ygap` and `yside` (see
  [`go_grid()`](https://msummersgill.github.io/plotly.R.core/reference/go_grid.md)).

- height:

  Sets the plot's height (in px). Number in the interval \[10, Inf\].

- hiddenlabels:

  hiddenlabels is the funnelarea & pie chart analog of
  visible:'legendonly' but it can contain many labels, and can
  simultaneously hide slices from several pies/funnelarea charts Data
  array: a vector, factor, Date/POSIXct vector, matrix or list.

- hoveranywhere:

  If true, \`plotly_hover\` events will fire for any cursor position
  within the plot area, not just over traces. When the cursor is not
  over a trace, the event will have an empty \`points\` array but will
  include \`xvals\` and \`yvals\` with cursor coordinates in data space,
  and \`xPixel\` and \`yPixel\` with cursor coordinates in pixels,
  relative to the top-left corner of the graph div. A \`plotly_unhover\`
  event fires when the cursor leaves the plot area. Logical.

- hoverdistance:

  Sets the default distance (in pixels) to look for data to add hover
  labels (-1 means no cutoff, 0 means no looking for data). This is only
  a real distance for hovering on point-like objects, like scatter
  points. For area-like objects (bars, scatter fills, etc) hovering is
  on inside the area and off outside, but these objects will not
  supersede hover on point-like objects in case of conflict. Integer in
  the interval \[-1, Inf\].

- hoverlabel:

  A
  [`go_hoverlabel()`](https://msummersgill.github.io/plotly.R.core/reference/go_hoverlabel.md)
  object or named list, with properties `align`, `bgcolor`,
  `bordercolor`, `font`, `grouptitlefont`, `namelength` and `showarrow`
  (see
  [`go_hoverlabel()`](https://msummersgill.github.io/plotly.R.core/reference/go_hoverlabel.md)).

- hovermode:

  Determines the mode of hover interactions. If "closest", a single
  hoverlabel will appear for the "closest" point within the
  \`hoverdistance\`. If "x" (or "y"), multiple hoverlabels will appear
  for multiple points at the "closest" x- (or y-) coordinate within the
  \`hoverdistance\`, with the caveat that no more than one hoverlabel
  will appear per trace. If "x unified" (or "y unified"), a single
  hoverlabel will appear multiple points at the closest x- (or y-)
  coordinate within the \`hoverdistance\` with the caveat that no more
  than one hoverlabel will appear per trace. In this mode, spikelines
  are enabled by default perpendicular to the specified axis. If false,
  hover interactions are disabled. One of `"x"`, `"y"`, `"closest"`,
  `"x unified"`, `"y unified"`, `FALSE`.

- hoversort:

  Determines the order of items shown in unified hover labels. If
  "trace", items are sorted by trace index. If "value descending", items
  are sorted by value from largest to smallest. If "value ascending",
  items are sorted by value from smallest to largest. Only applies when
  \`hovermode\` is "x unified" or "y unified". One of `"trace"`,
  `"value descending"`, `"value ascending"`.

- hoversubplots:

  Determines expansion of hover effects to other subplots If "single"
  just the axis pair of the primary point is included without overlaying
  subplots. If "overlaying" all subplots using the main axis and
  occupying the same space are included. If "axis", also include stacked
  subplots using the same axis when \`hovermode\` is set to "x", "x
  unified", "y" or "y unified". One of `"single"`, `"overlaying"`,
  `"axis"`.

- iciclecolorway:

  Sets the default icicle slice colors. Defaults to the main
  \`colorway\` used for trace colors. If you specify a new list here it
  can still be extended with lighter and darker colors, see
  \`extendiciclecolors\`. Vector of colors.

- images:

  List, each element a
  [`go_layout_image()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_image.md)
  object or named list, with properties `layer`, `name`, `opacity`,
  `sizex`, `sizey`, `sizing`, `source`, `templateitemname`, `visible`,
  `x`, `xanchor`, `xref`, `y`, `yanchor` and `yref` (see
  [`go_layout_image()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_image.md)).

- legend:

  A
  [`go_legend()`](https://msummersgill.github.io/plotly.R.core/reference/go_legend.md)
  object or named list, with properties `bgcolor`, `bordercolor`,
  `borderwidth`, `entrywidth`, `entrywidthmode`, `font`, `groupclick`,
  `groupdoubleclick`, `grouptitlefont`, `indentation`, `itemclick`,
  `itemdoubleclick` and 19 more (see
  [`go_legend()`](https://msummersgill.github.io/plotly.R.core/reference/go_legend.md)).

- map:

  A
  [`go_map()`](https://msummersgill.github.io/plotly.R.core/reference/go_map.md)
  object or named list, with properties `bearing`, `bounds`, `center`,
  `domain`, `fitbounds`, `layers`, `pitch`, `style`, `uirevision` and
  `zoom` (see
  [`go_map()`](https://msummersgill.github.io/plotly.R.core/reference/go_map.md)).

- margin:

  A
  [`go_margin()`](https://msummersgill.github.io/plotly.R.core/reference/go_margin.md)
  object or named list, with properties `autoexpand`, `b`, `l`, `pad`,
  `r` and `t` (see
  [`go_margin()`](https://msummersgill.github.io/plotly.R.core/reference/go_margin.md)).

- meta:

  Assigns extra meta information that can be used in various \`text\`
  attributes. Attributes such as the graph, axis and colorbar
  \`title.text\`, annotation \`text\` \`trace.name\` in legend items,
  \`rangeselector\`, \`updatemenus\` and \`sliders\` \`label\` text all
  support \`meta\`. One can access \`meta\` fields using template
  strings: \`%{meta\[i\]}\` where \`i\` is the index of the \`meta\`
  item in question. \`meta\` can also be an object for example \`{key:
  value}\` which can be accessed %{meta\[key\]}. Any value.

- minreducedheight:

  Minimum height of the plot with margin.automargin applied (in px)
  Number in the interval \[2, Inf\].

- minreducedwidth:

  Minimum width of the plot with margin.automargin applied (in px)
  Number in the interval \[2, Inf\].

- modebar:

  A
  [`go_modebar()`](https://msummersgill.github.io/plotly.R.core/reference/go_modebar.md)
  object or named list, with properties `activecolor`, `add`, `bgcolor`,
  `color`, `orientation`, `remove` and `uirevision` (see
  [`go_modebar()`](https://msummersgill.github.io/plotly.R.core/reference/go_modebar.md)).

- newselection:

  A
  [`go_newselection()`](https://msummersgill.github.io/plotly.R.core/reference/go_newselection.md)
  object or named list, with properties `line` and `mode` (see
  [`go_newselection()`](https://msummersgill.github.io/plotly.R.core/reference/go_newselection.md)).

- newshape:

  A
  [`go_newshape()`](https://msummersgill.github.io/plotly.R.core/reference/go_newshape.md)
  object or named list, with properties `drawdirection`, `fillcolor`,
  `fillrule`, `label`, `layer`, `legend`, `legendgroup`,
  `legendgrouptitle`, `legendrank`, `legendwidth`, `line`, `name`,
  `opacity`, `showlegend` and `visible` (see
  [`go_newshape()`](https://msummersgill.github.io/plotly.R.core/reference/go_newshape.md)).

- paper_bgcolor:

  Sets the background color of the paper where the graph is drawn.
  Color: a CSS color string or R color name.

- piecolorway:

  Sets the default pie slice colors. Defaults to the main \`colorway\`
  used for trace colors. If you specify a new list here it can still be
  extended with lighter and darker colors, see \`extendpiecolors\`.
  Vector of colors.

- plot_bgcolor:

  Sets the background color of the plotting area in-between x and y
  axes. Color: a CSS color string or R color name.

- polar:

  A
  [`go_polar()`](https://msummersgill.github.io/plotly.R.core/reference/go_polar.md)
  object or named list, with properties `angularaxis`, `bargap`,
  `barmode`, `bgcolor`, `domain`, `gridshape`, `hole`, `radialaxis`,
  `sector` and `uirevision` (see
  [`go_polar()`](https://msummersgill.github.io/plotly.R.core/reference/go_polar.md)).

- scattergap:

  Sets the gap (in plot fraction) between scatter points of adjacent
  location coordinates. Defaults to \`bargap\`. Number in the interval
  \[0, 1\].

- scattermode:

  Determines how scatter points at the same location coordinate are
  displayed on the graph. With "group", the scatter points are plotted
  next to one another centered around the shared location. With
  "overlay", the scatter points are plotted over one another, you might
  need to reduce "opacity" to see multiple scatter points. One of
  `"group"`, `"overlay"`.

- scene:

  A
  [`go_scene()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene.md)
  object or named list, with properties `annotations`, `aspectmode`,
  `aspectratio`, `bgcolor`, `camera`, `domain`, `dragmode`, `hovermode`,
  `uirevision`, `xaxis`, `yaxis` and `zaxis` (see
  [`go_scene()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene.md)).

- selectdirection:

  When \`dragmode\` is set to "select", this limits the selection of the
  drag to horizontal, vertical or diagonal. "h" only allows horizontal
  selection, "v" only vertical, "d" only diagonal and "any" sets no
  limit. One of `"h"`, `"v"`, `"d"`, `"any"`.

- selectionrevision:

  Controls persistence of user-driven changes in selected points from
  all traces. Any value.

- selections:

  List, each element a
  [`go_selection()`](https://msummersgill.github.io/plotly.R.core/reference/go_selection.md)
  object or named list, with properties `line`, `name`, `opacity`,
  `path`, `templateitemname`, `type`, `x0`, `x1`, `xref`, `y0`, `y1` and
  `yref` (see
  [`go_selection()`](https://msummersgill.github.io/plotly.R.core/reference/go_selection.md)).

- separators:

  Sets the decimal and thousand separators. For example, ". " puts a '.'
  before decimals and a space between thousands. In English locales,
  dflt is ".," but other locales may alter this default. String.

- shapes:

  List, each element a
  [`go_shape()`](https://msummersgill.github.io/plotly.R.core/reference/go_shape.md)
  object or named list, with properties `editable`, `fillcolor`,
  `fillrule`, `label`, `layer`, `legend`, `legendgroup`,
  `legendgrouptitle`, `legendrank`, `legendwidth`, `line`, `name` and 20
  more (see
  [`go_shape()`](https://msummersgill.github.io/plotly.R.core/reference/go_shape.md)).

- showlegend:

  Determines whether or not a legend is drawn. Default is \`true\` if
  there is a trace to show and any of these: a) Two or more traces would
  by default be shown in the legend. b) One pie trace is shown in the
  legend. c) One trace is explicitly given with \`showlegend: true\`.
  Logical.

- sliders:

  List, each element a
  [`go_slider()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider.md)
  object or named list, with properties `active`, `activebgcolor`,
  `bgcolor`, `bordercolor`, `borderwidth`, `currentvalue`, `font`,
  `len`, `lenmode`, `minorticklen`, `name`, `pad` and 11 more (see
  [`go_slider()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider.md)).

- smith:

  A
  [`go_smith()`](https://msummersgill.github.io/plotly.R.core/reference/go_smith.md)
  object or named list, with properties `bgcolor`, `domain`,
  `imaginaryaxis` and `realaxis` (see
  [`go_smith()`](https://msummersgill.github.io/plotly.R.core/reference/go_smith.md)).

- spikedistance:

  Sets the default distance (in pixels) to look for data to draw
  spikelines to (-1 means no cutoff, 0 means no looking for data). As
  with hoverdistance, distance does not apply to area-like objects. In
  addition, some objects can be hovered on but will not generate
  spikelines, such as scatter fills. Integer in the interval \[-1,
  Inf\].

- sunburstcolorway:

  Sets the default sunburst slice colors. Defaults to the main
  \`colorway\` used for trace colors. If you specify a new list here it
  can still be extended with lighter and darker colors, see
  \`extendsunburstcolors\`. Vector of colors.

- template:

  Default attributes to be applied to the plot. Templates can be created
  from existing plots using \`Plotly.makeTemplate\`, or created
  manually. They should be objects with format: \`{layout:
  layoutTemplate, data: {\[type\]: \[traceTemplate, ...\]}, ...}\`
  \`layoutTemplate\` and \`traceTemplate\` are objects matching the
  attribute structure of \`layout\` and a data trace. Trace templates
  are applied cyclically to traces of each type. Container arrays (eg
  \`annotations\`) have special handling: An object ending in
  \`defaults\` (eg \`annotationdefaults\`) is applied to each array
  item. But if an item has a \`templateitemname\` key we look in the
  template array for an item with matching \`name\` and apply that
  instead. If no matching \`name\` is found we mark the item invisible.
  Any named template item not referenced is appended to the end of the
  array, so you can use this for a watermark annotation or a logo image,
  for example. To omit one of these items on the plot, make an item with
  matching \`templateitemname\` and \`visible: false\`. Any value.

- ternary:

  A
  [`go_ternary()`](https://msummersgill.github.io/plotly.R.core/reference/go_ternary.md)
  object or named list, with properties `aaxis`, `baxis`, `bgcolor`,
  `caxis`, `domain`, `sum` and `uirevision` (see
  [`go_ternary()`](https://msummersgill.github.io/plotly.R.core/reference/go_ternary.md)).

- title:

  String (the title text), or a
  [`go_layout_title()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_title.md)
  object or named list, with properties `automargin`, `font`, `pad`,
  `subtitle`, `text`, `x`, `xanchor`, `xref`, `y`, `yanchor` and `yref`
  (see
  [`go_layout_title()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_title.md)).

- transition:

  Sets transition options used during Plotly.react updates. A
  [`go_layout_transition()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_transition.md)
  object or named list, with properties `duration`, `easing` and
  `ordering` (see
  [`go_layout_transition()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_transition.md)).

- treemapcolorway:

  Sets the default treemap slice colors. Defaults to the main
  \`colorway\` used for trace colors. If you specify a new list here it
  can still be extended with lighter and darker colors, see
  \`extendtreemapcolors\`. Vector of colors.

- uirevision:

  Used to allow user interactions with the plot to persist after
  \`Plotly.react\` calls that are unaware of these interactions. If
  \`uirevision\` is omitted, or if it is given and it changed from the
  previous \`Plotly.react\` call, the exact new figure is used. If
  \`uirevision\` is truthy and did NOT change, any attribute that has
  been affected by user interactions and did not receive a different
  value in the new figure will keep the interaction value.
  \`layout.uirevision\` attribute serves as the default for
  \`uirevision\` attributes in various sub-containers. For finer control
  you can set these sub-attributes directly. For example, if your app
  separately controls the data on the x and y axes you might set
  \`xaxis.uirevision="time"\` and \`yaxis.uirevision="cost"\`. Then if
  only the y data is changed, you can update
  \`yaxis.uirevision="quantity"\` and the y axis range will reset but
  the x axis range will retain any user-driven zoom. Any value.

- uniformtext:

  A
  [`go_uniformtext()`](https://msummersgill.github.io/plotly.R.core/reference/go_uniformtext.md)
  object or named list, with properties `minsize` and `mode` (see
  [`go_uniformtext()`](https://msummersgill.github.io/plotly.R.core/reference/go_uniformtext.md)).

- updatemenus:

  List, each element a
  [`go_updatemenu()`](https://msummersgill.github.io/plotly.R.core/reference/go_updatemenu.md)
  object or named list, with properties `active`, `bgcolor`,
  `bordercolor`, `borderwidth`, `buttons`, `direction`, `font`, `name`,
  `pad`, `showactive`, `templateitemname`, `type` and 5 more (see
  [`go_updatemenu()`](https://msummersgill.github.io/plotly.R.core/reference/go_updatemenu.md)).

- violingap:

  Sets the gap (in plot fraction) between violins of adjacent location
  coordinates. Has no effect on traces that have "width" set. Number in
  the interval \[0, 1\].

- violingroupgap:

  Sets the gap (in plot fraction) between violins of the same location
  coordinate. Has no effect on traces that have "width" set. Number in
  the interval \[0, 1\].

- violinmode:

  Determines how violins at the same location coordinate are displayed
  on the graph. If "group", the violins are plotted next to one another
  centered around the shared location. If "overlay", the violins are
  plotted over one another, you might need to set "opacity" to see them
  multiple violins. Has no effect on traces that have "width" set. One
  of `"group"`, `"overlay"`.

- waterfallgap:

  Sets the gap (in plot fraction) between bars of adjacent location
  coordinates. Number in the interval \[0, 1\].

- waterfallgroupgap:

  Sets the gap (in plot fraction) between bars of the same location
  coordinate. Number in the interval \[0, 1\].

- waterfallmode:

  Determines how bars at the same location coordinate are displayed on
  the graph. With "group", the bars are plotted next to one another
  centered around the shared location. With "overlay", the bars are
  plotted over one another, you might need to reduce "opacity" to see
  multiple bars. One of `"group"`, `"overlay"`.

- width:

  Sets the plot's width (in px). Number in the interval \[10, Inf\].

- xaxis:

  A
  [`go_xaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis.md)
  object or named list, with properties `anchor`, `automargin`,
  `autorange`, `autorangeoptions`, `autotickangles`, `autotypenumbers`,
  `calendar`, `categoryarray`, `categoryorder`, `color`, `constrain`,
  `constraintoward` and 80 more (see
  [`go_xaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis.md)).

- yaxis:

  A
  [`go_yaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_yaxis.md)
  object or named list, with properties `anchor`, `automargin`,
  `autorange`, `autorangeoptions`, `autoshift`, `autotickangles`,
  `autotypenumbers`, `calendar`, `categoryarray`, `categoryorder`,
  `color`, `constrain` and 80 more (see
  [`go_yaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_yaxis.md)).

- overwrite:

  If `TRUE`, replace nested objects instead of merging.

## Value

The modified figure.

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md),
[`update_xaxes()`](https://msummersgill.github.io/plotly.R.core/reference/update_xaxes.md)
and the other `update_*()` functions.

## Examples

``` r
go_figure() |>
  update_layout(title = "Title", xaxis = go_xaxis(range = c(0, 10))) |>
  update_layout(xaxis = go_xaxis(title = "x"), yaxis = go_yaxis(type = "log"))
```
