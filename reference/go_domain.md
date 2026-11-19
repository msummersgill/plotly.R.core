# Domain objects

Used for `domain` in 17 places in the schema. `go_domain()` creates one;
a named list with the same properties works too.

## Usage

``` r
go_domain(
  ...,
  column = NULL,
  row = NULL,
  x = NULL,
  y = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- column:

  If there is a layout grid, use the domain for this column in the grid
  for this funnelarea trace. Integer in the interval \[0, Inf\]. Not
  available in every context.

- row:

  If there is a layout grid, use the domain for this row in the grid for
  this funnelarea trace. Integer in the interval \[0, Inf\]. Not
  available in every context.

- x:

  Sets the horizontal domain of this funnelarea trace (in plot
  fraction). Vector or list of 2 element(s).

- y:

  Sets the vertical domain of this funnelarea trace (in plot fraction).
  Vector or list of 2 element(s).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_domain` object (a named list).

## Details

These objects appear in 17 places in the plotly.js schema (properties
named `domain`), with small differences between them: for example, not
every context has every property below. `go_domain()` checks the values
against the contexts it can be used in; when the object is placed in a
figure it is checked again against that context's rules.

## Examples

``` r
d <- as.data.frame(table(cylinders = mtcars$cyl))
d |>
  go_figure() |>
  add_pie(labels = ~cylinders, values = ~Freq, domain = go_domain())
```
