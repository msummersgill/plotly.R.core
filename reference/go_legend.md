# Layout legend objects

The object for the figure layout's `legend` (and `legend2`, `legend3`,
...: see
[`update_legends()`](https://msummersgill.github.io/plotly.R.core/reference/update_legends.md)).
`go_legend()` creates one, with exactly its properties; a named list
with the same properties works too.

## Usage

``` r
go_legend(
  arg = NULL,
  ...,
  bgcolor = NULL,
  bordercolor = NULL,
  borderwidth = NULL,
  entrywidth = NULL,
  entrywidthmode = NULL,
  font = NULL,
  groupclick = NULL,
  groupdoubleclick = NULL,
  grouptitlefont = NULL,
  indentation = NULL,
  itemclick = NULL,
  itemdoubleclick = NULL,
  itemheight = NULL,
  itemsizing = NULL,
  itemwidth = NULL,
  maxheight = NULL,
  orientation = NULL,
  title = NULL,
  titleclick = NULL,
  titledoubleclick = NULL,
  tracegroupgap = NULL,
  traceorder = NULL,
  uirevision = NULL,
  valign = NULL,
  visible = NULL,
  x = NULL,
  xanchor = NULL,
  xref = NULL,
  y = NULL,
  yanchor = NULL,
  yref = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- bgcolor:

  Sets the legend background color. Defaults to
  \`layout.paper_bgcolor\`. Color: a CSS color string or R color name.

- bordercolor:

  Sets the color of the border enclosing the legend. Color: a CSS color
  string or R color name.

- borderwidth:

  Sets the width (in px) of the border enclosing the legend. Number in
  the interval \[0, Inf\].

- entrywidth:

  Sets the width (in px or fraction) of the legend. Use 0 to size the
  entry based on the text width, when \`entrywidthmode\` is set to
  "pixels". Number in the interval \[0, Inf\].

- entrywidthmode:

  Determines what entrywidth means. One of `"fraction"`, `"pixels"`.

- font:

  Sets the font used to text the legend items. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- groupclick:

  Determines the behavior on legend group item click. "toggleitem"
  toggles the visibility of the individual item clicked on the graph.
  "togglegroup" toggles the visibility of all items in the same
  legendgroup as the item clicked on the graph. One of `"toggleitem"`,
  `"togglegroup"`.

- groupdoubleclick:

  Determines the behavior on legend group item double-click.
  "toggleitem" toggles the visibility of the individual item clicked on
  the graph. "togglegroup" toggles the visibility of all items in the
  same legendgroup as the item clicked on the graph. Defaults to the
  value of \`groupclick\`. One of `"toggleitem"`, `"togglegroup"`.

- grouptitlefont:

  Sets the font for group titles in legend. Defaults to \`legend.font\`
  with its size increased about 10%. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- indentation:

  Sets the indentation (in px) of the legend entries. Number in the
  interval \[-15, Inf\].

- itemclick:

  Determines the behavior on legend item click. "toggle" toggles the
  visibility of the item clicked on the graph. "toggleothers" makes the
  clicked item the sole visible item on the graph. FALSE disables legend
  item click interactions. One of `"toggle"`, `"toggleothers"`, `FALSE`.

- itemdoubleclick:

  Determines the behavior on legend item double-click. "toggle" toggles
  the visibility of the item clicked on the graph. "toggleothers" makes
  the clicked item the sole visible item on the graph. FALSE disables
  legend item double-click interactions. One of `"toggle"`,
  `"toggleothers"`, `FALSE`.

- itemheight:

  Sets the height (in px) of the legend item fill swatch. A taller
  swatch shows more of a trace "fill" or "fillpattern". Only traces with
  a "fill" use this value. Every legend item grows to fit, so a larger
  value makes every row taller. Number in the interval \[6, Inf\].

- itemsizing:

  Determines if the legend items symbols scale with their corresponding
  "trace" attributes or remain "constant" independent of the symbol size
  on the graph. One of `"trace"`, `"constant"`.

- itemwidth:

  Sets the width (in px) of the legend item symbols (the part other than
  the title.text). Number in the interval \[30, Inf\].

- maxheight:

  Sets the max height (in px) of the legend, or max height ratio
  (reference height \* ratio) if less than or equal to 1. Default value
  is: 0.5 for horizontal legends; 1 for vertical legends. The minimum
  allowed height is 30px. For a ratio of 0.5, the legend will take up to
  50% of the reference height before displaying a scrollbar. The
  reference height is the full layout height with the following
  exception: vertically oriented legends with a \`yref\` of \`"paper",
  located to the side of the plot. In this case, the reference height is
  the plot height. Number in the interval \[0, Inf\].

- orientation:

  Sets the orientation of the legend. One of `"v"`, `"h"`.

- title:

  String (the title text), or a
  [`go_legend_title()`](https://msummersgill.github.io/plotly.R.core/reference/go_legend_title.md)
  object or named list, with properties `font`, `side` and `text` (see
  [`go_legend_title()`](https://msummersgill.github.io/plotly.R.core/reference/go_legend_title.md)).

- titleclick:

  Determines the behavior on legend title click. "toggle" toggles the
  visibility of all items in the legend. "toggleothers" toggles the
  visibility of all other legends. FALSE disables legend title click
  interactions. Defaults to "toggle" when there are multiple legends,
  FALSE otherwise. Not supported for legends containing pie and pie-like
  traces. One of `"toggle"`, `"toggleothers"`, `FALSE`.

- titledoubleclick:

  Determines the behavior on legend title double-click. "toggle" toggles
  the visibility of all items in the legend. "toggleothers" toggles the
  visibility of all other legends. FALSE disables legend title
  double-click interactions. Defaults to "toggleothers" when there are
  multiple legends, FALSE otherwise. Not supported for legends
  containing pie and pie-like traces. One of `"toggle"`,
  `"toggleothers"`, `FALSE`.

- tracegroupgap:

  Sets the amount of vertical space (in px) between legend groups.
  Number in the interval \[0, Inf\].

- traceorder:

  Determines the order at which the legend items are displayed. If
  "normal", the items are displayed top-to-bottom in the same order as
  the input data. If "reversed", the items are displayed in the opposite
  order as "normal". If "grouped", the items are displayed in groups
  (when a trace \`legendgroup\` is provided). if "grouped+reversed", the
  items are displayed in the opposite order as "grouped". Any
  combination of `"reversed"`, `"grouped"` joined with `"+"`, or one of
  `"normal"`.

- uirevision:

  Controls persistence of legend-driven changes in trace and pie label
  visibility. Defaults to \`layout.uirevision\`. Any value.

- valign:

  Sets the vertical alignment of the symbols with respect to their
  associated text. One of `"top"`, `"middle"`, `"bottom"`.

- visible:

  Determines whether or not this legend is visible. Logical.

- x:

  Sets the x position with respect to \`xref\` (in normalized
  coordinates) of the legend. When \`xref\` is "paper", defaults to 1.02
  for vertical legends and defaults to 0 for horizontal legends. When
  \`xref\` is "container", defaults to 1 for vertical legends and
  defaults to 0 for horizontal legends. Must be between 0 and 1 if
  \`xref\` is "container". and between "-2" and 3 if \`xref\` is
  "paper". Number.

- xanchor:

  Sets the legend's horizontal position anchor. This anchor binds the
  \`x\` position to the "left", "center" or "right" of the legend. Value
  "auto" anchors legends to the right for \`x\` values greater than or
  equal to 2/3, anchors legends to the left for \`x\` values less than
  or equal to 1/3 and anchors legends with respect to their center
  otherwise. One of `"auto"`, `"left"`, `"center"`, `"right"`.

- xref:

  Sets the container \`x\` refers to. "container" spans the entire
  \`width\` of the plot. "paper" refers to the width of the plotting
  area only. One of `"container"`, `"paper"`.

- y:

  Sets the y position with respect to \`yref\` (in normalized
  coordinates) of the legend. When \`yref\` is "paper", defaults to 1
  for vertical legends, defaults to "-0.1" for horizontal legends on
  graphs w/o range sliders and defaults to 1.1 for horizontal legends on
  graph with one or multiple range sliders. When \`yref\` is
  "container", defaults to 1. Must be between 0 and 1 if \`yref\` is
  "container" and between "-2" and 3 if \`yref\` is "paper". Number.

- yanchor:

  Sets the legend's vertical position anchor. This anchor binds the
  \`y\` position to the "top", "middle" or "bottom" of the legend. Value
  "auto" anchors legends at their bottom for \`y\` values less than or
  equal to 1/3, anchors legends to at their top for \`y\` values greater
  than or equal to 2/3 and anchors legends with respect to their middle
  otherwise. One of `"auto"`, `"top"`, `"middle"`, `"bottom"`.

- yref:

  Sets the container \`y\` refers to. "container" spans the entire
  \`height\` of the plot. "paper" refers to the height of the plotting
  area only. One of `"container"`, `"paper"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_legend` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter(x = ~wt, y = ~mpg, mode = "markers") |>
  update_layout(legend = go_legend(visible = TRUE))
```
