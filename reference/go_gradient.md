# Gradient objects

Used for `gradient` in 6 places in the schema. `go_gradient()` creates
one; a named list with the same properties works too.

## Usage

``` r
go_gradient(..., color = NULL, type = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- color:

  Sets the final color of the gradient fill: the center color for
  radial, the right for horizontal, or the bottom for vertical. Color: a
  CSS color string or R color name, or a vector of these.

- type:

  Sets the type of gradient used to fill the markers One of `"radial"`,
  `"horizontal"`, `"vertical"`, `"none"`, or a vector of these.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_gradient` object (a named list).

## Details

These objects appear in 6 places in the plotly.js schema (properties
named `gradient`), all with the same properties and rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter(
    x = ~wt,
    y = ~mpg,
    mode = "markers",
    marker = go_scatter_marker(gradient = go_gradient(color = "red"))
  )
```
