# Layout slider transition objects

The object for the layout's `slider.transition`
([`go_slider()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider.md)).
`go_slider_transition()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_slider_transition(
  arg = NULL,
  ...,
  duration = NULL,
  easing = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- duration:

  Sets the duration of the slider transition Number in the interval \[0,
  Inf\].

- easing:

  Sets the easing function of the slider transition One of `"linear"`,
  `"quad"`, `"cubic"`, `"sin"`, `"exp"`, `"circle"`, `"elastic"`,
  `"back"`, `"bounce"`, `"linear-in"`, `"quad-in"`, `"cubic-in"`,
  `"sin-in"`, `"exp-in"`, `"circle-in"`, `"elastic-in"`, `"back-in"`,
  `"bounce-in"`, `"linear-out"`, `"quad-out"`, `"cubic-out"`,
  `"sin-out"`, `"exp-out"`, `"circle-out"`, `"elastic-out"`,
  `"back-out"`, `"bounce-out"`, `"linear-in-out"`, `"quad-in-out"`,
  `"cubic-in-out"`, `"sin-in-out"`, `"exp-in-out"`, `"circle-in-out"`,
  `"elastic-in-out"`, `"back-in-out"`, `"bounce-in-out"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_slider_transition` object (a named list).

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
  update_layout(
    sliders = list(go_slider(transition = go_slider_transition()))
  )
```
