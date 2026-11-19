# Scatter3d projection axis objects

Used for `x`, `y`, `z` in 3 places in the schema.
`go_scatter3d_projection_axis()` creates one; a named list with the same
properties works too.

## Usage

``` r
go_scatter3d_projection_axis(
  arg = NULL,
  ...,
  opacity = NULL,
  scale = NULL,
  show = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- opacity:

  Sets the projection color. Number in the interval \[0, 1\].

- scale:

  Sets the scale factor determining the size of the projection marker
  points. Number in the interval \[0, 10\].

- show:

  Sets whether or not projections are shown along the x axis. Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_scatter3d_projection_axis` object (a named list).

## Details

These objects appear in 3 places in the plotly.js schema (properties
named `x`, `y`, `z`), all with the same properties and rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter3d(
    x = ~wt,
    y = ~hp,
    z = ~mpg,
    projection = go_scatter3d_projection(
      x = go_scatter3d_projection_axis(opacity = 0.5)
    )
  )
```
