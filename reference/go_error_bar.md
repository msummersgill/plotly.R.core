# Error bar objects

Used for `error_x`, `error_y`, `error_z` in 11 places in the schema.
`go_error_bar()` creates one; a named list with the same properties
works too.

## Usage

``` r
go_error_bar(
  ...,
  array = NULL,
  arrayminus = NULL,
  color = NULL,
  copy_ystyle = NULL,
  copy_zstyle = NULL,
  symmetric = NULL,
  thickness = NULL,
  traceref = NULL,
  tracerefminus = NULL,
  type = NULL,
  value = NULL,
  valueminus = NULL,
  visible = NULL,
  width = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- array:

  Sets the data corresponding the length of each error bar. Values are
  plotted relative to the underlying data. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

- arrayminus:

  Sets the data corresponding the length of each error bar in the bottom
  (left) direction for vertical (horizontal) bars Values are plotted
  relative to the underlying data. Data array: a vector, factor,
  Date/POSIXct vector, matrix or list.

- color:

  Sets the stroke color of the error bars. Color: a CSS color string or
  R color name.

- copy_ystyle:

  Logical. Not available in every context.

- copy_zstyle:

  Logical. Not available in every context.

- symmetric:

  Determines whether or not the error bars have the same length in both
  direction (top/bottom for vertical bars, left/right for horizontal
  bars. Logical.

- thickness:

  Sets the thickness (in px) of the error bars. Number in the interval
  \[0, Inf\].

- traceref:

  Integer in the interval \[0, Inf\].

- tracerefminus:

  Integer in the interval \[0, Inf\].

- type:

  Determines the rule used to generate the error bars. If "constant",
  the bar lengths are of a constant value. Set this constant in
  \`value\`. If "percent", the bar lengths correspond to a percentage of
  underlying data. Set this percentage in \`value\`. If "sqrt", the bar
  lengths correspond to the square of the underlying data. If "data",
  the bar lengths are set with data set \`array\`. One of `"percent"`,
  `"constant"`, `"sqrt"`, `"data"`.

- value:

  Sets the value of either the percentage (if \`type\` is set to
  "percent") or the constant (if \`type\` is set to "constant")
  corresponding to the lengths of the error bars. Number in the interval
  \[0, Inf\].

- valueminus:

  Sets the value of either the percentage (if \`type\` is set to
  "percent") or the constant (if \`type\` is set to "constant")
  corresponding to the lengths of the error bars in the bottom (left)
  direction for vertical (horizontal) bars Number in the interval \[0,
  Inf\].

- visible:

  Determines whether or not this set of error bars is visible. Logical.

- width:

  Sets the width (in px) of the cross-bar at both ends of the error
  bars. Number in the interval \[0, Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_error_bar` object (a named list).

## Details

These objects appear in 11 places in the plotly.js schema (properties
named `error_x`, `error_y`, `error_z`), with small differences between
them: for example, not every context has every property below.
`go_error_bar()` checks the values against the contexts it can be used
in; when the object is placed in a figure it is checked again against
that context's rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter(
    x = ~wt,
    y = ~mpg,
    mode = "markers",
    error_x = go_error_bar(color = "red")
  )
```
