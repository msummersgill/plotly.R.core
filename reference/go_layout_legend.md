# Layout legend objects

Properties of `layout.legend`.

## Usage

``` r
go_layout_legend(
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

go_layout_legend_font(
  arg = NULL,
  ...,
  color = NULL,
  family = NULL,
  lineposition = NULL,
  shadow = NULL,
  size = NULL,
  style = NULL,
  textcase = NULL,
  variant = NULL,
  weight = NULL,
  skip_invalid = FALSE
)

go_layout_legend_grouptitlefont(
  arg = NULL,
  ...,
  color = NULL,
  family = NULL,
  lineposition = NULL,
  shadow = NULL,
  size = NULL,
  style = NULL,
  textcase = NULL,
  variant = NULL,
  weight = NULL,
  skip_invalid = FALSE
)

go_layout_legend_title(
  arg = NULL,
  ...,
  font = NULL,
  side = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_layout_legend_title_font(
  arg = NULL,
  ...,
  color = NULL,
  family = NULL,
  lineposition = NULL,
  shadow = NULL,
  size = NULL,
  style = NULL,
  textcase = NULL,
  variant = NULL,
  weight = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from (constructors). Named arguments take precedence.

- ...:

  Further properties, including nested properties in "magic underscore"
  form, e.g. `marker_size = 10` for `marker = list(size = 10)`. Property
  values may be one-sided formulas, evaluated in `data` for `add_*()`
  functions.

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

  **`go_layout_legend()`**: Sets the font used to text the legend items.
  Named list or `go_layout_legend_font()` object.

  **`go_layout_legend_title()`**: Sets this legend's title font.
  Defaults to \`legend.font\` with its size increased about 20%. Named
  list or `go_layout_legend_title_font()` object.

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
  with its size increased about 10%. Named list or
  `go_layout_legend_grouptitlefont()` object.

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

  String (the title text), named list or `go_layout_legend_title()`
  object.

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

- color:

  Color: a CSS color string or R color name.

- family:

  HTML font family - the typeface that will be applied by the web
  browser. The web browser can only apply a font if it is available on
  the system where it runs. Provide multiple font families, separated by
  commas, to indicate the order in which to apply fonts if they aren't
  available. String.

- lineposition:

  Sets the kind of decoration line(s) with text, such as an "under",
  "over" or "through" as well as combinations e.g. "under+over", etc.
  Any combination of `"under"`, `"over"`, `"through"` joined with `"+"`,
  or one of `"none"`.

- shadow:

  Sets the shape and color of the shadow behind text. "auto" places
  minimal shadow and applies contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String.

- size:

  Number in the interval \[1, Inf\].

- style:

  Sets whether a font should be styled with a normal or italic face from
  its family. One of `"normal"`, `"italic"`.

- textcase:

  Sets capitalization of text. It can be used to make text appear in
  all-uppercase or all-lowercase, or with each word capitalized. One of
  `"normal"`, `"word caps"`, `"upper"`, `"lower"`.

- variant:

  Sets the variant of the font. One of `"normal"`, `"small-caps"`,
  `"all-small-caps"`, `"all-petite-caps"`, `"petite-caps"`, `"unicase"`.

- weight:

  Sets the weight (or boldness) of the font. Integer in the interval
  \[1, 1000\].

- side:

  Determines the location of legend's title with respect to the legend
  items. Defaulted to "top" with \`orientation\` is "h". Defaulted to
  "left" with \`orientation\` is "v". The "top left" options could be
  used to expand top center and top right are for horizontal alignment
  legend area in both x and y sides. One of `"top"`, `"left"`,
  `"top left"`, `"top center"`, `"top right"`.

- text:

  Sets the title of the legend. String.

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_legend()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

Nested objects documented here:

- `go_layout_legend_font()`:

  `layout.legend.font`: Sets the font used to text the legend items.

- `go_layout_legend_grouptitlefont()`:

  `layout.legend.grouptitlefont`: Sets the font for group titles in
  legend. Defaults to \`legend.font\` with its size increased about 10%.

- `go_layout_legend_title()`:

  `layout.legend.title`

- `go_layout_legend_title_font()`:

  `layout.legend.title.font`: Sets this legend's title font. Defaults to
  \`legend.font\` with its size increased about 20%.

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
