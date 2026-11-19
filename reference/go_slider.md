# Layout slider objects

The object for an element of the figure layout's `sliders` list.
`go_slider()` creates one, with exactly its properties; a named list
with the same properties works too.

## Usage

``` r
go_slider(
  arg = NULL,
  ...,
  active = NULL,
  activebgcolor = NULL,
  bgcolor = NULL,
  bordercolor = NULL,
  borderwidth = NULL,
  currentvalue = NULL,
  font = NULL,
  len = NULL,
  lenmode = NULL,
  minorticklen = NULL,
  name = NULL,
  pad = NULL,
  steps = NULL,
  templateitemname = NULL,
  tickcolor = NULL,
  ticklen = NULL,
  tickwidth = NULL,
  transition = NULL,
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

- active:

  Determines which button (by index starting from 0) is considered
  active. Number in the interval \[0, Inf\].

- activebgcolor:

  Sets the background color of the slider grip while dragging. Color: a
  CSS color string or R color name.

- bgcolor:

  Sets the background color of the slider. Color: a CSS color string or
  R color name.

- bordercolor:

  Sets the color of the border enclosing the slider. Color: a CSS color
  string or R color name.

- borderwidth:

  Sets the width (in px) of the border enclosing the slider. Number in
  the interval \[0, Inf\].

- currentvalue:

  A
  [`go_slider_currentvalue()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider_currentvalue.md)
  object or named list, with properties `font`, `offset`, `prefix`,
  `suffix`, `visible` and `xanchor` (see
  [`go_slider_currentvalue()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider_currentvalue.md)).

- font:

  Sets the font of the slider step labels. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- len:

  Sets the length of the slider This measure excludes the padding of
  both ends. That is, the slider's length is this length minus the
  padding on both ends. Number in the interval \[0, Inf\].

- lenmode:

  Determines whether this slider length is set in units of plot
  "fraction" or in \*pixels. Use \`len\` to set the value. One of
  `"fraction"`, `"pixels"`.

- minorticklen:

  Sets the length in pixels of minor step tick marks Number in the
  interval \[0, Inf\].

- name:

  When used in a template, named items are created in the output figure
  in addition to any items the figure already has in this array. You can
  modify these items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- pad:

  Set the padding of the slider component along each side. A
  [`go_slider_pad()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider_pad.md)
  object or named list, with properties `b`, `l`, `r` and `t` (see
  [`go_slider_pad()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider_pad.md)).

- steps:

  List, each element a
  [`go_slider_step()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider_step.md)
  object or named list, with properties `args`, `execute`, `label`,
  `method`, `name`, `templateitemname`, `value` and `visible` (see
  [`go_slider_step()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider_step.md)).

- templateitemname:

  Used to refer to a named item in this array in the template. Named
  items from the template will be created even without a matching item
  in the input figure, but you can modify one by making an item with
  \`templateitemname\` matching its \`name\`, alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). If there is no template or no matching item, this item will
  be hidden unless you explicitly show it with \`visible: true\`.
  String.

- tickcolor:

  Sets the color of the border enclosing the slider. Color: a CSS color
  string or R color name.

- ticklen:

  Sets the length in pixels of step tick marks Number in the interval
  \[0, Inf\].

- tickwidth:

  Sets the tick width (in px). Number in the interval \[0, Inf\].

- transition:

  A
  [`go_slider_transition()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider_transition.md)
  object or named list, with properties `duration` and `easing` (see
  [`go_slider_transition()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider_transition.md)).

- visible:

  Determines whether or not the slider is visible. Logical.

- x:

  Sets the x position (in normalized coordinates) of the slider. Number
  in the interval \[-2, 3\].

- xanchor:

  Sets the slider's horizontal position anchor. This anchor binds the
  \`x\` position to the "left", "center" or "right" of the range
  selector. One of `"auto"`, `"left"`, `"center"`, `"right"`.

- y:

  Sets the y position (in normalized coordinates) of the slider. Number
  in the interval \[-2, 3\].

- yanchor:

  Sets the slider's vertical position anchor This anchor binds the \`y\`
  position to the "top", "middle" or "bottom" of the range selector. One
  of `"auto"`, `"top"`, `"middle"`, `"bottom"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_slider` object (a named list).

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
  update_layout(sliders = list(go_slider(visible = TRUE)))
```
