# Create a figure with a grid of subplots

Lays out a `rows` x `cols` grid of subplots, ported from plotly.py's
`make_subplots()`. Traces and layout objects can then be placed in a
cell with the `row` and `col` arguments of
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md),
the `add_<trace>()` functions,
[`update_xaxes()`](https://msummersgill.github.io/plotly.R.core/reference/update_xaxes.md),
[`add_annotation()`](https://msummersgill.github.io/plotly.R.core/reference/add_annotation.md)
and similar functions.

## Usage

``` r
make_subplots(
  rows = 1,
  cols = 1,
  shared_xaxes = FALSE,
  shared_yaxes = FALSE,
  start_cell = "top-left",
  print_grid = FALSE,
  horizontal_spacing = NULL,
  vertical_spacing = NULL,
  subplot_titles = NULL,
  column_widths = NULL,
  row_heights = NULL,
  specs = NULL,
  insets = NULL,
  column_titles = NULL,
  row_titles = NULL,
  x_title = NULL,
  y_title = NULL,
  figure = NULL,
  font = NULL
)
```

## Arguments

- rows, cols:

  Number of rows and columns in the grid.

- shared_xaxes, shared_yaxes:

  Link axes so they pan and zoom together: `TRUE` (x axes within each
  column, y axes within each row), `"columns"`, `"rows"`, `"all"` or
  `FALSE`. Tick labels are hidden on all but the outer axes.

- start_cell:

  Which cell is row 1, column 1: `"top-left"` or `"bottom-left"`.

- print_grid:

  If `TRUE`, print the grid layout (see
  [`print_grid()`](https://msummersgill.github.io/plotly.R.core/reference/print_grid.md)).

- horizontal_spacing, vertical_spacing:

  Space between columns or rows, as a fraction of the figure width or
  height. Defaults to `0.2 / cols` (`0.4 / cols` with secondary y axes)
  and `0.3 / rows` (`0.5 / rows` with subplot titles).

- subplot_titles:

  Character vector of titles, one per subplot in row-major order (insets
  last). Empty strings are skipped.

- column_widths, row_heights:

  Relative column widths and row heights; default equal.

- specs:

  Per-cell subplot specifications: a list of `rows` lists, each holding
  `cols` elements. Each element is `NULL` (empty cell) or a named list
  with any of:

  - `type`: `"xy"` (default, 2D cartesian), `"scene"`, `"polar"`,
    `"ternary"`, `"geo"`, `"map"`, `"domain"` (e.g. pie charts), or a
    trace type such as `"bar"` or `"pie"` to use its subplot type.

  - `secondary_y`: `TRUE` to add a second y axis on the right (`"xy"`
    only).

  - `colspan`, `rowspan`: number of columns or rows the subplot spans.

  - `l`, `r`, `b`, `t`: padding on each side, as a fraction of the
    figure.

- insets:

  List of inset subplots, each a named list with `cell` (`c(row, col)`
  of the cell it sits in), `type`, and `l`, `b` (offsets) and `w`, `h`
  (size, or `"to_end"`) as fractions of the cell.

- column_titles, row_titles:

  Titles above each column and to the right of each row.

- x_title, y_title:

  Titles below and to the left of the whole grid.

- figure:

  An existing
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
  to add the subplots to.

- font:

  Font for the subplot, column, row and x/y titles: a named list or
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object. Default `list(size = 16)`.

## Value

A `go_figure` with the subplot grid in its layout.

## See also

[`print_grid()`](https://msummersgill.github.io/plotly.R.core/reference/print_grid.md),
[`get_subplot()`](https://msummersgill.github.io/plotly.R.core/reference/print_grid.md)

## Examples

``` r
fig <- make_subplots(rows = 1, cols = 2, subplot_titles = c("Left", "Right")) |>
  add_scatter(x = 1:3, y = c(4, 5, 6), row = 1, col = 1) |>
  add_scatter(x = 20:22, y = c(50, 60, 70), row = 1, col = 2) |>
  update_yaxes(title = "y", row = 1, col = 1)

# Mixed subplot types and a secondary y axis
fig <- make_subplots(
  rows = 2, cols = 2,
  specs = list(
    list(list(secondary_y = TRUE), list(type = "domain")),
    list(list(colspan = 2), NULL)
  ),
  print_grid = TRUE
)
#> This is the format of your plot grid:
#> [ (1,1) x,y,y2 ]  [ (1,2)        ]
#> [ (2,1) x2,y3            -       ]
```
