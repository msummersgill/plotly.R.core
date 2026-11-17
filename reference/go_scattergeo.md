# Scattergeo traces

The data visualized as scatter point or lines on a geographic map is
provided either by longitude/latitude pairs in \`lon\` and \`lat\`
respectively or by geographic location IDs or names in \`locations\`.

## Usage

``` r
add_scattergeo(fig, ...)

# Default S3 method
add_scattergeo(
  fig,
  ...,
  data = NULL,
  connectgaps = NULL,
  customdata = NULL,
  featureidkey = NULL,
  fill = NULL,
  fillcolor = NULL,
  geo = NULL,
  geojson = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  lat = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  line = NULL,
  locationmode = NULL,
  locations = NULL,
  lon = NULL,
  marker = NULL,
  meta = NULL,
  mode = NULL,
  name = NULL,
  opacity = NULL,
  selected = NULL,
  selectedpoints = NULL,
  showlegend = NULL,
  text = NULL,
  textfont = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  uid = NULL,
  uirevision = NULL,
  unselected = NULL,
  visible = NULL,
  row = NULL,
  col = NULL,
  skip_invalid = FALSE
)

go_scattergeo(
  arg = NULL,
  ...,
  connectgaps = NULL,
  customdata = NULL,
  featureidkey = NULL,
  fill = NULL,
  fillcolor = NULL,
  geo = NULL,
  geojson = NULL,
  hoverinfo = NULL,
  hoverlabel = NULL,
  hovertemplate = NULL,
  hovertemplatefallback = NULL,
  hovertext = NULL,
  ids = NULL,
  lat = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  line = NULL,
  locationmode = NULL,
  locations = NULL,
  lon = NULL,
  marker = NULL,
  meta = NULL,
  mode = NULL,
  name = NULL,
  opacity = NULL,
  selected = NULL,
  selectedpoints = NULL,
  showlegend = NULL,
  text = NULL,
  textfont = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  uid = NULL,
  uirevision = NULL,
  unselected = NULL,
  visible = NULL,
  skip_invalid = FALSE
)

