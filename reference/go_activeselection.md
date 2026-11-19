# Layout activeselection objects

The object for the figure layout's `activeselection`.
`go_activeselection()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_activeselection(..., fillcolor = NULL, opacity = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- fillcolor:

  Sets the color filling the active selection' interior. Color: a CSS
  color string or R color name.

- opacity:

  Sets the opacity of the active selection. Number in the interval \[0,
  1\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_activeselection` object (a named list).

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
  add_scatter(x = ~wt, y = ~mpg, mode = "markers") |>
  update_layout(activeselection = go_activeselection(opacity = 0.5))
```
