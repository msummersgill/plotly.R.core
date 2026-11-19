# Legendgrouptitle objects

Used for `legendgrouptitle` in 49 places in the schema.
`go_legendgrouptitle()` creates one; a named list with the same
properties works too.

## Usage

``` r
go_legendgrouptitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- font:

  Sets this legend group's title font. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- text:

  Sets the title of the legend group. String.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_legendgrouptitle` object (a named list).

## Details

These objects appear in 49 places in the plotly.js schema (properties
named `legendgrouptitle`), all with the same properties and rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter(
    x = ~wt,
    y = ~mpg,
    mode = "markers",
    legendgrouptitle = go_legendgrouptitle(text = "title")
  )
```
