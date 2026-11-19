# Layout uniformtext objects

The object for the figure layout's `uniformtext`. `go_uniformtext()`
creates one, with exactly its properties; a named list with the same
properties works too.

## Usage

``` r
go_uniformtext(..., minsize = NULL, mode = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- minsize:

  Sets the minimum text size between traces of the same type. Number in
  the interval \[0, Inf\].

- mode:

  Determines how the font size for various text elements are uniformed
  between each trace type. If the computed text sizes were smaller than
  the minimum size defined by \`uniformtext.minsize\` using "hide"
  option hides the text; and using "show" option shows the text without
  further downscaling. Please note that if the size defined by
  \`minsize\` is greater than the font size defined by trace, then the
  \`minsize\` is used. One of `"hide"`, `"show"`, `FALSE`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_uniformtext` object (a named list).

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
  update_layout(uniformtext = go_uniformtext())
```
