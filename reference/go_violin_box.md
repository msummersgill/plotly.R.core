# Violin box objects

The object for the `box` of a violin trace
([`go_violin()`](https://msummersgill.github.io/plotly.R.core/reference/go_violin.md)).
`go_violin_box()` creates one, with exactly its properties; a named list
with the same properties works too.

## Usage

``` r
go_violin_box(
  ...,
  fillcolor = NULL,
  line = NULL,
  visible = NULL,
  width = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- fillcolor:

  Sets the inner box plot fill color. Color: a CSS color string or R
  color name.

- line:

  A
  [`go_violin_box_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_violin_box_line.md)
  object or named list, with properties `color` and `width` (see
  [`go_violin_box_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_violin_box_line.md)).

- visible:

  Determines if an miniature box plot is drawn inside the violins.
  Logical.

- width:

  Sets the width of the inner box plots relative to the violins' width.
  For example, with 1, the inner box plots are as wide as the violins.
  Number in the interval \[0, 1\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_violin_box` object (a named list).

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
    box = go_violin_box(width = 0.5)
  )
```
