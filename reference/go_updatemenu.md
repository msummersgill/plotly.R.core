# Layout updatemenu objects

The object for an element of the figure layout's `updatemenus` list.
`go_updatemenu()` creates one, with exactly its properties; a named list
with the same properties works too.

## Usage

``` r
go_updatemenu(
  arg = NULL,
  ...,
  active = NULL,
  bgcolor = NULL,
  bordercolor = NULL,
  borderwidth = NULL,
  buttons = NULL,
  direction = NULL,
  font = NULL,
  name = NULL,
  pad = NULL,
  showactive = NULL,
  templateitemname = NULL,
  type = NULL,
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
  active. Integer in the interval \[-1, Inf\].

- bgcolor:

  Sets the background color of the update menu buttons. Color: a CSS
  color string or R color name.

- bordercolor:

  Sets the color of the border enclosing the update menu. Color: a CSS
  color string or R color name.

- borderwidth:

  Sets the width (in px) of the border enclosing the update menu. Number
  in the interval \[0, Inf\].

- buttons:

  List, each element a
  [`go_updatemenu_button()`](https://msummersgill.github.io/plotly.R.core/reference/go_updatemenu_button.md)
  object or named list, with properties `args`, `args2`, `execute`,
  `label`, `method`, `name`, `templateitemname` and `visible` (see
  [`go_updatemenu_button()`](https://msummersgill.github.io/plotly.R.core/reference/go_updatemenu_button.md)).

- direction:

  Determines the direction in which the buttons are laid out, whether in
  a dropdown menu or a row/column of buttons. For \`left\` and \`up\`,
  the buttons will still appear in left-to-right or top-to-bottom order
  respectively. One of `"left"`, `"right"`, `"up"`, `"down"`.

- font:

  Sets the font of the update menu button text. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- name:

  When used in a template, named items are created in the output figure
  in addition to any items the figure already has in this array. You can
  modify these items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- pad:

  Sets the padding around the buttons or dropdown menu. A
  [`go_updatemenu_pad()`](https://msummersgill.github.io/plotly.R.core/reference/go_updatemenu_pad.md)
  object or named list, with properties `b`, `l`, `r` and `t` (see
  [`go_updatemenu_pad()`](https://msummersgill.github.io/plotly.R.core/reference/go_updatemenu_pad.md)).

- showactive:

  Highlights active dropdown item or active button if true. Logical.

- templateitemname:

  Used to refer to a named item in this array in the template. Named
  items from the template will be created even without a matching item
  in the input figure, but you can modify one by making an item with
  \`templateitemname\` matching its \`name\`, alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). If there is no template or no matching item, this item will
  be hidden unless you explicitly show it with \`visible: true\`.
  String.

- type:

  Determines whether the buttons are accessible via a dropdown menu or
  whether the buttons are stacked horizontally or vertically One of
  `"dropdown"`, `"buttons"`.

- visible:

  Determines whether or not the update menu is visible. Logical.

- x:

  Sets the x position (in normalized coordinates) of the update menu.
  Number in the interval \[-2, 3\].

- xanchor:

  Sets the update menu's horizontal position anchor. This anchor binds
  the \`x\` position to the "left", "center" or "right" of the range
  selector. One of `"auto"`, `"left"`, `"center"`, `"right"`.

- y:

  Sets the y position (in normalized coordinates) of the update menu.
  Number in the interval \[-2, 3\].

- yanchor:

  Sets the update menu's vertical position anchor This anchor binds the
  \`y\` position to the "top", "middle" or "bottom" of the range
  selector. One of `"auto"`, `"top"`, `"middle"`, `"bottom"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_updatemenu` object (a named list).

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
  update_layout(updatemenus = list(go_updatemenu(visible = TRUE)))
```
