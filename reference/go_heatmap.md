# Heatmap traces

The data that describes the heatmap value-to-color mapping is set in
\`z\`. Data in \`z\` can either be a matrix of values (ragged or not) or
a 1D array of values. In the case where \`z\` is a matrix, say that
\`z\` has N rows and M columns. Then, by default, the resulting heatmap
will have N partitions along the y axis and M partitions along the x
axis. In other words, the i-th row/ j-th column cell in \`z\` is mapped
to the i-th partition of the y axis (starting from the bottom of the
plot) and the j-th partition of the x-axis (starting from the left of
the plot). This behavior can be flipped by using \`transpose\`.
Moreover, \`x\` (\`y\`) can be provided with M or M+1 (N or N+1)
elements. If M (N), then the coordinates correspond to the center of the
heatmap cells and the cells have equal width. If M+1 (N+1), then the
coordinates correspond to the edges of the heatmap cells. In the case
where \`z\` is a 1D vector, the x and y coordinates must be provided in
\`x\` and \`y\` respectively to form data triplets.

## Usage

``` r
add_heatmap(fig, ...)

# Default S3 method
add_heatmap(
  fig,
  ...,
  data = NULL,
  autocolorscale = NULL,
  coloraxis = NULL,
  colorbar = NULL,
  colorscale = NULL,
  connectgaps = NULL,
  customdata = NULL,
  dx = NULL,
  dy = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hoverongaps = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  reversescale = NULL,
  showlegend = NULL,
  showscale = NULL,
  text = NULL,
  textfont = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  transpose = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  x = NULL,
  x0 = NULL,
  xaxis = NULL,
  xcalendar = NULL,
  xgap = NULL,
  xhoverformat = NULL,
  xperiod = NULL,
  xperiod0 = NULL,
  xperiodalignment = NULL,
  xtype = NULL,
  y = NULL,
  y0 = NULL,
  yaxis = NULL,
  ycalendar = NULL,
  ygap = NULL,
  yhoverformat = NULL,
  yperiod = NULL,
  yperiod0 = NULL,
  yperiodalignment = NULL,
  ytype = NULL,
  z = NULL,
  zauto = NULL,
  zhoverformat = NULL,
  zmax = NULL,
  zmid = NULL,
  zmin = NULL,
  zorder = NULL,
  zsmooth = NULL,
  row = NULL,
  col = NULL,
  secondary_y = NULL,
  skip_invalid = FALSE
)

go_heatmap(
  arg = NULL,
  ...,
  autocolorscale = NULL,
  coloraxis = NULL,
  colorbar = NULL,
  colorscale = NULL,
  connectgaps = NULL,
  customdata = NULL,
  dx = NULL,
  dy = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hoverongaps = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  meta = NULL,
  name = NULL,
  opacity = NULL,
  reversescale = NULL,
  showlegend = NULL,
  showscale = NULL,
  text = NULL,
  textfont = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  transpose = NULL,
  uid = NULL,
  uirevision = NULL,
  visible = NULL,
  x = NULL,
  x0 = NULL,
  xaxis = NULL,
  xcalendar = NULL,
  xgap = NULL,
  xhoverformat = NULL,
  xperiod = NULL,
  xperiod0 = NULL,
  xperiodalignment = NULL,
  xtype = NULL,
  y = NULL,
  y0 = NULL,
  yaxis = NULL,
  ycalendar = NULL,
  ygap = NULL,
  yhoverformat = NULL,
  yperiod = NULL,
  yperiod0 = NULL,
  yperiodalignment = NULL,
  ytype = NULL,
  z = NULL,
  zauto = NULL,
  zhoverformat = NULL,
  zmax = NULL,
  zmid = NULL,
  zmin = NULL,
  zorder = NULL,
  zsmooth = NULL,
  skip_invalid = FALSE
)

