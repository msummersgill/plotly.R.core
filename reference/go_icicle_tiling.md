# Icicle tiling objects

The object for the `tiling` of an icicle trace
([`go_icicle()`](https://msummersgill.github.io/plotly.R.core/reference/go_icicle.md)).
`go_icicle_tiling()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_icicle_tiling(
  arg = NULL,
  ...,
  flip = NULL,
  orientation = NULL,
  pad = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- flip:

  Determines if the positions obtained from solver are flipped on each
  axis. Any combination of `"x"`, `"y"` joined with `"+"`.

- orientation:

  When set in conjunction with \`tiling.flip\`, determines on which side
  the root nodes are drawn in the chart. If \`tiling.orientation\` is
  "v" and \`tiling.flip\` is \*", the root nodes appear at the top. If
  \`tiling.orientation\` is "v" and \`tiling.flip\` is "y", the root
  nodes appear at the bottom. If \`tiling.orientation\` is "h" and
  \`tiling.flip\` is "\*, the root nodes appear at the left. If
  \`tiling.orientation\` is "h" and \`tiling.flip\` is "x", the root
  nodes appear at the right. One of `"v"`, `"h"`.

- pad:

  Sets the inner padding (in px). Number in the interval \[0, Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_icicle_tiling` object (a named list).

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
  add_icicle(
    labels = ~labels,
    parents = ~parents,
    values = ~values,
    tiling = go_icicle_tiling()
  )
```
