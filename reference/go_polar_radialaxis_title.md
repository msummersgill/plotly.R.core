# Layout polar radialaxis title objects

The object for the layout's `polar.radialaxis.title`
([`go_polar_radialaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_polar_radialaxis.md)).
`go_polar_radialaxis_title()` creates one, with exactly its properties;
a named list with the same properties works too.

## Usage

``` r
go_polar_radialaxis_title(
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

A `go_layout_polar_radialaxis_title` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatterpolar(r = ~mpg, theta = ~hp) |>
  update_layout(
    polar = go_polar(
      radialaxis = go_polar_radialaxis(
        title = go_polar_radialaxis_title(text = "title")
      )
    )
  )
```
