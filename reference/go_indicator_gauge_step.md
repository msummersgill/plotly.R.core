# Indicator gauge step objects

The object for an element of the `steps` list of an indicator trace's
`gauge`
([`go_indicator_gauge()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge.md)).
`go_indicator_gauge_step()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_indicator_gauge_step(
  ...,
  color = NULL,
  line = NULL,
  name = NULL,
  range = NULL,
  templateitemname = NULL,
  thickness = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- color:

  Sets the background color of the arc. Color: a CSS color string or R
  color name.

- line:

  A
  [`go_indicator_gauge_step_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge_step_line.md)
  object or named list, with properties `color` and `width` (see
  [`go_indicator_gauge_step_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator_gauge_step_line.md)).

- name:

  When used in a template, named items are created in the output figure
  in addition to any items the figure already has in this array. You can
  modify these items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- range:

  Sets the range of this axis. Vector or list of 2 element(s).

- templateitemname:

  Used to refer to a named item in this array in the template. Named
  items from the template will be created even without a matching item
  in the input figure, but you can modify one by making an item with
  \`templateitemname\` matching its \`name\`, alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). If there is no template or no matching item, this item will
  be hidden unless you explicitly show it with \`visible: true\`.
  String.

- thickness:

  Sets the thickness of the bar as a fraction of the total thickness of
  the gauge. Number in the interval \[0, 1\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_indicator_gauge_step` object (a named list).

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
  add_indicator(
    mode = "number+gauge",
    value = mean(mtcars$mpg),
    title = go_indicator_title(text = "mean mpg"),
    gauge = go_indicator_gauge(
      steps = list(
        go_indicator_gauge_step(range = c(0, 20), color = "red")
      )
    )
  )
```
