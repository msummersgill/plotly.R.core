# Pie marker line objects

The object for the `marker.line` of a pie trace
([`go_pie_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_pie_marker.md)).
`go_pie_marker_line()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_pie_marker_line(
  arg = NULL,
  ...,
  color = NULL,
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

  Sets the color of the line enclosing each sector. Color: a CSS color
  string or R color name, or a vector of these.

- width:

  Sets the width (in px) of the line enclosing each sector. Number in
  the interval \[0, Inf\], or a vector of these.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_pie_marker_line` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
d <- as.data.frame(table(cylinders = mtcars$cyl))
d |>
  go_figure() |>
  add_pie(
    labels = ~cylinders,
    values = ~Freq,
    marker = go_pie_marker(line = go_pie_marker_line(color = "red"))
  )
```
