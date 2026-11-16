# Pie traces

A data visualized by the sectors of the pie is set in \`values\`. The
sector labels are set in \`labels\`. The sector colors are set in
\`marker.colors\`

## Usage

``` r
add_pie(fig, ...)

# Default S3 method
add_pie(
  fig,
  ...,
  data = NULL,
  automargin = NULL,
  customdata = NULL,
  direction = NULL,
  dlabel = NULL,
  domain = NULL,
  hole = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  insidetextfont = NULL,
  insidetextorientation = NULL,
  label0 = NULL,
  labels = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  marker = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  outsidetextfont = NULL,
  pull = NULL,
  rotation = NULL,
  scalegroup = NULL,
  showlegend = NULL,
  sort = NULL,
  text = NULL,
  textfont = NULL,
  textinfo = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  title = NULL,
  uid = NULL,
  uirevision = NULL,
  values = NULL,
  visible = NULL,
  row = NULL,
  col = NULL,
  skip_invalid = FALSE
)

go_pie(
  arg = NULL,
  ...,
  automargin = NULL,
  customdata = NULL,
  direction = NULL,
  dlabel = NULL,
  domain = NULL,
  hole = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  insidetextfont = NULL,
  insidetextorientation = NULL,
  label0 = NULL,
  labels = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  marker = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  outsidetextfont = NULL,
  pull = NULL,
  rotation = NULL,
  scalegroup = NULL,
  showlegend = NULL,
  sort = NULL,
  text = NULL,
  textfont = NULL,
  textinfo = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  title = NULL,
  uid = NULL,
  uirevision = NULL,
  values = NULL,
  visible = NULL,
  skip_invalid = FALSE
)

go_pie_domain(
  arg = NULL,
  ...,
  column = NULL,
  row = NULL,
  x = NULL,
  y = NULL,
  skip_invalid = FALSE
)

go_pie_hoverlabel(
  arg = NULL,
  ...,
  align = NULL,
  bgcolor = NULL,
  bordercolor = NULL,
  font = NULL,
  namelength = NULL,
  showarrow = NULL,
  skip_invalid = FALSE
)

