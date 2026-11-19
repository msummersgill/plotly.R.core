# Layout ternary objects

The object for the figure layout's `ternary` (and `ternary2`,
`ternary3`, ...: see
[`update_ternaries()`](https://msummersgill.github.io/plotly.R.core/reference/update_ternaries.md)).
`go_ternary()` creates one, with exactly its properties; a named list
with the same properties works too.

## Usage

``` r
go_ternary(
  ...,
  aaxis = NULL,
  baxis = NULL,
  bgcolor = NULL,
  caxis = NULL,
  domain = NULL,
  sum = NULL,
  uirevision = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- aaxis:

  A
  [`go_ternary_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_ternary_axis.md)
  object or named list, with properties `color`, `dtick`,
  `exponentformat`, `gridcolor`, `griddash`, `gridwidth`, `hoverformat`,
  `labelalias`, `layer`, `linecolor`, `linewidth`, `min` and 32 more
  (see
  [`go_ternary_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_ternary_axis.md)).

- baxis:

  A
  [`go_ternary_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_ternary_axis.md)
  object or named list, with properties `color`, `dtick`,
  `exponentformat`, `gridcolor`, `griddash`, `gridwidth`, `hoverformat`,
  `labelalias`, `layer`, `linecolor`, `linewidth`, `min` and 32 more
  (see
  [`go_ternary_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_ternary_axis.md)).

- bgcolor:

  Set the background color of the subplot Color: a CSS color string or R
  color name.

- caxis:

  A
  [`go_ternary_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_ternary_axis.md)
  object or named list, with properties `color`, `dtick`,
  `exponentformat`, `gridcolor`, `griddash`, `gridwidth`, `hoverformat`,
  `labelalias`, `layer`, `linecolor`, `linewidth`, `min` and 32 more
  (see
  [`go_ternary_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_ternary_axis.md)).

- domain:

  A
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)
  object or named list, with properties `column`, `row`, `x` and `y`
  (see
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)).

- sum:

  The number each triplet should sum to, and the maximum range of each
  axis Number in the interval \[0, Inf\].

- uirevision:

  Controls persistence of user-driven changes in axis \`min\` and
  \`title\`, if not overridden in the individual axes. Defaults to
  \`layout.uirevision\`. Any value.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_ternary` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
iris |>
  go_figure() |>
  add_scatterternary(
    a = ~Sepal.Length,
    b = ~Sepal.Width,
    c = ~Petal.Length
  ) |>
  update_layout(ternary = go_ternary(bgcolor = "lightyellow"))
```
