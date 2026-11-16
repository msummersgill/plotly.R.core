# Layout scene objects

Properties of `layout.scene`.

## Usage

``` r
go_layout_scene(
  arg = NULL,
  ...,
  annotations = NULL,
  aspectmode = NULL,
  aspectratio = NULL,
  bgcolor = NULL,
  camera = NULL,
  domain = NULL,
  dragmode = NULL,
  hovermode = NULL,
  uirevision = NULL,
  xaxis = NULL,
  yaxis = NULL,
  zaxis = NULL,
  skip_invalid = FALSE
)

go_layout_scene_annotation(
  arg = NULL,
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

go_layout_scene_annotation_font(
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

go_layout_scene_annotation_hoverlabel(
  arg = NULL,
  ...,
  bgcolor = NULL,
  bordercolor = NULL,
  font = NULL,
  skip_invalid = FALSE
)

go_layout_scene_annotation_hoverlabel_font(
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

go_layout_scene_aspectratio(
  arg = NULL,
  ...,
  x = NULL,
  y = NULL,
  z = NULL,
  skip_invalid = FALSE
)

go_layout_scene_camera(
  arg = NULL,
  ...,
  center = NULL,
  eye = NULL,
  projection = NULL,
  up = NULL,
  skip_invalid = FALSE
)

go_layout_scene_camera_center(
  arg = NULL,
  ...,
  x = NULL,
  y = NULL,
  z = NULL,
  skip_invalid = FALSE
)

go_layout_scene_camera_eye(
  arg = NULL,
  ...,
  x = NULL,
  y = NULL,
  z = NULL,
  skip_invalid = FALSE
)

go_layout_scene_camera_projection(
  arg = NULL,
  ...,
  type = NULL,
  skip_invalid = FALSE
)

go_layout_scene_camera_up(
  arg = NULL,
  ...,
  x = NULL,
  y = NULL,
  z = NULL,
  skip_invalid = FALSE
)

go_layout_scene_domain(
  arg = NULL,
  ...,
  column = NULL,
  row = NULL,
  x = NULL,
  y = NULL,
  skip_invalid = FALSE
)

go_layout_scene_xaxis(
  arg = NULL,
  ...,
  autorange = NULL,
  autorangeoptions = NULL,
  autotypenumbers = NULL,
  backgroundcolor = NULL,
  calendar = NULL,
  categoryarray = NULL,
  categoryorder = NULL,
  color = NULL,
  dtick = NULL,
  exponentformat = NULL,
  gridcolor = NULL,
  gridwidth = NULL,
  hoverformat = NULL,
  labelalias = NULL,
  linecolor = NULL,
  linewidth = NULL,
  maxallowed = NULL,
  minallowed = NULL,
  minexponent = NULL,
  mirror = NULL,
  nticks = NULL,
  range = NULL,
  rangemode = NULL,
  separatethousands = NULL,
  showaxeslabels = NULL,
  showbackground = NULL,
  showexponent = NULL,
  showgrid = NULL,
  showline = NULL,
  showspikes = NULL,
  showticklabels = NULL,
  showtickprefix = NULL,
  showticksuffix = NULL,
  spikecolor = NULL,
  spikesides = NULL,
  spikethickness = NULL,
  tick0 = NULL,
  tickangle = NULL,
  tickcolor = NULL,
  tickfont = NULL,
  tickformat = NULL,
  tickformatstops = NULL,
  ticklen = NULL,
  tickmode = NULL,
  tickprefix = NULL,
  ticks = NULL,
  ticksuffix = NULL,
  ticktext = NULL,
  tickvals = NULL,
  tickwidth = NULL,
  title = NULL,
  type = NULL,
  visible = NULL,
  zeroline = NULL,
  zerolinecolor = NULL,
  zerolinewidth = NULL,
  skip_invalid = FALSE
)

go_layout_scene_xaxis_autorangeoptions(
  arg = NULL,
  ...,
  clipmax = NULL,
  clipmin = NULL,
  include = NULL,
  maxallowed = NULL,
  minallowed = NULL,
  skip_invalid = FALSE
)

go_layout_scene_xaxis_tickfont(
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

go_layout_scene_xaxis_tickformatstop(
  arg = NULL,
  ...,
  dtickrange = NULL,
  enabled = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  skip_invalid = FALSE
)

go_layout_scene_xaxis_title(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_layout_scene_xaxis_title_font(
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

go_layout_scene_yaxis(
  arg = NULL,
  ...,
  autorange = NULL,
  autorangeoptions = NULL,
  autotypenumbers = NULL,
  backgroundcolor = NULL,
  calendar = NULL,
  categoryarray = NULL,
  categoryorder = NULL,
  color = NULL,
  dtick = NULL,
  exponentformat = NULL,
  gridcolor = NULL,
  gridwidth = NULL,
  hoverformat = NULL,
  labelalias = NULL,
  linecolor = NULL,
  linewidth = NULL,
  maxallowed = NULL,
  minallowed = NULL,
  minexponent = NULL,
  mirror = NULL,
  nticks = NULL,
  range = NULL,
  rangemode = NULL,
  separatethousands = NULL,
  showaxeslabels = NULL,
  showbackground = NULL,
  showexponent = NULL,
  showgrid = NULL,
  showline = NULL,
  showspikes = NULL,
  showticklabels = NULL,
  showtickprefix = NULL,
  showticksuffix = NULL,
  spikecolor = NULL,
  spikesides = NULL,
  spikethickness = NULL,
  tick0 = NULL,
  tickangle = NULL,
  tickcolor = NULL,
  tickfont = NULL,
  tickformat = NULL,
  tickformatstops = NULL,
  ticklen = NULL,
  tickmode = NULL,
  tickprefix = NULL,
  ticks = NULL,
  ticksuffix = NULL,
  ticktext = NULL,
  tickvals = NULL,
  tickwidth = NULL,
  title = NULL,
  type = NULL,
  visible = NULL,
  zeroline = NULL,
  zerolinecolor = NULL,
  zerolinewidth = NULL,
  skip_invalid = FALSE
)

go_layout_scene_yaxis_autorangeoptions(
  arg = NULL,
  ...,
  clipmax = NULL,
  clipmin = NULL,
  include = NULL,
  maxallowed = NULL,
  minallowed = NULL,
  skip_invalid = FALSE
)

go_layout_scene_yaxis_tickfont(
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

go_layout_scene_yaxis_tickformatstop(
  arg = NULL,
  ...,
  dtickrange = NULL,
  enabled = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  skip_invalid = FALSE
)

go_layout_scene_yaxis_title(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_layout_scene_yaxis_title_font(
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

go_layout_scene_zaxis(
  arg = NULL,
  ...,
  autorange = NULL,
  autorangeoptions = NULL,
  autotypenumbers = NULL,
  backgroundcolor = NULL,
  calendar = NULL,
  categoryarray = NULL,
  categoryorder = NULL,
  color = NULL,
  dtick = NULL,
  exponentformat = NULL,
  gridcolor = NULL,
  gridwidth = NULL,
  hoverformat = NULL,
  labelalias = NULL,
  linecolor = NULL,
  linewidth = NULL,
  maxallowed = NULL,
  minallowed = NULL,
  minexponent = NULL,
  mirror = NULL,
  nticks = NULL,
  range = NULL,
  rangemode = NULL,
  separatethousands = NULL,
  showaxeslabels = NULL,
  showbackground = NULL,
  showexponent = NULL,
  showgrid = NULL,
  showline = NULL,
  showspikes = NULL,
  showticklabels = NULL,
  showtickprefix = NULL,
  showticksuffix = NULL,
  spikecolor = NULL,
  spikesides = NULL,
  spikethickness = NULL,
  tick0 = NULL,
  tickangle = NULL,
  tickcolor = NULL,
  tickfont = NULL,
  tickformat = NULL,
  tickformatstops = NULL,
  ticklen = NULL,
  tickmode = NULL,
  tickprefix = NULL,
  ticks = NULL,
  ticksuffix = NULL,
  ticktext = NULL,
  tickvals = NULL,
  tickwidth = NULL,
  title = NULL,
  type = NULL,
  visible = NULL,
  zeroline = NULL,
  zerolinecolor = NULL,
  zerolinewidth = NULL,
  skip_invalid = FALSE
)

go_layout_scene_zaxis_autorangeoptions(
  arg = NULL,
  ...,
  clipmax = NULL,
  clipmin = NULL,
  include = NULL,
  maxallowed = NULL,
  minallowed = NULL,
  skip_invalid = FALSE
)

go_layout_scene_zaxis_tickfont(
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

go_layout_scene_zaxis_tickformatstop(
  arg = NULL,
  ...,
  dtickrange = NULL,
  enabled = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  skip_invalid = FALSE
)

go_layout_scene_zaxis_title(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_layout_scene_zaxis_title_font(
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

- annotations:

  List of named lists or `go_layout_scene_annotation()` objects.

- aspectmode:

  If "cube", this scene's axes are drawn as a cube, regardless of the
  axes' ranges. If "data", this scene's axes are drawn in proportion
  with the axes' ranges. If "manual", this scene's axes are drawn in
  proportion with the input of "aspectratio" (the default behavior if
  "aspectratio" is provided). If "auto", this scene's axes are drawn
  using the results of "data" except when one axis is more than four
  times the size of the two others, where in that case the results of
  "cube" are used. One of `"auto"`, `"cube"`, `"data"`, `"manual"`.

- aspectratio:

  Sets this scene's axis aspectratio. Named list or
  `go_layout_scene_aspectratio()` object.

- bgcolor:

  **`go_layout_scene()`**: Color: a CSS color string or R color name.

  **`go_layout_scene_annotation()`**: Sets the background color of the
  annotation. Color: a CSS color string or R color name.

  **`go_layout_scene_annotation_hoverlabel()`**: Sets the background
  color of the hover label. By default uses the annotation's \`bgcolor\`
  made opaque, or white if it was transparent. Color: a CSS color string
  or R color name.

- camera:

  Named list or `go_layout_scene_camera()` object.

- domain:

  Named list or `go_layout_scene_domain()` object.

- dragmode:

  Determines the mode of drag interactions for this scene. One of
  `"orbit"`, `"turntable"`, `"zoom"`, `"pan"`, `FALSE`.

- hovermode:

  Determines the mode of hover interactions for this scene. One of
  `"closest"`, `FALSE`.

- uirevision:

  Controls persistence of user-driven changes in camera attributes.
  Defaults to \`layout.uirevision\`. Any value.

- xaxis:

  Named list or `go_layout_scene_xaxis()` object.

- yaxis:

  Named list or `go_layout_scene_yaxis()` object.

- zaxis:

  Named list or `go_layout_scene_zaxis()` object.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

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

- bordercolor:

  **`go_layout_scene_annotation()`**: Sets the color of the border
  enclosing the annotation \`text\`. Color: a CSS color string or R
  color name.

  **`go_layout_scene_annotation_hoverlabel()`**: Sets the border color
  of the hover label. By default uses either dark grey or white, for
  maximum contrast with \`hoverlabel.bgcolor\`. Color: a CSS color
  string or R color name.

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

  **`go_layout_scene_annotation()`**: Sets the annotation text font.
  Named list or `go_layout_scene_annotation_font()` object.

  **`go_layout_scene_annotation_hoverlabel()`**: Sets the hover label
  text font. By default uses the global hover font and size, with color
  from \`hoverlabel.bordercolor\`. Named list or
  `go_layout_scene_annotation_hoverlabel_font()` object.

  **`go_layout_scene_xaxis_title()`**: Sets this axis' title font. Named
  list or `go_layout_scene_xaxis_title_font()` object.

  **`go_layout_scene_yaxis_title()`**: Sets this axis' title font. Named
  list or `go_layout_scene_yaxis_title_font()` object.

  **`go_layout_scene_zaxis_title()`**: Sets this axis' title font. Named
  list or `go_layout_scene_zaxis_title_font()` object.

- height:

  Sets an explicit height for the text box. null (default) lets the text
  set the box height. Taller text will be clipped. Number in the
  interval \[1, Inf\].

- hoverlabel:

  Named list or `go_layout_scene_annotation_hoverlabel()` object.

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

  **`go_layout_scene_annotation()`**: Sets the text associated with this
  annotation. Plotly uses a subset of HTML tags to do things like
  newline (\`\<br\>\`), bold (\`\<b\>\</b\>\`), italics
  (\`\<i\>\</i\>\`), hyperlinks (\`\<a href='...'\>\</a\>\`). Tags
  \`\<em\>\`, \`\<sup\>\`, \`\<sub\>\`, \`\<s\>\`, \`\<u\>\`, and
  \`\<span\>\` are also supported. String.

  **`go_layout_scene_xaxis_title()`, `go_layout_scene_yaxis_title()`,
  `go_layout_scene_zaxis_title()`**: Sets the title of this axis.
  String.

- textangle:

  Sets the angle at which the \`text\` is drawn with respect to the
  horizontal. Angle in degrees.

- valign:

  Sets the vertical alignment of the \`text\` within the box. Has an
  effect only if an explicit height is set to override the text height.
  One of `"top"`, `"middle"`, `"bottom"`.

- visible:

  **`go_layout_scene_annotation()`**: Determines whether or not this
  annotation is visible. Logical.

  **`go_layout_scene_xaxis()`, `go_layout_scene_yaxis()`,
  `go_layout_scene_zaxis()`**: A single toggle to hide the axis while
  preserving interaction like dragging. Default is true when a cheater
  plot is present on the axis, otherwise false Logical.

- width:

  Sets an explicit width for the text box. null (default) lets the text
  set the box width. Wider text will be clipped. There is no automatic
  wrapping; use \<br\> to start a new line. Number in the interval \[1,
  Inf\].

- x:

  **`go_layout_scene_annotation()`**: Sets the annotation's x position.
  Any value.

  **`go_layout_scene_aspectratio()`**: Number in the interval \[0,
  Inf\].

  **`go_layout_scene_camera_center()`, `go_layout_scene_camera_eye()`,
  `go_layout_scene_camera_up()`**: Number.

  **`go_layout_scene_domain()`**: Sets the horizontal domain of this
  scene subplot (in plot fraction). Vector or list of 2 element(s).

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

  **`go_layout_scene_annotation()`**: Sets the annotation's y position.
  Any value.

  **`go_layout_scene_aspectratio()`**: Number in the interval \[0,
  Inf\].

  **`go_layout_scene_camera_center()`, `go_layout_scene_camera_eye()`,
  `go_layout_scene_camera_up()`**: Number.

  **`go_layout_scene_domain()`**: Sets the vertical domain of this scene
  subplot (in plot fraction). Vector or list of 2 element(s).

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

  **`go_layout_scene_annotation()`**: Sets the annotation's z position.
  Any value.

  **`go_layout_scene_aspectratio()`**: Number in the interval \[0,
  Inf\].

  **`go_layout_scene_camera_center()`, `go_layout_scene_camera_eye()`,
  `go_layout_scene_camera_up()`**: Number.

- color:

  **`go_layout_scene_annotation_font()`,
  `go_layout_scene_annotation_hoverlabel_font()`,
  `go_layout_scene_xaxis_tickfont()`,
  `go_layout_scene_xaxis_title_font()`,
  `go_layout_scene_yaxis_tickfont()`,
  `go_layout_scene_yaxis_title_font()`,
  `go_layout_scene_zaxis_tickfont()`,
  `go_layout_scene_zaxis_title_font()`**: Color: a CSS color string or R
  color name.

  **`go_layout_scene_xaxis()`, `go_layout_scene_yaxis()`,
  `go_layout_scene_zaxis()`**: Sets default for all colors associated
  with this axis all at once: line, font, tick, and grid colors. Grid
  color is lightened by blending this with the plot background
  Individual pieces can override this. Color: a CSS color string or R
  color name.

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

- center:

  Sets the (x,y,z) components of the 'center' camera vector This vector
  determines the translation (x,y,z) space about the center of this
  scene. By default, there is no such translation. Named list or
  `go_layout_scene_camera_center()` object.

- eye:

  Sets the (x,y,z) components of the 'eye' camera vector. This vector
  determines the view point about the origin of this scene. Named list
  or `go_layout_scene_camera_eye()` object.

- projection:

  Named list or `go_layout_scene_camera_projection()` object.

- up:

  Sets the (x,y,z) components of the 'up' camera vector. This vector
  determines the up direction of this scene with respect to the page.
  The default is "{x: 0, y: 0, z: 1}" which means that the z axis points
  up. Named list or `go_layout_scene_camera_up()` object.

- type:

  **`go_layout_scene_camera_projection()`**: Sets the projection type.
  The projection type could be either "perspective" or "orthographic".
  The default is "perspective". One of `"perspective"`,
  `"orthographic"`.

  **`go_layout_scene_xaxis()`, `go_layout_scene_yaxis()`,
  `go_layout_scene_zaxis()`**: Sets the axis type. By default, plotly
  attempts to determined the axis type by looking into the data of the
  traces that referenced the axis in question. One of `"-"`, `"linear"`,
  `"log"`, `"date"`, `"category"`.

- column:

  If there is a layout grid, use the domain for this column in the grid
  for this scene subplot. Integer in the interval \[0, Inf\].

- row:

  If there is a layout grid, use the domain for this row in the grid for
  this scene subplot. Integer in the interval \[0, Inf\].

- autorange:

  Determines whether or not the range of this axis is computed in
  relation to the input data. See \`rangemode\` for more info. If
  \`range\` is provided and it has a value for both the lower and upper
  bound, \`autorange\` is set to FALSE. Using "min" applies autorange
  only to set the minimum. Using "max" applies autorange only to set the
  maximum. Using "min reversed" applies autorange only to set the
  minimum on a reversed axis. Using "max reversed" applies autorange
  only to set the maximum on a reversed axis. Using "reversed" applies
  autorange on both ends and reverses the axis direction. One of
  `"reversed"`, `"min reversed"`, `"max reversed"`, `"min"`, `"max"`,
  `TRUE`, `FALSE`.

- autorangeoptions:

  **`go_layout_scene_xaxis()`**: Named list or
  `go_layout_scene_xaxis_autorangeoptions()` object.

  **`go_layout_scene_yaxis()`**: Named list or
  `go_layout_scene_yaxis_autorangeoptions()` object.

  **`go_layout_scene_zaxis()`**: Named list or
  `go_layout_scene_zaxis_autorangeoptions()` object.

- autotypenumbers:

  Using "strict" a numeric string in trace data is not converted to a
  number. Using "convert types" a numeric string in trace data may be
  treated as a number during automatic axis \`type\` detection. Defaults
  to layout.autotypenumbers. One of `"convert types"`, `"strict"`.

- backgroundcolor:

  Sets the background color of this axis' wall. Color: a CSS color
  string or R color name.

- calendar:

  Sets the calendar system to use for \`range\` and \`tick0\` if this is
  a date axis. This does not set the calendar for interpreting data on
  this axis, that's specified in the trace or via the global
  \`layout.calendar\` One of `"chinese"`, `"coptic"`, `"discworld"`,
  `"ethiopian"`, `"gregorian"`, `"hebrew"`, `"islamic"`, `"jalali"`,
  `"julian"`, `"mayan"`, `"nanakshahi"`, `"nepali"`, `"persian"`,
  `"taiwan"`, `"thai"`, `"ummalqura"`.

- categoryarray:

  Sets the order in which categories on this axis appear. Only has an
  effect if \`categoryorder\` is set to "array". Used with
  \`categoryorder\`. Data array: a vector, factor, Date/POSIXct vector,
  matrix or list.

- categoryorder:

  Specifies the ordering logic for the case of categorical variables. By
  default, plotly uses "trace", which specifies the order that is
  present in the data supplied. Set \`categoryorder\` to "category
  ascending" or "category descending" if order should be determined by
  the alphanumerical order of the category names. Set \`categoryorder\`
  to "array" to derive the ordering from the attribute
  \`categoryarray\`. If a category is not found in the \`categoryarray\`
  array, the sorting behavior for that attribute will be identical to
  the "trace" mode. The unspecified categories will follow the
  categories in \`categoryarray\`. Set \`categoryorder\` to "total
  ascending" or "total descending" if order should be determined by the
  numerical order of the values. Similarly, the order can be determined
  by the min, max, sum, mean, geometric mean or median of all the
  values. One of `"trace"`, `"category ascending"`,
  `"category descending"`, `"array"`, `"total ascending"`,
  `"total descending"`, `"min ascending"`, `"min descending"`,
  `"max ascending"`, `"max descending"`, `"sum ascending"`,
  `"sum descending"`, `"mean ascending"`, `"mean descending"`,
  `"geometric mean ascending"`, `"geometric mean descending"`,
  `"median ascending"`, `"median descending"`.

- dtick:

  Sets the step in-between ticks on this axis. Use with \`tick0\`. Must
  be a positive number, or special strings available to "log" and "date"
  axes. If the axis \`type\` is "log", then ticks are set every
  10^(n\*dtick) where n is the tick number. For example, to set a tick
  mark at 1, 10, 100, 1000, ... set dtick to 1. To set tick marks at 1,
  100, 10000, ... set dtick to 2. To set tick marks at 1, 5, 25, 125,
  625, 3125, ... set dtick to log_10(5), or 0.69897000433. "log" has
  several special values; "L\<f\>", where \`f\` is a positive number,
  gives ticks linearly spaced in value (but not position). For example
  \`tick0\` = 0.1, \`dtick\` = "L0.5" will put ticks at 0.1, 0.6, 1.1,
  1.6 etc. To show powers of 10 plus small digits between, use "D1" (all
  digits) or "D2" (only 2 and 5). \`tick0\` is ignored for "D1" and
  "D2". If the axis \`type\` is "date", then you must convert the time
  to milliseconds. For example, to set the interval between ticks to one
  day, set \`dtick\` to 86400000.0. "date" also has special values
  "M\<n\>" gives ticks spaced by a number of months. \`n\` must be a
  positive integer. To set ticks on the 15th of every third month, set
  \`tick0\` to "2000-01-15" and \`dtick\` to "M3". To set ticks every 4
  years, set \`dtick\` to "M48" Any value.

- exponentformat:

  Determines a formatting rule for the tick exponents. For example,
  consider the number 1,000,000,000. If "none", it appears as
  1,000,000,000. If "e", 1e+9. If "E", 1E+9. If "power", 1x10^9 (with 9
  in a super script). If "SI", 1G. If "B", 1B. "SI" uses prefixes from
  "femto" f (10^-15) to "tera" T (10^12). "SI extended" covers instead
  the full SI range from "quecto" q (10^-30) to "quetta" Q (10^30). If
  "SI" or "SI extended" is used and the exponent is beyond the above
  ranges, the formatting rule will automatically be switched to the
  power notation. One of `"none"`, `"e"`, `"E"`, `"power"`, `"SI"`,
  `"B"`, `"SI extended"`.

- gridcolor:

  Sets the color of the grid lines. Color: a CSS color string or R color
  name.

- gridwidth:

  Sets the width (in px) of the grid lines. Number in the interval \[0,
  Inf\].

- hoverformat:

  Sets the hover text formatting rule using d3 formatting mini-languages
  which are very similar to those in Python. For numbers, see:
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for dates
  see: https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format.
  We add two items to d3's date formatter: "%h" for half of the year as
  a decimal number as well as "%{n}f" for fractional seconds with n
  digits. For example, "2016-10-13 09:15:23.456" with tickformat
  "%H~%M~%S.%2f" would display "09~15~23.46" String.

- labelalias:

  Replacement text for specific tick or hover labels. For example using
  {US: 'USA', CA: 'Canada'} changes US to USA and CA to Canada. The
  labels we would have shown must match the keys exactly, after adding
  any tickprefix or ticksuffix. For negative numbers the minus sign
  symbol used (U+2212) is wider than the regular ascii dash. That means
  you need to use -1 instead of -1. labelalias can be used with any axis
  type, and both keys (if needed) and values (if desired) can include
  html-like tags or MathJax. Any value.

- linecolor:

  Sets the axis line color. Color: a CSS color string or R color name.

- linewidth:

  Sets the width (in px) of the axis line. Number in the interval \[0,
  Inf\].

- maxallowed:

  **`go_layout_scene_xaxis()`, `go_layout_scene_yaxis()`,
  `go_layout_scene_zaxis()`**: Determines the maximum range of this
  axis. Any value.

  **`go_layout_scene_xaxis_autorangeoptions()`,
  `go_layout_scene_yaxis_autorangeoptions()`,
  `go_layout_scene_zaxis_autorangeoptions()`**: Use this value exactly
  as autorange maximum. Any value.

- minallowed:

  **`go_layout_scene_xaxis()`, `go_layout_scene_yaxis()`,
  `go_layout_scene_zaxis()`**: Determines the minimum range of this
  axis. Any value.

  **`go_layout_scene_xaxis_autorangeoptions()`,
  `go_layout_scene_yaxis_autorangeoptions()`,
  `go_layout_scene_zaxis_autorangeoptions()`**: Use this value exactly
  as autorange minimum. Any value.

- minexponent:

  Hide SI prefix for 10^n if \|n\| is below this number. This only has
  an effect when \`tickformat\` is "SI" or "B". Number in the interval
  \[0, Inf\].

- mirror:

  Determines if the axis lines or/and ticks are mirrored to the opposite
  side of the plotting area. If TRUE, the axis lines are mirrored. If
  "ticks", the axis lines and ticks are mirrored. If FALSE, mirroring is
  disable. If "all", axis lines are mirrored on all shared-axes
  subplots. If "allticks", axis lines and ticks are mirrored on all
  shared-axes subplots. One of `"ticks"`, `"all"`, `"allticks"`, `TRUE`,
  `FALSE`.

- nticks:

  Specifies the maximum number of ticks for the particular axis. The
  actual number of ticks will be chosen automatically to be less than or
  equal to \`nticks\`. Has an effect only if \`tickmode\` is set to
  "auto". Integer in the interval \[0, Inf\].

- range:

  Sets the range of this axis. If the axis \`type\` is "log", then you
  must take the log of your desired range (e.g. to set the range from 1
  to 100, set the range from 0 to 2). If the axis \`type\` is "date", it
  should be date strings, like date data, though Date objects and unix
  milliseconds will be accepted and converted to strings. If the axis
  \`type\` is "category", it should be numbers, using the scale where
  each category is assigned a serial number from zero in the order it
  appears. Leaving either or both elements \`null\` impacts the default
  \`autorange\`. Vector or list of 2 element(s).

- rangemode:

  If "normal", the range is computed in relation to the extrema of the
  input data. If "tozero", the range extends to 0, regardless of the
  input data If "nonnegative", the range is non-negative, regardless of
  the input data. Applies only to linear axes. One of `"normal"`,
  `"tozero"`, `"nonnegative"`.

- separatethousands:

  If "true", even 4-digit integers are separated Logical.

- showaxeslabels:

  Sets whether or not this axis is labeled Logical.

- showbackground:

  Sets whether or not this axis' wall has a background color. Logical.

- showexponent:

  If "all", all exponents are shown besides their significands. If
  "first", only the exponent of the first tick is shown. If "last", only
  the exponent of the last tick is shown. If "none", no exponents
  appear. One of `"all"`, `"first"`, `"last"`, `"none"`.

- showgrid:

  Determines whether or not grid lines are drawn. If TRUE, the grid
  lines are drawn at every tick mark. Logical.

- showline:

  Determines whether or not a line bounding this axis is drawn. Logical.

- showspikes:

  Sets whether or not spikes starting from data points to this axis'
  wall are shown on hover. Logical.

- showticklabels:

  Determines whether or not the tick labels are drawn. Logical.

- showtickprefix:

  If "all", all tick labels are displayed with a prefix. If "first",
  only the first tick is displayed with a prefix. If "last", only the
  last tick is displayed with a suffix. If "none", tick prefixes are
  hidden. One of `"all"`, `"first"`, `"last"`, `"none"`.

- showticksuffix:

  Same as \`showtickprefix\` but for tick suffixes. One of `"all"`,
  `"first"`, `"last"`, `"none"`.

- spikecolor:

  Sets the color of the spikes. Color: a CSS color string or R color
  name.

- spikesides:

  Sets whether or not spikes extending from the projection data points
  to this axis' wall boundaries are shown on hover. Logical.

- spikethickness:

  Sets the thickness (in px) of the spikes. Number in the interval \[0,
  Inf\].

- tick0:

  Sets the placement of the first tick on this axis. Use with \`dtick\`.
  If the axis \`type\` is "log", then you must take the log of your
  starting tick (e.g. to set the starting tick to 100, set the \`tick0\`
  to 2) except when \`dtick\`="L\<f\>" (see \`dtick\` for more info). If
  the axis \`type\` is "date", it should be a date string, like date
  data. If the axis \`type\` is "category", it should be a number, using
  the scale where each category is assigned a serial number from zero in
  the order it appears. Any value.

- tickangle:

  Sets the angle of the tick labels with respect to the horizontal. For
  example, a \`tickangle\` of -90 draws the tick labels vertically.
  Angle in degrees.

- tickcolor:

  Sets the tick color. Color: a CSS color string or R color name.

- tickfont:

  **`go_layout_scene_xaxis()`**: Sets the tick font. Named list or
  `go_layout_scene_xaxis_tickfont()` object.

  **`go_layout_scene_yaxis()`**: Sets the tick font. Named list or
  `go_layout_scene_yaxis_tickfont()` object.

  **`go_layout_scene_zaxis()`**: Sets the tick font. Named list or
  `go_layout_scene_zaxis_tickfont()` object.

- tickformat:

  Sets the tick label formatting rule using d3 formatting mini-languages
  which are very similar to those in Python. For numbers, see:
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for dates
  see: https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format.
  We add two items to d3's date formatter: "%h" for half of the year as
  a decimal number as well as "%{n}f" for fractional seconds with n
  digits. For example, "2016-10-13 09:15:23.456" with tickformat
  "%H~%M~%S.%2f" would display "09~15~23.46" String.

- tickformatstops:

  **`go_layout_scene_xaxis()`**: List of named lists or
  `go_layout_scene_xaxis_tickformatstop()` objects.

  **`go_layout_scene_yaxis()`**: List of named lists or
  `go_layout_scene_yaxis_tickformatstop()` objects.

  **`go_layout_scene_zaxis()`**: List of named lists or
  `go_layout_scene_zaxis_tickformatstop()` objects.

- ticklen:

  Sets the tick length (in px). Number in the interval \[0, Inf\].

- tickmode:

  Sets the tick mode for this axis. If "auto", the number of ticks is
  set via \`nticks\`. If "linear", the placement of the ticks is
  determined by a starting position \`tick0\` and a tick step \`dtick\`
  ("linear" is the default value if \`tick0\` and \`dtick\` are
  provided). If "array", the placement of the ticks is set via
  \`tickvals\` and the tick text is \`ticktext\`. ("array" is the
  default value if \`tickvals\` is provided). One of `"auto"`,
  `"linear"`, `"array"`.

- tickprefix:

  Sets a tick label prefix. String.

- ticks:

  Determines whether ticks are drawn or not. If \*\*, this axis' ticks
  are not drawn. If "outside" ("inside"), this axis' are drawn outside
  (inside) the axis lines. One of `"outside"`, `"inside"`, `""`.

- ticksuffix:

  Sets a tick label suffix. String.

- ticktext:

  Sets the text displayed at the ticks position via \`tickvals\`. Only
  has an effect if \`tickmode\` is set to "array". Used with
  \`tickvals\`. Data array: a vector, factor, Date/POSIXct vector,
  matrix or list.

- tickvals:

  Sets the values at which ticks on this axis appear. Only has an effect
  if \`tickmode\` is set to "array". Used with \`ticktext\`. Data array:
  a vector, factor, Date/POSIXct vector, matrix or list.

- tickwidth:

  Sets the tick width (in px). Number in the interval \[0, Inf\].

- title:

  **`go_layout_scene_xaxis()`**: String (the title text), named list or
  `go_layout_scene_xaxis_title()` object.

  **`go_layout_scene_yaxis()`**: String (the title text), named list or
  `go_layout_scene_yaxis_title()` object.

  **`go_layout_scene_zaxis()`**: String (the title text), named list or
  `go_layout_scene_zaxis_title()` object.

- zeroline:

  Determines whether or not a line is drawn at along the 0 value of this
  axis. If TRUE, the zero line is drawn on top of the grid lines.
  Logical.

- zerolinecolor:

  Sets the line color of the zero line. Color: a CSS color string or R
  color name.

- zerolinewidth:

  Sets the width (in px) of the zero line. Number.

- clipmax:

  Clip autorange maximum if it goes beyond this value. Has no effect
  when \`autorangeoptions.maxallowed\` is provided. Any value.

- clipmin:

  Clip autorange minimum if it goes beyond this value. Has no effect
  when \`autorangeoptions.minallowed\` is provided. Any value.

- include:

  Extends the autorange to include this value or array of values, even
  when they fall outside the data range. Has no effect on endpoints set
  by \`autorangeoptions.minallowed\` or \`autorangeoptions.maxallowed\`.
  Subject to \`autorangeoptions.clipmin\` and
  \`autorangeoptions.clipmax\`. Any value.

- dtickrange:

  range \["min", "max"\], where "min", "max" - dtick values which
  describe some zoom level, it is possible to omit "min" or "max" value
  by passing "null" Vector or list of 2 element(s).

- enabled:

  Determines whether or not this stop is used. If \`false\`, this stop
  is ignored even within its \`dtickrange\`. Logical.

- value:

  string - dtickformat for described zoom level, the same as
  "tickformat" String.

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_scene()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

Nested objects documented here:

- `go_layout_scene_annotation()`:

  `layout.scene.annotation`

- `go_layout_scene_annotation_font()`:

  `layout.scene.annotation.font`: Sets the annotation text font.

- `go_layout_scene_annotation_hoverlabel()`:

  `layout.scene.annotation.hoverlabel`

- `go_layout_scene_annotation_hoverlabel_font()`:

  `layout.scene.annotation.hoverlabel.font`: Sets the hover label text
  font. By default uses the global hover font and size, with color from
  \`hoverlabel.bordercolor\`.

- `go_layout_scene_aspectratio()`:

  `layout.scene.aspectratio`: Sets this scene's axis aspectratio.

- `go_layout_scene_camera()`:

  `layout.scene.camera`

- `go_layout_scene_camera_center()`:

  `layout.scene.camera.center`: Sets the (x,y,z) components of the
  'center' camera vector This vector determines the translation (x,y,z)
  space about the center of this scene. By default, there is no such
  translation.

- `go_layout_scene_camera_eye()`:

  `layout.scene.camera.eye`: Sets the (x,y,z) components of the 'eye'
  camera vector. This vector determines the view point about the origin
  of this scene.

- `go_layout_scene_camera_projection()`:

  `layout.scene.camera.projection`

- `go_layout_scene_camera_up()`:

  `layout.scene.camera.up`: Sets the (x,y,z) components of the 'up'
  camera vector. This vector determines the up direction of this scene
  with respect to the page. The default is "{x: 0, y: 0, z: 1}" which
  means that the z axis points up.

- `go_layout_scene_domain()`:

  `layout.scene.domain`

- `go_layout_scene_xaxis()`:

  `layout.scene.xaxis`

- `go_layout_scene_xaxis_autorangeoptions()`:

  `layout.scene.xaxis.autorangeoptions`

- `go_layout_scene_xaxis_tickfont()`:

  `layout.scene.xaxis.tickfont`: Sets the tick font.

- `go_layout_scene_xaxis_tickformatstop()`:

  `layout.scene.xaxis.tickformatstop`

- `go_layout_scene_xaxis_title()`:

  `layout.scene.xaxis.title`

- `go_layout_scene_xaxis_title_font()`:

  `layout.scene.xaxis.title.font`: Sets this axis' title font.

- `go_layout_scene_yaxis()`:

  `layout.scene.yaxis`

- `go_layout_scene_yaxis_autorangeoptions()`:

  `layout.scene.yaxis.autorangeoptions`

- `go_layout_scene_yaxis_tickfont()`:

  `layout.scene.yaxis.tickfont`: Sets the tick font.

- `go_layout_scene_yaxis_tickformatstop()`:

  `layout.scene.yaxis.tickformatstop`

- `go_layout_scene_yaxis_title()`:

  `layout.scene.yaxis.title`

- `go_layout_scene_yaxis_title_font()`:

  `layout.scene.yaxis.title.font`: Sets this axis' title font.

- `go_layout_scene_zaxis()`:

  `layout.scene.zaxis`

- `go_layout_scene_zaxis_autorangeoptions()`:

  `layout.scene.zaxis.autorangeoptions`

- `go_layout_scene_zaxis_tickfont()`:

  `layout.scene.zaxis.tickfont`: Sets the tick font.

- `go_layout_scene_zaxis_tickformatstop()`:

  `layout.scene.zaxis.tickformatstop`

- `go_layout_scene_zaxis_title()`:

  `layout.scene.zaxis.title`

- `go_layout_scene_zaxis_title_font()`:

  `layout.scene.zaxis.title.font`: Sets this axis' title font.

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
