# Waterfall totals objects

The object for the `totals` of a waterfall trace
([`go_waterfall()`](https://msummersgill.github.io/plotly.R.core/reference/go_waterfall.md)).
`go_waterfall_totals()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_waterfall_totals(..., marker = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- marker:

  A
  [`go_waterfall_totals_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_waterfall_totals_marker.md)
  object or named list, with properties `color` and `line` (see
  [`go_waterfall_totals_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_waterfall_totals_marker.md)).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_waterfall_totals` object (a named list).

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
  add_waterfall(
    x = ~factor(cyl),
    y = ~mpg,
    totals = go_waterfall_totals()
  )
```
