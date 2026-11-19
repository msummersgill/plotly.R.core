# Print or query a figure's subplot grid

`print_grid()` prints the layout of a grid created by
[`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md).
`get_subplot()` returns the layout object(s) of one grid cell: a list
with `xaxis` and `yaxis` for 2D cartesian subplots, the `scene`,
`polar`, etc. object for other subplot types, or the `x` and `y` domain
for `"domain"` subplots.

## Usage

``` r
print_grid(fig)

get_subplot(fig, row, col, secondary_y = FALSE)
```

## Arguments

- fig:

  A figure created by
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md).

- row, col:

  Grid cell (1-based).

- secondary_y:

  If `TRUE`, the cell's secondary y axis.

## Value

`print_grid()` returns `fig` invisibly; `get_subplot()` returns the
subplot's layout objects, or `NULL` for an empty cell.

## Examples

``` r
fig <- make_subplots(rows = 2, cols = 2, specs = list(
  list(list(), list(type = "polar")),
  list(list(colspan = 2), NULL)
))
print_grid(fig)
#> This is the format of your plot grid:
#> [ (1,1) x,y   ]  [ (1,2) polar ]
#> [ (2,1) x2,y2           -      ]
get_subplot(fig, 1, 2)
#> <layout.polar>
#> {
#>   "domain": {
#>     "x": [
#>       0.55,
#>       1
#>     ],
#>     "y": [
#>       0.575,
#>       1
#>     ]
#>   }
#> }
#> 
```
