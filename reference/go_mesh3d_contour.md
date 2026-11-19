# Mesh3d contour objects

The object for the `contour` of a mesh3d trace
([`go_mesh3d()`](https://msummersgill.github.io/plotly.R.core/reference/go_mesh3d.md)).
`go_mesh3d_contour()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_mesh3d_contour(
  arg = NULL,
  ...,
  color = NULL,
  show = NULL,
  width = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- color:

  Sets the color of the contour lines. Color: a CSS color string or R
  color name.

- show:

  Sets whether or not dynamic contours are shown on hover Logical.

- width:

  Sets the width of the contour lines. Number in the interval \[1, 16\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_mesh3d_contour` object (a named list).

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
  add_mesh3d(
    x = ~wt,
    y = ~hp,
    z = ~mpg,
    contour = go_mesh3d_contour(color = "red")
  )
```
