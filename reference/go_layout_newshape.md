# Layout newshape objects

Properties of `layout.newshape`.

## Usage

``` r
go_layout_newshape(
  arg = NULL,
  ...,
  drawdirection = NULL,
  fillcolor = NULL,
  fillrule = NULL,
  label = NULL,
  layer = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  line = NULL,
  name = NULL,
  opacity = NULL,
  showlegend = NULL,
  visible = NULL,
  skip_invalid = FALSE
)

go_layout_newshape_label(
  arg = NULL,
  ...,
  font = NULL,
  padding = NULL,
  text = NULL,
  textangle = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  xanchor = NULL,
  yanchor = NULL,
  skip_invalid = FALSE
)

go_layout_newshape_label_font(
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

go_layout_newshape_legendgrouptitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_layout_newshape_legendgrouptitle_font(
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

go_layout_newshape_line(
  arg = NULL,
  ...,
  color = NULL,
  dash = NULL,
  width = NULL,
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

- drawdirection:

  When \`dragmode\` is set to "drawrect", "drawline" or "drawcircle"
  this limits the drag to be horizontal, vertical or diagonal. Using
  "diagonal" there is no limit e.g. in drawing lines in any direction.
  "ortho" limits the draw to be either horizontal or vertical.
  "horizontal" allows horizontal extend. "vertical" allows vertical
  extend. One of `"ortho"`, `"horizontal"`, `"vertical"`, `"diagonal"`.

- fillcolor:

  Sets the color filling new shapes' interior. Please note that if using
  a fillcolor with alpha greater than half, drag inside the active shape
  starts moving the shape underneath, otherwise a new shape could be
  started over. Color: a CSS color string or R color name.

- fillrule:

  Determines the path's interior. For more info please visit
  https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill-rule
  One of `"evenodd"`, `"nonzero"`.

- label:

  Named list or `go_layout_newshape_label()` object.

- layer:

  Specifies whether new shapes are drawn below gridlines ("below"),
  between gridlines and traces ("between") or above traces ("above").
  One of `"below"`, `"above"`, `"between"`.

- legend:

  Sets the reference to a legend to show new shape in. References to
  these legends are "legend", "legend2", "legend3", etc. Settings for
  these legends are set in the layout, under \`layout.legend\`,
  \`layout.legend2\`, etc. Subplot id: `"legend"`, `"legend2"`,
  `"legend3"`, ....

- legendgroup:

  Sets the legend group for new shape. Traces and shapes part of the
  same legend group hide/show at the same time when toggling legend
  items. String.

- legendgrouptitle:

  Named list or `go_layout_newshape_legendgrouptitle()` object.

- legendrank:

  Sets the legend rank for new shape. Items and groups with smaller
  ranks are presented on top/left side while with "reversed"
  \`legend.traceorder\` they are on bottom/right side. The default
  legendrank is 1000, so that you can use ranks less than 1000 to place
  certain items before all unranked items, and ranks greater than 1000
  to go after all unranked items. Number.

- legendwidth:

  Sets the width (in px or fraction) of the legend for new shape. Number
  in the interval \[0, Inf\].

- line:

  Named list or `go_layout_newshape_line()` object.

- name:

  Sets new shape name. The name appears as the legend item. String.

- opacity:

  Sets the opacity of new shapes. Number in the interval \[0, 1\].

- showlegend:

  Determines whether or not new shape is shown in the legend. Logical.

- visible:

  Determines whether or not new shape is visible. If "legendonly", the
  shape is not drawn, but can appear as a legend item (provided that the
  legend itself is visible). One of `"legendonly"`, `TRUE`, `FALSE`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- font:

  **`go_layout_newshape_label()`**: Sets the new shape label text font.
  Named list or `go_layout_newshape_label_font()` object.

  **`go_layout_newshape_legendgrouptitle()`**: Sets this legend group's
  title font. Named list or `go_layout_newshape_legendgrouptitle_font()`
  object.

- padding:

  Sets padding (in px) between edge of label and edge of new shape.
  Number in the interval \[0, Inf\].

- text:

  **`go_layout_newshape_label()`**: Sets the text to display with the
  new shape. It is also used for legend item if \`name\` is not
  provided. String.

  **`go_layout_newshape_legendgrouptitle()`**: Sets the title of the
  legend group. String.

- textangle:

  Sets the angle at which the label text is drawn with respect to the
  horizontal. For lines, angle "auto" is the same angle as the line. For
  all other shapes, angle "auto" is horizontal. Angle in degrees.

- textposition:

  Sets the position of the label text relative to the new shape.
  Supported values for rectangles, circles and paths are "top left",
  "top center", "top right", "middle left", "middle center", "middle
  right", "bottom left", "bottom center", and "bottom right". Supported
  values for lines are "start", "middle", and "end". Default: "middle
  center" for rectangles, circles, and paths; "middle" for lines. One of
  `"top left"`, `"top center"`, `"top right"`, `"middle left"`,
  `"middle center"`, `"middle right"`, `"bottom left"`,
  `"bottom center"`, `"bottom right"`, `"start"`, `"middle"`, `"end"`.

- texttemplate:

  Template string used for rendering the new shape's label. Note that
  this will override \`text\`. Variables are inserted using %{variable},
  for example "x0: %{x0}". Numbers are formatted using d3-format's
  syntax %{variable:d3-format}, for example "Price: %{x0:\$.2f}". See
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format for details on
  the formatting syntax. Dates are formatted using d3-time-format's
  syntax %{variable\|d3-time-format}, for example "Day: %{x0\|%m %b
  %Y}". See
  https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format for
  details on the date formatting syntax. A single multiplication or
  division operation may be applied to numeric variables, and combined
  with d3 number formatting, for example "Length in cm: %{x0"2.54}",
  "%{slope"60:.1f} meters per second." For log axes, variable values are
  given in log units. For date axes, x/y coordinate variables and center
  variables use datetimes, while all other variable values use values in
  ms. Finally, the template string has access to variables \`x0\`,
  \`x1\`, \`y0\`, \`y1\`, \`slope\`, \`dx\`, \`dy\`, \`width\`,
  \`height\`, \`length\`, \`xcenter\`, \`ycenter\`, \`simpleXVariables\`
  and \`simpleYVariables\`. Variables that can't be found will be
  replaced with the specifier. For example, a template of "data: %{x},
  %{y}" will result in a value of "data: 1, %{y}" if x is 1 and y is
  missing. Variables with an undefined value will be replaced with the
  fallback value. String.

- texttemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- xanchor:

  Sets the label's horizontal position anchor This anchor binds the
  specified \`textposition\` to the "left", "center" or "right" of the
  label text. For example, if \`textposition\` is set to "top right" and
  \`xanchor\` to "right" then the right-most portion of the label text
  lines up with the right-most edge of the new shape. One of `"auto"`,
  `"left"`, `"center"`, `"right"`.

- yanchor:

  Sets the label's vertical position anchor This anchor binds the
  specified \`textposition\` to the "top", "middle" or "bottom" of the
  label text. For example, if \`textposition\` is set to "top right" and
  \`yanchor\` to "top" then the top-most portion of the label text lines
  up with the top-most edge of the new shape. One of `"top"`,
  `"middle"`, `"bottom"`.

- color:

  **`go_layout_newshape_label_font()`,
  `go_layout_newshape_legendgrouptitle_font()`**: Color: a CSS color
  string or R color name.

  **`go_layout_newshape_line()`**: Sets the line color. By default uses
  either dark grey or white to increase contrast with background color.
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

- dash:

  Sets the dash style of lines. Set to a dash type string ("solid",
  "dot", "dash", "longdash", "dashdot", or "longdashdot") or a dash
  length list in px (eg "5px,10px,2px,2px"). One of `"solid"`, `"dot"`,
  `"dash"`, `"longdash"`, `"dashdot"`, `"longdashdot"`, or a string
  matching
  `"^\\d+(\\.\\d+)?(px|%)?((,|\\s)\\s*\\d+(\\.\\d+)?(px|%)?)*$"`.

- width:

  Sets the line width (in px). Number in the interval \[0, Inf\].

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_newshape()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

Nested objects documented here:

- `go_layout_newshape_label()`:

  `layout.newshape.label`

- `go_layout_newshape_label_font()`:

  `layout.newshape.label.font`: Sets the new shape label text font.

- `go_layout_newshape_legendgrouptitle()`:

  `layout.newshape.legendgrouptitle`

- `go_layout_newshape_legendgrouptitle_font()`:

  `layout.newshape.legendgrouptitle.font`: Sets this legend group's
  title font.

- `go_layout_newshape_line()`:

  `layout.newshape.line`

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
