# Unselected objects

Used for `unselected` in 19 places in the schema. `go_unselected()`
creates one; a named list with the same properties works too.

## Usage

``` r
go_unselected(
  arg = NULL,
  ...,
  line = NULL,
  marker = NULL,
  textfont = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- line:

  A
  [`go_unselected_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected_line.md)
  object or named list, with properties `color` and `opacity` (see
  [`go_unselected_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected_line.md)).
  Not available in every context.

- marker:

  A
  [`go_unselected_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected_marker.md)
  object or named list, with properties `color`, `opacity` and `size`
  (see
  [`go_unselected_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected_marker.md)).
  In some contexts: A
  [`go_unselected_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected_marker.md)
  object or named list, with properties `color` and `opacity` (see
  [`go_unselected_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected_marker.md));
  or A
  [`go_unselected_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected_marker.md)
  object or named list, with properties `opacity` (see
  [`go_unselected_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected_marker.md));
  or A
  [`go_unselected_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected_marker.md)
  object or named list, with properties `color` and `line` (see
  [`go_unselected_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected_marker.md)).
  Not available in every context.

- textfont:

  A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).
  Not available in every context.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_unselected` object (a named list).

## Details

These objects appear in 19 places in the plotly.js schema (properties
named `unselected`), with small differences between them: for example,
not every context has every property below. `go_unselected()` checks the
values against the contexts it can be used in; when the object is placed
in a figure it is checked again against that context's rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter(
    x = ~wt,
    y = ~mpg,
    mode = "markers",
    unselected = go_unselected()
  )
```
