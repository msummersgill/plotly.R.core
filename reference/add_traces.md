# Add traces to a figure

`add_trace()` adds one trace and `add_traces()` several. `add_trace()`
is an S3 generic, so packages can add methods for their own figure
classes (the plotly package does for `plot_ly()` objects).

## Usage

``` r
add_trace(p, ...)

# S3 method for class 'go_figure'
add_trace(
  p,
  trace,
  row = NULL,
  col = NULL,
  secondary_y = NULL,
  exclude_empty_subplots = FALSE,
  ...
)

add_traces(
  fig,
  data,
  rows = NULL,
  cols = NULL,
  secondary_ys = NULL,
  exclude_empty_subplots = FALSE
)
```

## Arguments

- p:

  A `go_figure` object (for `add_trace()`; `p`, as in the plotly
  package, so calls such as `add_trace(p = fig, ...)` keep working).

- ...:

  Unused.

- trace:

  A trace: a graph object such as
  [`go_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md),
  or a named list with a `type` element (default `"scatter"`).

- row, col:

  Subplot grid cell for the trace (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). Either may be `"all"` or a vector, to add the trace to several
  cells.

- secondary_y:

  If `TRUE`, use the secondary y axis of the subplot (see the `specs`
  argument of
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)).

- exclude_empty_subplots:

  If `TRUE`, don't add the trace to subplots that have no traces or
  layout objects yet.

- fig:

  A `go_figure` object (for `add_traces()`).

- data:

  A list of traces.

- rows, cols, secondary_ys:

  Per-trace grid cells and secondary y flags for `add_traces()`; a
  single value applies to every trace.

## Value

The modified figure.

## See also

The generated `add_<trace type>()` functions, e.g.
[`add_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md).

## Examples

``` r
go_figure() |>
  add_trace(go_scatter(x = 1:3, y = 1:3)) |>
  add_traces(list(list(type = "scatter", y = 3:1), go_scatter(y = c(2, 2, 2))))

make_subplots(rows = 1, cols = 2) |>
  add_trace(go_scatter(y = 1:3), row = 1, col = 2)
```
