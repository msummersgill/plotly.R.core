# Ternary axis title objects

Used for `title` in 3 places in the schema. `go_ternary_axis_title()`
creates one; a named list with the same properties works too.

## Usage

``` r
go_ternary_axis_title(
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

A `go_ternary_axis_title` object (a named list).

## Details

These objects appear in 3 places in the plotly.js schema (properties
named `title`), all with the same properties and rules.

## Examples

``` r
iris |>
  go_figure() |>
  add_scatterternary(
    a = ~Sepal.Length,
    b = ~Sepal.Width,
    c = ~Petal.Length
  ) |>
  update_layout(
    ternary = go_ternary(
      aaxis = go_ternary_axis(
        title = go_ternary_axis_title(text = "title")
      )
    )
  )
```
