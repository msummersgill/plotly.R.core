# Waterfall connector objects

The object for the `connector` of a waterfall trace
([`go_waterfall()`](https://msummersgill.github.io/plotly.R.core/reference/go_waterfall.md)).
`go_waterfall_connector()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_waterfall_connector(
  ...,
  line = NULL,
  mode = NULL,
  visible = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- line:

  A
  [`go_waterfall_connector_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_waterfall_connector_line.md)
  object or named list, with properties `color`, `dash` and `width` (see
  [`go_waterfall_connector_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_waterfall_connector_line.md)).

- mode:

  Sets the shape of connector lines. One of `"spanning"`, `"between"`.

- visible:

  Determines if connector lines are drawn. Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_waterfall_connector` object (a named list).

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
  add_waterfall(
    x = ~factor(cyl),
    y = ~mpg,
    connector = go_waterfall_connector(visible = TRUE)
  )
```
