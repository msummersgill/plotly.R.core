# Layout smith objects

The object for the figure layout's `smith` (and `smith2`, `smith3`, ...:
see
[`update_smiths()`](https://msummersgill.github.io/plotly.R.core/reference/update_smiths.md)).
`go_smith()` creates one, with exactly its properties; a named list with
the same properties works too.

## Usage

``` r
go_smith(
  ...,
  bgcolor = NULL,
  domain = NULL,
  imaginaryaxis = NULL,
  realaxis = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- bgcolor:

  Set the background color of the subplot Color: a CSS color string or R
  color name.

- domain:

  A
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)
  object or named list, with properties `column`, `row`, `x` and `y`
  (see
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)).

- imaginaryaxis:

  A
  [`go_smith_imaginaryaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_smith_imaginaryaxis.md)
  object or named list, with properties `color`, `gridcolor`,
  `griddash`, `gridwidth`, `hoverformat`, `labelalias`, `layer`,
  `linecolor`, `linewidth`, `showgrid`, `showline`, `showticklabels` and
  12 more (see
  [`go_smith_imaginaryaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_smith_imaginaryaxis.md)).

- realaxis:

  A
  [`go_smith_realaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_smith_realaxis.md)
  object or named list, with properties `color`, `gridcolor`,
  `griddash`, `gridwidth`, `hoverformat`, `labelalias`, `layer`,
  `linecolor`, `linewidth`, `showgrid`, `showline`, `showticklabels` and
  14 more (see
  [`go_smith_realaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_smith_realaxis.md)).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_smith` object (a named list).

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
  add_scattersmith(real = ~wt, imag = ~drat) |>
  update_layout(smith = go_smith(bgcolor = "lightyellow"))
```
