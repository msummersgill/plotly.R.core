# Indicator gauge bar objects

Set the appearance of the gauge's value The object for the `gauge.bar`
of an indicator trace
([`go_indicator_gauge()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge.md)).
`go_indicator_gauge_bar()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_indicator_gauge_bar(
  ...,
  color = NULL,
  line = NULL,
  thickness = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- color:

  Sets the background color of the arc. Color: a CSS color string or R
  color name.

- line:

  A
  [`go_indicator_gauge_bar_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge_bar_line.md)
  object or named list, with properties `color` and `width` (see
  [`go_indicator_gauge_bar_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge_bar_line.md)).

- thickness:

  Sets the thickness of the bar as a fraction of the total thickness of
  the gauge. Number in the interval \[0, 1\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_indicator_gauge_bar` object (a named list).

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
      bar = go_indicator_gauge_bar(color = "red")
    )
  )
```
