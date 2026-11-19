# Lightposition objects

Used for `lightposition` in 6 places in the schema. `go_lightposition()`
creates one; a named list with the same properties works too.

## Usage

``` r
go_lightposition(
  arg = NULL,
  ...,
  x = NULL,
  y = NULL,
  z = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

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
