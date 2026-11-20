# Treemap traces

Visualize hierarchal data from leaves (and/or outer branches) towards
root with rectangles. The treemap sectors are determined by the entries
in "labels" or "ids" and in "parents".

## Usage

``` r
add_treemap(fig, ...)

# Default S3 method
add_treemap(
  fig,
  ...,
  data = NULL,
  split = NULL,
  branchvalues = NULL,
  count = NULL,
  customdata = NULL,
  domain = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  insidetextfont = NULL,
  labels = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  level = NULL,
  marker = NULL,
  maxdepth = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  outsidetextfont = NULL,
  parents = NULL,
  pathbar = NULL,
  root = NULL,
  sort = NULL,
  text = NULL,
  textfont = NULL,
  textinfo = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  tiling = NULL,
  uid = NULL,
  uirevision = NULL,
  values = NULL,
  visible = NULL,
  row = NULL,
  col = NULL,
  skip_invalid = FALSE
)

go_treemap(
  ...,
  branchvalues = NULL,
  count = NULL,
  customdata = NULL,
  domain = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  insidetextfont = NULL,
  labels = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  level = NULL,
  marker = NULL,
  maxdepth = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  outsidetextfont = NULL,
  parents = NULL,
  pathbar = NULL,
  root = NULL,
  sort = NULL,
  text = NULL,
  textfont = NULL,
  textinfo = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  tiling = NULL,
  uid = NULL,
  uirevision = NULL,
  values = NULL,
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

  A data frame in which formula properties (e.g. `values = ~col`,
  `marker = go_treemap_marker(colors = ~col)`) are evaluated. Default:
  the data given to
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md).
  Only the evaluated values are added to the trace. A
  [`crosstalk::SharedData`](https://rdrr.io/pkg/crosstalk/man/SharedData.html)
  works the same way, and links the trace to its crosstalk group (see
  [`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)).

- split:

  A column (`~col`) or vector, one value per row of the data: one trace
  is added per value, named after it. Colour properties given a discrete
  column (a factor, character or logical, e.g.
  `marker = go_scatter_marker(color = ~group)`) split the data the same
  way, each trace getting its own colour: evenly spaced viridis colours
  for an ordered factor, otherwise the figure's colorway.

