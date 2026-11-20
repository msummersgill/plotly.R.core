# Indicator traces

An indicator is used to visualize a single \`value\` along with some
contextual information such as \`steps\` or a \`threshold\`, using a
combination of three visual elements: a number, a delta, and/or a gauge.
Deltas are taken with respect to a \`reference\`. Gauges can be either
angular or bullet (aka linear) gauges.

## Usage

``` r
add_indicator(fig, ...)

# Default S3 method
add_indicator(
  fig,
  ...,
  data = NULL,
  split = NULL,
  align = NULL,
  customdata = NULL,
  delta = NULL,
  domain = NULL,
  gauge = NULL,
  ids = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  meta = NULL,
  mode = NULL,
  name = NULL,
  number = NULL,
  title = NULL,
  uid = NULL,
  uirevision = NULL,
  value = NULL,
  visible = NULL,
  row = NULL,
  col = NULL,
  skip_invalid = FALSE
)

go_indicator(
  ...,
  align = NULL,
  customdata = NULL,
  delta = NULL,
  domain = NULL,
  gauge = NULL,
  ids = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  meta = NULL,
  mode = NULL,
  name = NULL,
  number = NULL,
  title = NULL,
  uid = NULL,
  uirevision = NULL,
  value = NULL,
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

  A data frame in which formula properties (e.g. `ids = ~col`) are
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

- align:

  Sets the horizontal alignment of the \`text\` within the box. Note
  that this attribute has no effect if an angular gauge is displayed: in
  this case, it is always centered One of `"left"`, `"center"`,
  `"right"`.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- delta:

  A
  [`go_indicator_delta()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_delta.md)
  object or named list, with properties `decreasing`, `font`,
  `increasing`, `position`, `prefix`, `reference`, `relative`, `suffix`
  and `valueformat` (see
  [`go_indicator_delta()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_delta.md)).

- domain:

  A
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)
  object or named list, with properties `column`, `row`, `x` and `y`
  (see
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)).

- gauge:

  The gauge of the Indicator plot. A
  [`go_indicator_gauge()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge.md)
  object or named list, with properties `axis`, `bar`, `bgcolor`,
  `bordercolor`, `borderwidth`, `shape`, `steps` and `threshold` (see
  [`go_indicator_gauge()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge.md)).

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

- mode:

  Determines how the value is displayed on the graph. \`number\`
  displays the value numerically in text. \`delta\` displays the
  difference to a reference value in text. Finally, \`gauge\` displays
  the value graphically on an axis. Any combination of `"number"`,
  `"delta"`, `"gauge"` joined with `"+"`.

- name:

  Sets the trace name. The trace name appears as the legend item and on
  hover. String.

- number:

  A
  [`go_indicator_number()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_number.md)
  object or named list, with properties `font`, `prefix`, `suffix` and
  `valueformat` (see
  [`go_indicator_number()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_number.md)).

- title:

  String (the title text), or a
  [`go_indicator_title()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_title.md)
  object or named list, with properties `align`, `font` and `text` (see
  [`go_indicator_title()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_title.md)).

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

- value:

  Sets the number to be displayed. Number.

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

`go_indicator()` creates a validated graph object (a named list).
`add_indicator()` creates one and adds it to a figure.

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
  add_indicator(
    mode = "number+gauge",
    value = mean(mtcars$mpg),
    title = go_indicator_title(text = "mean mpg")
  )
```
