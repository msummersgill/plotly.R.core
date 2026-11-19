# Indicator gauge step line objects

The object for the `gauge.step.line` of an indicator trace
([`go_indicator_gauge_step()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge_step.md)).
`go_indicator_gauge_step_line()` creates one, with exactly its
properties; a named list with the same properties works too.

## Usage

``` r
go_indicator_gauge_step_line(
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

  Sets the color of the line enclosing each sector. Color: a CSS color
  string or R color name.

- width:

  Sets the width (in px) of the line enclosing each sector. Number in
  the interval \[0, Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_indicator_gauge_step_line` object (a named list).

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
      steps = list(
        go_indicator_gauge_step(
          range = c(0, 20), line = go_indicator_gauge_step_line(color = "red")
        )
      )
    )
  )
```
