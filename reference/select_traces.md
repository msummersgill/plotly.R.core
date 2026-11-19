# Select, update or modify traces

`select_traces()` returns the traces matching `selector` (and, for
figures created with
[`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md),
the grid cell given by `row`, `col` and `secondary_y`).
`update_traces()` updates their properties like
[`update_layout()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md)
does. `for_each_trace()` replaces each one with the result of `fn`.

## Usage

``` r
select_traces(fig, selector = NULL, row = NULL, col = NULL, secondary_y = NULL)

update_traces(
  fig,
  patch = NULL,
  ...,
  selector = NULL,
  row = NULL,
  col = NULL,
  secondary_y = NULL,
  overwrite = FALSE
)

for_each_trace(
  fig,
  fn,
  selector = NULL,
  row = NULL,
  col = NULL,
  secondary_y = NULL
)
```

## Arguments

- fig:

  A `go_figure` object.

- selector:

  Which traces to use: `NULL` (all), a trace type such as `"scatter"`,
  indices into the matching traces, a named list of property values that
  must all match (nested lists match nested properties, e.g.
  `list(marker = list(color = "red"))`), or a function that takes a
  trace and returns `TRUE` or `FALSE`.

- row, col:

  Only traces in this subplot grid row and/or column.

- secondary_y:

  Only traces on secondary (`TRUE`) or primary (`FALSE`) y axes.

- patch:

  A named list of property updates.

- ...:

  Further named updates.

- overwrite:

  If `TRUE`, replace nested objects instead of merging.

- fn:

  A function that takes a trace and returns the modified trace. If it
  returns anything other than a list, the trace is left unchanged.

## Value

`select_traces()` returns a list of traces; the others return the
modified figure.

## Examples

``` r
fig <- go_figure() |>
  add_scatter(y = 1:3, name = "a") |>
  add_scatter(y = 3:1, name = "b", mode = "markers")
select_traces(fig, list(name = "b"))
#> [[1]]
#> <go_scatter>
#> {
#>   "type": "scatter",
#>   "mode": "markers",
#>   "name": "b",
#>   "y": [
#>     3,
#>     2,
#>     1
#>   ]
#> }
#> 
#> 
fig <- update_traces(
  fig,
  marker = go_scatter_marker(size = 12),
  selector = list(mode = "markers")
)
fig <- for_each_trace(fig, function(tr) {
  tr$name <- toupper(tr$name)
  tr
})
```