go_heatmap_colorbar(
  arg = NULL,
  ...,
  bgcolor = NULL,
  bordercolor = NULL,
  borderwidth = NULL,
  dtick = NULL,
  exponentformat = NULL,
  labelalias = NULL,
  len = NULL,
  lenmode = NULL,
  minexponent = NULL,
  nticks = NULL,
  orientation = NULL,
  outlinecolor = NULL,
  outlinewidth = NULL,
  separatethousands = NULL,
  showexponent = NULL,
  showticklabels = NULL,
  showtickprefix = NULL,
  showticksuffix = NULL,
  thickness = NULL,
  thicknessmode = NULL,
  tick0 = NULL,
  tickangle = NULL,
  tickcolor = NULL,
  tickfont = NULL,
  tickformat = NULL,
  tickformatstops = NULL,
  ticklabeloverflow = NULL,
  ticklabelposition = NULL,
  ticklabelstep = NULL,
  ticklen = NULL,
  tickmode = NULL,
  tickprefix = NULL,
  ticks = NULL,
  ticksuffix = NULL,
  ticktext = NULL,
  tickvals = NULL,
  tickwidth = NULL,
  title = NULL,
  x = NULL,
  xanchor = NULL,
  xpad = NULL,
  xref = NULL,
  y = NULL,
  yanchor = NULL,
  ypad = NULL,
  yref = NULL,
  skip_invalid = FALSE
)

