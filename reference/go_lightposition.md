# Lightposition objects

Used for `lightposition` in 6 places in the schema. `go_lightposition()`
creates one; a named list with the same properties works too.

## Usage

``` r
go_lightposition(..., x = NULL, y = NULL, z = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- x:

  Numeric vector, representing the X coordinate for each vertex. Number
  in the interval \[-100000, 100000\].

- y:

  Numeric vector, representing the Y coordinate for each vertex. Number
  in the interval \[-100000, 100000\].

- z:

  Numeric vector, representing the Z coordinate for each vertex. Number
  in the interval \[-100000, 100000\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_lightposition` object (a named list).

## Details

These objects appear in 6 places in the plotly.js schema (properties
named `lightposition`), all with the same properties and rules.

## Examples

``` r
d <- expand.grid(x = 1:3, y = 1:3, z = 1:3)
d |>
  go_figure() |>
  add_cone(
    x = ~x,
    y = ~y,
    z = ~z,
    u = ~y,
    v = ~-x,
    w = ~z,
    lightposition = go_lightposition()
  )
```
