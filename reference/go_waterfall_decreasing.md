# Waterfall decreasing objects

The object for the `decreasing` of a waterfall trace
([`go_waterfall()`](https://msummersgill.github.io/plotly.R.core/reference/go_waterfall.md)).
`go_waterfall_decreasing()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_waterfall_decreasing(arg = NULL, ..., marker = NULL, skip_invalid = FALSE)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- marker:

  A
  [`go_waterfall_decreasing_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_waterfall_decreasing_marker.md)
  object or named list, with properties `color` and `line` (see
  [`go_waterfall_decreasing_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_waterfall_decreasing_marker.md)).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_waterfall_decreasing` object (a named list).

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
    decreasing = go_waterfall_decreasing()
  )
```
