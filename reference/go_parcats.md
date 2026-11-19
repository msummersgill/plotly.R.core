# Parcats traces

Parallel categories diagram for multidimensional categorical data.

## Usage

``` r
add_parcats(fig, ...)

# Default S3 method
add_parcats(
  fig,
  ...,
  data = NULL,
  arrangement = NULL,
  bundlecolors = NULL,
  counts = NULL,
  dimensions = NULL,
  domain = NULL,
  hoverinfo = NULL,
  hoveron = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  labelfont = NULL,
  legendgrouptitle = NULL,
  legendwidth = NULL,
  line = NULL,
  meta = NULL,
  name = NULL,
  sortpaths = NULL,
  tickfont = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  row = NULL,
  col = NULL,
  skip_invalid = FALSE
)

go_parcats(
  ...,
  arrangement = NULL,
  bundlecolors = NULL,
  counts = NULL,
  dimensions = NULL,
  domain = NULL,
  hoverinfo = NULL,
  hoveron = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  labelfont = NULL,
  legendgrouptitle = NULL,
  legendwidth = NULL,
  line = NULL,
  meta = NULL,
  name = NULL,
  sortpaths = NULL,
  tickfont = NULL,
  uid = NULL,
  uirevision = NULL,
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

  A data frame in which formula properties (e.g. `x = ~col`,
  `marker = list(size = ~col)`,
  `marker = go_scatter_marker(size = ~col)`) are evaluated. Default: the
  data given to
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md).
  Only the evaluated values are added to the trace. A
  [`crosstalk::SharedData`](https://rdrr.io/pkg/crosstalk/man/SharedData.html)
  works the same way, and links the trace to its crosstalk group (see
  [`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)).

- arrangement:

  Sets the drag interaction mode for categories and dimensions. If
  \`perpendicular\`, the categories can only move along a line
  perpendicular to the paths. If \`freeform\`, the categories can freely
  move on the plane. If \`fixed\`, the categories and dimensions are
  stationary. One of `"perpendicular"`, `"freeform"`, `"fixed"`.

- bundlecolors:

  Sort paths so that like colors are bundled together within each
  category. Logical.

- counts:

  The number of observations represented by each state. Defaults to 1 so
  that each state represents one observation Number in the interval \[0,
  Inf\], or a vector of these.

- dimensions:

  List, each element a
  [`go_parcats_dimension()`](https://msummersgill.github.io/plotly.R.core/reference/go_parcats_dimension.md)
  object or named list, with properties `categoryarray`,
  `categoryorder`, `displayindex`, `label`, `ticktext`, `values` and
  `visible` (see
  [`go_parcats_dimension()`](https://msummersgill.github.io/plotly.R.core/reference/go_parcats_dimension.md)).

- domain:

  A
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)
  object or named list, with properties `column`, `row`, `x` and `y`
  (see
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)).

- hoverinfo:

  Determines what trace information appears on hover. If \`none\` or
  \`skip\` are set, no information is displayed upon hovering. But, if
  \`none\` is set, click and hover events are still fired. Any
  combination of `"count"`, `"probability"` joined with `"+"`, or one of
  `"all"`, `"none"`, `"skip"`.

- hoveron:

  Sets the hover interaction mode for the parcats diagram. If
  \`category\`, hover interaction take place per category. If \`color\`,
  hover interactions take place per color per category. If
  \`dimension\`, hover interactions take place across all categories per
  dimension. One of `"category"`, `"color"`, `"dimension"`.

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
  string has access to variables \`count\`, \`probability\`,
  \`category\`, \`categorycount\`, \`colorcount\` and
  \`bandcolorcount\`. Anything contained in tag \`\<extra\>\` is
  displayed in the secondary box, for example
  \`\<extra\>%{fullData.name}\</extra\>\`. To hide the secondary box
  completely, use an empty tag \`\<extra\>\</extra\>\`. String.

- hovertemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- labelfont:

  Sets the font for the \`dimension\` labels. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- legendgrouptitle:

  A
  [`go_legendgrouptitle()`](https://msummersgill.github.io/plotly.R.core/reference/go_legendgrouptitle.md)
  object or named list, with properties `font` and `text` (see
  [`go_legendgrouptitle()`](https://msummersgill.github.io/plotly.R.core/reference/go_legendgrouptitle.md)).

- legendwidth:

  Sets the width (in px or fraction) of the legend for this trace.
  Number in the interval \[0, Inf\].

- line:

  A
  [`go_parcats_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_parcats_line.md)
  object or named list, with properties `autocolorscale`, `cauto`,
  `cmax`, `cmid`, `cmin`, `color`, `coloraxis`, `colorbar`,
  `colorscale`, `hovertemplate`, `hovertemplatefallback`,
  `reversescale`, `shape` and `showscale` (see
  [`go_parcats_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_parcats_line.md)).

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

- sortpaths:

  Sets the path sorting algorithm. If \`forward\`, sort paths based on
  dimension categories from left to right. If \`backward\`, sort paths
  based on dimensions categories from right to left. One of `"forward"`,
  `"backward"`.

- tickfont:

  Sets the font for the \`category\` labels. A
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

`go_parcats()` creates a validated graph object (a named list).
`add_parcats()` creates one and adds it to a figure.

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
  add_parcats(
    dimensions = list(
      go_parcats_dimension(label = "cyl", values = ~cyl),
      go_parcats_dimension(label = "gear", values = ~gear),
      go_parcats_dimension(label = "am", values = ~am)
    )
  )
```
