# Layout activeshape objects

Properties of `layout.activeshape`.

## Usage

``` r
go_layout_activeshape(
  arg = NULL,
  ...,
  fillcolor = NULL,
  opacity = NULL,
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

- fillcolor:

  Sets the color filling the active shape' interior. Color: a CSS color
  string or R color name.

- opacity:

  Sets the opacity of the active shape. Number in the interval \[0, 1\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_activeshape()` create validated graph objects (named lists).
Every property is checked against the plotly.js schema when an object is
created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
