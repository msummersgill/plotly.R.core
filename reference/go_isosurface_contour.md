# Isosurface contour objects

The object for the `contour` of an isosurface trace
([`go_isosurface()`](https://msummersgill.github.io/plotly.R.core/reference/go_isosurface.md)).
`go_isosurface_contour()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_isosurface_contour(
  ...,
  color = NULL,
  show = NULL,
  width = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

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

A `go_isosurface_contour` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
d <- expand.grid(x = 1:5, y = 1:5, z = 1:5)
d |>
  go_figure() |>
  add_isosurface(
    x = ~x,
    y = ~y,
    z = ~z,
    value = ~x * y * z,
    isomin = 10,
    isomax = 50,
    contour = go_isosurface_contour(color = "red")
  )
```
