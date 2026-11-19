# Selected objects

Used for `selected` in 18 places in the schema. `go_selected()` creates
one; a named list with the same properties works too.

## Usage

``` r
go_selected(..., marker = NULL, textfont = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- marker:

  A
  [`go_selected_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected_marker.md)
  object or named list, with properties `color`, `opacity` and `size`
  (see
  [`go_selected_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected_marker.md)).
  In some contexts: A
  [`go_selected_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected_marker.md)
  object or named list, with properties `color` and `opacity` (see
  [`go_selected_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected_marker.md));
  or A
  [`go_selected_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected_marker.md)
  object or named list, with properties `opacity` (see
  [`go_selected_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected_marker.md));
  or A
  [`go_selected_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected_marker.md)
  object or named list, with properties `color` and `line` (see
  [`go_selected_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected_marker.md)).

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

A `go_selected` object (a named list).

## Details

These objects appear in 18 places in the plotly.js schema (properties
named `selected`), with small differences between them: for example, not
every context has every property below. `go_selected()` checks the
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
    selected = go_selected()
  )
```
