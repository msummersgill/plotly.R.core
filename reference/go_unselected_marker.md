# Unselected marker objects

Used for `marker` in 18 places in the schema. `go_unselected_marker()`
creates one; a named list with the same properties works too.

## Usage

``` r
go_unselected_marker(
  arg = NULL,
  ...,
  color = NULL,
  line = NULL,
  opacity = NULL,
  size = NULL,
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

  Sets the marker color of unselected points, applied only when a
  selection exists. Color: a CSS color string or R color name. Not
  available in every context.

- line:

  A
  [`go_unselected_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected_marker_line.md)
  object or named list, with properties `width` (see
  [`go_unselected_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected_marker_line.md)).
  Not available in every context.

- opacity:

  Sets the marker opacity of unselected points, applied only when a
  selection exists. Number in the interval \[0, 1\]. Not available in
  every context.

- size:

  Sets the marker size of unselected points, applied only when a
  selection exists. Number in the interval \[0, Inf\]. Not available in
  every context.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_unselected_marker` object (a named list).

## Details

These objects appear in 18 places in the plotly.js schema (properties
named `marker`), with small differences between them: for example, not
every context has every property below. `go_unselected_marker()` checks
the values against the contexts it can be used in; when the object is
placed in a figure it is checked again against that context's rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_box(
    x = ~factor(cyl),
    y = ~mpg,
    unselected = go_unselected(marker = go_unselected_marker(color = "red"))
  )
```
