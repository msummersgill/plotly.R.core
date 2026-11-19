# Scene axis title objects

Used for `title` in 3 places in the schema. `go_scene_axis_title()`
creates one; a named list with the same properties works too.

## Usage

``` r
go_scene_axis_title(..., font = NULL, text = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- font:

  Sets this axis' title font. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- text:

  Sets the title of this axis. String.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_scene_axis_title` object (a named list).

## Details

These objects appear in 3 places in the plotly.js schema (properties
named `title`), all with the same properties and rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter3d(x = ~wt, y = ~hp, z = ~mpg) |>
  update_layout(
    scene = go_scene(
      xaxis = go_scene_axis(title = go_scene_axis_title(text = "title"))
    )
  )
```
