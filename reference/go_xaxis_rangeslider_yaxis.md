# Layout xaxis rangeslider yaxis objects

The object for the layout's `xaxis.rangeslider.yaxis`
([`go_xaxis_rangeslider()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis_rangeslider.md)).
`go_xaxis_rangeslider_yaxis()` creates one, with exactly its properties;
a named list with the same properties works too.

## Usage

``` r
go_xaxis_rangeslider_yaxis(
  ...,
  range = NULL,
  rangemode = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- range:

  Sets the range of this axis for the rangeslider. Vector or list of 2
  element(s).

- rangemode:

  Determines whether or not the range of this axis in the rangeslider
  use the same value than in the main plot when zooming in/out. If
  "auto", the autorange will be used. If "fixed", the \`range\` is used.
  If "match", the current range of the corresponding y-axis on the main
  subplot is used. One of `"auto"`, `"fixed"`, `"match"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_xaxis_rangeslider_yaxis` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter(x = ~wt, y = ~mpg, mode = "markers") |>
  update_layout(
    xaxis = go_xaxis(
      rangeslider = go_xaxis_rangeslider(yaxis = go_xaxis_rangeslider_yaxis())
    )
  )
```
