# Table traces

Table view for detailed data viewing. The data are arranged in a grid of
rows and columns. Most styling can be specified for columns, rows or
individual cells. Table is using a column-major order, ie. the grid is
represented as a vector of column vectors.

## Usage

``` r
add_table(fig, ...)

# Default S3 method
add_table(
  fig,
  ...,
  data = NULL,
  cells = NULL,
  columnorder = NULL,
  columnwidth = NULL,
  customdata = NULL,
  domain = NULL,
  header = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  ids = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  meta = NULL,
  name = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  row = NULL,
  col = NULL,
  skip_invalid = FALSE
)

go_table(
  arg = NULL,
  ...,
  cells = NULL,
  columnorder = NULL,
  columnwidth = NULL,
  customdata = NULL,
  domain = NULL,
  header = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  ids = NULL,
  legend = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  meta = NULL,
  name = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  skip_invalid = FALSE
)

go_table_cells(
  arg = NULL,
  ...,
  align = NULL,
  fill = NULL,
  font = NULL,
  format = NULL,
  height = NULL,
  line = NULL,
  prefix = NULL,
  suffix = NULL,
  values = NULL,
  skip_invalid = FALSE
)

go_table_cells_fill(arg = NULL, ..., color = NULL, skip_invalid = FALSE)

go_table_cells_font(
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

go_table_cells_line(
  arg = NULL,
  ...,
  color = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_table_domain(
  arg = NULL,
  ...,
  column = NULL,
  row = NULL,
  x = NULL,
  y = NULL,
  skip_invalid = FALSE
)

go_table_header(
  arg = NULL,
  ...,
  align = NULL,
  fill = NULL,
  font = NULL,
  format = NULL,
  height = NULL,
  line = NULL,
  prefix = NULL,
  suffix = NULL,
  values = NULL,
  skip_invalid = FALSE
)

go_table_header_fill(arg = NULL, ..., color = NULL, skip_invalid = FALSE)

go_table_header_font(
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

go_table_header_line(
  arg = NULL,
  ...,
  color = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_table_hoverlabel(
  arg = NULL,
  ...,
  align = NULL,
  bgcolor = NULL,
  bordercolor = NULL,
  font = NULL,
  namelength = NULL,
  showarrow = NULL,
  skip_invalid = FALSE
)

go_table_hoverlabel_font(
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

go_table_legendgrouptitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_table_legendgrouptitle_font(
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

- fig:

  A `go_figure` object.

- ...:

  Further properties, including nested properties in "magic underscore"
  form, e.g. `marker_size = 10` for `marker = list(size = 10)`. Property
  values may be one-sided formulas, evaluated in `data` for `add_*()`
  functions.

- data:

  A data frame in which formula properties (e.g. `x = ~col`,
  `marker_size = ~col`) are evaluated. Default: the data given to
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md).
  Only the evaluated values are added to the trace.

- cells:

  Named list or `go_table_cells()` object.

- columnorder:

  Specifies the rendered order of the data columns; for example, a value
  \`2\` at position \`0\` means that column index \`0\` in the data will
  be rendered as the third column, as columns have an index base of
  zero. Data array: a vector, factor, Date/POSIXct vector, matrix or
  list.

- columnwidth:

  The width of columns expressed as a ratio. Columns fill the available
  width in proportion of their specified column widths. Number, or a
  vector of these.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- domain:

  Named list or `go_table_domain()` object.

- header:

  Named list or `go_table_header()` object.

- hoverinfo:

  Determines what trace information appears on hover. If \`none\` or
  \`skip\` are set, no information is displayed upon hovering. But, if
  \`none\` is set, click and hover events are still fired. Any
  combination of `"x"`, `"y"`, `"z"`, `"text"`, `"name"` joined with
  `"+"`, or one of `"all"`, `"none"`, `"skip"`, or a vector of these.

- hoverlabel:

  Named list or `go_table_hoverlabel()` object.

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

  Named list or `go_table_legendgrouptitle()` object.

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

  **`add_table()`**: Subplot grid row (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

  **`go_table_domain()`**: If there is a layout grid, use the domain for
  this row in the grid for this table trace. Integer in the interval
  \[0, Inf\].

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

- align:

  **`go_table_cells()`, `go_table_header()`**: Sets the horizontal
  alignment of the \`text\` within the box. Has an effect only if
  \`text\` spans two or more lines (i.e. \`text\` contains one or more
  \<br\> HTML tags) or if an explicit width is set to override the text
  width. One of `"left"`, `"center"`, `"right"`, or a vector of these.

  **`go_table_hoverlabel()`**: Sets the horizontal alignment of the text
  content within hover label box. Has an effect only if the hover label
  text spans two or more lines One of `"left"`, `"right"`, `"auto"`, or
  a vector of these.

- fill:

  **`go_table_cells()`**: Named list or `go_table_cells_fill()` object.

  **`go_table_header()`**: Named list or `go_table_header_fill()`
  object.

- font:

  **`go_table_cells()`**: Named list or `go_table_cells_font()` object.

  **`go_table_header()`**: Named list or `go_table_header_font()`
  object.

  **`go_table_hoverlabel()`**: Sets the font used in hover labels. Named
  list or `go_table_hoverlabel_font()` object.

  **`go_table_legendgrouptitle()`**: Sets this legend group's title
  font. Named list or `go_table_legendgrouptitle_font()` object.

- format:

  Sets the cell value formatting rule using d3 formatting mini-languages
  which are very similar to those in Python. For numbers, see:
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format. Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- height:

  The height of cells. Number.

- line:

  **`go_table_cells()`**: Named list or `go_table_cells_line()` object.

  **`go_table_header()`**: Named list or `go_table_header_line()`
  object.

- prefix:

  Prefix for cell values. String, or a vector of these.

- suffix:

  Suffix for cell values. String, or a vector of these.

- values:

  **`go_table_cells()`**: Cell values. \`values\[m\]\[n\]\` represents
  the value of the \`n\`th point in column \`m\`, therefore the
  \`values\[m\]\` vector length for all columns must be the same (longer
  vectors will be truncated). Each value must be a finite number or a
  string. Data array: a vector, factor, Date/POSIXct vector, matrix or
  list.

  **`go_table_header()`**: Header cell values. \`values\[m\]\[n\]\`
  represents the value of the \`n\`th point in column \`m\`, therefore
  the \`values\[m\]\` vector length for all columns must be the same
  (longer vectors will be truncated). Each value must be a finite number
  or a string. Data array: a vector, factor, Date/POSIXct vector, matrix
  or list.

- color:

  **`go_table_cells_fill()`, `go_table_header_fill()`**: Sets the cell
  fill color. It accepts either a specific color or an array of colors
  or a 2D array of colors. Color: a CSS color string or R color name, or
  a vector of these.

  **`go_table_cells_font()`, `go_table_cells_line()`,
  `go_table_header_font()`, `go_table_header_line()`,
  `go_table_hoverlabel_font()`**: Color: a CSS color string or R color
  name, or a vector of these.

  **`go_table_legendgrouptitle_font()`**: Color: a CSS color string or R
  color name.

- family:

  **`go_table_cells_font()`, `go_table_header_font()`,
  `go_table_hoverlabel_font()`**: HTML font family - the typeface that
  will be applied by the web browser. The web browser can only apply a
  font if it is available on the system where it runs. Provide multiple
  font families, separated by commas, to indicate the order in which to
  apply fonts if they aren't available. String, or a vector of these.

  **`go_table_legendgrouptitle_font()`**: HTML font family - the
  typeface that will be applied by the web browser. The web browser can
  only apply a font if it is available on the system where it runs.
  Provide multiple font families, separated by commas, to indicate the
  order in which to apply fonts if they aren't available. String.

- lineposition:

  **`go_table_cells_font()`, `go_table_header_font()`,
  `go_table_hoverlabel_font()`**: Sets the kind of decoration line(s)
  with text, such as an "under", "over" or "through" as well as
  combinations e.g. "under+over", etc. Any combination of `"under"`,
  `"over"`, `"through"` joined with `"+"`, or one of `"none"`, or a
  vector of these.

  **`go_table_legendgrouptitle_font()`**: Sets the kind of decoration
  line(s) with text, such as an "under", "over" or "through" as well as
  combinations e.g. "under+over", etc. Any combination of `"under"`,
  `"over"`, `"through"` joined with `"+"`, or one of `"none"`.

- shadow:

  **`go_table_cells_font()`, `go_table_header_font()`,
  `go_table_hoverlabel_font()`**: Sets the shape and color of the shadow
  behind text. "auto" places minimal shadow and applies contrast text
  font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String, or a vector of these.

  **`go_table_legendgrouptitle_font()`**: Sets the shape and color of
  the shadow behind text. "auto" places minimal shadow and applies
  contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String.

- size:

  **`go_table_cells_font()`, `go_table_header_font()`,
  `go_table_hoverlabel_font()`**: Number in the interval \[1, Inf\], or
  a vector of these.

  **`go_table_legendgrouptitle_font()`**: Number in the interval \[1,
  Inf\].

- style:

  **`go_table_cells_font()`, `go_table_header_font()`,
  `go_table_hoverlabel_font()`**: Sets whether a font should be styled
  with a normal or italic face from its family. One of `"normal"`,
  `"italic"`, or a vector of these.

  **`go_table_legendgrouptitle_font()`**: Sets whether a font should be
  styled with a normal or italic face from its family. One of
  `"normal"`, `"italic"`.

- textcase:

  **`go_table_cells_font()`, `go_table_header_font()`,
  `go_table_hoverlabel_font()`**: Sets capitalization of text. It can be
  used to make text appear in all-uppercase or all-lowercase, or with
  each word capitalized. One of `"normal"`, `"word caps"`, `"upper"`,
  `"lower"`, or a vector of these.

  **`go_table_legendgrouptitle_font()`**: Sets capitalization of text.
  It can be used to make text appear in all-uppercase or all-lowercase,
  or with each word capitalized. One of `"normal"`, `"word caps"`,
  `"upper"`, `"lower"`.

- variant:

  **`go_table_cells_font()`, `go_table_header_font()`,
  `go_table_hoverlabel_font()`**: Sets the variant of the font. One of
  `"normal"`, `"small-caps"`, `"all-small-caps"`, `"all-petite-caps"`,
  `"petite-caps"`, `"unicase"`, or a vector of these.

  **`go_table_legendgrouptitle_font()`**: Sets the variant of the font.
  One of `"normal"`, `"small-caps"`, `"all-small-caps"`,
  `"all-petite-caps"`, `"petite-caps"`, `"unicase"`.

- weight:

  **`go_table_cells_font()`, `go_table_header_font()`,
  `go_table_hoverlabel_font()`**: Sets the weight (or boldness) of the
  font. Integer in the interval \[1, 1000\], or a vector of these.

  **`go_table_legendgrouptitle_font()`**: Sets the weight (or boldness)
  of the font. Integer in the interval \[1, 1000\].

- width:

  Number, or a vector of these.

- column:

  If there is a layout grid, use the domain for this column in the grid
  for this table trace. Integer in the interval \[0, Inf\].

- x:

  Sets the horizontal domain of this table trace (in plot fraction).
  Vector or list of 2 element(s).

- y:

  Sets the vertical domain of this table trace (in plot fraction).
  Vector or list of 2 element(s).

- bgcolor:

  Sets the background color of the hover labels for this trace Color: a
  CSS color string or R color name, or a vector of these.

- bordercolor:

  Sets the border color of the hover labels for this trace. Color: a CSS
  color string or R color name, or a vector of these.

- namelength:

  Sets the default length (in number of characters) of the trace name in
  the hover labels for all traces. -1 shows the whole name regardless of
  length. 0-3 shows the first 0-3 characters, and an integer \>3 will
  show the whole name if it is less than that many characters, but if it
  is longer, will truncate to \`namelength - 3\` characters and add an
  ellipsis. Integer in the interval \[-1, Inf\], or a vector of these.

- showarrow:

  Sets whether or not to show the hover label arrow/triangle pointing to
  the data point. Logical.

- text:

  Sets the title of the legend group. String.

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_table()` and the nested object constructors below create validated
graph objects (named lists). Every property is checked against the
plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
`add_table()` creates an object and adds it to a figure.

Nested objects documented here:

- `go_table_cells()`:

  `table.cells`

- `go_table_cells_fill()`:

  `table.cells.fill`

- `go_table_cells_font()`:

  `table.cells.font`

- `go_table_cells_line()`:

  `table.cells.line`

- `go_table_domain()`:

  `table.domain`

- `go_table_header()`:

  `table.header`

- `go_table_header_fill()`:

  `table.header.fill`

- `go_table_header_font()`:

  `table.header.font`

- `go_table_header_line()`:

  `table.header.line`

- `go_table_hoverlabel()`:

  `table.hoverlabel`

- `go_table_hoverlabel_font()`:

  `table.hoverlabel.font`: Sets the font used in hover labels.

- `go_table_legendgrouptitle()`:

  `table.legendgrouptitle`

- `go_table_legendgrouptitle_font()`:

  `table.legendgrouptitle.font`: Sets this legend group's title font.

## See also

[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)

## Examples

``` r
go_table()
#> <go_table>
#> {
#>   "type": "table"
#> }
#> 
```