go_heatmap_colorbar_tickfont(
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

go_heatmap_colorbar_tickformatstop(
  arg = NULL,
  ...,
  dtickrange = NULL,
  enabled = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  skip_invalid = FALSE
)

go_heatmap_colorbar_title(
  arg = NULL,
  ...,
  font = NULL,
  side = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_heatmap_colorbar_title_font(
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

go_heatmap_hoverlabel(
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

go_heatmap_hoverlabel_font(
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

go_heatmap_legendgrouptitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_heatmap_legendgrouptitle_font(
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

go_heatmap_textfont(
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

- autocolorscale:

  Determines whether the colorscale is a default palette
  (\`autocolorscale: true\`) or the palette determined by
  \`colorscale\`. In case \`colorscale\` is unspecified or
  \`autocolorscale\` is true, the default palette will be chosen
  according to whether numbers in the \`color\` array are all positive,
  all negative or mixed. Logical.

- coloraxis:

  Sets a reference to a shared color axis. References to these shared
  color axes are "coloraxis", "coloraxis2", "coloraxis3", etc. Settings
  for these shared color axes are set in the layout, under
  \`layout.coloraxis\`, \`layout.coloraxis2\`, etc. Note that multiple
  color scales can be linked to the same color axis. Subplot id:
  `"coloraxis"`, `"coloraxis2"`, `"coloraxis3"`, ....

- colorbar:

  Named list or `go_heatmap_colorbar()` object.

- colorscale:

  Sets the colorscale. The colorscale must be an array containing arrays
  mapping a normalized value to an rgb, rgba, hex, hsl, hsla, hwb, or
  named color string. At minimum, a mapping for the lowest (0) and
  highest (1) values are required. For example, \`\[\[0,
  'rgb(0,0,255)'\], \[1, 'rgb(255,0,0)'\]\]\`. To control the bounds of
  the colorscale in color space, use \`zmin\` and \`zmax\`.
  Alternatively, \`colorscale\` may be a palette name string of the
  following list:
  Blackbody,Bluered,Blues,Cividis,Earth,Electric,Greens,Greys,Hot,Jet,Picnic,Portland,Rainbow,RdBu,Reds,Viridis,YlGnBu,YlOrRd.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

- connectgaps:

  Determines whether or not gaps (i.e. {nan} or missing values) in the
  \`z\` data are filled in. It is defaulted to true if \`z\` is a one
  dimensional array and \`zsmooth\` is not false; otherwise it is
  defaulted to false. Logical.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- dx:

  Sets the x coordinate step. See \`x0\` for more info. Number.

- dy:

  Sets the y coordinate step. See \`y0\` for more info. Number.

- hoverinfo:

  Determines what trace information appears on hover. If \`none\` or
  \`skip\` are set, no information is displayed upon hovering. But, if
  \`none\` is set, click and hover events are still fired. Any
  combination of `"x"`, `"y"`, `"z"`, `"text"`, `"name"` joined with
  `"+"`, or one of `"all"`, `"none"`, `"skip"`, or a vector of these.

- hoverlabel:

  Named list or `go_heatmap_hoverlabel()` object.

- hoverongaps:

  Determines whether or not gaps (i.e. {nan} or missing values) in the
  \`z\` data have hover labels associated with them. Logical.

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
  that are \`arrayOk: true\`) are available. Anything contained in tag
  \`\<extra\>\` is displayed in the secondary box, for example
  \`\<extra\>%{fullData.name}\</extra\>\`. To hide the secondary box
  completely, use an empty tag \`\<extra\>\</extra\>\`. String, or a
  vector of these.

- hovertemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- hovertext:

  Same as \`text\`. Data array: a vector, factor, Date/POSIXct vector,
  matrix or list.

- ids:

  Assigns id labels to each datum. These ids for object constancy of
  data points during animation. Should be an array of strings, not
  numbers or any other type. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- legend:

  Sets the reference to a legend to show this trace in. References to
  these legends are "legend", "legend2", "legend3", etc. Settings for
  these legends are set in the layout, under \`layout.legend\`,
  \`layout.legend2\`, etc. Subplot id: `"legend"`, `"legend2"`,
  `"legend3"`, ....

- legendgroup:

  Sets the legend group for this trace. Traces and shapes part of the
  same legend group hide/show at the same time when toggling legend
  items. String.

- legendgrouptitle:

  Named list or `go_heatmap_legendgrouptitle()` object.

- legendrank:

  Sets the legend rank for this trace. Items and groups with smaller
  ranks are presented on top/left side while with "reversed"
  \`legend.traceorder\` they are on bottom/right side. The default
  legendrank is 1000, so that you can use ranks less than 1000 to place
  certain items before all unranked items, and ranks greater than 1000
  to go after all unranked items. When having unranked or equal rank
  items shapes would be displayed after traces i.e. according to their
  order in data and layout. Number.

- legendwidth:

  Sets the width (in px or fraction) of the legend for this trace.
  Number in the interval \[0, Inf\].

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

  **`go_heatmap()`**: Sets the trace name. The trace name appears as the
  legend item and on hover. String.

  **`go_heatmap_colorbar_tickformatstop()`**: When used in a template,
  named items are created in the output figure in addition to any items
  the figure already has in this array. You can modify these items in
  the output figure by making your own item with \`templateitemname\`
  matching this \`name\` alongside your modifications (including
  \`visible: false\` or \`enabled: false\` to hide it). Has no effect
  outside of a template. String.

- opacity:

  Sets the opacity of the trace. Number in the interval \[0, 1\].

- reversescale:

  Reverses the color mapping if true. If true, \`zmin\` will correspond
  to the last color in the array and \`zmax\` will correspond to the
  first color. Logical.

- showlegend:

  Determines whether or not an item corresponding to this trace is shown
  in the legend. Logical.

- showscale:

  Determines whether or not a colorbar is displayed for this trace.
  Logical.

- text:

  **`go_heatmap()`**: Sets the text elements associated with each z
  value. Data array: a vector, factor, Date/POSIXct vector, matrix or
  list.

  **`go_heatmap_colorbar_title()`**: Sets the title of the color bar.
  String.

  **`go_heatmap_legendgrouptitle()`**: Sets the title of the legend
  group. String.

- textfont:

  Sets the text font. Named list or `go_heatmap_textfont()` object.

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
  template string has access to variables \`x\`, \`y\`, \`z\` and
  \`text\`. String.

- texttemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- transpose:

  Transposes the z data. Logical.

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

- visible:

  Determines whether or not this trace is visible. If "legendonly", the
  trace is not drawn, but can appear as a legend item (provided that the
  legend itself is visible). One of `"legendonly"`, `TRUE`, `FALSE`.

- x:

  **`go_heatmap()`**: Sets the x coordinates. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

  **`go_heatmap_colorbar()`**: Sets the x position with respect to
  \`xref\` of the color bar (in plot fraction). When \`xref\` is
  "paper", defaults to 1.02 when \`orientation\` is "v" and 0.5 when
  \`orientation\` is "h". When \`xref\` is "container", defaults to 1
  when \`orientation\` is "v" and 0.5 when \`orientation\` is "h". Must
  be between 0 and 1 if \`xref\` is "container" and between "-2" and 3
  if \`xref\` is "paper". Number.

- x0:

  Alternate to \`x\`. Builds a linear space of x coordinates. Use with
  \`dx\` where \`x0\` is the starting coordinate and \`dx\` the step.
  Any value.

- xaxis:

  Sets a reference between this trace's x coordinates and a 2D cartesian
  x axis. If "x" (the default value), the x coordinates refer to
  \`layout.xaxis\`. If "x2", the x coordinates refer to
  \`layout.xaxis2\`, and so on. Subplot id: `"x"`, `"x2"`, `"x3"`, ....

- xcalendar:

  Sets the calendar system to use with \`x\` date data. One of
  `"chinese"`, `"coptic"`, `"discworld"`, `"ethiopian"`, `"gregorian"`,
  `"hebrew"`, `"islamic"`, `"jalali"`, `"julian"`, `"mayan"`,
  `"nanakshahi"`, `"nepali"`, `"persian"`, `"taiwan"`, `"thai"`,
  `"ummalqura"`.

- xgap:

  Sets the horizontal gap (in pixels) between bricks. Number in the
  interval \[0, Inf\].

- xhoverformat:

  Sets the hover text formatting rule for \`x\` using d3 formatting
  mini-languages which are very similar to those in Python. For numbers,
  see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for
  dates see:
  https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format. We add
  two items to d3's date formatter: "%h" for half of the year as a
  decimal number as well as "%{n}f" for fractional seconds with n
  digits. For example, "2016-10-13 09:15:23.456" with tickformat
  "%H~%M~%S.%2f" would display "09~15~23.46"By default the values are
  formatted using \`xaxis.hoverformat\`. String.

- xperiod:

  Only relevant when the axis \`type\` is "date". Sets the period
  positioning in milliseconds or "M\<n\>" on the x axis. Special values
  in the form of "M\<n\>" could be used to declare the number of months.
  In this case \`n\` must be a positive integer. Any value.

- xperiod0:

  Only relevant when the axis \`type\` is "date". Sets the base for
  period positioning in milliseconds or date string on the x0 axis. When
  \`x0period\` is round number of weeks, the \`x0period0\` by default
  would be on a Sunday i.e. 2000-01-02, otherwise it would be at
  2000-01-01. Any value.

- xperiodalignment:

  Only relevant when the axis \`type\` is "date". Sets the alignment of
  data points on the x axis. One of `"start"`, `"middle"`, `"end"`.

- xtype:

  If "array", the heatmap's x coordinates are given by "x" (the default
  behavior when \`x\` is provided). If "scaled", the heatmap's x
  coordinates are given by "x0" and "dx" (the default behavior when
  \`x\` is not provided). One of `"array"`, `"scaled"`.

- y:

  **`go_heatmap()`**: Sets the y coordinates. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

  **`go_heatmap_colorbar()`**: Sets the y position with respect to
  \`yref\` of the color bar (in plot fraction). When \`yref\` is
  "paper", defaults to 0.5 when \`orientation\` is "v" and 1.02 when
  \`orientation\` is "h". When \`yref\` is "container", defaults to 0.5
  when \`orientation\` is "v" and 1 when \`orientation\` is "h". Must be
  between 0 and 1 if \`yref\` is "container" and between "-2" and 3 if
  \`yref\` is "paper". Number.

- y0:

  Alternate to \`y\`. Builds a linear space of y coordinates. Use with
  \`dy\` where \`y0\` is the starting coordinate and \`dy\` the step.
  Any value.

- yaxis:

  Sets a reference between this trace's y coordinates and a 2D cartesian
  y axis. If "y" (the default value), the y coordinates refer to
  \`layout.yaxis\`. If "y2", the y coordinates refer to
  \`layout.yaxis2\`, and so on. Subplot id: `"y"`, `"y2"`, `"y3"`, ....

- ycalendar:

  Sets the calendar system to use with \`y\` date data. One of
  `"chinese"`, `"coptic"`, `"discworld"`, `"ethiopian"`, `"gregorian"`,
  `"hebrew"`, `"islamic"`, `"jalali"`, `"julian"`, `"mayan"`,
  `"nanakshahi"`, `"nepali"`, `"persian"`, `"taiwan"`, `"thai"`,
  `"ummalqura"`.

- ygap:

  Sets the vertical gap (in pixels) between bricks. Number in the
  interval \[0, Inf\].

- yhoverformat:

  Sets the hover text formatting rule for \`y\` using d3 formatting
  mini-languages which are very similar to those in Python. For numbers,
  see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for
  dates see:
  https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format. We add
  two items to d3's date formatter: "%h" for half of the year as a
  decimal number as well as "%{n}f" for fractional seconds with n
  digits. For example, "2016-10-13 09:15:23.456" with tickformat
  "%H~%M~%S.%2f" would display "09~15~23.46"By default the values are
  formatted using \`yaxis.hoverformat\`. String.

- yperiod:

  Only relevant when the axis \`type\` is "date". Sets the period
  positioning in milliseconds or "M\<n\>" on the y axis. Special values
  in the form of "M\<n\>" could be used to declare the number of months.
  In this case \`n\` must be a positive integer. Any value.

- yperiod0:

  Only relevant when the axis \`type\` is "date". Sets the base for
  period positioning in milliseconds or date string on the y0 axis. When
  \`y0period\` is round number of weeks, the \`y0period0\` by default
  would be on a Sunday i.e. 2000-01-02, otherwise it would be at
  2000-01-01. Any value.

- yperiodalignment:

  Only relevant when the axis \`type\` is "date". Sets the alignment of
  data points on the y axis. One of `"start"`, `"middle"`, `"end"`.

- ytype:

  If "array", the heatmap's y coordinates are given by "y" (the default
  behavior when \`y\` is provided) If "scaled", the heatmap's y
  coordinates are given by "y0" and "dy" (the default behavior when
  \`y\` is not provided) One of `"array"`, `"scaled"`.

- z:

  Sets the z data. Data array: a vector, factor, Date/POSIXct vector,
  matrix or list.

- zauto:

  Determines whether or not the color domain is computed with respect to
  the input data (here in \`z\`) or the bounds set in \`zmin\` and
  \`zmax\` Defaults to \`false\` when \`zmin\` and \`zmax\` are set by
  the user. Logical.

- zhoverformat:

  Sets the hover text formatting rule for \`z\` using d3 formatting
  mini-languages which are very similar to those in Python. For numbers,
  see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format.By default
  the values are formatted using generic number format. String.

- zmax:

  Sets the upper bound of the color domain. Value should have the same
  units as in \`z\` and if set, \`zmin\` must be set as well. Number.

- zmid:

  Sets the mid-point of the color domain by scaling \`zmin\` and/or
  \`zmax\` to be equidistant to this point. Value should have the same
  units as in \`z\`. Has no effect when \`zauto\` is \`false\`. Number.

- zmin:

  Sets the lower bound of the color domain. Value should have the same
  units as in \`z\` and if set, \`zmax\` must be set as well. Number.

- zorder:

  Sets the layer on which this trace is displayed, relative to other SVG
  traces on the same subplot. SVG traces with higher \`zorder\` appear
  in front of those with lower \`zorder\`. Integer.

- zsmooth:

  Picks a smoothing algorithm use to smooth \`z\` data. One of `"fast"`,
  `"best"`, `FALSE`.

- row:

  Subplot grid row (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

- col:

  Subplot grid column (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

- secondary_y:

  If `TRUE`, use the secondary y axis of the subplot.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from (constructors). Named arguments take precedence.

- bgcolor:

  **`go_heatmap_colorbar()`**: Sets the color of padded area. Color: a
  CSS color string or R color name.

  **`go_heatmap_hoverlabel()`**: Sets the background color of the hover
  labels for this trace Color: a CSS color string or R color name, or a
  vector of these.

- bordercolor:

  **`go_heatmap_colorbar()`**: Sets the axis line color. Color: a CSS
  color string or R color name.

  **`go_heatmap_hoverlabel()`**: Sets the border color of the hover
  labels for this trace. Color: a CSS color string or R color name, or a
  vector of these.

- borderwidth:

  Sets the width (in px) or the border enclosing this color bar. Number
  in the interval \[0, Inf\].

- dtick:

  Sets the step in-between ticks on this color bar. Use with \`tick0\`.
  Must be a positive number. Note: unlike on x/y axes, the special "log"
  and "date" string forms ("L\<f\>", "D1", "D2", "M\<n\>") are not
  supported here: this axis is always linear, so such strings are
  silently ignored and the step is set to 1. Any value.

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

- labelalias:

  Replacement text for specific tick or hover labels. For example using
  {US: 'USA', CA: 'Canada'} changes US to USA and CA to Canada. The
  labels we would have shown must match the keys exactly, after adding
  any tickprefix or ticksuffix. For negative numbers the minus sign
  symbol used (U+2212) is wider than the regular ascii dash. That means
  you need to use -1 instead of -1. labelalias can be used with any axis
  type, and both keys (if needed) and values (if desired) can include
  html-like tags or MathJax. Any value.

- len:

  Sets the length of the color bar This measure excludes the padding of
  both ends. That is, the color bar length is this length minus the
  padding on both ends. Number in the interval \[0, Inf\].

- lenmode:

  Determines whether this color bar's length (i.e. the measure in the
  color variation direction) is set in units of plot "fraction" or in
  \*pixels. Use \`len\` to set the value. One of `"fraction"`,
  `"pixels"`.

- minexponent:

  Hide SI prefix for 10^n if \|n\| is below this number. This only has
  an effect when \`tickformat\` is "SI" or "B". Number in the interval
  \[0, Inf\].

- nticks:

  Specifies the maximum number of ticks for the particular axis. The
  actual number of ticks will be chosen automatically to be less than or
  equal to \`nticks\`. Has an effect only if \`tickmode\` is set to
  "auto". Integer in the interval \[0, Inf\].

- orientation:

  Sets the orientation of the colorbar. One of `"h"`, `"v"`.

- outlinecolor:

  Sets the axis line color. Color: a CSS color string or R color name.

- outlinewidth:

  Sets the width (in px) of the axis line. Number in the interval \[0,
  Inf\].

- separatethousands:

  If "true", even 4-digit integers are separated Logical.

- showexponent:

  If "all", all exponents are shown besides their significands. If
  "first", only the exponent of the first tick is shown. If "last", only
  the exponent of the last tick is shown. If "none", no exponents
  appear. One of `"all"`, `"first"`, `"last"`, `"none"`.

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

- thickness:

  Sets the thickness of the color bar This measure excludes the size of
  the padding, ticks and labels. Number in the interval \[0, Inf\].

- thicknessmode:

  Determines whether this color bar's thickness (i.e. the measure in the
  constant color direction) is set in units of plot "fraction" or in
  "pixels". Use \`thickness\` to set the value. One of `"fraction"`,
  `"pixels"`.

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

  Sets the color bar's tick label font Named list or
  `go_heatmap_colorbar_tickfont()` object.

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

  List of named lists or `go_heatmap_colorbar_tickformatstop()` objects.

- ticklabeloverflow:

  Determines how we handle tick labels that would overflow either the
  graph div or the domain of the axis. The default value for inside tick
  labels is "hide past domain". In other cases the default is "hide past
  div". One of `"allow"`, `"hide past div"`, `"hide past domain"`.

- ticklabelposition:

  Determines where tick labels are drawn relative to the ticks. Left and
  right options are used when \`orientation\` is "h", top and bottom
  when \`orientation\` is "v". One of `"outside"`, `"inside"`,
  `"outside top"`, `"inside top"`, `"outside left"`, `"inside left"`,
  `"outside right"`, `"inside right"`, `"outside bottom"`,
  `"inside bottom"`.

- ticklabelstep:

  Sets the spacing between tick labels as compared to the spacing
  between ticks. A value of 1 (default) means each tick gets a label. A
  value of 2 means shows every 2nd label. A larger value n means only
  every nth tick is labeled. \`tick0\` determines which labels are
  shown. Not implemented for axes with \`type\` "log" or
  "multicategory", or when \`tickmode\` is "array". Integer in the
  interval \[1, Inf\].

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

  String (the title text), named list or `go_heatmap_colorbar_title()`
  object.

- xanchor:

  Sets this color bar's horizontal position anchor. This anchor binds
  the \`x\` position to the "left", "center" or "right" of the color
  bar. Defaults to "left" when \`orientation\` is "v" and "center" when
  \`orientation\` is "h". One of `"left"`, `"center"`, `"right"`.

- xpad:

  Sets the amount of padding (in px) along the x direction. Number in
  the interval \[0, Inf\].

- xref:

  Sets the container \`x\` refers to. "container" spans the entire
  \`width\` of the plot. "paper" refers to the width of the plotting
  area only. One of `"container"`, `"paper"`.

- yanchor:

  Sets this color bar's vertical position anchor This anchor binds the
  \`y\` position to the "top", "middle" or "bottom" of the color bar.
  Defaults to "middle" when \`orientation\` is "v" and "bottom" when
  \`orientation\` is "h". One of `"top"`, `"middle"`, `"bottom"`.

- ypad:

  Sets the amount of padding (in px) along the y direction. Number in
  the interval \[0, Inf\].

- yref:

  Sets the container \`y\` refers to. "container" spans the entire
  \`height\` of the plot. "paper" refers to the height of the plotting
  area only. One of `"container"`, `"paper"`.

- color:

  **`go_heatmap_colorbar_tickfont()`,
  `go_heatmap_colorbar_title_font()`,
  `go_heatmap_legendgrouptitle_font()`, `go_heatmap_textfont()`**:
  Color: a CSS color string or R color name.

  **`go_heatmap_hoverlabel_font()`**: Color: a CSS color string or R
  color name, or a vector of these.

- family:

  **`go_heatmap_colorbar_tickfont()`,
  `go_heatmap_colorbar_title_font()`,
  `go_heatmap_legendgrouptitle_font()`, `go_heatmap_textfont()`**: HTML
  font family - the typeface that will be applied by the web browser.
  The web browser can only apply a font if it is available on the system
  where it runs. Provide multiple font families, separated by commas, to
  indicate the order in which to apply fonts if they aren't available.
  String.

  **`go_heatmap_hoverlabel_font()`**: HTML font family - the typeface
  that will be applied by the web browser. The web browser can only
  apply a font if it is available on the system where it runs. Provide
  multiple font families, separated by commas, to indicate the order in
  which to apply fonts if they aren't available. String, or a vector of
  these.

- lineposition:

  **`go_heatmap_colorbar_tickfont()`,
  `go_heatmap_colorbar_title_font()`,
  `go_heatmap_legendgrouptitle_font()`, `go_heatmap_textfont()`**: Sets
  the kind of decoration line(s) with text, such as an "under", "over"
  or "through" as well as combinations e.g. "under+over", etc. Any
  combination of `"under"`, `"over"`, `"through"` joined with `"+"`, or
  one of `"none"`.

  **`go_heatmap_hoverlabel_font()`**: Sets the kind of decoration
  line(s) with text, such as an "under", "over" or "through" as well as
  combinations e.g. "under+over", etc. Any combination of `"under"`,
  `"over"`, `"through"` joined with `"+"`, or one of `"none"`, or a
  vector of these.

- shadow:

  **`go_heatmap_colorbar_tickfont()`,
  `go_heatmap_colorbar_title_font()`,
  `go_heatmap_legendgrouptitle_font()`, `go_heatmap_textfont()`**: Sets
  the shape and color of the shadow behind text. "auto" places minimal
  shadow and applies contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String.

  **`go_heatmap_hoverlabel_font()`**: Sets the shape and color of the
  shadow behind text. "auto" places minimal shadow and applies contrast
  text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String, or a vector of these.

- size:

  **`go_heatmap_colorbar_tickfont()`,
  `go_heatmap_colorbar_title_font()`,
  `go_heatmap_legendgrouptitle_font()`, `go_heatmap_textfont()`**:
  Number in the interval \[1, Inf\].

  **`go_heatmap_hoverlabel_font()`**: Number in the interval \[1, Inf\],
  or a vector of these.

- style:

  **`go_heatmap_colorbar_tickfont()`,
  `go_heatmap_colorbar_title_font()`,
  `go_heatmap_legendgrouptitle_font()`, `go_heatmap_textfont()`**: Sets
  whether a font should be styled with a normal or italic face from its
  family. One of `"normal"`, `"italic"`.

  **`go_heatmap_hoverlabel_font()`**: Sets whether a font should be
  styled with a normal or italic face from its family. One of
  `"normal"`, `"italic"`, or a vector of these.

- textcase:

  **`go_heatmap_colorbar_tickfont()`,
  `go_heatmap_colorbar_title_font()`,
  `go_heatmap_legendgrouptitle_font()`, `go_heatmap_textfont()`**: Sets
  capitalization of text. It can be used to make text appear in
  all-uppercase or all-lowercase, or with each word capitalized. One of
  `"normal"`, `"word caps"`, `"upper"`, `"lower"`.

  **`go_heatmap_hoverlabel_font()`**: Sets capitalization of text. It
  can be used to make text appear in all-uppercase or all-lowercase, or
  with each word capitalized. One of `"normal"`, `"word caps"`,
  `"upper"`, `"lower"`, or a vector of these.

- variant:

  **`go_heatmap_colorbar_tickfont()`,
  `go_heatmap_colorbar_title_font()`,
  `go_heatmap_legendgrouptitle_font()`, `go_heatmap_textfont()`**: Sets
  the variant of the font. One of `"normal"`, `"small-caps"`,
  `"all-small-caps"`, `"all-petite-caps"`, `"petite-caps"`, `"unicase"`.

  **`go_heatmap_hoverlabel_font()`**: Sets the variant of the font. One
  of `"normal"`, `"small-caps"`, `"all-small-caps"`,
  `"all-petite-caps"`, `"petite-caps"`, `"unicase"`, or a vector of
  these.

- weight:

  **`go_heatmap_colorbar_tickfont()`,
  `go_heatmap_colorbar_title_font()`,
  `go_heatmap_legendgrouptitle_font()`, `go_heatmap_textfont()`**: Sets
  the weight (or boldness) of the font. Integer in the interval \[1,
  1000\].

  **`go_heatmap_hoverlabel_font()`**: Sets the weight (or boldness) of
  the font. Integer in the interval \[1, 1000\], or a vector of these.

- dtickrange:

  range \["min", "max"\], where "min", "max" - dtick values which
  describe some zoom level, it is possible to omit "min" or "max" value
  by passing "null" Vector or list of 2 element(s).

- enabled:

  Determines whether or not this stop is used. If \`false\`, this stop
  is ignored even within its \`dtickrange\`. Logical.

- templateitemname:

  Used to refer to a named item in this array in the template. Named
  items from the template will be created even without a matching item
  in the input figure, but you can modify one by making an item with
  \`templateitemname\` matching its \`name\`, alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). If there is no template or no matching item, this item will
  be hidden unless you explicitly show it with \`visible: true\`.
  String.

- value:

  string - dtickformat for described zoom level, the same as
  "tickformat" String.

- font:

  **`go_heatmap_colorbar_title()`**: Sets this color bar's title font.
  Named list or `go_heatmap_colorbar_title_font()` object.

  **`go_heatmap_hoverlabel()`**: Sets the font used in hover labels.
  Named list or `go_heatmap_hoverlabel_font()` object.

  **`go_heatmap_legendgrouptitle()`**: Sets this legend group's title
  font. Named list or `go_heatmap_legendgrouptitle_font()` object.

- side:

  Determines the location of color bar's title with respect to the color
  bar. Defaults to "top" when \`orientation\` is "v" and defaults to
  "right" when \`orientation\` is "h". One of `"right"`, `"top"`,
  `"bottom"`.

- align:

  Sets the horizontal alignment of the text content within hover label
  box. Has an effect only if the hover label text spans two or more
  lines One of `"left"`, `"right"`, `"auto"`, or a vector of these.

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

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_heatmap()` and the nested object constructors below create validated
graph objects (named lists). Every property is checked against the
plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
`add_heatmap()` creates an object and adds it to a figure.

Nested objects documented here:

- `go_heatmap_colorbar()`:

  `heatmap.colorbar`

- `go_heatmap_colorbar_tickfont()`:

  `heatmap.colorbar.tickfont`: Sets the color bar's tick label font

- `go_heatmap_colorbar_tickformatstop()`:

  `heatmap.colorbar.tickformatstop`

- `go_heatmap_colorbar_title()`:

  `heatmap.colorbar.title`

- `go_heatmap_colorbar_title_font()`:

  `heatmap.colorbar.title.font`: Sets this color bar's title font.

- `go_heatmap_hoverlabel()`:

  `heatmap.hoverlabel`

- `go_heatmap_hoverlabel_font()`:

  `heatmap.hoverlabel.font`: Sets the font used in hover labels.

- `go_heatmap_legendgrouptitle()`:

  `heatmap.legendgrouptitle`

- `go_heatmap_legendgrouptitle_font()`:

  `heatmap.legendgrouptitle.font`: Sets this legend group's title font.

- `go_heatmap_textfont()`:

  `heatmap.textfont`: Sets the text font.

## See also

[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)

## Examples

``` r
go_heatmap(x = 1:3, y = c(2, 1, 3))
#> <go_heatmap>
#> {
#>   "type": "heatmap",
#>   "x": [
#>     1,
#>     2,
#>     3
#>   ],
#>   "y": [
#>     2,
#>     1,
#>     3
#>   ]
#> }
#> 
```
