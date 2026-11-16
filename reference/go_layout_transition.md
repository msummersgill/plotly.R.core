# Layout transition objects

Sets transition options used during Plotly.react updates.

## Usage

``` r
go_layout_transition(
  arg = NULL,
  ...,
  duration = NULL,
  easing = NULL,
  ordering = NULL,
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

- duration:

  The duration of the transition, in milliseconds. If equal to zero,
  updates are synchronous. Number in the interval \[0, Inf\].

- easing:

  The easing function used for the transition One of `"linear"`,
  `"quad"`, `"cubic"`, `"sin"`, `"exp"`, `"circle"`, `"elastic"`,
  `"back"`, `"bounce"`, `"linear-in"`, `"quad-in"`, `"cubic-in"`,
  `"sin-in"`, `"exp-in"`, `"circle-in"`, `"elastic-in"`, `"back-in"`,
  `"bounce-in"`, `"linear-out"`, `"quad-out"`, `"cubic-out"`,
  `"sin-out"`, `"exp-out"`, `"circle-out"`, `"elastic-out"`,
  `"back-out"`, `"bounce-out"`, `"linear-in-out"`, `"quad-in-out"`,
  `"cubic-in-out"`, `"sin-in-out"`, `"exp-in-out"`, `"circle-in-out"`,
  `"elastic-in-out"`, `"back-in-out"`, `"bounce-in-out"`.

- ordering:

  Determines whether the figure's layout or traces smoothly transitions
  during updates that make both traces and layout change. One of
  `"layout first"`, `"traces first"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_transition()` create validated graph objects (named lists).
Every property is checked against the plotly.js schema when an object is
created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
