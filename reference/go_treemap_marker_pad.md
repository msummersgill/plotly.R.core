# Treemap marker pad objects

The object for the `marker.pad` of a treemap trace
([`go_treemap_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_treemap_marker.md)).
`go_treemap_marker_pad()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_treemap_marker_pad(
  arg = NULL,
  ...,
  b = NULL,
  l = NULL,
  r = NULL,
  t = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- b:

  Sets the padding form the bottom (in px). Number in the interval \[0,
  Inf\].

- l:

  Sets the padding form the left (in px). Number in the interval \[0,
  Inf\].

- r:

  Sets the padding form the right (in px). Number in the interval \[0,
  Inf\].

- t:

  Sets the padding form the top (in px). Number in the interval \[0,
  Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_treemap_marker_pad` object (a named list).

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
  add_treemap(
    labels = ~labels,
    parents = ~parents,
    values = ~values,
    marker = go_treemap_marker(pad = go_treemap_marker_pad())
  )
```
