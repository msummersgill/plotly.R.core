# Histogram2dcontour marker objects

The object for the `marker` of a histogram2dcontour trace
([`go_histogram2dcontour()`](https://msummersgill.github.io/plotly.R.core/reference/go_histogram2dcontour.md)).
`go_histogram2dcontour_marker()` creates one, with exactly its
properties; a named list with the same properties works too.

## Usage

``` r
go_histogram2dcontour_marker(..., color = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- color:

  Sets the aggregation data. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_histogram2dcontour_marker` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
faithful |>
  go_figure() |>
  add_histogram2dcontour(
    x = ~eruptions,
    y = ~waiting,
    marker = go_histogram2dcontour_marker(color = "red")
  )
```
