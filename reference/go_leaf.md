# Leaf objects

Used for `leaf` in 2 places in the schema. `go_leaf()` creates one; a
named list with the same properties works too.

## Usage

``` r
go_leaf(arg = NULL, ..., opacity = NULL, skip_invalid = FALSE)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- opacity:

  Sets the opacity of the leaves. With colorscale it is defaulted to 1;
  otherwise it is defaulted to 0.7 Number in the interval \[0, 1\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_leaf` object (a named list).

## Details

These objects appear in 2 places in the plotly.js schema (properties
named `leaf`), all with the same properties and rules.

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
    leaf = go_leaf(opacity = 0.5)
  )
```
