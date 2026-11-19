# Treemap tiling objects

The object for the `tiling` of a treemap trace
([`go_treemap()`](https://msummersgill.github.io/plotly.R.core/reference/go_treemap.md)).
`go_treemap_tiling()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_treemap_tiling(
  arg = NULL,
  ...,
  flip = NULL,
  packing = NULL,
  pad = NULL,
  squarifyratio = NULL,
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

- packing:

  Determines d3 treemap solver. For more info please refer to
  https://github.com/d3/d3-hierarchy#treemap-tiling One of `"squarify"`,
  `"binary"`, `"dice"`, `"slice"`, `"slice-dice"`, `"dice-slice"`.

- pad:

  Sets the inner padding (in px). Number in the interval \[0, Inf\].

- squarifyratio:

  When using "squarify" \`packing\` algorithm, according to
  https://github.com/d3/d3-hierarchy/blob/v3.1.1/README.md#squarify_ratio
  this option specifies the desired aspect ratio of the generated
  rectangles. The ratio must be specified as a number greater than or
  equal to one. Note that the orientation of the generated rectangles
  (tall or wide) is not implied by the ratio; for example, a ratio of
  two will attempt to produce a mixture of rectangles whose width:height
  ratio is either 2:1 or 1:2. When using "squarify", unlike d3 which
  uses the Golden Ratio i.e. 1.618034, Plotly applies 1 to increase
  squares in treemap layouts. Number in the interval \[1, Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_treemap_tiling` object (a named list).

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
    tiling = go_treemap_tiling()
  )
```
