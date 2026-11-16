# Send numeric data to the browser in single precision

Marks a numeric vector or matrix to be sent to plotly.js as a float32
typed array: 4 bytes per value instead of 8, halving the size of the
widget's data and of plotly.js's copy of it. Use it in trace properties,
or on data frame columns used by
[`px_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/px_scatter.md)
and the other `px_*()` functions. Set
`options(plotly.core.float32 = TRUE)` to send all numeric arrays in
single precision.

## Usage

``` r
as_float32(x)
```

## Arguments

- x:

  A numeric vector or matrix.

## Value

`x`, marked with class `plotly_float32`.

## Details

Single precision keeps about 7 significant digits: values shown in hover
labels and returned by
[`event_data()`](https://msummersgill.github.io/plotly.R.core/reference/event_data.md)
change (`0.1` becomes `0.100000001490116`), whole numbers above 2^24
(16,777,216) aren't exact and numeric times in seconds since 1970 are
only accurate to minutes. Vectors of whole numbers (in the 32-bit
integer range) are always sent as integers without loss, and date-times
as text, so neither is affected. WebGL traces (e.g.
[`go_scattergl()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattergl.md))
draw in single precision anyway.

## Examples

``` r
n <- 1e4
data.frame(x = rnorm(n), y = rnorm(n)) |>
  go_figure() |>
  add_scattergl(x = ~as_float32(x), y = ~as_float32(y), mode = "markers")
```
