# Layout uniformtext objects

Properties of `layout.uniformtext`.

## Usage

``` r
go_layout_uniformtext(
  arg = NULL,
  ...,
  minsize = NULL,
  mode = NULL,
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

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_uniformtext()` create validated graph objects (named lists).
Every property is checked against the plotly.js schema when an object is
created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
