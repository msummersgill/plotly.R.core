# Slices objects

Used for `slices` in 2 places in the schema. `go_slices()` creates one;
a named list with the same properties works too.

## Usage

``` r
go_slices(..., x = NULL, y = NULL, z = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- x:

  A
  [`go_slices_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_slices_axis.md)
  object or named list, with properties `fill`, `locations` and `show`
  (see
  [`go_slices_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_slices_axis.md)).

- y:

  A
  [`go_slices_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_slices_axis.md)
  object or named list, with properties `fill`, `locations` and `show`
  (see
  [`go_slices_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_slices_axis.md)).

- z:

  A
  [`go_slices_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_slices_axis.md)
  object or named list, with properties `fill`, `locations` and `show`
  (see
  [`go_slices_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_slices_axis.md)).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_slices` object (a named list).

## Details

These objects appear in 2 places in the plotly.js schema (properties
named `slices`), all with the same properties and rules.

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
    slices = go_slices()
  )
```
