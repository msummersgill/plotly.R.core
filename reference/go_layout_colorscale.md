# Layout colorscale objects

Properties of `layout.colorscale`.

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
  properties from (constructors). Named arguments take precedence.

- ...:

  Further properties, including nested properties in "magic underscore"
  form, e.g. `marker_size = 10` for `marker = list(size = 10)`. Property
  values may be one-sided formulas, evaluated in `data` for `add_*()`
  functions.

- diverging:

  Sets the default diverging colorscale. Note that \`autocolorscale\`
  must be true for this attribute to work. Colorscale: a vector of
  colors, a two-column data.frame of (value, color), or the name of a
  sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

- sequential:

  Sets the default sequential colorscale for positive values. Note that
  \`autocolorscale\` must be true for this attribute to work.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

- sequentialminus:

  Sets the default sequential colorscale for negative values. Note that
  \`autocolorscale\` must be true for this attribute to work.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_colorscale()` create validated graph objects (named lists).
Every property is checked against the plotly.js schema when an object is
created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
