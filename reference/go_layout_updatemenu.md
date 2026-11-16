# Layout updatemenu objects

Properties of `layout.updatemenu`.

## Usage

``` r
go_layout_updatemenu(
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

go_layout_updatemenu_button(
  arg = NULL,
  ...,
  args = NULL,
  args2 = NULL,
  execute = NULL,
  label = NULL,
  method = NULL,
  name = NULL,
  templateitemname = NULL,
  visible = NULL,
  skip_invalid = FALSE
)

go_layout_updatemenu_font(
  arg = NULL,
  ...,
  color = NULL,
  family = NULL,
  lineposition = NULL,
  shadow = NULL,
  size = NULL,
  style = NULL,
  textcase = NULL,
  variant = NULL,
  weight = NULL,
  skip_invalid = FALSE
)

go_layout_updatemenu_pad(
  arg = NULL,
  ...,
  b = NULL,
  l = NULL,
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

  List of named lists or `go_layout_updatemenu_button()` objects.

- direction:

  Determines the direction in which the buttons are laid out, whether in
  a dropdown menu or a row/column of buttons. For \`left\` and \`up\`,
  the buttons will still appear in left-to-right or top-to-bottom order
  respectively. One of `"left"`, `"right"`, `"up"`, `"down"`.

- font:

  Sets the font of the update menu button text. Named list or
  `go_layout_updatemenu_font()` object.

- name:

  When used in a template, named items are created in the output figure
  in addition to any items the figure already has in this array. You can
  modify these items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- pad:

  Sets the padding around the buttons or dropdown menu. Named list or
  `go_layout_updatemenu_pad()` object.

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

  **`go_layout_updatemenu()`**: Determines whether or not the update
  menu is visible. Logical.

  **`go_layout_updatemenu_button()`**: Determines whether or not this
  button is visible. Logical.

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

- args:

  Sets the arguments values to be passed to the Plotly method set in
  \`method\` on click. Vector or list of up to 3 element(s).

- args2:

  Sets a 2nd set of \`args\`, these arguments values are passed to the
  Plotly method set in \`method\` when clicking this button while in the
  active state. Use this to create toggle buttons. Vector or list of up
  to 3 element(s).

- execute:

  When true, the API method is executed. When false, all other behaviors
  are the same and command execution is skipped. This may be useful when
  hooking into, for example, the \`plotly_buttonclicked\` method and
  executing the API command manually without losing the benefit of the
  updatemenu automatically binding to the state of the plot through the
  specification of \`method\` and \`args\`. Logical.

- label:

  Sets the text label to appear on the button. String.

- method:

  Sets the Plotly method to be called on click. If the \`skip\` method
  is used, the API updatemenu will function as normal but will perform
  no API calls and will not bind automatically to state updates. This
  may be used to create a component interface and attach to updatemenu
  events manually via JavaScript. One of `"restyle"`, `"relayout"`,
  `"animate"`, `"update"`, `"skip"`.

- color:

  Color: a CSS color string or R color name.

- family:

  HTML font family - the typeface that will be applied by the web
  browser. The web browser can only apply a font if it is available on
  the system where it runs. Provide multiple font families, separated by
  commas, to indicate the order in which to apply fonts if they aren't
  available. String.

- lineposition:

  Sets the kind of decoration line(s) with text, such as an "under",
  "over" or "through" as well as combinations e.g. "under+over", etc.
  Any combination of `"under"`, `"over"`, `"through"` joined with `"+"`,
  or one of `"none"`.

- shadow:

  Sets the shape and color of the shadow behind text. "auto" places
  minimal shadow and applies contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String.

- size:

  Number in the interval \[1, Inf\].

- style:

  Sets whether a font should be styled with a normal or italic face from
  its family. One of `"normal"`, `"italic"`.

- textcase:

  Sets capitalization of text. It can be used to make text appear in
  all-uppercase or all-lowercase, or with each word capitalized. One of
  `"normal"`, `"word caps"`, `"upper"`, `"lower"`.

- variant:

  Sets the variant of the font. One of `"normal"`, `"small-caps"`,
  `"all-small-caps"`, `"all-petite-caps"`, `"petite-caps"`, `"unicase"`.

- weight:

  Sets the weight (or boldness) of the font. Integer in the interval
  \[1, 1000\].

- b:

  The amount of padding (in px) along the bottom of the component.
  Number.

- l:

  The amount of padding (in px) on the left side of the component.
  Number.

- r:

  The amount of padding (in px) on the right side of the component.
  Number.

- t:

  The amount of padding (in px) along the top of the component. Number.

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_updatemenu()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

Nested objects documented here:

- `go_layout_updatemenu_button()`:

  `layout.updatemenu.button`

- `go_layout_updatemenu_font()`:

  `layout.updatemenu.font`: Sets the font of the update menu button
  text.

- `go_layout_updatemenu_pad()`:

  `layout.updatemenu.pad`: Sets the padding around the buttons or
  dropdown menu.

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
