# Violin line objects

The object for the `line` of a violin trace
([`go_violin()`](https://msummersgill.github.io/plotly.R.core/reference/go_violin.md)).
`go_violin_line()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_violin_line(..., color = NULL, width = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- color:

  Sets the color of line bounding the violin(s). Color: a CSS color
  string or R color name.

- width:

  Sets the width (in px) of line bounding the violin(s). Number in the
  interval \[0, Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_violin_line` object (a named list).

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
  add_violin(
    x = ~factor(cyl),
    y = ~mpg,
    line = go_violin_line(color = "red")
  )
```
