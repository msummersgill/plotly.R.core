# Layout margin objects

Properties of `layout.margin`.

## Usage

``` r
go_layout_margin(
  arg = NULL,
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

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from (constructors). Named arguments take precedence.

- ...:

  Further properties, including nested properties in "magic underscore"
  form, e.g. `marker_size = 10` for `marker = list(size = 10)`. Property
  values may be one-sided formulas, evaluated in `data` for `add_*()`
  functions.

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

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_margin()` create validated graph objects (named lists). Every
property is checked against the plotly.js schema when an object is
created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
