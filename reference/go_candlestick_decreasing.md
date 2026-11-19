# Candlestick decreasing objects

The object for the `decreasing` of a candlestick trace
([`go_candlestick()`](https://msummersgill.github.io/plotly.R.core/reference/go_candlestick.md)).
`go_candlestick_decreasing()` creates one, with exactly its properties;
a named list with the same properties works too.

## Usage

``` r
go_candlestick_decreasing(
  arg = NULL,
  ...,
  fillcolor = NULL,
  line = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- fillcolor:

  Sets the fill color. Defaults to a half-transparent variant of the
  line color, marker color, or marker line color, whichever is
  available. Color: a CSS color string or R color name.

- line:

  A
  [`go_candlestick_decreasing_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_candlestick_decreasing_line.md)
  object or named list, with properties `color` and `width` (see
  [`go_candlestick_decreasing_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_candlestick_decreasing_line.md)).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_candlestick_decreasing` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
d <- data.frame(day = 1:30, close = EuStockMarkets[1:30, "DAX"])
d$open <- c(d$close[1], head(d$close, -1))
d$high <- pmax(d$open, d$close) + 5
d$low <- pmin(d$open, d$close) - 5
d |>
  go_figure() |>
  add_candlestick(
    x = ~day,
    open = ~open,
    high = ~high,
    low = ~low,
    close = ~close,
    decreasing = go_candlestick_decreasing()
  )
```
