# Unselected line objects

Used for `line` in 1 places in the schema. `go_unselected_line()`
creates one; a named list with the same properties works too.

## Usage

``` r
go_unselected_line(..., color = NULL, opacity = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- color:

  Sets the base color of unselected lines. in connection with
  \`unselected.line.opacity\`. Color: a CSS color string or R color
  name.

- opacity:

  Sets the opacity of unselected lines. The default "auto" decreases the
  opacity smoothly as the number of lines increases. Use 1 to achieve
  exact \`unselected.line.color\`. Number in the interval \[0, 1\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_unselected_line` object (a named list).

## Details

These objects appear in 1 places in the plotly.js schema (properties
named `line`), all with the same properties and rules.

## Examples

``` r
iris |>
  go_figure() |>
  add_parcoords(
    dimensions = list(
      go_parcoords_dimension(label = "Sepal.Length", values = ~Sepal.Length),
      go_parcoords_dimension(label = "Sepal.Width", values = ~Sepal.Width),
      go_parcoords_dimension(label = "Petal.Length", values = ~Petal.Length)
    ),
    unselected = go_unselected(line = go_unselected_line(color = "red"))
  )
```
