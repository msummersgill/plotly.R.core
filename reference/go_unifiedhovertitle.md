# Unifiedhovertitle objects

Used for `unifiedhovertitle` in 2 places in the schema.
`go_unifiedhovertitle()` creates one; a named list with the same
properties works too.

## Usage

``` r
go_unifiedhovertitle(..., text = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- text:

  Template string used for rendering the title that appear on x or y
  unified hover box. Variables are inserted using %{variable}, for
  example "y: %{y}". Numbers are formatted using d3-format's syntax
  %{variable:d3-format}, for example "Price: %{y:\$.2f}".
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format for details on
  the formatting syntax. Dates are formatted using d3-time-format's
  syntax %{variable\|d3-time-format}, for example "Day:
  %{2019-01-01\|%A}".
  https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format for
  details on the date formatting syntax. Variables that can't be found
  will be replaced with the specifier. For example, a template of "data:
  %{x}, %{y}" will result in a value of "data: 1, %{y}" if x is 1 and y
  is missing. Variables with an undefined value will be replaced with
  the fallback value. String.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_unifiedhovertitle` object (a named list).

## Details

These objects appear in 2 places in the plotly.js schema (properties
named `unifiedhovertitle`), all with the same properties and rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter(x = ~wt, y = ~mpg, mode = "markers") |>
  update_layout(
    xaxis = go_xaxis(
      unifiedhovertitle = go_unifiedhovertitle(text = "title")
    )
  )
```
