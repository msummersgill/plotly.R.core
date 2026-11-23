# Funnelarea traces

Visualize stages in a process using area-encoded trapezoids. This trace
can be used to show data in a part-to-whole representation similar to a
"pie" trace, wherein each item appears in a single stage. See also the
"funnel" trace type for a different approach to visualizing funnel data.

## Usage

``` r
add_funnelarea(p, ...)

# Default S3 method
add_funnelarea(
  p,
  ...,
  data = NULL,
  split = NULL,
  labels = NULL,
  values = NULL,
  aspectratio = NULL,
  baseratio = NULL,
  customdata = NULL,
  dlabel = NULL,
  domain = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  insidetextfont = NULL,
  label0 = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  marker = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  scalegroup = NULL,
  showlegend = NULL,
  text = NULL,
  textfont = NULL,
  textinfo = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  title = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  row = NULL,
  col = NULL,
  skip_invalid = FALSE
)

go_funnelarea(
  ...,
  labels = NULL,
  values = NULL,
  aspectratio = NULL,
  baseratio = NULL,
  customdata = NULL,
  dlabel = NULL,
  domain = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  insidetextfont = NULL,
  label0 = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  marker = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  scalegroup = NULL,
  showlegend = NULL,
  text = NULL,
  textfont = NULL,
  textinfo = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  title = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- p:

  A `go_figure` object (or, through methods for its class, another
  figure, e.g. a `plot_ly()` figure of the plotly package).

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- data:

  A data frame in which formula properties (e.g. `values = ~col`,
  `marker = go_funnelarea_marker(colors = ~col)`) are evaluated.
  Default: the data given to
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

- labels:

  Sets the sector labels. If \`labels\` entries are duplicated, we sum
  associated \`values\` or simply count occurrences if \`values\` is not
  provided. For other array attributes (including color) we use the
  first non-empty entry among all occurrences of the label. Data array:
  a vector, factor, Date/POSIXct vector, matrix or list.

- values:

  Sets the values of the sectors. If omitted, we count occurrences of
  each label. Data array: a vector, factor, Date/POSIXct vector, matrix
  or list.

- aspectratio:

  Sets the ratio between height and width Number in the interval \[0,
  Inf\].

- baseratio:

  Sets the ratio between bottom length and maximum top length. Number in
  the interval \[0, 1\].

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- dlabel:

  Sets the label step. See \`label0\` for more info. Number.

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
  `"percent"`, `"name"` joined with `"+"`, or one of `"all"`, `"none"`,
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
  string has access to variables \`label\`, \`color\`, \`value\`,
  \`text\` and \`percent\`. Anything contained in tag \`\<extra\>\` is
  displayed in the secondary box, for example
  \`\<extra\>%{fullData.name}\</extra\>\`. To hide the secondary box
  completely, use an empty tag \`\<extra\>\</extra\>\`. String, or a
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

- label0:

  Alternate to \`labels\`. Builds a numeric set of labels. Use with
  \`dlabel\` where \`label0\` is the starting label and \`dlabel\` the
  step. Number.

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

- marker:

  A
  [`go_funnelarea_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_funnelarea_marker.md)
  object or named list, with properties `colors`, `line` and `pattern`
  (see
  [`go_funnelarea_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_funnelarea_marker.md)).

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

- scalegroup:

  If there are multiple funnelareas that should be sized according to
  their totals, link them by providing a non-empty group id here shared
  by every trace in the same group. String.

- showlegend:

  Determines whether or not an item corresponding to this trace is shown
  in the legend. Logical.

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
  `"percent"` joined with `"+"`, or one of `"none"`.

- textposition:

  Specifies the location of the \`textinfo\`. One of `"inside"`,
  `"none"`, or a vector of these.

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
  template string has access to variables \`label\`, \`color\`,
  \`value\`, \`text\` and \`percent\`. String, or a vector of these.

- texttemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- title:

  String (the title text), or a
  [`go_funnelarea_title()`](https://msummersgill.github.io/plotly.R.core/reference/go_funnelarea_title.md)
  object or named list, with properties `font`, `position` and `text`
  (see
  [`go_funnelarea_title()`](https://msummersgill.github.io/plotly.R.core/reference/go_funnelarea_title.md)).

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

`go_funnelarea()` creates a validated graph object (a named list).
`add_funnelarea()` creates one and adds it to a figure.

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
d <- as.data.frame(table(cylinders = mtcars$cyl))
d |>
  go_figure() |>
  add_funnelarea(labels = ~cylinders, values = ~Freq)
```
