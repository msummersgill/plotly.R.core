# Layout scene annotation objects

The object for an element of the `annotations` list of the layout's
`scene`
([`go_scene()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene.md)).
`go_scene_annotation()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_scene_annotation(
  ...,
  align = NULL,
  arrowcolor = NULL,
  arrowhead = NULL,
  arrowside = NULL,
  arrowsize = NULL,
  arrowwidth = NULL,
  ax = NULL,
  ay = NULL,
  bgcolor = NULL,
  bordercolor = NULL,
  borderpad = NULL,
  borderwidth = NULL,
  captureevents = NULL,
  font = NULL,
  height = NULL,
  hoverlabel = NULL,
  hovertext = NULL,
  name = NULL,
  opacity = NULL,
  showarrow = NULL,
  standoff = NULL,
  startarrowhead = NULL,
  startarrowsize = NULL,
  startstandoff = NULL,
  templateitemname = NULL,
  text = NULL,
  textangle = NULL,
  valign = NULL,
  visible = NULL,
  width = NULL,
  x = NULL,
  xanchor = NULL,
  xshift = NULL,
  y = NULL,
  yanchor = NULL,
  yshift = NULL,
  z = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- align:

  Sets the horizontal alignment of the \`text\` within the box. Has an
  effect only if \`text\` spans two or more lines (i.e. \`text\`
  contains one or more \<br\> HTML tags) or if an explicit width is set
  to override the text width. One of `"left"`, `"center"`, `"right"`.

- arrowcolor:

  Sets the color of the annotation arrow. Color: a CSS color string or R
  color name.

- arrowhead:

  Sets the end annotation arrow head style. Integer in the interval \[0,
  8\].

- arrowside:

  Sets the annotation arrow head position. Any combination of `"end"`,
  `"start"` joined with `"+"`, or one of `"none"`.

- arrowsize:

  Sets the size of the end annotation arrow head, relative to
  \`arrowwidth\`. A value of 1 (default) gives a head about 3x as wide
  as the line. Number in the interval \[0.3, Inf\].

- arrowwidth:

  Sets the width (in px) of annotation arrow line. Number in the
  interval \[0.1, Inf\].

- ax:

  Sets the x component of the arrow tail about the arrow head (in
  pixels). Number.

- ay:

  Sets the y component of the arrow tail about the arrow head (in
  pixels). Number.

- bgcolor:

  Sets the background color of the annotation. Color: a CSS color string
  or R color name.

- bordercolor:

  Sets the color of the border enclosing the annotation \`text\`. Color:
  a CSS color string or R color name.

- borderpad:

  Sets the padding (in px) between the \`text\` and the enclosing
  border. Number in the interval \[0, Inf\].

- borderwidth:

  Sets the width (in px) of the border enclosing the annotation
  \`text\`. Number in the interval \[0, Inf\].

- captureevents:

  Determines whether the annotation text box captures mouse move and
  click events, or allows those events to pass through to data points in
  the plot that may be behind the annotation. By default
  \`captureevents\` is FALSE unless \`hovertext\` is provided. If you
  use the event \`plotly_clickannotation\` without \`hovertext\` you
  must explicitly enable \`captureevents\`. Logical.

- font:

  Sets the annotation text font. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- height:

  Sets an explicit height for the text box. null (default) lets the text
  set the box height. Taller text will be clipped. Number in the
  interval \[1, Inf\].

- hoverlabel:

  A
  [`go_hoverlabel()`](https://msummersgill.github.io/plotly.R.core/reference/go_hoverlabel.md)
  object or named list, with properties `bgcolor`, `bordercolor` and
  `font` (see
  [`go_hoverlabel()`](https://msummersgill.github.io/plotly.R.core/reference/go_hoverlabel.md)).

- hovertext:

  Sets text to appear when hovering over this annotation. If omitted or
  blank, no hover label will appear. String.

- name:

  When used in a template, named items are created in the output figure
  in addition to any items the figure already has in this array. You can
  modify these items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- opacity:

  Sets the opacity of the annotation (text + arrow). Number in the
  interval \[0, 1\].

- showarrow:

  Determines whether or not the annotation is drawn with an arrow. If
  TRUE, \`text\` is placed near the arrow's tail. If FALSE, \`text\`
  lines up with the \`x\` and \`y\` provided. Logical.

- standoff:

  Sets a distance, in pixels, to move the end arrowhead away from the
  position it is pointing at, for example to point at the edge of a
  marker independent of zoom. Note that this shortens the arrow from the
  \`ax\` / \`ay\` vector, in contrast to \`xshift\` / \`yshift\` which
  moves everything by this amount. Number in the interval \[0, Inf\].

- startarrowhead:

  Sets the start annotation arrow head style. Integer in the interval
  \[0, 8\].

- startarrowsize:

  Sets the size of the start annotation arrow head, relative to
  \`arrowwidth\`. A value of 1 (default) gives a head about 3x as wide
  as the line. Number in the interval \[0.3, Inf\].

- startstandoff:

  Sets a distance, in pixels, to move the start arrowhead away from the
  position it is pointing at, for example to point at the edge of a
  marker independent of zoom. Note that this shortens the arrow from the
  \`ax\` / \`ay\` vector, in contrast to \`xshift\` / \`yshift\` which
  moves everything by this amount. Number in the interval \[0, Inf\].

- templateitemname:

  Used to refer to a named item in this array in the template. Named
  items from the template will be created even without a matching item
  in the input figure, but you can modify one by making an item with
  \`templateitemname\` matching its \`name\`, alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). If there is no template or no matching item, this item will
  be hidden unless you explicitly show it with \`visible: true\`.
  String.

- text:

  Sets the text associated with this annotation. Plotly uses a subset of
  HTML tags to do things like newline (\`\<br\>\`), bold
  (\`\<b\>\</b\>\`), italics (\`\<i\>\</i\>\`), hyperlinks (\`\<a
  href='...'\>\</a\>\`). Tags \`\<em\>\`, \`\<sup\>\`, \`\<sub\>\`,
  \`\<s\>\`, \`\<u\>\`, and \`\<span\>\` are also supported. String.

- textangle:

  Sets the angle at which the \`text\` is drawn with respect to the
  horizontal. Angle in degrees.

- valign:

  Sets the vertical alignment of the \`text\` within the box. Has an
  effect only if an explicit height is set to override the text height.
  One of `"top"`, `"middle"`, `"bottom"`.

- visible:

  Determines whether or not this annotation is visible. Logical.

- width:

  Sets an explicit width for the text box. null (default) lets the text
  set the box width. Wider text will be clipped. There is no automatic
  wrapping; use \<br\> to start a new line. Number in the interval \[1,
  Inf\].

- x:

  Sets the annotation's x position. Any value.

- xanchor:

  Sets the text box's horizontal position anchor This anchor binds the
  \`x\` position to the "left", "center" or "right" of the annotation.
  For example, if \`x\` is set to 1, \`xref\` to "paper" and \`xanchor\`
  to "right" then the right-most portion of the annotation lines up with
  the right-most edge of the plotting area. If "auto", the anchor is
  equivalent to "center" for data-referenced annotations or if there is
  an arrow, whereas for paper-referenced with no arrow, the anchor
  picked corresponds to the closest side. One of `"auto"`, `"left"`,
  `"center"`, `"right"`.

- xshift:

  Shifts the position of the whole annotation and arrow to the right
  (positive) or left (negative) by this many pixels. Number.

- y:

  Sets the annotation's y position. Any value.

- yanchor:

  Sets the text box's vertical position anchor This anchor binds the
  \`y\` position to the "top", "middle" or "bottom" of the annotation.
  For example, if \`y\` is set to 1, \`yref\` to "paper" and \`yanchor\`
  to "top" then the top-most portion of the annotation lines up with the
  top-most edge of the plotting area. If "auto", the anchor is
  equivalent to "middle" for data-referenced annotations or if there is
  an arrow, whereas for paper-referenced with no arrow, the anchor
  picked corresponds to the closest side. One of `"auto"`, `"top"`,
  `"middle"`, `"bottom"`.

- yshift:

  Shifts the position of the whole annotation and arrow up (positive) or
  down (negative) by this many pixels. Number.

- z:

  Sets the annotation's z position. Any value.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_scene_annotation` object (a named list).

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
  add_scatter3d(x = ~wt, y = ~hp, z = ~mpg) |>
  update_layout(
    scene = go_scene(
      annotations = list(go_scene_annotation(text = "title"))
    )
  )
```
