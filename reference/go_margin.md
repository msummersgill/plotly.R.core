# Layout margin objects

The object for the figure layout's `margin`. `go_margin()` creates one,
with exactly its properties; a named list with the same properties works
too.

## Usage

``` r
go_margin(
  ...,
  autoexpand = NULL,
  b = NULL,
  l = NULL,
  pad = NULL,
  r = NULL,
  t = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- autoexpand:

  Turns on/off margin expansion computations. Legends, colorbars,
  updatemenus, sliders, axis rangeselector and rangeslider are allowed
  to push the margins by defaults. Logical.

- b:

  Sets the bottom margin (in px). Number in the interval \[0, Inf\].

- l:

  Sets the left margin (in px). Number in the interval \[0, Inf\].

- pad:

  Sets the amount of padding (in px) between the plotting area and the
  axis lines Number in the interval \[0, Inf\].

- r:

  Sets the right margin (in px). Number in the interval \[0, Inf\].

- t:

  Sets the top margin (in px). Number in the interval \[0, Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_margin` object (a named list).

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
  update_layout(margin = go_margin())
```
