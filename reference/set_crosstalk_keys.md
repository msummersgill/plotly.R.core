# Link traces to a crosstalk group

Gives traces of a figure the keys of a
[crosstalk::SharedData](https://rdrr.io/pkg/crosstalk/man/SharedData.html),
so that selecting their points selects the same rows in other views of
the crosstalk group (and the reverse). This happens by itself for
`add_<trace>()` traces whose formula properties are evaluated in a
SharedData (piped into
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
or given as `data`); use this for other traces. See
[`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)
for how selections are made and shown.

## Usage

``` r
set_crosstalk_keys(fig, key, group = NULL, traces = NULL, simple = FALSE)
```

## Arguments

- fig:

  A
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md).

- key:

  A
  [crosstalk::SharedData](https://rdrr.io/pkg/crosstalk/man/SharedData.html),
  whose row keys give the keys of the points, in the same order as the
  trace's data; or the keys (a vector with one per point), or a list
  with the keys of each trace in `traces`.

- group:

  The crosstalk group. Default: the SharedData's group.

- traces:

  Indices of the traces to link (default: all).

- simple:

  Whether each trace as a whole stands for all its keys (e.g. a line or
  a fitted curve, which can't be split into points); selecting the trace
  selects them all, and it is highlighted when all are selected.

## Value

`fig`, linked.

## Examples

``` r
sd <- crosstalk::SharedData$new(iris)
go_figure() |>
  add_scatter(x = iris$Sepal.Width, y = iris$Sepal.Length, mode = "markers") |>
  set_crosstalk_keys(sd) |>
  highlight(on = "plotly_selected")
```
