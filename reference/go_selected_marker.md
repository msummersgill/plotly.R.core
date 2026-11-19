# Selected marker objects

Used for `marker` in 18 places in the schema. `go_selected_marker()`
creates one; a named list with the same properties works too.

## Usage

``` r
go_selected_marker(
  ...,
  color = NULL,
  line = NULL,
  opacity = NULL,
  size = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- color:

  Sets the marker color of selected points. Color: a CSS color string or
  R color name. Not available in every context.

- line:

  A
  [`go_selected_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected_marker_line.md)
  object or named list, with properties `width` (see
  [`go_selected_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected_marker_line.md)).
  Not available in every context.

- opacity:

  Sets the marker opacity of selected points. Number in the interval
  \[0, 1\]. Not available in every context.

- size:

  Sets the marker size of selected points. Number in the interval \[0,
  Inf\]. Not available in every context.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_selected_marker` object (a named list).

## Details

These objects appear in 18 places in the plotly.js schema (properties
named `marker`), with small differences between them: for example, not
every context has every property below. `go_selected_marker()` checks
the values against the contexts it can be used in; when the object is
placed in a figure it is checked again against that context's rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_box(
    x = ~factor(cyl),
    y = ~mpg,
    selected = go_selected(marker = go_selected_marker(color = "red"))
  )
```
