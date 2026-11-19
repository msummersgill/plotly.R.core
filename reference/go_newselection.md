# Layout newselection objects

The object for the figure layout's `newselection`. `go_newselection()`
creates one, with exactly its properties; a named list with the same
properties works too.

## Usage

``` r
go_newselection(..., line = NULL, mode = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- line:

  A
  [`go_newselection_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_newselection_line.md)
  object or named list, with properties `color`, `dash` and `width` (see
  [`go_newselection_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_newselection_line.md)).

- mode:

  Describes how a new selection is created. If \`immediate\`, a new
  selection is created after first mouse up. If \`gradual\`, a new
  selection is not created after first mouse. By adding to and
  subtracting from the initial selection, this option allows declaring
  extra outlines of the selection. One of `"immediate"`, `"gradual"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_newselection` object (a named list).

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
  update_layout(newselection = go_newselection())
```