- branchvalues:

  Determines how the items in \`values\` are summed. When set to
  "total", items in \`values\` are taken to be value of all its
  descendants. When set to "remainder", items in \`values\`
  corresponding to the root and the branches sectors are taken to be the
  extra part not part of the sum of the values at their leaves. One of
  `"remainder"`, `"total"`.

- count:

  Determines default for \`values\` when it is not provided, by
  inferring a 1 for each of the "leaves" and/or "branches", otherwise 0.
  Any combination of `"branches"`, `"leaves"` joined with `"+"`.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- domain:

  A
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)
  object or named list, with properties `column`, `row`, `x` and `y`
  (see
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)).

- hoverinfo:

  Determines what trace information appears on hover. Flags are rendered
  in a fixed order; use \`hovertemplate\` if you need explicit control
  over the rendered string, including the order of fields and
  surrounding text. Any combination of `"label"`, `"text"`, `"value"`,
  `"name"`, `"current path"`, `"percent root"`, `"percent entry"`,
  `"percent parent"` joined with `"+"`, or one of `"all"`, `"none"`,
  `"skip"`, or a vector of these.

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
  string has access to variables \`currentPath\`, \`root\`, \`entry\`,
  \`percentRoot\`, \`percentEntry\` and \`percentParent\`. Anything
  contained in tag \`\<extra\>\` is displayed in the secondary box, for
  example \`\<extra\>%{fullData.name}\</extra\>\`. To hide the secondary
  box completely, use an empty tag \`\<extra\>\</extra\>\`. String, or a
  vector of these.

- hovertemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- hovertext:

  Sets hover text elements associated with each sector. If a single
  string, the same string appears for all data points. If an array of
  string, the items are mapped in order of this trace's sectors. To be
  seen, trace \`hoverinfo\` must contain a "text" flag. String, or a
  vector of these.

- ids:

  Assigns id labels to each datum. These ids for object constancy of
  data points during animation. Should be an array of strings, not
  numbers or any other type. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- insidetextfont:

  Sets the font used for \`textinfo\` lying inside the sector. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- labels:

  Sets the labels of each of the sectors. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

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

- level:

  Sets the level from which this trace hierarchy is rendered. Set
  \`level\` to \`”\` to start from the root node in the hierarchy. Must
  be an "id" if \`ids\` is filled in, otherwise plotly attempts to find
  a matching item in \`labels\`. Any value.

- marker:

  A
  [`go_treemap_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_treemap_marker.md)
  object or named list, with properties `autocolorscale`, `cauto`,
  `cmax`, `cmid`, `cmin`, `coloraxis`, `colorbar`, `colors`,
  `colorscale`, `cornerradius`, `depthfade`, `line`, `pad`, `pattern`,
  `reversescale` and `showscale` (see
  [`go_treemap_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_treemap_marker.md)).

- maxdepth:

  Sets the number of rendered sectors from any given \`level\`. Set
  \`maxdepth\` to "-1" to render all the levels in the hierarchy.
  Integer.

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

- outsidetextfont:

  Sets the font used for \`textinfo\` lying outside the sector. This
  option refers to the root of the hierarchy presented on top left
  corner of a treemap graph. Please note that if a hierarchy has
  multiple root nodes, this option won't have any effect and
  \`insidetextfont\` would be used. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- parents:

  Sets the parent sectors for each of the sectors. Empty string items ”
  are understood to reference the root node in the hierarchy. If \`ids\`
  is filled, \`parents\` items are understood to be "ids" themselves.
  When \`ids\` is not set, plotly attempts to find matching items in
  \`labels\`, but beware they must be unique. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

- pathbar:

  A
  [`go_pathbar()`](https://msummersgill.github.io/plotly.R.core/reference/go_pathbar.md)
  object or named list, with properties `edgeshape`, `side`, `textfont`,
  `thickness` and `visible` (see
  [`go_pathbar()`](https://msummersgill.github.io/plotly.R.core/reference/go_pathbar.md)).

- root:

  A
  [`go_root()`](https://msummersgill.github.io/plotly.R.core/reference/go_root.md)
  object or named list, with properties `color` (see
  [`go_root()`](https://msummersgill.github.io/plotly.R.core/reference/go_root.md)).

- sort:

  Determines whether or not the sectors are reordered from largest to
  smallest. Logical.

- text:

  Sets text elements associated with each sector. If trace \`textinfo\`
  contains a "text" flag, these elements will be seen on the chart. If
  trace \`hoverinfo\` contains a "text" flag and "hovertext" is not set,
  these elements will be seen in the hover labels. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

- textfont:

  Sets the font used for \`textinfo\`. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- textinfo:

  Determines what trace information appears on the graph. Flags are
  rendered in a fixed order; use \`texttemplate\` if you need explicit
  control over the rendered string, including the order of fields and
  surrounding text. Any combination of `"label"`, `"text"`, `"value"`,
  `"current path"`, `"percent root"`, `"percent entry"`,
  `"percent parent"` joined with `"+"`, or one of `"none"`.

- textposition:

  Sets the positions of the \`text\` elements. One of `"top left"`,
  `"top center"`, `"top right"`, `"middle left"`, `"middle center"`,
  `"middle right"`, `"bottom left"`, `"bottom center"`,
  `"bottom right"`.

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
  template string has access to variables \`currentPath\`, \`root\`,
  \`entry\`, \`percentRoot\`, \`percentEntry\`, \`percentParent\`,
  \`label\` and \`value\`. String, or a vector of these.

- texttemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- tiling:

  A
  [`go_treemap_tiling()`](https://msummersgill.github.io/plotly.R.core/reference/go_treemap_tiling.md)
  object or named list, with properties `flip`, `packing`, `pad` and
  `squarifyratio` (see
  [`go_treemap_tiling()`](https://msummersgill.github.io/plotly.R.core/reference/go_treemap_tiling.md)).

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

- values:

  Sets the values associated with each of the sectors. Use with
  \`branchvalues\` to determine how the values are summed. Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

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

`go_treemap()` creates a validated graph object (a named list).
`add_treemap()` creates one and adds it to a figure.

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
cyl <- table(paste(mtcars$cyl, "cylinders"))
d <- data.frame(
  labels = c("all cars", names(cyl)),
  parents = c("", rep("all cars", length(cyl))),
  values = c(0, as.vector(cyl))
)
d |>
  go_figure() |>
  add_treemap(labels = ~labels, parents = ~parents, values = ~values)
```
