# Caps axis objects

Used for `x`, `y`, `z` in 6 places in the schema. `go_caps_axis()`
creates one; a named list with the same properties works too.

## Usage

``` r
go_caps_axis(arg = NULL, ..., fill = NULL, show = NULL, skip_invalid = FALSE)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- fill:

  Sets the fill ratio of the \`caps\`. The default fill value of the
  \`caps\` is 1 meaning that they are entirely shaded. On the other hand
  Applying a \`fill\` ratio less than one would allow the creation of
  openings parallel to the edges. Number in the interval \[0, 1\].

- show:

  Sets the fill ratio of the \`slices\`. The default fill value of the x
  \`slices\` is 1 meaning that they are entirely shaded. On the other
  hand Applying a \`fill\` ratio less than one would allow the creation
  of openings parallel to the edges. Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_caps_axis` object (a named list).

## Details

These objects appear in 6 places in the plotly.js schema (properties
named `x`, `y`, `z`), all with the same properties and rules.

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
    caps = go_caps(x = go_caps_axis(show = TRUE))
  )
```
