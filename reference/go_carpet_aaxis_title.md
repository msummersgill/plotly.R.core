# Carpet aaxis title objects

The object for the `aaxis.title` of a carpet trace
([`go_carpet_aaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_carpet_aaxis.md)).
`go_carpet_aaxis_title()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_carpet_aaxis_title(
  ...,
  font = NULL,
  offset = NULL,
  text = NULL,
  skip_invalid = FALSE
)
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

- offset:

  An additional amount by which to offset the title from the tick
  labels, given in pixels. Number.

- text:

  Sets the title of this axis. String.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_carpet_aaxis_title` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
d <- expand.grid(a = c(4, 5, 6), b = c(1, 2, 3))
d$y <- d$a * d$b
d |>
  go_figure() |>
  add_carpet(
    a = ~a,
    b = ~b,
    y = ~y,
    aaxis = go_carpet_aaxis(
      title = go_carpet_aaxis_title(text = "title")
    )
  )
```
