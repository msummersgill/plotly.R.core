# Indicator delta objects

The object for the `delta` of an indicator trace
([`go_indicator()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator.md)).
`go_indicator_delta()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_indicator_delta(
  ...,
  decreasing = NULL,
  font = NULL,
  increasing = NULL,
  position = NULL,
  prefix = NULL,
  reference = NULL,
  relative = NULL,
  suffix = NULL,
  valueformat = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- decreasing:

  A
  [`go_indicator_delta_decreasing()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_delta_decreasing.md)
  object or named list, with properties `color` and `symbol` (see
  [`go_indicator_delta_decreasing()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_delta_decreasing.md)).

- font:

  Set the font used to display the delta A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- increasing:

  A
  [`go_indicator_delta_increasing()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_delta_increasing.md)
  object or named list, with properties `color` and `symbol` (see
  [`go_indicator_delta_increasing()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_delta_increasing.md)).

- position:

  Sets the position of delta with respect to the number. One of `"top"`,
  `"bottom"`, `"left"`, `"right"`.

- prefix:

  Sets a prefix appearing before the delta. String.

- reference:

  Sets the reference value to compute the delta. By default, it is set
  to the current value. Number.

- relative:

  Show relative change Logical.

- suffix:

  Sets a suffix appearing next to the delta. String.

- valueformat:

  Sets the value formatting rule using d3 formatting mini-languages
  which are very similar to those in Python. For numbers, see:
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format. String.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_indicator_delta` object (a named list).

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
    delta = go_indicator_delta()
  )
```
