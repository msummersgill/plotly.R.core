# Waterfall totals marker line objects

The object for the `totals.marker.line` of a waterfall trace
([`go_waterfall_totals_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_waterfall_totals_marker.md)).
`go_waterfall_totals_marker_line()` creates one, with exactly its
properties; a named list with the same properties works too.

## Usage

``` r
go_waterfall_totals_marker_line(
  ...,
  color = NULL,
  width = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- color:

  Sets the line color of all intermediate sums and total values. Color:
  a CSS color string or R color name.

- width:

  Sets the line width of all intermediate sums and total values. Number
  in the interval \[0, Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_waterfall_totals_marker_line` object (a named list).

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
    totals = go_waterfall_totals(
      marker = go_waterfall_totals_marker(
        line = go_waterfall_totals_marker_line(color = "red")
      )
    )
  )
```
