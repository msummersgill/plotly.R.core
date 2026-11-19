# Sunburst marker line objects

The object for the `marker.line` of a sunburst trace
([`go_sunburst_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_sunburst_marker.md)).
`go_sunburst_marker_line()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_sunburst_marker_line(..., color = NULL, width = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- color:

  Sets the color of the line enclosing each sector. Defaults to the
  \`paper_bgcolor\` value. Color: a CSS color string or R color name, or
  a vector of these.

- width:

  Sets the width (in px) of the line enclosing each sector. Number in
  the interval \[0, Inf\], or a vector of these.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_sunburst_marker_line` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
cyl <- table(paste(mtcars$cyl, "cylinders"))
d <- data.frame(
  labels = c("all cars", names(cyl)),
  parents = c("", rep("all cars", length(cyl))),
  values = c(0, as.vector(cyl))
)
d |>
  go_figure() |>
  add_sunburst(
    labels = ~labels,
    parents = ~parents,
    values = ~values,
    marker = go_sunburst_marker(
      line = go_sunburst_marker_line(color = "red")
    )
  )
```
