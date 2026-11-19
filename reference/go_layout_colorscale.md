# Layout colorscale objects

The object for the figure layout's `colorscale`.
`go_layout_colorscale()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_layout_colorscale(
  arg = NULL,
  ...,
  diverging = NULL,
  sequential = NULL,
  sequentialminus = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- diverging:

  Sets the default diverging colorscale. Note that \`autocolorscale\`
  must be true for this attribute to work. Colorscale: a vector of
  colors, a two-column data.frame of (value, color), or the name of a
  sequential, diverging or cyclical scale in
  [`plotly_colors()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_colors.md)
  (append `"_r"` to reverse).

- sequential:

  Sets the default sequential colorscale for positive values. Note that
  \`autocolorscale\` must be true for this attribute to work.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`plotly_colors()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_colors.md)
  (append `"_r"` to reverse).

- sequentialminus:

  Sets the default sequential colorscale for negative values. Note that
  \`autocolorscale\` must be true for this attribute to work.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`plotly_colors()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_colors.md)
  (append `"_r"` to reverse).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_colorscale` object (a named list).

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
  update_layout(colorscale = go_layout_colorscale())
```
