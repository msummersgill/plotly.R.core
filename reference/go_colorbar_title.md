# Colorbar title objects

Used for `title` in 37 places in the schema. `go_colorbar_title()`
creates one; a named list with the same properties works too.

## Usage

``` r
go_colorbar_title(
  ...,
  font = NULL,
  side = NULL,
  text = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- font:

  Sets this color bar's title font. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- side:

  Determines the location of color bar's title with respect to the color
  bar. Defaults to "top" when \`orientation\` is "v" and defaults to
  "right" when \`orientation\` is "h". One of `"right"`, `"top"`,
  `"bottom"`.

- text:

  Sets the title of the color bar. String.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_colorbar_title` object (a named list).

## Details

These objects appear in 37 places in the plotly.js schema (properties
named `title`), all with the same properties and rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_bar(
    x = ~factor(cyl),
    y = ~mpg,
    marker = go_bar_marker(
      colorbar = go_colorbar(title = go_colorbar_title(text = "title"))
    )
  )
```