go_pie_hoverlabel_font(
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

go_pie_insidetextfont(
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

go_pie_legendgrouptitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_pie_legendgrouptitle_font(
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

go_pie_marker(
  arg = NULL,
  ...,
  colors = NULL,
  line = NULL,
  pattern = NULL,
  skip_invalid = FALSE
)

go_pie_marker_line(
  arg = NULL,
  ...,
  color = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_pie_marker_pattern(
  arg = NULL,
  ...,
  bgcolor = NULL,
  fgcolor = NULL,
  fgopacity = NULL,
  fillmode = NULL,
  path = NULL,
  shape = NULL,
  size = NULL,
  solidity = NULL,
  skip_invalid = FALSE
)

go_pie_outsidetextfont(
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

go_pie_textfont(
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

go_pie_title(
  arg = NULL,
  ...,
  font = NULL,
  position = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_pie_title_font(
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

- fig:

  A `go_figure` object.

- ...:

  Further properties, including nested properties in "magic underscore"
  form, e.g. `marker_size = 10` for `marker = list(size = 10)`. Property
  values may be one-sided formulas, evaluated in `data` for `add_*()`
  functions.

- data:

  A data frame in which formula properties (e.g. `x = ~col`,
  `marker_size = ~col`) are evaluated. Default: the data given to
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md).
  Only the evaluated values are added to the trace.

- automargin:

  Determines whether outside text labels can push the margins. Logical.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- direction:

  Specifies the direction at which succeeding sectors follow one
  another. One of `"clockwise"`, `"counterclockwise"`.

- dlabel:

  Sets the label step. See \`label0\` for more info. Number.

- domain:

  Named list or `go_pie_domain()` object.

- hole:

  Sets the fraction of the radius to cut out of the pie. Use this to
  make a donut chart. Number in the interval \[0, 1\].

- hoverinfo:

  Determines what trace information appears on hover. Flags are rendered
  in a fixed order; use \`hovertemplate\` if you need explicit control
  over the rendered string, including the order of fields and
  surrounding text. Any combination of `"label"`, `"text"`, `"value"`,
  `"percent"`, `"name"` joined with `"+"`, or one of `"all"`, `"none"`,
  `"skip"`, or a vector of these.

- hoverlabel:

  Named list or `go_pie_hoverlabel()` object.

- hovertemplate:

  Template string used for rendering the information that appear on
  hover box. Note that this will override \`hoverinfo\`. Variables are
  inserted using %{variable}, for example "y: %{y}" as well as
  %{xother}, {%\_xother}, {%\_xother\_}, {%xother\_}. When showing info
  for several points, "xother" will be added to those with different x
  positions from the first point. An underscore before or after
  "(x\|y)other" will add a space on that side, only when this field is
  shown. Numbers are formatted using d3-format's syntax
  %{variable:d3-format}, for example "Price: %{y:\$.2f}".
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format for details on
  the formatting syntax. Dates are formatted using d3-time-format's
  syntax %{variable\|d3-time-format}, for example "Day:
  %{2019-01-01\|%A}".
  https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format for
  details on the date formatting syntax. Variables that can't be found
  will be replaced with the specifier. For example, a template of "data:
  %{x}, %{y}" will result in a value of "data: 1, %{y}" if x is 1 and y
  is missing. Variables with an undefined value will be replaced with
  the fallback value. The variables available in \`hovertemplate\` are
  the ones emitted as event data described at this link
  https://plotly.com/javascript/plotlyjs-events/#event-data.
  Additionally, all attributes that can be specified per-point (the ones
  that are \`arrayOk: true\`) are available. Finally, the template
  string has access to variables \`label\`, \`color\`, \`value\`,
  \`percent\` and \`text\`. Anything contained in tag \`\<extra\>\` is
  displayed in the secondary box, for example
  \`\<extra\>%{fullData.name}\</extra\>\`. To hide the secondary box
  completely, use an empty tag \`\<extra\>\</extra\>\`. String, or a
  vector of these.

- hovertemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- hovertext:

  Sets hover text elements associated with each sector. If a single
  string, the same string appears for all data points. If an array of
  string, the items are mapped in order of this trace's sectors. To be
  seen, trace \`hoverinfo\` must contain a "text" flag. String, or a
  vector of these.

- ids:

  Assigns id labels to each datum. These ids for object constancy of
  data points during animation. Should be an array of strings, not
  numbers or any other type. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- insidetextfont:

  Sets the font used for \`textinfo\` lying inside the sector. Named
  list or `go_pie_insidetextfont()` object.

- insidetextorientation:

  Controls the orientation of the text inside chart sectors. When set to
  "auto", text may be oriented in any direction in order to be as big as
  possible in the middle of a sector. The "horizontal" option orients
  text to be parallel with the bottom of the chart, and may make text
  smaller in order to achieve that goal. The "radial" option orients
  text along the radius of the sector. The "tangential" option orients
  text perpendicular to the radius of the sector. One of `"horizontal"`,
  `"radial"`, `"tangential"`, `"auto"`.

- label0:

  Alternate to \`labels\`. Builds a numeric set of labels. Use with
  \`dlabel\` where \`label0\` is the starting label and \`dlabel\` the
  step. Number.

- labels:

  Sets the sector labels. If \`labels\` entries are duplicated, we sum
  associated \`values\` or simply count occurrences if \`values\` is not
  provided. For other array attributes (including color) we use the
  first non-empty entry among all occurrences of the label. Data array:
  a vector, factor, Date/POSIXct vector, matrix or list.

- legend:

  Sets the reference to a legend to show the pie slices in. Can be an
  array if \`values\` is set. In that case, each entry specifies the
  legend reference for one slice. References to these legends are
  "legend", "legend2", "legend3", etc. Settings for these legends are
  set in the layout, under \`layout.legend\`, \`layout.legend2\`, etc.
  Subplot id: `"legend"`, `"legend2"`, `"legend3"`, ....

- legendgroup:

  Sets the legend group for this trace. Traces and shapes part of the
  same legend group hide/show at the same time when toggling legend
  items. String.

- legendgrouptitle:

  Named list or `go_pie_legendgrouptitle()` object.

- legendrank:

  Sets the legend rank for this pie. If passed as an array, this will
  set the legend rank of the individual pie slices. Items and groups
  with smaller ranks are presented on top/left side while with
  "reversed" \`legend.traceorder\` they are on bottom/right side. The
  default legendrank is 1000, so that you can use ranks less than 1000
  to place certain items before all unranked items, and ranks greater
  than 1000 to go after all unranked items. When having unranked or
  equal rank items shapes would be displayed after traces i.e. according
  to their order in data and layout. Number, or a vector of these.

- legendwidth:

  Sets the width (in px or fraction) of the legend for this trace.
  Number in the interval \[0, Inf\].

- marker:

  Named list or `go_pie_marker()` object.

- meta:

  Assigns extra meta information associated with this trace that can be
  used in various text attributes. Attributes such as trace \`name\`,
  graph, axis and colorbar \`title.text\`, annotation \`text\`
  \`rangeselector\`, \`updatemenues\` and \`sliders\` \`label\` text all
  support \`meta\`. To access the trace \`meta\` values in an attribute
  in the same trace, simply use \`%{meta\[i\]}\` where \`i\` is the
  index or key of the \`meta\` item in question. To access trace
  \`meta\` in layout attributes, use \`%{data\[n\[.meta\[i\]}\` where
  \`i\` is the index or key of the \`meta\` and \`n\` is the trace
  index. Any value.

- name:

  Sets the trace name. The trace name appears as the legend item and on
  hover. String.

- opacity:

  Sets the opacity of the trace. Number in the interval \[0, 1\].

- outsidetextfont:

  Sets the font used for \`textinfo\` lying outside the sector. Named
  list or `go_pie_outsidetextfont()` object.

- pull:

  Sets the fraction of larger radius to pull the sectors out from the
  center. This can be a constant to pull all slices apart from each
  other equally or an array to highlight one or more slices. Number in
  the interval \[0, 1\], or a vector of these.

- rotation:

  Instead of the first slice starting at 12 o'clock, rotate to some
  other angle. Angle in degrees.

- scalegroup:

  If there are multiple pie charts that should be sized according to
  their totals, link them by providing a non-empty group id here shared
  by every trace in the same group. String.

- showlegend:

  Determines whether or not items corresponding to the pie slices are
  shown in the legend. Can be an array if \`values\` is set. In that
  case, each entry specifies appearance in the legend for one slice.
  Logical, or a vector of these.

- sort:

  Determines whether or not the sectors are reordered from largest to
  smallest. Logical.

- text:

  **`go_pie()`**: Sets text elements associated with each sector. If
  trace \`textinfo\` contains a "text" flag, these elements will be seen
  on the chart. If trace \`hoverinfo\` contains a "text" flag and
  "hovertext" is not set, these elements will be seen in the hover
  labels. Data array: a vector, factor, Date/POSIXct vector, matrix or
  list.

  **`go_pie_legendgrouptitle()`**: Sets the title of the legend group.
  String.

  **`go_pie_title()`**: Sets the title of the chart. If it is empty, no
  title is displayed. String.

- textfont:

  Sets the font used for \`textinfo\`. Named list or `go_pie_textfont()`
  object.

- textinfo:

  Determines what trace information appears on the graph. Flags are
  rendered in a fixed order; use \`texttemplate\` if you need explicit
  control over the rendered string, including the order of fields and
  surrounding text. Any combination of `"label"`, `"text"`, `"value"`,
  `"percent"` joined with `"+"`, or one of `"none"`.

- textposition:

  Specifies the location of the \`textinfo\`. One of `"inside"`,
  `"outside"`, `"auto"`, `"none"`, or a vector of these.

- texttemplate:

  Template string used for rendering the information text that appears
  on points. Note that this will override \`textinfo\`. Variables are
  inserted using %{variable}, for example "y: %{y}". Numbers are
  formatted using d3-format's syntax %{variable:d3-format}, for example
  "Price: %{y:\$.2f}".
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format for details on
  the formatting syntax. Dates are formatted using d3-time-format's
  syntax %{variable\|d3-time-format}, for example "Day:
  %{2019-01-01\|%A}".
  https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format for
  details on the date formatting syntax. Variables that can't be found
  will be replaced with the specifier. For example, a template of "data:
  %{x}, %{y}" will result in a value of "data: 1, %{y}" if x is 1 and y
  is missing. Variables with an undefined value will be replaced with
  the fallback value. All attributes that can be specified per-point
  (the ones that are \`arrayOk: true\`) are available. Finally, the
  template string has access to variables \`label\`, \`color\`,
  \`value\`, \`percent\` and \`text\`. String, or a vector of these.

- texttemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- title:

  String (the title text), named list or `go_pie_title()` object.

- uid:

  Assign an id to this trace, Use this to provide object constancy
  between traces during animations and transitions. String.

- uirevision:

  Controls persistence of some user-driven changes to the trace:
  \`constraintrange\` in \`parcoords\` traces, as well as some
  \`editable: true\` modifications such as \`name\` and
  \`colorbar.title\`. Defaults to \`layout.uirevision\`. Note that other
  user-driven trace attribute changes are controlled by \`layout\`
  attributes: \`trace.visible\` is controlled by
  \`layout.legend.uirevision\`, \`selectedpoints\` is controlled by
  \`layout.selectionrevision\`, and \`colorbar.(x\|y)\` (accessible with
  \`config: {editable: true}\`) is controlled by
  \`layout.editrevision\`. Trace changes are tracked by \`uid\`, which
  only falls back on trace index if no \`uid\` is provided. So if your
  app can add/remove traces before the end of the \`data\` array, such
  that the same trace has a different index, you can still preserve
  user-driven changes if you give each trace a \`uid\` that stays with
  it as it moves. Any value.

- values:

  Sets the values of the sectors. If omitted, we count occurrences of
  each label. Data array: a vector, factor, Date/POSIXct vector, matrix
  or list.

- visible:

  Determines whether or not this trace is visible. If "legendonly", the
  trace is not drawn, but can appear as a legend item (provided that the
  legend itself is visible). One of `"legendonly"`, `TRUE`, `FALSE`.

- row:

  **`add_pie()`**: Subplot grid row (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

  **`go_pie_domain()`**: If there is a layout grid, use the domain for
  this row in the grid for this pie trace. Integer in the interval \[0,
  Inf\].

- col:

  Subplot grid column (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from (constructors). Named arguments take precedence.

- column:

  If there is a layout grid, use the domain for this column in the grid
  for this pie trace. Integer in the interval \[0, Inf\].

- x:

  Sets the horizontal domain of this pie trace (in plot fraction).
  Vector or list of 2 element(s).

- y:

  Sets the vertical domain of this pie trace (in plot fraction). Vector
  or list of 2 element(s).

- align:

  Sets the horizontal alignment of the text content within hover label
  box. Has an effect only if the hover label text spans two or more
  lines One of `"left"`, `"right"`, `"auto"`, or a vector of these.

- bgcolor:

  **`go_pie_hoverlabel()`**: Sets the background color of the hover
  labels for this trace Color: a CSS color string or R color name, or a
  vector of these.

  **`go_pie_marker_pattern()`**: When there is no colorscale sets the
  color of background pattern fill. Defaults to a \`marker.color\`
  background when \`fillmode\` is "overlay". Otherwise, defaults to a
  transparent background. Color: a CSS color string or R color name, or
  a vector of these.

- bordercolor:

  Sets the border color of the hover labels for this trace. Color: a CSS
  color string or R color name, or a vector of these.

- font:

  **`go_pie_hoverlabel()`**: Sets the font used in hover labels. Named
  list or `go_pie_hoverlabel_font()` object.

  **`go_pie_legendgrouptitle()`**: Sets this legend group's title font.
  Named list or `go_pie_legendgrouptitle_font()` object.

  **`go_pie_title()`**: Sets the font used for \`title\`. Named list or
  `go_pie_title_font()` object.

- namelength:

  Sets the default length (in number of characters) of the trace name in
  the hover labels for all traces. -1 shows the whole name regardless of
  length. 0-3 shows the first 0-3 characters, and an integer \>3 will
  show the whole name if it is less than that many characters, but if it
  is longer, will truncate to \`namelength - 3\` characters and add an
  ellipsis. Integer in the interval \[-1, Inf\], or a vector of these.

- showarrow:

  Sets whether or not to show the hover label arrow/triangle pointing to
  the data point. Logical.

- color:

  **`go_pie_hoverlabel_font()`, `go_pie_insidetextfont()`,
  `go_pie_outsidetextfont()`, `go_pie_textfont()`,
  `go_pie_title_font()`**: Color: a CSS color string or R color name, or
  a vector of these.

  **`go_pie_legendgrouptitle_font()`**: Color: a CSS color string or R
  color name.

  **`go_pie_marker_line()`**: Sets the color of the line enclosing each
  sector. Color: a CSS color string or R color name, or a vector of
  these.

- family:

  **`go_pie_hoverlabel_font()`, `go_pie_insidetextfont()`,
  `go_pie_outsidetextfont()`, `go_pie_textfont()`,
  `go_pie_title_font()`**: HTML font family - the typeface that will be
  applied by the web browser. The web browser can only apply a font if
  it is available on the system where it runs. Provide multiple font
  families, separated by commas, to indicate the order in which to apply
  fonts if they aren't available. String, or a vector of these.

  **`go_pie_legendgrouptitle_font()`**: HTML font family - the typeface
  that will be applied by the web browser. The web browser can only
  apply a font if it is available on the system where it runs. Provide
  multiple font families, separated by commas, to indicate the order in
  which to apply fonts if they aren't available. String.

- lineposition:

  **`go_pie_hoverlabel_font()`, `go_pie_insidetextfont()`,
  `go_pie_outsidetextfont()`, `go_pie_textfont()`,
  `go_pie_title_font()`**: Sets the kind of decoration line(s) with
  text, such as an "under", "over" or "through" as well as combinations
  e.g. "under+over", etc. Any combination of `"under"`, `"over"`,
  `"through"` joined with `"+"`, or one of `"none"`, or a vector of
  these.

  **`go_pie_legendgrouptitle_font()`**: Sets the kind of decoration
  line(s) with text, such as an "under", "over" or "through" as well as
  combinations e.g. "under+over", etc. Any combination of `"under"`,
  `"over"`, `"through"` joined with `"+"`, or one of `"none"`.

- shadow:

  **`go_pie_hoverlabel_font()`, `go_pie_insidetextfont()`,
  `go_pie_outsidetextfont()`, `go_pie_textfont()`,
  `go_pie_title_font()`**: Sets the shape and color of the shadow behind
  text. "auto" places minimal shadow and applies contrast text font
  color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String, or a vector of these.

  **`go_pie_legendgrouptitle_font()`**: Sets the shape and color of the
  shadow behind text. "auto" places minimal shadow and applies contrast
  text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String.

- size:

  **`go_pie_hoverlabel_font()`, `go_pie_insidetextfont()`,
  `go_pie_outsidetextfont()`, `go_pie_textfont()`,
  `go_pie_title_font()`**: Number in the interval \[1, Inf\], or a
  vector of these.

  **`go_pie_legendgrouptitle_font()`**: Number in the interval \[1,
  Inf\].

  **`go_pie_marker_pattern()`**: Sets the size of unit squares of the
  pattern fill in pixels, which corresponds to the interval of
  repetition of the pattern. Number in the interval \[0, Inf\], or a
  vector of these.

- style:

  **`go_pie_hoverlabel_font()`, `go_pie_insidetextfont()`,
  `go_pie_outsidetextfont()`, `go_pie_textfont()`,
  `go_pie_title_font()`**: Sets whether a font should be styled with a
  normal or italic face from its family. One of `"normal"`, `"italic"`,
  or a vector of these.

  **`go_pie_legendgrouptitle_font()`**: Sets whether a font should be
  styled with a normal or italic face from its family. One of
  `"normal"`, `"italic"`.

- textcase:

  **`go_pie_hoverlabel_font()`, `go_pie_insidetextfont()`,
  `go_pie_outsidetextfont()`, `go_pie_textfont()`,
  `go_pie_title_font()`**: Sets capitalization of text. It can be used
  to make text appear in all-uppercase or all-lowercase, or with each
  word capitalized. One of `"normal"`, `"word caps"`, `"upper"`,
  `"lower"`, or a vector of these.

  **`go_pie_legendgrouptitle_font()`**: Sets capitalization of text. It
  can be used to make text appear in all-uppercase or all-lowercase, or
  with each word capitalized. One of `"normal"`, `"word caps"`,
  `"upper"`, `"lower"`.

- variant:

  **`go_pie_hoverlabel_font()`, `go_pie_insidetextfont()`,
  `go_pie_outsidetextfont()`, `go_pie_textfont()`,
  `go_pie_title_font()`**: Sets the variant of the font. One of
  `"normal"`, `"small-caps"`, `"all-small-caps"`, `"all-petite-caps"`,
  `"petite-caps"`, `"unicase"`, or a vector of these.

  **`go_pie_legendgrouptitle_font()`**: Sets the variant of the font.
  One of `"normal"`, `"small-caps"`, `"all-small-caps"`,
  `"all-petite-caps"`, `"petite-caps"`, `"unicase"`.

- weight:

  **`go_pie_hoverlabel_font()`, `go_pie_insidetextfont()`,
  `go_pie_outsidetextfont()`, `go_pie_textfont()`,
  `go_pie_title_font()`**: Sets the weight (or boldness) of the font.
  Integer in the interval \[1, 1000\], or a vector of these.

  **`go_pie_legendgrouptitle_font()`**: Sets the weight (or boldness) of
  the font. Integer in the interval \[1, 1000\].

- colors:

  Sets the color of each sector. If not specified, the default trace
  color set is used to pick the sector colors. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

- line:

  Named list or `go_pie_marker_line()` object.

- pattern:

  Sets the pattern within the marker. Named list or
  `go_pie_marker_pattern()` object.

- width:

  Sets the width (in px) of the line enclosing each sector. Number in
  the interval \[0, Inf\], or a vector of these.

- fgcolor:

  When there is no colorscale sets the color of foreground pattern fill.
  Defaults to a \`marker.color\` background when \`fillmode\` is
  "replace". Otherwise, defaults to dark grey or white to increase
  contrast with the \`bgcolor\`. Color: a CSS color string or R color
  name, or a vector of these.

- fgopacity:

  Sets the opacity of the foreground pattern fill. Defaults to a 0.5
  when \`fillmode\` is "overlay". Otherwise, defaults to 1. Number in
  the interval \[0, 1\].

- fillmode:

  Determines whether \`marker.color\` should be used as a default to
  \`bgcolor\` or a \`fgcolor\`. One of `"replace"`, `"overlay"`.

- path:

  Sets a custom path for pattern fill. Use with no \`shape\` or
  \`solidity\`, provide an SVG path string for the regions of the square
  from (0,0) to (\`size\`,\`size\`) to color. String, or a vector of
  these.

- shape:

  Sets the shape of the pattern fill. By default, no pattern is used for
  filling the area. One of `""`, `"/"`, `"\\"`, `"x"`, `"-"`, `"|"`,
  `"+"`, `"."`, or a vector of these.

- solidity:

  Sets the solidity of the pattern fill. Solidity is roughly the
  fraction of the area filled by the pattern. Solidity of 0 shows only
  the background color without pattern and solidty of 1 shows only the
  foreground color without pattern. Number in the interval \[0, 1\], or
  a vector of these.

- position:

  Specifies the location of the \`title\`. One of `"top left"`,
  `"top center"`, `"top right"`, `"middle center"`, `"bottom left"`,
  `"bottom center"`, `"bottom right"`.

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_pie()` and the nested object constructors below create validated
graph objects (named lists). Every property is checked against the
plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
`add_pie()` creates an object and adds it to a figure.

Nested objects documented here:

- `go_pie_domain()`:

  `pie.domain`

- `go_pie_hoverlabel()`:

  `pie.hoverlabel`

- `go_pie_hoverlabel_font()`:

  `pie.hoverlabel.font`: Sets the font used in hover labels.

- `go_pie_insidetextfont()`:

  `pie.insidetextfont`: Sets the font used for \`textinfo\` lying inside
  the sector.

- `go_pie_legendgrouptitle()`:

  `pie.legendgrouptitle`

- `go_pie_legendgrouptitle_font()`:

  `pie.legendgrouptitle.font`: Sets this legend group's title font.

- `go_pie_marker()`:

  `pie.marker`

- `go_pie_marker_line()`:

  `pie.marker.line`

- `go_pie_marker_pattern()`:

  `pie.marker.pattern`: Sets the pattern within the marker.

- `go_pie_outsidetextfont()`:

  `pie.outsidetextfont`: Sets the font used for \`textinfo\` lying
  outside the sector.

- `go_pie_textfont()`:

  `pie.textfont`: Sets the font used for \`textinfo\`.

- `go_pie_title()`:

  `pie.title`

- `go_pie_title_font()`:

  `pie.title.font`: Sets the font used for \`title\`.

## See also

[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)

## Examples

``` r
go_pie()
#> <go_pie>
#> {
#>   "type": "pie"
#> }
#> 
```
