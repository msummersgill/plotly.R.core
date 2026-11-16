# Layout slider objects

Properties of `layout.slider`.

## Usage

``` r
go_layout_slider(
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

go_layout_slider_currentvalue(
  arg = NULL,
  ...,
  font = NULL,
  offset = NULL,
  prefix = NULL,
  suffix = NULL,
  visible = NULL,
  xanchor = NULL,
  skip_invalid = FALSE
)

go_layout_slider_currentvalue_font(
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

go_layout_slider_font(
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

go_layout_slider_pad(
  arg = NULL,
  ...,
  b = NULL,
  l = NULL,
  r = NULL,
  t = NULL,
  skip_invalid = FALSE
)

go_layout_slider_step(
  arg = NULL,
  ...,
  args = NULL,
  execute = NULL,
  label = NULL,
  method = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  visible = NULL,
  skip_invalid = FALSE
)

go_layout_slider_transition(
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
  properties from (constructors). Named arguments take precedence.

- ...:

  Further properties, including nested properties in "magic underscore"
  form, e.g. `marker_size = 10` for `marker = list(size = 10)`. Property
  values may be one-sided formulas, evaluated in `data` for `add_*()`
  functions.

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

  Named list or `go_layout_slider_currentvalue()` object.

- font:

  **`go_layout_slider()`**: Sets the font of the slider step labels.
  Named list or `go_layout_slider_font()` object.

  **`go_layout_slider_currentvalue()`**: Sets the font of the current
  value label text. Named list or `go_layout_slider_currentvalue_font()`
  object.

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

  Set the padding of the slider component along each side. Named list or
  `go_layout_slider_pad()` object.

- steps:

  List of named lists or `go_layout_slider_step()` objects.

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

  Named list or `go_layout_slider_transition()` object.

- visible:

  **`go_layout_slider()`**: Determines whether or not the slider is
  visible. Logical.

  **`go_layout_slider_currentvalue()`**: Shows the currently-selected
  value above the slider. Logical.

  **`go_layout_slider_step()`**: Determines whether or not this step is
  included in the slider. Logical.

- x:

  Sets the x position (in normalized coordinates) of the slider. Number
  in the interval \[-2, 3\].

- xanchor:

  **`go_layout_slider()`**: Sets the slider's horizontal position
  anchor. This anchor binds the \`x\` position to the "left", "center"
  or "right" of the range selector. One of `"auto"`, `"left"`,
  `"center"`, `"right"`.

  **`go_layout_slider_currentvalue()`**: The alignment of the value
  readout relative to the length of the slider. One of `"left"`,
  `"center"`, `"right"`.

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

- offset:

  The amount of space, in pixels, between the current value label and
  the slider. Number.

- prefix:

  When currentvalue.visible is true, this sets the prefix of the label.
  String.

- suffix:

  When currentvalue.visible is true, this sets the suffix of the label.
  String.

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

- args:

  Sets the arguments values to be passed to the Plotly method set in
  \`method\` on slide. Vector or list of up to 3 element(s).

- execute:

  When true, the API method is executed. When false, all other behaviors
  are the same and command execution is skipped. This may be useful when
  hooking into, for example, the \`plotly_sliderchange\` method and
  executing the API command manually without losing the benefit of the
  slider automatically binding to the state of the plot through the
  specification of \`method\` and \`args\`. Logical.

- label:

  Sets the text label to appear on the slider String.

- method:

  Sets the Plotly method to be called when the slider value is changed.
  If the \`skip\` method is used, the API slider will function as normal
  but will perform no API calls and will not bind automatically to state
  updates. This may be used to create a component interface and attach
  to slider events manually via JavaScript. One of `"restyle"`,
  `"relayout"`, `"animate"`, `"update"`, `"skip"`.

- value:

  Sets the value of the slider step, used to refer to the step
  programatically. Defaults to the slider label if not provided. String.

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

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_slider()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

Nested objects documented here:

- `go_layout_slider_currentvalue()`:

  `layout.slider.currentvalue`

- `go_layout_slider_currentvalue_font()`:

  `layout.slider.currentvalue.font`: Sets the font of the current value
  label text.

- `go_layout_slider_font()`:

  `layout.slider.font`: Sets the font of the slider step labels.

- `go_layout_slider_pad()`:

  `layout.slider.pad`: Set the padding of the slider component along
  each side.

- `go_layout_slider_step()`:

  `layout.slider.step`

- `go_layout_slider_transition()`:

  `layout.slider.transition`

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
