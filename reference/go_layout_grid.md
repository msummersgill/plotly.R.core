# Layout grid objects

Properties of `layout.grid`.

## Usage

``` r
go_layout_grid(
  arg = NULL,
  ...,
  columns = NULL,
  domain = NULL,
  pattern = NULL,
  roworder = NULL,
  rows = NULL,
  subplots = NULL,
  xaxes = NULL,
  xgap = NULL,
  xside = NULL,
  yaxes = NULL,
  ygap = NULL,
  yside = NULL,
  skip_invalid = FALSE
)

go_layout_grid_domain(
  arg = NULL,
  ...,
  x = NULL,
  y = NULL,
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

- columns:

  The number of columns in the grid. If you provide a 2D \`subplots\`
  array, the length of its longest row is used as the default. If you
  give an \`xaxes\` array, its length is used as the default. But it's
  also possible to have a different length, if you want to leave a row
  at the end for non-cartesian subplots. Integer in the interval \[1,
  Inf\].

- domain:

  Named list or `go_layout_grid_domain()` object.

- pattern:

  If no \`subplots\`, \`xaxes\`, or \`yaxes\` are given but we do have
  \`rows\` and \`columns\`, we can generate defaults using consecutive
  axis IDs, in two ways: "coupled" gives one x axis per column and one y
  axis per row. "independent" uses a new xy pair for each cell,
  left-to-right across each row then iterating rows according to
  \`roworder\`. One of `"independent"`, `"coupled"`.

- roworder:

  Is the first row the top or the bottom? Note that columns are always
  enumerated from left to right. One of `"top to bottom"`,
  `"bottom to top"`.

- rows:

  The number of rows in the grid. If you provide a 2D \`subplots\` array
  or a \`yaxes\` array, its length is used as the default. But it's also
  possible to have a different length, if you want to leave a row at the
  end for non-cartesian subplots. Integer in the interval \[1, Inf\].

- subplots:

  Used for freeform grids, where some axes may be shared across subplots
  but others are not. Each entry should be a cartesian subplot id, like
  "xy" or "x3y2", or \*\* to leave that cell empty. You may reuse x axes
  within the same column, and y axes within the same row. Non-cartesian
  subplots and traces that support \`domain\` can place themselves in
  this grid separately using the \`gridcell\` attribute. Vector or list
  of up to 1 element(s).

- xaxes:

  Used with \`yaxes\` when the x and y axes are shared across columns
  and rows. Each entry should be an x axis id like "x", "x2", etc., or
  \*" to not put an x axis in that column. Entries other than "\* must
  be unique. Ignored if \`subplots\` is present. If missing but
  \`yaxes\` is present, will generate consecutive IDs. Vector or list of
  up to 1 element(s).

- xgap:

  Horizontal space between grid cells, expressed as a fraction of the
  total width available to one cell. Defaults to 0.1 for coupled-axes
  grids and 0.2 for independent grids. Number in the interval \[0, 1\].

- xside:

  Sets where the x axis labels and titles go. "bottom" means the very
  bottom of the grid. "bottom plot" is the lowest plot that each x axis
  is used in. "top" and "top plot" are similar. One of `"bottom"`,
  `"bottom plot"`, `"top plot"`, `"top"`.

- yaxes:

  Used with \`yaxes\` when the x and y axes are shared across columns
  and rows. Each entry should be an y axis id like "y", "y2", etc., or
  \*" to not put a y axis in that row. Entries other than "\* must be
  unique. Ignored if \`subplots\` is present. If missing but \`xaxes\`
  is present, will generate consecutive IDs. Vector or list of up to 1
  element(s).

- ygap:

  Vertical space between grid cells, expressed as a fraction of the
  total height available to one cell. Defaults to 0.1 for coupled-axes
  grids and 0.3 for independent grids. Number in the interval \[0, 1\].

- yside:

  Sets where the y axis labels and titles go. "left" means the very left
  edge of the grid. "left plot" is the leftmost plot that each y axis is
  used in. "right" and "right plot" are similar. One of `"left"`,
  `"left plot"`, `"right plot"`, `"right"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- x:

  Sets the horizontal domain of this grid subplot (in plot fraction).
  The first and last cells end exactly at the domain edges, with no
  grout around the edges. Vector or list of 2 element(s).

- y:

  Sets the vertical domain of this grid subplot (in plot fraction). The
  first and last cells end exactly at the domain edges, with no grout
  around the edges. Vector or list of 2 element(s).

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_grid()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

Nested objects documented here:

- `go_layout_grid_domain()`:

  `layout.grid.domain`

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
