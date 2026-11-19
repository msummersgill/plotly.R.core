# Layout xaxis rangeslider objects

The object for the layout's `xaxis.rangeslider`
([`go_xaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis.md)).
`go_xaxis_rangeslider()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_xaxis_rangeslider(
  arg = NULL,
  ...,
  autorange = NULL,
  bgcolor = NULL,
  bordercolor = NULL,
  borderwidth = NULL,
  range = NULL,
  thickness = NULL,
  visible = NULL,
  yaxis = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- autorange:

  Determines whether or not the range slider range is computed in
  relation to the input data. If \`range\` is provided, then
  \`autorange\` is set to FALSE. Logical.

- bgcolor:

  Sets the background color of the range slider. Color: a CSS color
  string or R color name.

- bordercolor:

  Sets the border color of the range slider. Color: a CSS color string
  or R color name.

- borderwidth:

  Sets the border width of the range slider. Integer in the interval
  \[0, Inf\].

- range:

  Sets the range of the range slider. If not set, defaults to the full
  xaxis range. If the axis \`type\` is "log", then you must take the log
  of your desired range. If the axis \`type\` is "date", it should be
  date strings, like date data, though Date objects and unix
  milliseconds will be accepted and converted to strings. If the axis
  \`type\` is "category", it should be numbers, using the scale where
  each category is assigned a serial number from zero in the order it
  appears. Vector or list of 2 element(s).

- thickness:

  The height of the range slider as a fraction of the total plot area
  height. Number in the interval \[0, 1\].

- visible:

  Determines whether or not the range slider will be visible. If
  visible, perpendicular axes will be set to \`fixedrange\` Logical.

- yaxis:

  A
  [`go_xaxis_rangeslider_yaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis_rangeslider_yaxis.md)
  object or named list, with properties `range` and `rangemode` (see
  [`go_xaxis_rangeslider_yaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis_rangeslider_yaxis.md)).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_xaxis_rangeslider` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter(x = ~wt, y = ~mpg, mode = "markers") |>
  update_layout(
    xaxis = go_xaxis(rangeslider = go_xaxis_rangeslider(visible = TRUE))
  )
```
