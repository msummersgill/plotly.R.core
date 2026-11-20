# Sankey traces

Sankey plots for network flow data analysis. The nodes are specified in
\`nodes\` and the links between sources and targets in \`links\`. The
colors are set in \`nodes\[i\].color\` and \`links\[i\].color\`,
otherwise defaults are used.

## Usage

``` r
add_sankey(fig, ...)

# Default S3 method
add_sankey(
  fig,
  ...,
  data = NULL,
  split = NULL,
  arrangement = NULL,
  customdata = NULL,
  direction = NULL,
  domain = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  ids = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  link = NULL,
  meta = NULL,
  name = NULL,
  node = NULL,
  orientation = NULL,
  selectedpoints = NULL,
  textfont = NULL,
  uid = NULL,
  uirevision = NULL,
  valueformat = NULL,
  valuesuffix = NULL,
  visible = NULL,
  row = NULL,
  col = NULL,
  skip_invalid = FALSE
)

go_sankey(
  ...,
  arrangement = NULL,
  customdata = NULL,
  direction = NULL,
  domain = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  ids = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  link = NULL,
  meta = NULL,
  name = NULL,
  node = NULL,
  orientation = NULL,
  selectedpoints = NULL,
  textfont = NULL,
  uid = NULL,
  uirevision = NULL,
  valueformat = NULL,
  valuesuffix = NULL,
  visible = NULL,
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

  A data frame in which formula properties (e.g. `ids = ~col`,
  `link = go_sankey_link(color = ~col)`) are evaluated. Default: the
  data given to
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

- arrangement:

  If value is \`snap\` (the default), the node arrangement is assisted
  by automatic snapping of elements to preserve space between nodes
  specified via \`nodepad\`. If value is \`perpendicular\`, the nodes
  can only move along a line perpendicular to the flow. If value is
  \`freeform\`, the nodes can freely move on the plane. If value is
  \`fixed\`, the nodes are stationary. One of `"snap"`,
  `"perpendicular"`, `"freeform"`, `"fixed"`.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- direction:

  Sets the direction of the flow along the \`orientation\` axis. With
  \`forward\` (the default), sources are on the left (horizontal) or top
  (vertical). With \`reversed\`, sources are on the right (horizontal)
  or bottom (vertical). One of `"forward"`, `"reversed"`.

- domain:

  A
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)
  object or named list, with properties `column`, `row`, `x` and `y`
  (see
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)).

- hoverinfo:

  Determines what trace information appears on hover. If \`none\` or
  \`skip\` are set, no information is displayed upon hovering. But, if
  \`none\` is set, click and hover events are still fired. Note that
  this attribute is superseded by \`node.hoverinfo\` and
  \`node.hoverinfo\` for nodes and links respectively. Any combination
  of `""` joined with `"+"`, or one of `"all"`, `"none"`, `"skip"`.

- hoverlabel:

  A
  [`go_hoverlabel()`](https://msummersgill.github.io/plotly.R.core/reference/go_hoverlabel.md)
  object or named list, with properties `align`, `bgcolor`,
  `bordercolor`, `font`, `namelength` and `showarrow` (see
  [`go_hoverlabel()`](https://msummersgill.github.io/plotly.R.core/reference/go_hoverlabel.md)).

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

- link:

  The links of the Sankey plot. A
  [`go_sankey_link()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey_link.md)
  object or named list, with properties `arrowlen`, `color`,
  `colorscales`, `customdata`, `hovercolor`, `hoverinfo`, `hoverlabel`,
  `hovertemplate`, `hovertemplatefallback`, `label`, `line`, `sort`,
  `source`, `target` and `value` (see
  [`go_sankey_link()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey_link.md)).

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

- node:

  The nodes of the Sankey plot. A
  [`go_sankey_node()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey_node.md)
  object or named list, with properties `align`, `color`, `customdata`,
  `groups`, `hoverinfo`, `hoverlabel`, `hovertemplate`,
  `hovertemplatefallback`, `label`, `line`, `pad`, `sort`, `thickness`,
  `x` and `y` (see
  [`go_sankey_node()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey_node.md)).

- orientation:

  Sets the orientation of the Sankey diagram. With \`h\` (the default),
  the flow runs horizontally. With \`v\`, the flow runs vertically. Use
  \`direction\` to control which side the sources are placed on. One of
  `"v"`, `"h"`.

- selectedpoints:

  Array containing integer indices of selected points. Has an effect
  only for traces that support selections. Note that an empty array
  means an empty selection where the \`unselected\` are turned on for
  all points, whereas, any other non-array values means no selection all
  where the \`selected\` and \`unselected\` styles have no effect. Any
  value.

- textfont:

  Sets the font for node labels A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

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

- valueformat:

  Sets the value formatting rule using d3 formatting mini-languages
  which are very similar to those in Python. For numbers, see:
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format. String.

- valuesuffix:

  Adds a unit to follow the value in the hover tooltip. Add a space if a
  separation is necessary from the value. String.

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

## Value

`go_*()` functions return a graph object; `add_*()` functions return the
modified figure.

## Details

`go_sankey()` creates a validated graph object (a named list).
`add_sankey()` creates one and adds it to a figure.

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
d <- aggregate(Freq ~ Class + Survived, as.data.frame(Titanic), sum)
nodes <- c(levels(d$Class), paste("Survived:", levels(d$Survived)))
d$source <- as.integer(d$Class) - 1
d$target <- nlevels(d$Class) + as.integer(d$Survived) - 1
d |>
  go_figure() |>
  add_sankey(
    node = go_sankey_node(label = nodes),
    link = go_sankey_link(source = ~source, target = ~target, value = ~Freq)
  )
```
