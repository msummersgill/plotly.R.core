# Update a figure's layout

Updates layout properties, merging nested objects (e.g. `xaxis`) with
any existing values unless `overwrite = TRUE`. Properties can be given
in `patch`, in `...`, or both; `...` is applied last. Nested properties
are given as named lists, which are merged into the existing objects:
`xaxis = list(title = list(text = "x"))` sets the x axis title and keeps
its other properties.

## Usage

``` r
update_layout(fig, patch = NULL, ..., overwrite = FALSE)
```

## Arguments

- fig:

  A `go_figure` object.

- patch:

  A named list or
  [`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
  object of updates.

- ...:

  Further named updates.

- overwrite:

  If `TRUE`, replace nested objects instead of merging.

## Value

The modified figure.

## Examples

``` r
go_figure() |>
  update_layout(title = "Title", xaxis = go_xaxis(range = c(0, 10))) |>
  update_layout(xaxis = go_xaxis(title = "x"), yaxis = go_yaxis(type = "log"))
```
