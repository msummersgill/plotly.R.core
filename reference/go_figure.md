# Create a figure

A figure holds a list of traces (`data`) and a `layout`. Everything is
validated against the plotly.js schema. Printing a figure renders it as
an htmlwidget.

## Usage

``` r
go_figure(data = NULL, layout = NULL, frames = NULL, skip_invalid = FALSE)
```

## Arguments

- data:

  A trace (e.g. from
  [`go_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md)),
  a list of traces, or a figure (or a list with `data` and `layout`
  elements) to copy. Traces may be graph objects or named lists with a
  `type` element. Or a data frame: the figure starts without traces, and
  formula properties of later `add_<trace>()` calls (e.g.
  `add_scatter(x = ~col)`) are evaluated in it. The data frame is kept
  with the figure in R (attribute `"plotly_data"`) but is not sent to
  the browser; only the values traces use are. A
  [crosstalk::SharedData](https://rdrr.io/pkg/crosstalk/man/SharedData.html)
  works the same way, and the traces whose points are its rows are
  linked to its crosstalk group (see
  [`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)).

- layout:

  A
  [`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
  object or a named list of layout properties.

- frames:

  Animation frames: a list of named lists with `name`, `data` (a list of
  traces), and optionally `layout`, `group`, `traces` and `baseframe`
  elements (see <https://plotly.com/javascript/animations/>).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_figure` object.

## See also

[`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md),
[`update_layout()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md),
[`update_traces()`](https://msummersgill.github.io/plotly.R.core/reference/select_traces.md)

## Examples

``` r
fig <- go_figure(
  data = go_scatter(x = 1:3, y = c(2, 1, 3)),
  layout = go_layout(title = "A figure")
)
fig <- fig |>
  add_scatter(x = 1:3, y = c(3, 2, 1), mode = "markers") |>
  update_layout(xaxis = go_xaxis(title = "x"))
if (interactive()) print(fig)

# pipe in a data frame and refer to its columns with formulas
iris |>
  go_figure() |>
  add_scatter(x = ~Sepal.Length, y = ~Sepal.Width, mode = "markers", name = "sepal") |>
  add_scatter(x = ~Petal.Length, y = ~Petal.Width, mode = "markers", name = "petal")
```
