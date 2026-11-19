# Carpet traces

The data describing carpet axis layout is set in \`y\` and (optionally)
also \`x\`. If only \`y\` is present, \`x\` the plot is interpreted as a
cheater plot and is filled in using the \`y\` values. \`x\` and \`y\`
may either be 2D arrays matching with each dimension matching that of
\`a\` and \`b\`, or they may be 1D arrays with total length equal to
that of \`a\` and \`b\`.

## Usage

``` r
go_carpet(
  ...,
  a = NULL,
  a0 = NULL,
  aaxis = NULL,
  b = NULL,
  b0 = NULL,
  baxis = NULL,
  carpet = NULL,
  cheaterslope = NULL,
  color = NULL,
  customdata = NULL,
  da = NULL,
  db = NULL,
  font = NULL,
  ids = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  x = NULL,
  xaxis = NULL,
  y = NULL,
  yaxis = NULL,
  zorder = NULL,
  skip_invalid = FALSE
)

add_carpet(fig, ...)

# Default S3 method
add_carpet(
  fig,
  ...,
  data = NULL,
  a = NULL,
  a0 = NULL,
  aaxis = NULL,
  b = NULL,
  b0 = NULL,
  baxis = NULL,
  carpet = NULL,
  cheaterslope = NULL,
  color = NULL,
  customdata = NULL,
  da = NULL,
  db = NULL,
  font = NULL,
  ids = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  x = NULL,
  xaxis = NULL,
  y = NULL,
  yaxis = NULL,
  zorder = NULL,
  row = NULL,
  col = NULL,
  secondary_y = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- a:

  An array containing values of the first parameter value Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- a0:

  Alternate to \`a\`. Builds a linear space of a coordinates. Use with
  \`da\` where \`a0\` is the starting coordinate and \`da\` the step.
  Number.

- aaxis:

  A
  [`go_carpet_aaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_carpet_aaxis.md)
  object or named list, with properties `arraydtick`, `arraytick0`,
  `autorange`, `autotypenumbers`, `categoryarray`, `categoryorder`,
  `cheatertype`, `color`, `dtick`, `endline`, `endlinecolor`,
  `endlinewidth` and 42 more (see
  [`go_carpet_aaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_carpet_aaxis.md)).

- b:

  A two dimensional array of y coordinates at each carpet point. Data
  array: a vector, factor, Date/POSIXct vector, matrix or list.

- b0:

  Alternate to \`b\`. Builds a linear space of a coordinates. Use with
  \`db\` where \`b0\` is the starting coordinate and \`db\` the step.
  Number.

- baxis:

  A
  [`go_carpet_baxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_carpet_baxis.md)
  object or named list, with properties `arraydtick`, `arraytick0`,
  `autorange`, `autotypenumbers`, `categoryarray`, `categoryorder`,
  `cheatertype`, `color`, `dtick`, `endline`, `endlinecolor`,
  `endlinewidth` and 42 more (see
  [`go_carpet_baxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_carpet_baxis.md)).

- carpet:

  An identifier for this carpet, so that \`scattercarpet\` and
  \`contourcarpet\` traces can specify a carpet plot on which they lie
  String.

- cheaterslope:

  The shift applied to each successive row of data in creating a cheater
  plot. Only used if \`x\` is been omitted. Number.

- color:

  Sets default for all colors associated with this axis all at once:
  line, font, tick, and grid colors. Grid color is lightened by blending
  this with the plot background Individual pieces can override this.
  Color: a CSS color string or R color name.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- da:

  Sets the a coordinate step. See \`a0\` for more info. Number.

- db:

  Sets the b coordinate step. See \`b0\` for more info. Number.

- font:

  The default font used for axis & tick labels on this carpet A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

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

- x:

  A two dimensional array of x coordinates at each carpet point. If
  omitted, the plot is a cheater plot and the xaxis is hidden by
  default. Data array: a vector, factor, Date/POSIXct vector, matrix or
  list.

- xaxis:

  Sets a reference between this trace's x coordinates and a 2D cartesian
  x axis. If "x" (the default value), the x coordinates refer to
  \`layout.xaxis\`. If "x2", the x coordinates refer to
  \`layout.xaxis2\`, and so on. Subplot id: `"x"`, `"x2"`, `"x3"`, ....

- y:

  A two dimensional array of y coordinates at each carpet point. Data
  array: a vector, factor, Date/POSIXct vector, matrix or list.

- yaxis:

  Sets a reference between this trace's y coordinates and a 2D cartesian
  y axis. If "y" (the default value), the y coordinates refer to
  \`layout.yaxis\`. If "y2", the y coordinates refer to
  \`layout.yaxis2\`, and so on. Subplot id: `"y"`, `"y2"`, `"y3"`, ....

- zorder:

  Sets the layer on which this trace is displayed, relative to other SVG
  traces on the same subplot. SVG traces with higher \`zorder\` appear
  in front of those with lower \`zorder\`. Integer.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- fig:

  A `go_figure` object.

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

## Value

`go_*()` functions return a graph object; `add_*()` functions return the
modified figure.

## Details

`go_carpet()` creates a validated graph object (a named list).
`add_carpet()` creates one and adds it to a figure.

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
d <- expand.grid(a = c(4, 5, 6), b = c(1, 2, 3))
d$y <- d$a * d$b
d |>
  go_figure() |>
  add_carpet(a = ~a, b = ~b, y = ~y)
```