go_scattergeo_hoverlabel(
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

go_scattergeo_hoverlabel_font(
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

go_scattergeo_legendgrouptitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_scattergeo_legendgrouptitle_font(
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

go_scattergeo_line(
  arg = NULL,
  ...,
  color = NULL,
  dash = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_scattergeo_marker(
  arg = NULL,
  ...,
  angle = NULL,
  angleref = NULL,
  autocolorscale = NULL,
  cauto = NULL,
  cmax = NULL,
  cmid = NULL,
  cmin = NULL,
  color = NULL,
  coloraxis = NULL,
  colorbar = NULL,
  colorscale = NULL,
  gradient = NULL,
  line = NULL,
  opacity = NULL,
  reversescale = NULL,
  showscale = NULL,
  size = NULL,
  sizemin = NULL,
  sizemode = NULL,
  sizeref = NULL,
  standoff = NULL,
  symbol = NULL,
  skip_invalid = FALSE
)

go_scattergeo_marker_colorbar(
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

go_scattergeo_marker_colorbar_tickfont(
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

go_scattergeo_marker_colorbar_tickformatstop(
  arg = NULL,
  ...,
  dtickrange = NULL,
  enabled = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  skip_invalid = FALSE
)

go_scattergeo_marker_colorbar_title(
  arg = NULL,
  ...,
  font = NULL,
  side = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_scattergeo_marker_colorbar_title_font(
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

go_scattergeo_marker_gradient(
  arg = NULL,
  ...,
  color = NULL,
  type = NULL,
  skip_invalid = FALSE
)

go_scattergeo_marker_line(
  arg = NULL,
  ...,
  autocolorscale = NULL,
  cauto = NULL,
  cmax = NULL,
  cmid = NULL,
  cmin = NULL,
  color = NULL,
  coloraxis = NULL,
  colorscale = NULL,
  dash = NULL,
  reversescale = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_scattergeo_selected(
  arg = NULL,
  ...,
  marker = NULL,
  textfont = NULL,
  skip_invalid = FALSE
)

go_scattergeo_selected_marker(
  arg = NULL,
  ...,
  color = NULL,
  opacity = NULL,
  size = NULL,
  skip_invalid = FALSE
)

go_scattergeo_selected_textfont(
  arg = NULL,
  ...,
  color = NULL,
  skip_invalid = FALSE
)

go_scattergeo_textfont(
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

go_scattergeo_unselected(
  arg = NULL,
  ...,
  marker = NULL,
  textfont = NULL,
  skip_invalid = FALSE
)

go_scattergeo_unselected_marker(
  arg = NULL,
  ...,
  color = NULL,
  opacity = NULL,
  size = NULL,
  skip_invalid = FALSE
)

go_scattergeo_unselected_textfont(
  arg = NULL,
  ...,
  color = NULL,
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
  Only the evaluated values are added to the trace. A
  [`crosstalk::SharedData`](https://rdrr.io/pkg/crosstalk/man/SharedData.html)
  works the same way, and links the trace to its crosstalk group (see
  [`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)).

- connectgaps:

  Determines whether or not gaps (i.e. {nan} or missing values) in the
  provided data arrays are connected. Logical.

- customdata:

  Assigns extra data each datum. This may be useful when listening to
  hover, click and selection events. Note that, "scatter" traces also
  appends customdata items in the markers DOM elements Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- featureidkey:

  Sets the key in GeoJSON features which is used as id to match the
  items included in the \`locations\` array. Only has an effect when
  \`geojson\` is set. Support nested property, for example
  "properties.name". String.

- fill:

  Sets the area to fill with a solid color. Use with \`fillcolor\` if
  not "none". "toself" connects the endpoints of the trace (or each
  segment of the trace if it has gaps) into a closed shape. One of
  `"none"`, `"toself"`.

- fillcolor:

  Sets the fill color. Defaults to a half-transparent variant of the
  line color, marker color, or marker line color, whichever is
  available. Color: a CSS color string or R color name.

- geo:

  Sets a reference between this trace's geospatial coordinates and a
  geographic map. If "geo" (the default value), the geospatial
  coordinates refer to \`layout.geo\`. If "geo2", the geospatial
  coordinates refer to \`layout.geo2\`, and so on. Subplot id: `"geo"`,
  `"geo2"`, `"geo3"`, ....

- geojson:

  Sets optional GeoJSON data associated with this trace. If not given,
  the features on the base map are used when \`locations\` is set. It
  can be set as a valid GeoJSON object or as a URL string. Note that we
  only accept GeoJSONs of type "FeatureCollection" or "Feature" with
  geometries of type "Polygon" or "MultiPolygon". Any value.

- hoverinfo:

  Determines what trace information appears on hover. If \`none\` or
  \`skip\` are set, no information is displayed upon hovering. But, if
  \`none\` is set, click and hover events are still fired. Any
  combination of `"lon"`, `"lat"`, `"location"`, `"text"`, `"name"`
  joined with `"+"`, or one of `"all"`, `"none"`, `"skip"`, or a vector
  of these.

- hoverlabel:

  Named list or `go_scattergeo_hoverlabel()` object.

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

  Sets hover text elements associated with each (lon,lat) pair or item
  in \`locations\`. If a single string, the same string appears over all
  the data points. If an array of string, the items are mapped in order
  to the this trace's (lon,lat) or \`locations\` coordinates. To be
  seen, trace \`hoverinfo\` must contain a "text" flag. String, or a
  vector of these.

- ids:

  Assigns id labels to each datum. These ids for object constancy of
  data points during animation. Should be an array of strings, not
  numbers or any other type. Data array: a vector, factor, Date/POSIXct
  vector, matrix or list.

- lat:

  Sets the latitude coordinates (in degrees North). Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

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

  Named list or `go_scattergeo_legendgrouptitle()` object.

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

- line:

  **`go_scattergeo()`**: Named list or `go_scattergeo_line()` object.

  **`go_scattergeo_marker()`**: Named list or
  `go_scattergeo_marker_line()` object.

- locationmode:

  Determines the set of locations used to match entries in \`locations\`
  to regions on the map. Values "ISO-3", "USA-states", "country names"
  correspond to features on the base map and value "geojson-id"
  corresponds to features from a custom GeoJSON linked to the
  \`geojson\` attribute. "USA-states" accepts both two-letter
  abbreviations (e.g. "CA") and full state names (e.g. "California").
  One of `"ISO-3"`, `"USA-states"`, `"country names"`, `"geojson-id"`.

- locations:

  Sets the coordinates via location IDs or names. Coordinates correspond
  to the centroid of each location given. See \`locationmode\` for more
  info. Data array: a vector, factor, Date/POSIXct vector, matrix or
  list.

- lon:

  Sets the longitude coordinates (in degrees East). Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- marker:

  **`go_scattergeo()`**: Named list or `go_scattergeo_marker()` object.

  **`go_scattergeo_selected()`**: Named list or
  `go_scattergeo_selected_marker()` object.

  **`go_scattergeo_unselected()`**: Named list or
  `go_scattergeo_unselected_marker()` object.

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

- mode:

  Determines the drawing mode for this scatter trace. If the provided
  \`mode\` includes "text" then the \`text\` elements appear at the
  coordinates. Otherwise, the \`text\` elements appear on hover. If
  there are less than 20 points and the trace is not stacked then the
  default is "lines+markers". Otherwise, "lines". Any combination of
  `"lines"`, `"markers"`, `"text"` joined with `"+"`, or one of
  `"none"`.

- name:

  **`go_scattergeo()`**: Sets the trace name. The trace name appears as
  the legend item and on hover. String.

  **`go_scattergeo_marker_colorbar_tickformatstop()`**: When used in a
  template, named items are created in the output figure in addition to
  any items the figure already has in this array. You can modify these
  items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- opacity:

  **`go_scattergeo()`**: Sets the opacity of the trace. Number in the
  interval \[0, 1\].

  **`go_scattergeo_marker()`**: Sets the marker opacity. Number in the
  interval \[0, 1\], or a vector of these.

  **`go_scattergeo_selected_marker()`**: Sets the marker opacity of
  selected points. Number in the interval \[0, 1\].

  **`go_scattergeo_unselected_marker()`**: Sets the marker opacity of
  unselected points, applied only when a selection exists. Number in the
  interval \[0, 1\].

- selected:

  Named list or `go_scattergeo_selected()` object.

- selectedpoints:

  Array containing integer indices of selected points. Has an effect
  only for traces that support selections. Note that an empty array
  means an empty selection where the \`unselected\` are turned on for
  all points, whereas, any other non-array values means no selection all
  where the \`selected\` and \`unselected\` styles have no effect. Any
  value.

- showlegend:

  Determines whether or not an item corresponding to this trace is shown
  in the legend. Logical.

- text:

  **`go_scattergeo()`**: Sets text elements associated with each
  (lon,lat) pair or item in \`locations\`. If a single string, the same
  string appears over all the data points. If an array of string, the
  items are mapped in order to the this trace's (lon,lat) or
  \`locations\` coordinates. If trace \`hoverinfo\` contains a "text"
  flag and "hovertext" is not set, these elements will be seen in the
  hover labels. String, or a vector of these.

  **`go_scattergeo_legendgrouptitle()`**: Sets the title of the legend
  group. String.

  **`go_scattergeo_marker_colorbar_title()`**: Sets the title of the
  color bar. String.

- textfont:

  **`go_scattergeo()`**: Sets the text font. Named list or
  `go_scattergeo_textfont()` object.

  **`go_scattergeo_selected()`**: Named list or
  `go_scattergeo_selected_textfont()` object.

  **`go_scattergeo_unselected()`**: Named list or
  `go_scattergeo_unselected_textfont()` object.

- textposition:

  Sets the positions of the \`text\` elements with respects to the (x,y)
  coordinates. One of `"top left"`, `"top center"`, `"top right"`,
  `"middle left"`, `"middle center"`, `"middle right"`, `"bottom left"`,
  `"bottom center"`, `"bottom right"`, or a vector of these.

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
  template string has access to variables \`lat\`, \`lon\`, \`location\`
  and \`text\`. String, or a vector of these.

- texttemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

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

- unselected:

  Named list or `go_scattergeo_unselected()` object.

- visible:

  Determines whether or not this trace is visible. If "legendonly", the
  trace is not drawn, but can appear as a legend item (provided that the
  legend itself is visible). One of `"legendonly"`, `TRUE`, `FALSE`.

- row:

  Subplot grid row (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

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

- align:

  Sets the horizontal alignment of the text content within hover label
  box. Has an effect only if the hover label text spans two or more
  lines One of `"left"`, `"right"`, `"auto"`, or a vector of these.

- bgcolor:

  **`go_scattergeo_hoverlabel()`**: Sets the background color of the
  hover labels for this trace Color: a CSS color string or R color name,
  or a vector of these.

  **`go_scattergeo_marker_colorbar()`**: Sets the color of padded area.
  Color: a CSS color string or R color name.

- bordercolor:

  **`go_scattergeo_hoverlabel()`**: Sets the border color of the hover
  labels for this trace. Color: a CSS color string or R color name, or a
  vector of these.

  **`go_scattergeo_marker_colorbar()`**: Sets the axis line color.
  Color: a CSS color string or R color name.

- font:

  **`go_scattergeo_hoverlabel()`**: Sets the font used in hover labels.
  Named list or `go_scattergeo_hoverlabel_font()` object.

  **`go_scattergeo_legendgrouptitle()`**: Sets this legend group's title
  font. Named list or `go_scattergeo_legendgrouptitle_font()` object.

  **`go_scattergeo_marker_colorbar_title()`**: Sets this color bar's
  title font. Named list or `go_scattergeo_marker_colorbar_title_font()`
  object.

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

  **`go_scattergeo_hoverlabel_font()`, `go_scattergeo_textfont()`**:
  Color: a CSS color string or R color name, or a vector of these.

  **`go_scattergeo_legendgrouptitle_font()`,
  `go_scattergeo_marker_colorbar_tickfont()`,
  `go_scattergeo_marker_colorbar_title_font()`**: Color: a CSS color
  string or R color name.

  **`go_scattergeo_line()`**: Sets the line color. Color: a CSS color
  string or R color name.

  **`go_scattergeo_marker()`**: Sets the marker color. It accepts either
  a specific color or an array of numbers that are mapped to the
  colorscale relative to the max and min values of the array or relative
  to \`marker.cmin\` and \`marker.cmax\` if set. Color: a CSS color
  string or R color name, or a number mapped to a color by
  `scattergeo.marker.colorscale`, or a vector of these.

  **`go_scattergeo_marker_gradient()`**: Sets the final color of the
  gradient fill: the center color for radial, the right for horizontal,
  or the bottom for vertical. Color: a CSS color string or R color name,
  or a vector of these.

  **`go_scattergeo_marker_line()`**: Sets the marker.line color. It
  accepts either a specific color or an array of numbers that are mapped
  to the colorscale relative to the max and min values of the array or
  relative to \`marker.line.cmin\` and \`marker.line.cmax\` if set.
  Color: a CSS color string or R color name, or a number mapped to a
  color by `scattergeo.marker.line.colorscale`, or a vector of these.

  **`go_scattergeo_selected_marker()`**: Sets the marker color of
  selected points. Color: a CSS color string or R color name.

  **`go_scattergeo_selected_textfont()`**: Sets the text font color of
  selected points. Color: a CSS color string or R color name.

  **`go_scattergeo_unselected_marker()`**: Sets the marker color of
  unselected points, applied only when a selection exists. Color: a CSS
  color string or R color name.

  **`go_scattergeo_unselected_textfont()`**: Sets the text font color of
  unselected points, applied only when a selection exists. Color: a CSS
  color string or R color name.

- family:

  **`go_scattergeo_hoverlabel_font()`, `go_scattergeo_textfont()`**:
  HTML font family - the typeface that will be applied by the web
  browser. The web browser can only apply a font if it is available on
  the system where it runs. Provide multiple font families, separated by
  commas, to indicate the order in which to apply fonts if they aren't
  available. String, or a vector of these.

  **`go_scattergeo_legendgrouptitle_font()`,
  `go_scattergeo_marker_colorbar_tickfont()`,
  `go_scattergeo_marker_colorbar_title_font()`**: HTML font family - the
  typeface that will be applied by the web browser. The web browser can
  only apply a font if it is available on the system where it runs.
  Provide multiple font families, separated by commas, to indicate the
  order in which to apply fonts if they aren't available. String.

- lineposition:

  **`go_scattergeo_hoverlabel_font()`, `go_scattergeo_textfont()`**:
  Sets the kind of decoration line(s) with text, such as an "under",
  "over" or "through" as well as combinations e.g. "under+over", etc.
  Any combination of `"under"`, `"over"`, `"through"` joined with `"+"`,
  or one of `"none"`, or a vector of these.

  **`go_scattergeo_legendgrouptitle_font()`,
  `go_scattergeo_marker_colorbar_tickfont()`,
  `go_scattergeo_marker_colorbar_title_font()`**: Sets the kind of
  decoration line(s) with text, such as an "under", "over" or "through"
  as well as combinations e.g. "under+over", etc. Any combination of
  `"under"`, `"over"`, `"through"` joined with `"+"`, or one of
  `"none"`.

- shadow:

  **`go_scattergeo_hoverlabel_font()`, `go_scattergeo_textfont()`**:
  Sets the shape and color of the shadow behind text. "auto" places
  minimal shadow and applies contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String, or a vector of these.

  **`go_scattergeo_legendgrouptitle_font()`,
  `go_scattergeo_marker_colorbar_tickfont()`,
  `go_scattergeo_marker_colorbar_title_font()`**: Sets the shape and
  color of the shadow behind text. "auto" places minimal shadow and
  applies contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String.

- size:

  **`go_scattergeo_hoverlabel_font()`, `go_scattergeo_textfont()`**:
  Number in the interval \[1, Inf\], or a vector of these.

  **`go_scattergeo_legendgrouptitle_font()`,
  `go_scattergeo_marker_colorbar_tickfont()`,
  `go_scattergeo_marker_colorbar_title_font()`**: Number in the interval
  \[1, Inf\].

  **`go_scattergeo_marker()`**: Sets the marker size (in px). Number in
  the interval \[0, Inf\], or a vector of these.

  **`go_scattergeo_selected_marker()`**: Sets the marker size of
  selected points. Number in the interval \[0, Inf\].

  **`go_scattergeo_unselected_marker()`**: Sets the marker size of
  unselected points, applied only when a selection exists. Number in the
  interval \[0, Inf\].

- style:

  **`go_scattergeo_hoverlabel_font()`, `go_scattergeo_textfont()`**:
  Sets whether a font should be styled with a normal or italic face from
  its family. One of `"normal"`, `"italic"`, or a vector of these.

  **`go_scattergeo_legendgrouptitle_font()`,
  `go_scattergeo_marker_colorbar_tickfont()`,
  `go_scattergeo_marker_colorbar_title_font()`**: Sets whether a font
  should be styled with a normal or italic face from its family. One of
  `"normal"`, `"italic"`.

- textcase:

  **`go_scattergeo_hoverlabel_font()`, `go_scattergeo_textfont()`**:
  Sets capitalization of text. It can be used to make text appear in
  all-uppercase or all-lowercase, or with each word capitalized. One of
  `"normal"`, `"word caps"`, `"upper"`, `"lower"`, or a vector of these.

  **`go_scattergeo_legendgrouptitle_font()`,
  `go_scattergeo_marker_colorbar_tickfont()`,
  `go_scattergeo_marker_colorbar_title_font()`**: Sets capitalization of
  text. It can be used to make text appear in all-uppercase or
  all-lowercase, or with each word capitalized. One of `"normal"`,
  `"word caps"`, `"upper"`, `"lower"`.

- variant:

  **`go_scattergeo_hoverlabel_font()`, `go_scattergeo_textfont()`**:
  Sets the variant of the font. One of `"normal"`, `"small-caps"`,
  `"all-small-caps"`, `"all-petite-caps"`, `"petite-caps"`, `"unicase"`,
  or a vector of these.

  **`go_scattergeo_legendgrouptitle_font()`,
  `go_scattergeo_marker_colorbar_tickfont()`,
  `go_scattergeo_marker_colorbar_title_font()`**: Sets the variant of
  the font. One of `"normal"`, `"small-caps"`, `"all-small-caps"`,
  `"all-petite-caps"`, `"petite-caps"`, `"unicase"`.

- weight:

  **`go_scattergeo_hoverlabel_font()`, `go_scattergeo_textfont()`**:
  Sets the weight (or boldness) of the font. Integer in the interval
  \[1, 1000\], or a vector of these.

  **`go_scattergeo_legendgrouptitle_font()`,
  `go_scattergeo_marker_colorbar_tickfont()`,
  `go_scattergeo_marker_colorbar_title_font()`**: Sets the weight (or
  boldness) of the font. Integer in the interval \[1, 1000\].

- dash:

  **`go_scattergeo_line()`**: Sets the dash style of lines. Set to a
  dash type string ("solid", "dot", "dash", "longdash", "dashdot", or
  "longdashdot") or a dash length list in px (eg "5px,10px,2px,2px").
  One of `"solid"`, `"dot"`, `"dash"`, `"longdash"`, `"dashdot"`,
  `"longdashdot"`, or a string matching
  `"^\\d+(\\.\\d+)?(px|%)?((,|\\s)\\s*\\d+(\\.\\d+)?(px|%)?)*$"`.

  **`go_scattergeo_marker_line()`**: Sets the dash style of lines. Set
  to a dash type string ("solid", "dot", "dash", "longdash", "dashdot",
  or "longdashdot") or a dash length list in px (eg "5px,10px,2px,2px").
  One of `"solid"`, `"dot"`, `"dash"`, `"longdash"`, `"dashdot"`,
  `"longdashdot"`, or a string matching
  `"^\\d+(\\.\\d+)?(px|%)?((,|\\s)\\s*\\d+(\\.\\d+)?(px|%)?)*$"`, or a
  vector of these.

- width:

  **`go_scattergeo_line()`**: Sets the line width (in px). Number in the
  interval \[0, Inf\].

  **`go_scattergeo_marker_line()`**: Sets the width (in px) of the lines
  bounding the marker points. Number in the interval \[0, Inf\], or a
  vector of these.

- angle:

  Sets the marker angle in respect to \`angleref\`. Angle in degrees, or
  a vector of these.

- angleref:

  Sets the reference for marker angle. With "previous", angle 0 points
  along the line from the previous point to this one. With "up", angle 0
  points toward the top of the screen. With "north", angle 0 points
  north based on the current map projection. One of `"previous"`,
  `"up"`, `"north"`.

- autocolorscale:

  **`go_scattergeo_marker()`**: Determines whether the colorscale is a
  default palette (\`autocolorscale: true\`) or the palette determined
  by \`marker.colorscale\`. Has an effect only if in \`marker.color\` is
  set to a numerical array. In case \`colorscale\` is unspecified or
  \`autocolorscale\` is true, the default palette will be chosen
  according to whether numbers in the \`color\` array are all positive,
  all negative or mixed. Logical.

  **`go_scattergeo_marker_line()`**: Determines whether the colorscale
  is a default palette (\`autocolorscale: true\`) or the palette
  determined by \`marker.line.colorscale\`. Has an effect only if in
  \`marker.line.color\` is set to a numerical array. In case
  \`colorscale\` is unspecified or \`autocolorscale\` is true, the
  default palette will be chosen according to whether numbers in the
  \`color\` array are all positive, all negative or mixed. Logical.

- cauto:

  **`go_scattergeo_marker()`**: Determines whether or not the color
  domain is computed with respect to the input data (here in
  \`marker.color\`) or the bounds set in \`marker.cmin\` and
  \`marker.cmax\` Has an effect only if in \`marker.color\` is set to a
  numerical array. Defaults to \`false\` when \`marker.cmin\` and
  \`marker.cmax\` are set by the user. Logical.

  **`go_scattergeo_marker_line()`**: Determines whether or not the color
  domain is computed with respect to the input data (here in
  \`marker.line.color\`) or the bounds set in \`marker.line.cmin\` and
  \`marker.line.cmax\` Has an effect only if in \`marker.line.color\` is
  set to a numerical array. Defaults to \`false\` when
  \`marker.line.cmin\` and \`marker.line.cmax\` are set by the user.
  Logical.

- cmax:

  **`go_scattergeo_marker()`**: Sets the upper bound of the color
  domain. Has an effect only if in \`marker.color\` is set to a
  numerical array. Value should have the same units as in
  \`marker.color\` and if set, \`marker.cmin\` must be set as well.
  Number.

  **`go_scattergeo_marker_line()`**: Sets the upper bound of the color
  domain. Has an effect only if in \`marker.line.color\` is set to a
  numerical array. Value should have the same units as in
  \`marker.line.color\` and if set, \`marker.line.cmin\` must be set as
  well. Number.

- cmid:

  **`go_scattergeo_marker()`**: Sets the mid-point of the color domain
  by scaling \`marker.cmin\` and/or \`marker.cmax\` to be equidistant to
  this point. Has an effect only if in \`marker.color\` is set to a
  numerical array. Value should have the same units as in
  \`marker.color\`. Has no effect when \`marker.cauto\` is \`false\`.
  Number.

  **`go_scattergeo_marker_line()`**: Sets the mid-point of the color
  domain by scaling \`marker.line.cmin\` and/or \`marker.line.cmax\` to
  be equidistant to this point. Has an effect only if in
  \`marker.line.color\` is set to a numerical array. Value should have
  the same units as in \`marker.line.color\`. Has no effect when
  \`marker.line.cauto\` is \`false\`. Number.

- cmin:

  **`go_scattergeo_marker()`**: Sets the lower bound of the color
  domain. Has an effect only if in \`marker.color\` is set to a
  numerical array. Value should have the same units as in
  \`marker.color\` and if set, \`marker.cmax\` must be set as well.
  Number.

  **`go_scattergeo_marker_line()`**: Sets the lower bound of the color
  domain. Has an effect only if in \`marker.line.color\` is set to a
  numerical array. Value should have the same units as in
  \`marker.line.color\` and if set, \`marker.line.cmax\` must be set as
  well. Number.

- coloraxis:

  Sets a reference to a shared color axis. References to these shared
  color axes are "coloraxis", "coloraxis2", "coloraxis3", etc. Settings
  for these shared color axes are set in the layout, under
  \`layout.coloraxis\`, \`layout.coloraxis2\`, etc. Note that multiple
  color scales can be linked to the same color axis. Subplot id:
  `"coloraxis"`, `"coloraxis2"`, `"coloraxis3"`, ....

- colorbar:

  Named list or `go_scattergeo_marker_colorbar()` object.

- colorscale:

  **`go_scattergeo_marker()`**: Sets the colorscale. Has an effect only
  if in \`marker.color\` is set to a numerical array. The colorscale
  must be an array containing arrays mapping a normalized value to an
  rgb, rgba, hex, hsl, hsla, hwb, or named color string. At minimum, a
  mapping for the lowest (0) and highest (1) values are required. For
  example, \`\[\[0, 'rgb(0,0,255)'\], \[1, 'rgb(255,0,0)'\]\]\`. To
  control the bounds of the colorscale in color space, use
  \`marker.cmin\` and \`marker.cmax\`. Alternatively, \`colorscale\` may
  be a palette name string of the following list:
  Blackbody,Bluered,Blues,Cividis,Earth,Electric,Greens,Greys,Hot,Jet,Picnic,Portland,Rainbow,RdBu,Reds,Viridis,YlGnBu,YlOrRd.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

  **`go_scattergeo_marker_line()`**: Sets the colorscale. Has an effect
  only if in \`marker.line.color\` is set to a numerical array. The
  colorscale must be an array containing arrays mapping a normalized
  value to an rgb, rgba, hex, hsl, hsla, hwb, or named color string. At
  minimum, a mapping for the lowest (0) and highest (1) values are
  required. For example, \`\[\[0, 'rgb(0,0,255)'\], \[1,
  'rgb(255,0,0)'\]\]\`. To control the bounds of the colorscale in color
  space, use \`marker.line.cmin\` and \`marker.line.cmax\`.
  Alternatively, \`colorscale\` may be a palette name string of the
  following list:
  Blackbody,Bluered,Blues,Cividis,Earth,Electric,Greens,Greys,Hot,Jet,Picnic,Portland,Rainbow,RdBu,Reds,Viridis,YlGnBu,YlOrRd.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`px_colors()`](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md)
  (append `"_r"` to reverse).

- gradient:

  Named list or `go_scattergeo_marker_gradient()` object.

- reversescale:

  **`go_scattergeo_marker()`**: Reverses the color mapping if true. Has
  an effect only if in \`marker.color\` is set to a numerical array. If
  true, \`marker.cmin\` will correspond to the last color in the array
  and \`marker.cmax\` will correspond to the first color. Logical.

  **`go_scattergeo_marker_line()`**: Reverses the color mapping if true.
  Has an effect only if in \`marker.line.color\` is set to a numerical
  array. If true, \`marker.line.cmin\` will correspond to the last color
  in the array and \`marker.line.cmax\` will correspond to the first
  color. Logical.

- showscale:

  Determines whether or not a colorbar is displayed for this trace. Has
  an effect only if in \`marker.color\` is set to a numerical array.
  Logical.

- sizemin:

  Has an effect only if \`marker.size\` is set to a numerical array.
  Sets the minimum size (in px) of the rendered marker points. Number in
  the interval \[0, Inf\].

- sizemode:

  Has an effect only if \`marker.size\` is set to a numerical array.
  Sets the rule for which the data in \`size\` is converted to pixels.
  One of `"diameter"`, `"area"`.

- sizeref:

  Has an effect only if \`marker.size\` is set to a numerical array.
  Sets the scale factor used to determine the rendered size of marker
  points. Use with \`sizemin\` and \`sizemode\`. Number.

- standoff:

  Moves the marker away from the data point in the direction of
  \`angle\` (in px). This can be useful for example if you have another
  marker at this location and you want to point an arrowhead marker at
  it. Number in the interval \[0, Inf\], or a vector of these.

- symbol:

  Sets the marker symbol type. Adding 100 is equivalent to appending
  "-open" to a symbol name. Adding 200 is equivalent to appending "-dot"
  to a symbol name. Adding 300 is equivalent to appending "-open-dot" or
  "dot-open" to a symbol name. One of `"0"`, `"circle"`, `"100"`,
  `"circle-open"`, `"200"`, `"circle-dot"`, `"300"`,
  `"circle-open-dot"`, `"1"`, `"square"`, `"101"`, `"square-open"`,
  `"201"`, `"square-dot"`, `"301"`, `"square-open-dot"`, `"2"`,
  `"diamond"`, `"102"`, `"diamond-open"`, `"202"`, `"diamond-dot"`,
  `"302"`, `"diamond-open-dot"`, `"3"`, `"cross"`, `"103"`,
  `"cross-open"`, `"203"`, `"cross-dot"`, `"303"`, `"cross-open-dot"`,
  `"4"`, `"x"`, `"104"`, `"x-open"`, `"204"`, `"x-dot"`, `"304"`,
  `"x-open-dot"`, `"5"`, `"triangle-up"`, `"105"`, `"triangle-up-open"`,
  `"205"`, `"triangle-up-dot"`, `"305"`, `"triangle-up-open-dot"`,
  `"6"`, `"triangle-down"`, `"106"`, `"triangle-down-open"`, `"206"`,
  `"triangle-down-dot"`, `"306"`, `"triangle-down-open-dot"`, `"7"`,
  `"triangle-left"`, `"107"`, `"triangle-left-open"`, `"207"`,
  `"triangle-left-dot"`, `"307"`, `"triangle-left-open-dot"`, `"8"`,
  `"triangle-right"`, `"108"`, `"triangle-right-open"`, `"208"`,
  `"triangle-right-dot"`, `"308"`, `"triangle-right-open-dot"`, `"9"`,
  `"triangle-ne"`, `"109"`, `"triangle-ne-open"`, `"209"`,
  `"triangle-ne-dot"`, `"309"`, `"triangle-ne-open-dot"`, `"10"`,
  `"triangle-se"`, `"110"`, `"triangle-se-open"`, `"210"`,
  `"triangle-se-dot"`, `"310"`, `"triangle-se-open-dot"`, `"11"`,
  `"triangle-sw"`, `"111"`, `"triangle-sw-open"`, `"211"`,
  `"triangle-sw-dot"`, `"311"`, `"triangle-sw-open-dot"`, `"12"`,
  `"triangle-nw"`, `"112"`, `"triangle-nw-open"`, `"212"`,
  `"triangle-nw-dot"`, `"312"`, `"triangle-nw-open-dot"`, `"13"`,
  `"pentagon"`, `"113"`, `"pentagon-open"`, `"213"`, `"pentagon-dot"`,
  `"313"`, `"pentagon-open-dot"`, `"14"`, `"hexagon"`, `"114"`,
  `"hexagon-open"`, `"214"`, `"hexagon-dot"`, `"314"`,
  `"hexagon-open-dot"`, `"15"`, `"hexagon2"`, `"115"`,
  `"hexagon2-open"`, `"215"`, `"hexagon2-dot"`, `"315"`,
  `"hexagon2-open-dot"`, `"16"`, `"octagon"`, `"116"`, `"octagon-open"`,
  `"216"`, `"octagon-dot"`, `"316"`, `"octagon-open-dot"`, `"17"`,
  `"star"`, `"117"`, `"star-open"`, `"217"`, `"star-dot"`, `"317"`,
  `"star-open-dot"`, `"18"`, `"hexagram"`, `"118"`, `"hexagram-open"`,
  `"218"`, `"hexagram-dot"`, `"318"`, `"hexagram-open-dot"`, `"19"`,
  `"star-triangle-up"`, `"119"`, `"star-triangle-up-open"`, `"219"`,
  `"star-triangle-up-dot"`, `"319"`, `"star-triangle-up-open-dot"`,
  `"20"`, `"star-triangle-down"`, `"120"`, `"star-triangle-down-open"`,
  `"220"`, `"star-triangle-down-dot"`, `"320"`,
  `"star-triangle-down-open-dot"`, `"21"`, `"star-square"`, `"121"`,
  `"star-square-open"`, `"221"`, `"star-square-dot"`, `"321"`,
  `"star-square-open-dot"`, `"22"`, `"star-diamond"`, `"122"`,
  `"star-diamond-open"`, `"222"`, `"star-diamond-dot"`, `"322"`,
  `"star-diamond-open-dot"`, `"23"`, `"diamond-tall"`, `"123"`,
  `"diamond-tall-open"`, `"223"`, `"diamond-tall-dot"`, `"323"`,
  `"diamond-tall-open-dot"`, `"24"`, `"diamond-wide"`, `"124"`,
  `"diamond-wide-open"`, `"224"`, `"diamond-wide-dot"`, `"324"`,
  `"diamond-wide-open-dot"`, `"25"`, `"hourglass"`, `"125"`,
  `"hourglass-open"`, `"26"`, `"bowtie"`, `"126"`, `"bowtie-open"`,
  `"27"`, `"circle-cross"`, `"127"`, `"circle-cross-open"`, `"28"`,
  `"circle-x"`, `"128"`, `"circle-x-open"`, `"29"`, `"square-cross"`,
  `"129"`, `"square-cross-open"`, `"30"`, `"square-x"`, `"130"`,
  `"square-x-open"`, `"31"`, `"diamond-cross"`, `"131"`,
  `"diamond-cross-open"`, `"32"`, `"diamond-x"`, `"132"`,
  `"diamond-x-open"`, `"33"`, `"cross-thin"`, `"133"`,
  `"cross-thin-open"`, `"34"`, `"x-thin"`, `"134"`, `"x-thin-open"`,
  `"35"`, `"asterisk"`, `"135"`, `"asterisk-open"`, `"36"`, `"hash"`,
  `"136"`, `"hash-open"`, `"236"`, `"hash-dot"`, `"336"`,
  `"hash-open-dot"`, `"37"`, `"y-up"`, `"137"`, `"y-up-open"`, `"38"`,
  `"y-down"`, `"138"`, `"y-down-open"`, `"39"`, `"y-left"`, `"139"`,
  `"y-left-open"`, `"40"`, `"y-right"`, `"140"`, `"y-right-open"`,
  `"41"`, `"line-ew"`, `"141"`, `"line-ew-open"`, `"42"`, `"line-ns"`,
  `"142"`, `"line-ns-open"`, `"43"`, `"line-ne"`, `"143"`,
  `"line-ne-open"`, `"44"`, `"line-nw"`, `"144"`, `"line-nw-open"`,
  `"45"`, `"arrow-up"`, `"145"`, `"arrow-up-open"`, `"46"`,
  `"arrow-down"`, `"146"`, `"arrow-down-open"`, `"47"`, `"arrow-left"`,
  `"147"`, `"arrow-left-open"`, `"48"`, `"arrow-right"`, `"148"`,
  `"arrow-right-open"`, `"49"`, `"arrow-bar-up"`, `"149"`,
  `"arrow-bar-up-open"`, `"50"`, `"arrow-bar-down"`, `"150"`,
  `"arrow-bar-down-open"`, `"51"`, `"arrow-bar-left"`, `"151"`,
  `"arrow-bar-left-open"`, `"52"`, `"arrow-bar-right"`, `"152"`,
  `"arrow-bar-right-open"`, `"53"`, `"arrow"`, `"153"`, `"arrow-open"`,
  `"54"`, `"arrow-wide"`, `"154"`, `"arrow-wide-open"`, `0`, `100`,
  `200`, `300`, `1`, `101`, `201`, `301`, `2`, `102`, `202`, `302`, `3`,
  `103`, `203`, `303`, `4`, `104`, `204`, `304`, `5`, `105`, `205`,
  `305`, `6`, `106`, `206`, `306`, `7`, `107`, `207`, `307`, `8`, `108`,
  `208`, `308`, `9`, `109`, `209`, `309`, `10`, `110`, `210`, `310`,
  `11`, `111`, `211`, `311`, `12`, `112`, `212`, `312`, `13`, `113`,
  `213`, `313`, `14`, `114`, `214`, `314`, `15`, `115`, `215`, `315`,
  `16`, `116`, `216`, `316`, `17`, `117`, `217`, `317`, `18`, `118`,
  `218`, `318`, `19`, `119`, `219`, `319`, `20`, `120`, `220`, `320`,
  `21`, `121`, `221`, `321`, `22`, `122`, `222`, `322`, `23`, `123`,
  `223`, `323`, `24`, `124`, `224`, `324`, `25`, `125`, `26`, `126`,
  `27`, `127`, `28`, `128`, `29`, `129`, `30`, `130`, `31`, `131`, `32`,
  `132`, `33`, `133`, `34`, `134`, `35`, `135`, `36`, `136`, `236`,
  `336`, `37`, `137`, `38`, `138`, `39`, `139`, `40`, `140`, `41`,
  `141`, `42`, `142`, `43`, `143`, `44`, `144`, `45`, `145`, `46`,
  `146`, `47`, `147`, `48`, `148`, `49`, `149`, `50`, `150`, `51`,
  `151`, `52`, `152`, `53`, `153`, `54`, `154`, or a vector of these.

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
  `go_scattergeo_marker_colorbar_tickfont()` object.

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

  List of named lists or
  `go_scattergeo_marker_colorbar_tickformatstop()` objects.

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

  String (the title text), named list or
  `go_scattergeo_marker_colorbar_title()` object.

- x:

  Sets the x position with respect to \`xref\` of the color bar (in plot
  fraction). When \`xref\` is "paper", defaults to 1.02 when
  \`orientation\` is "v" and 0.5 when \`orientation\` is "h". When
  \`xref\` is "container", defaults to 1 when \`orientation\` is "v" and
  0.5 when \`orientation\` is "h". Must be between 0 and 1 if \`xref\`
  is "container" and between "-2" and 3 if \`xref\` is "paper". Number.

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

- y:

  Sets the y position with respect to \`yref\` of the color bar (in plot
  fraction). When \`yref\` is "paper", defaults to 0.5 when
  \`orientation\` is "v" and 1.02 when \`orientation\` is "h". When
  \`yref\` is "container", defaults to 0.5 when \`orientation\` is "v"
  and 1 when \`orientation\` is "h". Must be between 0 and 1 if \`yref\`
  is "container" and between "-2" and 3 if \`yref\` is "paper". Number.

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

- side:

  Determines the location of color bar's title with respect to the color
  bar. Defaults to "top" when \`orientation\` is "v" and defaults to
  "right" when \`orientation\` is "h". One of `"right"`, `"top"`,
  `"bottom"`.

- type:

  Sets the type of gradient used to fill the markers One of `"radial"`,
  `"horizontal"`, `"vertical"`, `"none"`, or a vector of these.

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_scattergeo()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
`add_scattergeo()` creates an object and adds it to a figure.

Nested objects documented here:

- `go_scattergeo_hoverlabel()`:

  `scattergeo.hoverlabel`

- `go_scattergeo_hoverlabel_font()`:

  `scattergeo.hoverlabel.font`: Sets the font used in hover labels.

- `go_scattergeo_legendgrouptitle()`:

  `scattergeo.legendgrouptitle`

- `go_scattergeo_legendgrouptitle_font()`:

  `scattergeo.legendgrouptitle.font`: Sets this legend group's title
  font.

- `go_scattergeo_line()`:

  `scattergeo.line`

- `go_scattergeo_marker()`:

  `scattergeo.marker`

- `go_scattergeo_marker_colorbar()`:

  `scattergeo.marker.colorbar`

- `go_scattergeo_marker_colorbar_tickfont()`:

  `scattergeo.marker.colorbar.tickfont`: Sets the color bar's tick label
  font

- `go_scattergeo_marker_colorbar_tickformatstop()`:

  `scattergeo.marker.colorbar.tickformatstop`

- `go_scattergeo_marker_colorbar_title()`:

  `scattergeo.marker.colorbar.title`

- `go_scattergeo_marker_colorbar_title_font()`:

  `scattergeo.marker.colorbar.title.font`: Sets this color bar's title
  font.

- `go_scattergeo_marker_gradient()`:

  `scattergeo.marker.gradient`

- `go_scattergeo_marker_line()`:

  `scattergeo.marker.line`

- `go_scattergeo_selected()`:

  `scattergeo.selected`

- `go_scattergeo_selected_marker()`:

  `scattergeo.selected.marker`

- `go_scattergeo_selected_textfont()`:

  `scattergeo.selected.textfont`

- `go_scattergeo_textfont()`:

  `scattergeo.textfont`: Sets the text font.

- `go_scattergeo_unselected()`:

  `scattergeo.unselected`

- `go_scattergeo_unselected_marker()`:

  `scattergeo.unselected.marker`

- `go_scattergeo_unselected_textfont()`:

  `scattergeo.unselected.textfont`

## See also

[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)

## Examples

``` r
go_scattergeo(mode = "markers", marker_color = "red")
#> <go_scattergeo>
#> {
#>   "type": "scattergeo",
#>   "mode": "markers",
#>   "marker": {
#>     "color": "red"
#>   }
#> }
#> 
```
