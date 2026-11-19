# Root objects

Used for `root` in 3 places in the schema. `go_root()` creates one; a
named list with the same properties works too.

## Usage

``` r
go_root(arg = NULL, ..., color = NULL, skip_invalid = FALSE)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- color:

  sets the color of the root node for a sunburst/treemap/icicle trace.
  this has no effect when a colorscale is used to set the markers.
  Color: a CSS color string or R color name.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_root` object (a named list).

## Details

These objects appear in 3 places in the plotly.js schema (properties
named `root`), all with the same properties and rules.

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
    root = go_root(color = "red")
  )
```
