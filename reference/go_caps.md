# Caps objects

Used for `caps` in 2 places in the schema. `go_caps()` creates one; a
named list with the same properties works too.

## Usage

``` r
go_caps(arg = NULL, ..., x = NULL, y = NULL, z = NULL, skip_invalid = FALSE)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- x:

  A
  [`go_caps_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_caps_axis.md)
  object or named list, with properties `fill` and `show` (see
  [`go_caps_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_caps_axis.md)).

- y:

  A
  [`go_caps_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_caps_axis.md)
  object or named list, with properties `fill` and `show` (see
  [`go_caps_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_caps_axis.md)).

- z:

  A
  [`go_caps_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_caps_axis.md)
  object or named list, with properties `fill` and `show` (see
  [`go_caps_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_caps_axis.md)).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_caps` object (a named list).

## Details

These objects appear in 2 places in the plotly.js schema (properties
named `caps`), all with the same properties and rules.

## Examples

``` r
d <- expand.grid(x = 1:5, y = 1:5, z = 1:5)
d |>
  go_figure() |>
  add_isosurface(
    x = ~x,
    y = ~y,
    z = ~z,
    value = ~x * y * z,
    isomin = 10,
    isomax = 50,
    caps = go_caps()
  )
```
