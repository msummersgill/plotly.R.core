# Scatter3d projection objects

The object for the `projection` of a scatter3d trace
([`go_scatter3d()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter3d.md)).
`go_scatter3d_projection()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_scatter3d_projection(
  arg = NULL,
  ...,
  x = NULL,
  y = NULL,
  z = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- x:

  A
  [`go_scatter3d_projection_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter3d_projection_axis.md)
  object or named list, with properties `opacity`, `scale` and `show`
  (see
  [`go_scatter3d_projection_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter3d_projection_axis.md)).

- y:

  A
  [`go_scatter3d_projection_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter3d_projection_axis.md)
  object or named list, with properties `opacity`, `scale` and `show`
  (see
  [`go_scatter3d_projection_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter3d_projection_axis.md)).

- z:

  A
  [`go_scatter3d_projection_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter3d_projection_axis.md)
  object or named list, with properties `opacity`, `scale` and `show`
  (see
  [`go_scatter3d_projection_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter3d_projection_axis.md)).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_scatter3d_projection` object (a named list).

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
  add_scatter3d(
    x = ~wt,
    y = ~hp,
    z = ~mpg,
    projection = go_scatter3d_projection()
  )
```
