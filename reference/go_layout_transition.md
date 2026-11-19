# Layout transition objects

Sets transition options used during Plotly.react updates. The object for
the figure layout's `transition`. `go_layout_transition()` creates one,
with exactly its properties; a named list with the same properties works
too.

## Usage

``` r
go_layout_transition(
  ...,
  duration = NULL,
  easing = NULL,
  ordering = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

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

A `go_layout_transition` object (a named list).

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
  update_layout(transition = go_layout_transition())
```
