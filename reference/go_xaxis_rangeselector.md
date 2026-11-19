# Layout xaxis rangeselector objects

The object for the layout's `xaxis.rangeselector`
([`go_xaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis.md)).
`go_xaxis_rangeselector()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_xaxis_rangeselector(
  arg = NULL,
  ...,
  activecolor = NULL,
  bgcolor = NULL,
  bordercolor = NULL,
  borderwidth = NULL,
  buttons = NULL,
  font = NULL,
  visible = NULL,
  x = NULL,
  xanchor = NULL,
  y = NULL,
  yanchor = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- activecolor:

  Sets the background color of the active range selector button. Color:
  a CSS color string or R color name.

- bgcolor:

  Sets the background color of the range selector buttons. Color: a CSS
  color string or R color name.

- bordercolor:

  Sets the color of the border enclosing the range selector. Color: a
  CSS color string or R color name.

- borderwidth:

  Sets the width (in px) of the border enclosing the range selector.
  Number in the interval \[0, Inf\].

- buttons:

  List, each element a
  [`go_xaxis_rangeselector_button()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis_rangeselector_button.md)
  object or named list, with properties `count`, `label`, `name`,
  `step`, `stepmode`, `templateitemname` and `visible` (see
  [`go_xaxis_rangeselector_button()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis_rangeselector_button.md)).

- font:

  Sets the font of the range selector button text. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- visible:

  Determines whether or not this range selector is visible. Note that
  range selectors are only available for x axes of \`type\` set to or
  auto-typed to "date". Logical.

- x:

  Sets the x position (in normalized coordinates) of the range selector.
  Number in the interval \[-2, 3\].

- xanchor:

  Sets the range selector's horizontal position anchor. This anchor
  binds the \`x\` position to the "left", "center" or "right" of the
  range selector. One of `"auto"`, `"left"`, `"center"`, `"right"`.

- y:

  Sets the y position (in normalized coordinates) of the range selector.
  Number in the interval \[-2, 3\].

- yanchor:

  Sets the range selector's vertical position anchor This anchor binds
  the \`y\` position to the "top", "middle" or "bottom" of the range
  selector. One of `"auto"`, `"top"`, `"middle"`, `"bottom"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_xaxis_rangeselector` object (a named list).

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
    xaxis = go_xaxis(
      rangeselector = go_xaxis_rangeselector(visible = TRUE)
    )
  )
```
