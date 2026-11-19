# Histogram cumulative objects

The object for the `cumulative` of a histogram trace
([`go_histogram()`](https://msummersgill.github.io/plotly.R.core/reference/go_histogram.md)).
`go_histogram_cumulative()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_histogram_cumulative(
  arg = NULL,
  ...,
  currentbin = NULL,
  direction = NULL,
  enabled = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- currentbin:

  Only applies if cumulative is enabled. Sets whether the current bin is
  included, excluded, or has half of its value included in the current
  cumulative value. "include" is the default for compatibility with
  various other tools, however it introduces a half-bin bias to the
  results. "exclude" makes the opposite half-bin bias, and "half"
  removes it. One of `"include"`, `"exclude"`, `"half"`.

- direction:

  Only applies if cumulative is enabled. If "increasing" (default) we
  sum all prior bins, so the result increases from left to right. If
  "decreasing" we sum later bins so the result decreases from left to
  right. One of `"increasing"`, `"decreasing"`.

- enabled:

  If true, display the cumulative distribution by summing the binned
  values. Use the \`direction\` and \`centralbin\` attributes to tune
  the accumulation method. Note: in this mode, the "density"
  \`histnorm\` settings behave the same as their equivalents without
  "density": \*" and "density" both rise to the number of data points,
  and "probability" and "probability density\* both rise to the number
  of sample points. Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_histogram_cumulative` object (a named list).

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
  add_histogram(x = ~mpg, cumulative = go_histogram_cumulative())
```
