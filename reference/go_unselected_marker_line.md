# Unselected marker line objects

Used for `line` in 1 places in the schema. `go_unselected_marker_line()`
creates one; a named list with the same properties works too.

## Usage

``` r
go_unselected_marker_line(arg = NULL, ..., width = NULL, skip_invalid = FALSE)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- width:

  Sets the line width of unselected points, applied only when a
  selection exists. Number in the interval \[0, Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_unselected_marker_line` object (a named list).

## Details

These objects appear in 1 places in the plotly.js schema (properties
named `line`), all with the same properties and rules.

## Examples

``` r
d <- expand.grid(x = 1:5, y = 1:5)
d |>
  go_figure() |>
  add_quiver(
    x = ~x,
    y = ~y,
    u = ~y / 10,
    v = ~-x / 10,
    unselected = go_unselected(
      marker = go_unselected_marker(
        line = go_unselected_marker_line(width = 2)
      )
    )
  )
```
