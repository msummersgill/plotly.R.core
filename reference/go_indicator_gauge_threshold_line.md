# Indicator gauge threshold line objects

The object for the `gauge.threshold.line` of an indicator trace
([`go_indicator_gauge_threshold()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge_threshold.md)).
`go_indicator_gauge_threshold_line()` creates one, with exactly its
properties; a named list with the same properties works too.

## Usage

``` r
go_indicator_gauge_threshold_line(
  arg = NULL,
  ...,
  color = NULL,
  width = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- color:

  Sets the color of the threshold line. Color: a CSS color string or R
  color name.

- width:

  Sets the width (in px) of the threshold line. Number in the interval
  \[0, Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_indicator_gauge_threshold_line` object (a named list).

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
  add_indicator(
    mode = "number+gauge",
    value = mean(mtcars$mpg),
    title = go_indicator_title(text = "mean mpg"),
    gauge = go_indicator_gauge(
      threshold = go_indicator_gauge_threshold(
        line = go_indicator_gauge_threshold_line(color = "red")
      )
    )
  )
```
