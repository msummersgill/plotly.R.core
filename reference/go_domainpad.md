# Domainpad objects

Sets the space in pixels to reserve inside the edges of \`domain\`.
Because \`domain\` is a fraction of the plot area, the gap between
subplots changes with the figure size. \`domainpad\` keeps the same size
in pixels at all figure sizes, so it can hold content with a fixed size,
such as a subplot title. x axes use \`left\` and \`right\`. y axes use
\`top\` and \`bottom\`. If the padding needs more room than the domain
has, the two pads shrink by the same factor, and the plot area keeps a
length of at least 2 pixels. An axis that sets \`overlaying\` ignores
its own \`domainpad\` and uses the \`domainpad\` of the axis it
overlays, so that both axes share the same plot area. Used for
`domainpad` in 2 places in the schema. `go_domainpad()` creates one; a
named list with the same properties works too.

## Usage

``` r
go_domainpad(
  ...,
  bottom = NULL,
  left = NULL,
  right = NULL,
  top = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- bottom:

  Sets the space in pixels to reserve inside the bottom edge of
  \`domain\`. Applies to y axes only. Number in the interval \[0, Inf\].

- left:

  Sets the space in pixels to reserve inside the left edge of
  \`domain\`. Applies to x axes only. Number in the interval \[0, Inf\].

- right:

  Sets the space in pixels to reserve inside the right edge of
  \`domain\`. Applies to x axes only. Number in the interval \[0, Inf\].

- top:

  Sets the space in pixels to reserve inside the top edge of \`domain\`.
  Applies to y axes only. Number in the interval \[0, Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_domainpad` object (a named list).

## Details

These objects appear in 2 places in the plotly.js schema (properties
named `domainpad`), all with the same properties and rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter(x = ~wt, y = ~mpg, mode = "markers") |>
  update_layout(xaxis = go_xaxis(domainpad = go_domainpad()))
```
