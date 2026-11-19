# Indicator gauge objects

The gauge of the Indicator plot. The object for the `gauge` of an
indicator trace
([`go_indicator()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator.md)).
`go_indicator_gauge()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_indicator_gauge(
  ...,
  axis = NULL,
  bar = NULL,
  bgcolor = NULL,
  bordercolor = NULL,
  borderwidth = NULL,
  shape = NULL,
  steps = NULL,
  threshold = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- axis:

  A
  [`go_indicator_gauge_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge_axis.md)
  object or named list, with properties `dtick`, `exponentformat`,
  `labelalias`, `minexponent`, `nticks`, `range`, `separatethousands`,
  `showexponent`, `showticklabels`, `showtickprefix`, `showticksuffix`,
  `tick0` and 15 more (see
  [`go_indicator_gauge_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge_axis.md)).

- bar:

  Set the appearance of the gauge's value A
  [`go_indicator_gauge_bar()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge_bar.md)
  object or named list, with properties `color`, `line` and `thickness`
  (see
  [`go_indicator_gauge_bar()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge_bar.md)).

- bgcolor:

  Sets the gauge background color. Color: a CSS color string or R color
  name.

- bordercolor:

  Sets the color of the border enclosing the gauge. Color: a CSS color
  string or R color name.

- borderwidth:

  Sets the width (in px) of the border enclosing the gauge. Number in
  the interval \[0, Inf\].

- shape:

  Set the shape of the gauge One of `"angular"`, `"bullet"`.

- steps:

  List, each element a
  [`go_indicator_gauge_step()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge_step.md)
  object or named list, with properties `color`, `line`, `name`,
  `range`, `templateitemname` and `thickness` (see
  [`go_indicator_gauge_step()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge_step.md)).

- threshold:

  A
  [`go_indicator_gauge_threshold()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge_threshold.md)
  object or named list, with properties `line`, `thickness` and `value`
  (see
  [`go_indicator_gauge_threshold()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge_threshold.md)).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_indicator_gauge` object (a named list).

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
    gauge = go_indicator_gauge(bgcolor = "lightyellow")
  )
```
