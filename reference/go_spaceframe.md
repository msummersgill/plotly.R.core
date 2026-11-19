# Spaceframe objects

Used for `spaceframe` in 2 places in the schema. `go_spaceframe()`
creates one; a named list with the same properties works too.

## Usage

``` r
go_spaceframe(arg = NULL, ..., fill = NULL, show = NULL, skip_invalid = FALSE)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- fill:

  Sets the fill ratio of the \`spaceframe\` elements. The default fill
  value is 0.15 meaning that only 15% of the area of every faces of
  tetras would be shaded. Applying a greater \`fill\` ratio would allow
  the creation of stronger elements or could be sued to have entirely
  closed areas (in case of using 1). Number in the interval \[0, 1\].

- show:

  Displays/hides tetrahedron shapes between minimum and maximum
  iso-values. Often useful when either caps or surfaces are disabled or
  filled with values less than 1. Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_spaceframe` object (a named list).

## Details

These objects appear in 2 places in the plotly.js schema (properties
named `spaceframe`), all with the same properties and rules.

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
    spaceframe = go_spaceframe(show = TRUE)
  )
```
