# Project objects

Used for `project` in 3 places in the schema. `go_project()` creates
one; a named list with the same properties works too.

## Usage

``` r
go_project(..., x = NULL, y = NULL, z = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- x:

  Determines whether or not these contour lines are projected on the x
  plane. If \`highlight\` is set to TRUE (the default), the projected
  lines are shown on hover. If \`show\` is set to TRUE, the projected
  lines are shown in permanence. Logical.

- y:

  Determines whether or not these contour lines are projected on the y
  plane. If \`highlight\` is set to TRUE (the default), the projected
  lines are shown on hover. If \`show\` is set to TRUE, the projected
  lines are shown in permanence. Logical.

- z:

  Determines whether or not these contour lines are projected on the z
  plane. If \`highlight\` is set to TRUE (the default), the projected
  lines are shown on hover. If \`show\` is set to TRUE, the projected
  lines are shown in permanence. Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_project` object (a named list).

## Details

These objects appear in 3 places in the plotly.js schema (properties
named `project`), all with the same properties and rules.

## Examples

``` r
go_figure() |>
  add_surface(
    z = volcano,
    contours = go_surface_contours(
      x = go_surface_contours_axis(project = go_project())
    )
  )
```
