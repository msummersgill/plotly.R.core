# Funnelarea title objects

The object for the `title` of a funnelarea trace
([`go_funnelarea()`](https://msummersgill.github.io/plotly.R.core/reference/go_funnelarea.md)).
`go_funnelarea_title()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_funnelarea_title(
  arg = NULL,
  ...,
  font = NULL,
  position = NULL,
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

  Sets the font used for \`title\`. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- position:

  Specifies the location of the \`title\`. One of `"top left"`,
  `"top center"`, `"top right"`.

- text:

  Sets the title of the chart. If it is empty, no title is displayed.
  String.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_funnelarea_title` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
d <- as.data.frame(table(cylinders = mtcars$cyl))
d |>
  go_figure() |>
  add_funnelarea(
    labels = ~cylinders,
    values = ~Freq,
    title = go_funnelarea_title(text = "title")
  )
```
