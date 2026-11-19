# Funnel connector objects

The object for the `connector` of a funnel trace
([`go_funnel()`](https://msummersgill.github.io/plotly.R.core/reference/go_funnel.md)).
`go_funnel_connector()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_funnel_connector(
  ...,
  fillcolor = NULL,
  line = NULL,
  visible = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- fillcolor:

  Sets the fill color. Color: a CSS color string or R color name.

- line:

  A
  [`go_funnel_connector_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_funnel_connector_line.md)
  object or named list, with properties `color`, `dash` and `width` (see
  [`go_funnel_connector_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_funnel_connector_line.md)).

- visible:

  Determines if connector regions and lines are drawn. Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_funnel_connector` object (a named list).

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
  add_funnel(
    x = ~factor(cyl),
    y = ~mpg,
    connector = go_funnel_connector(visible = TRUE)
  )
```
