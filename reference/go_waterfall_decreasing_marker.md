# Waterfall decreasing marker objects

The object for the `decreasing.marker` of a waterfall trace
([`go_waterfall_decreasing()`](https://msummersgill.github.io/plotly.R.core/reference/go_waterfall_decreasing.md)).
`go_waterfall_decreasing_marker()` creates one, with exactly its
properties; a named list with the same properties works too.

## Usage

``` r
go_waterfall_decreasing_marker(
  ...,
  color = NULL,
  line = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- color:

  Sets the marker color of all decreasing values. Color: a CSS color
  string or R color name.

- line:

  A
  [`go_waterfall_decreasing_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_waterfall_decreasing_marker_line.md)
  object or named list, with properties `color` and `width` (see
  [`go_waterfall_decreasing_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_waterfall_decreasing_marker_line.md)).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_waterfall_decreasing_marker` object (a named list).

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
    decreasing = go_waterfall_decreasing(
      marker = go_waterfall_decreasing_marker(color = "red")
    )
  )
```
