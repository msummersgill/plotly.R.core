# Ohlc line objects

The object for the `line` of an ohlc trace
([`go_ohlc()`](https://msummersgill.github.io/plotly.R.core/reference/go_ohlc.md)).
`go_ohlc_line()` creates one, with exactly its properties; a named list
with the same properties works too.

## Usage

``` r
go_ohlc_line(arg = NULL, ..., dash = NULL, width = NULL, skip_invalid = FALSE)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- dash:

  Sets the dash style of lines. Set to a dash type string ("solid",
  "dot", "dash", "longdash", "dashdot", or "longdashdot") or a dash
  length list in px (eg "5px,10px,2px,2px"). Note that this style
  setting can also be set per direction via \`increasing.line.dash\` and
  \`decreasing.line.dash\`. One of `"solid"`, `"dot"`, `"dash"`,
  `"longdash"`, `"dashdot"`, `"longdashdot"`, or a string matching
  `"^\\d+(\\.\\d+)?(px|%)?((,|\\s)\\s*\\d+(\\.\\d+)?(px|%)?)*$"`.

- width:

  Sets the line width (in px). Note that this style setting can also be
  set per direction via \`increasing.line.width\` and
  \`decreasing.line.width\`. Number in the interval \[0, Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_ohlc_line` object (a named list).

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
  add_ohlc(
    x = ~day,
    open = ~open,
    high = ~high,
    low = ~low,
    close = ~close,
    line = go_ohlc_line(width = 2)
  )
```
