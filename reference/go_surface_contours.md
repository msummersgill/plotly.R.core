# Surface contours objects

The object for the `contours` of a surface trace
([`go_surface()`](https://msummersgill.github.io/plotly.R.core/reference/go_surface.md)).
`go_surface_contours()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_surface_contours(..., x = NULL, y = NULL, z = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- x:

  A
  [`go_surface_contours_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_surface_contours_axis.md)
  object or named list, with properties `color`, `end`, `highlight`,
  `highlightcolor`, `highlightwidth`, `project`, `show`, `size`,
  `start`, `usecolormap` and `width` (see
  [`go_surface_contours_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_surface_contours_axis.md)).

- y:

  A
  [`go_surface_contours_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_surface_contours_axis.md)
  object or named list, with properties `color`, `end`, `highlight`,
  `highlightcolor`, `highlightwidth`, `project`, `show`, `size`,
  `start`, `usecolormap` and `width` (see
  [`go_surface_contours_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_surface_contours_axis.md)).

- z:

  A
  [`go_surface_contours_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_surface_contours_axis.md)
  object or named list, with properties `color`, `end`, `highlight`,
  `highlightcolor`, `highlightwidth`, `project`, `show`, `size`,
  `start`, `usecolormap` and `width` (see
  [`go_surface_contours_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_surface_contours_axis.md)).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_surface_contours` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
go_figure() |>
  add_surface(z = volcano, contours = go_surface_contours())
```
