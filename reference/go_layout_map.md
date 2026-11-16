# Layout map objects

Properties of `layout.map`.

## Usage

``` r
go_layout_map(
  arg = NULL,
  ...,
  bearing = NULL,
  bounds = NULL,
  center = NULL,
  domain = NULL,
  fitbounds = NULL,
  layers = NULL,
  pitch = NULL,
  style = NULL,
  uirevision = NULL,
  zoom = NULL,
  skip_invalid = FALSE
)

go_layout_map_bounds(
  arg = NULL,
  ...,
  east = NULL,
  north = NULL,
  south = NULL,
  west = NULL,
  skip_invalid = FALSE
)

go_layout_map_center(
  arg = NULL,
  ...,
  lat = NULL,
  lon = NULL,
  skip_invalid = FALSE
)

go_layout_map_domain(
  arg = NULL,
  ...,
  column = NULL,
  row = NULL,
  x = NULL,
  y = NULL,
  skip_invalid = FALSE
)

go_layout_map_layer(
  arg = NULL,
  ...,
  below = NULL,
  circle = NULL,
  color = NULL,
  coordinates = NULL,
  fill = NULL,
  line = NULL,
  maxzoom = NULL,
  minzoom = NULL,
  name = NULL,
  opacity = NULL,
  source = NULL,
  sourceattribution = NULL,
  sourcelayer = NULL,
  sourcetype = NULL,
  symbol = NULL,
  templateitemname = NULL,
  type = NULL,
  visible = NULL,
  skip_invalid = FALSE
)

go_layout_map_layer_circle(
  arg = NULL,
  ...,
  radius = NULL,
  skip_invalid = FALSE
)

go_layout_map_layer_fill(
  arg = NULL,
  ...,
  outlinecolor = NULL,
  skip_invalid = FALSE
)

go_layout_map_layer_line(
  arg = NULL,
  ...,
  dash = NULL,
  width = NULL,
  skip_invalid = FALSE
)

go_layout_map_layer_symbol(
  arg = NULL,
  ...,
  icon = NULL,
  iconsize = NULL,
  placement = NULL,
  text = NULL,
  textfont = NULL,
  textposition = NULL,
  skip_invalid = FALSE
)

go_layout_map_layer_symbol_textfont(
  arg = NULL,
  ...,
  color = NULL,
  family = NULL,
  size = NULL,
  style = NULL,
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

- bearing:

  Sets the bearing angle of the map in degrees counter-clockwise from
  North (map.bearing). Number.

- bounds:

  Named list or `go_layout_map_bounds()` object.

- center:

  Named list or `go_layout_map_center()` object.

- domain:

  Named list or `go_layout_map_domain()` object.

- fitbounds:

  Determines if this subplot's view settings are auto-computed to fit
  trace data. If "locations" (default), the view is auto-fit to the
  lon/lat coordinates of the visible trace data. If FALSE, the view
  settings are used as-is; set this to opt out of auto-fitting. If
  \`fitbounds\` is enabled but a user provides \`center\` or \`zoom\`,
  auto-fit will be skipped. One of `"locations"`, `FALSE`.

- layers:

  List of named lists or `go_layout_map_layer()` objects.

- pitch:

  Sets the pitch angle of the map (in degrees, where 0 means
  perpendicular to the surface of the map) (map.pitch). Number.

- style:

  **`go_layout_map()`**: Defines the map layers that are rendered by
  default below the trace layers defined in \`data\`, which are
  themselves by default rendered below the layers defined in
  \`layout.map.layers\`. These layers can be defined either explicitly
  as a Map Style object which can contain multiple layer definitions
  that load data from any public or private Tile Map Service (TMS or
  XYZ) or Web Map Service (WMS) or implicitly by using one of the
  built-in style objects which use WMSes or by using a custom style URL
  Map Style objects are of the form described in the MapLibre GL JS
  documentation available at https://maplibre.org/maplibre-style-spec/
  The built-in plotly.js styles objects are: basic, carto-darkmatter,
  carto-darkmatter-nolabels, carto-positron, carto-positron-nolabels,
  carto-voyager, carto-voyager-nolabels, dark, light, open-street-map,
  outdoors, satellite, satellite-streets, streets, white-bg. Any value.

  **`go_layout_map_layer_symbol_textfont()`**: Sets whether a font
  should be styled with a normal or italic face from its family. One of
  `"normal"`, `"italic"`.

- uirevision:

  Controls persistence of user-driven changes in the view: \`center\`,
  \`zoom\`, \`bearing\`, \`pitch\`. Defaults to \`layout.uirevision\`.
  Any value.

- zoom:

  Sets the zoom level of the map (map.zoom). Number.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- east:

  Sets the maximum longitude of the map (in degrees East) if \`west\`,
  \`south\` and \`north\` are declared. Number.

- north:

  Sets the maximum latitude of the map (in degrees North) if \`east\`,
  \`west\` and \`south\` are declared. Number.

- south:

  Sets the minimum latitude of the map (in degrees North) if \`east\`,
  \`west\` and \`north\` are declared. Number.

- west:

  Sets the minimum longitude of the map (in degrees East) if \`east\`,
  \`south\` and \`north\` are declared. Number.

- lat:

  Sets the latitude of the center of the map (in degrees North). Number.

- lon:

  Sets the longitude of the center of the map (in degrees East). Number.

- column:

  If there is a layout grid, use the domain for this column in the grid
  for this map subplot. Integer in the interval \[0, Inf\].

- row:

  If there is a layout grid, use the domain for this row in the grid for
  this map subplot. Integer in the interval \[0, Inf\].

- x:

  Sets the horizontal domain of this map subplot (in plot fraction).
  Vector or list of 2 element(s).

- y:

  Sets the vertical domain of this map subplot (in plot fraction).
  Vector or list of 2 element(s).

- below:

  Determines if the layer will be inserted before the layer with the
  specified ID. If omitted or set to ”, the layer will be inserted above
  every existing layer. String.

- circle:

  Named list or `go_layout_map_layer_circle()` object.

- color:

  **`go_layout_map_layer()`**: Sets the primary layer color. If \`type\`
  is "circle", color corresponds to the circle color
  (map.layer.paint.circle-color) If \`type\` is "line", color
  corresponds to the line color (map.layer.paint.line-color) If \`type\`
  is "fill", color corresponds to the fill color
  (map.layer.paint.fill-color) If \`type\` is "symbol", color
  corresponds to the icon color (map.layer.paint.icon-color) Color: a
  CSS color string or R color name.

  **`go_layout_map_layer_symbol_textfont()`**: Color: a CSS color string
  or R color name.

- coordinates:

  Sets the coordinates array contains \[longitude, latitude\] pairs for
  the image corners listed in clockwise order: top left, top right,
  bottom right, bottom left. Only has an effect for "image"
  \`sourcetype\`. Any value.

- fill:

  Named list or `go_layout_map_layer_fill()` object.

- line:

  Named list or `go_layout_map_layer_line()` object.

- maxzoom:

  Sets the maximum zoom level (map.layer.maxzoom). At zoom levels equal
  to or greater than the maxzoom, the layer will be hidden. Number in
  the interval \[0, 24\].

- minzoom:

  Sets the minimum zoom level (map.layer.minzoom). At zoom levels less
  than the minzoom, the layer will be hidden. Number in the interval
  \[0, 24\].

- name:

  When used in a template, named items are created in the output figure
  in addition to any items the figure already has in this array. You can
  modify these items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- opacity:

  Sets the opacity of the layer. If \`type\` is "circle", opacity
  corresponds to the circle opacity (map.layer.paint.circle-opacity) If
  \`type\` is "line", opacity corresponds to the line opacity
  (map.layer.paint.line-opacity) If \`type\` is "fill", opacity
  corresponds to the fill opacity (map.layer.paint.fill-opacity) If
  \`type\` is "symbol", opacity corresponds to the icon/text opacity
  (map.layer.paint.text-opacity) Number in the interval \[0, 1\].

- source:

  Sets the source data for this layer (map.layer.source). When
  \`sourcetype\` is set to "geojson", \`source\` can be a URL to a
  GeoJSON or a GeoJSON object. When \`sourcetype\` is set to "vector" or
  "raster", \`source\` can be a URL or an array of tile URLs. When
  \`sourcetype\` is set to "image", \`source\` can be a URL to an image.
  Any value.

- sourceattribution:

  Sets the attribution for this source. String.

- sourcelayer:

  Specifies the layer to use from a vector tile source
  (map.layer.source-layer). Required for "vector" source type that
  supports multiple layers. String.

- sourcetype:

  Sets the source type for this layer, that is the type of the layer
  data. One of `"geojson"`, `"vector"`, `"raster"`, `"image"`.

- symbol:

  Named list or `go_layout_map_layer_symbol()` object.

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

  Sets the layer type, that is the how the layer data set in \`source\`
  will be rendered With \`sourcetype\` set to "geojson", the following
  values are allowed: "circle", "line", "fill" and "symbol". but note
  that "line" and "fill" are not compatible with Point GeoJSON
  geometries. With \`sourcetype\` set to "vector", the following values
  are allowed: "circle", "line", "fill" and "symbol". With
  \`sourcetype\` set to "raster" or "image", only the "raster" value is
  allowed. One of `"circle"`, `"line"`, `"fill"`, `"symbol"`,
  `"raster"`.

- visible:

  Determines whether this layer is displayed Logical.

- radius:

  Sets the circle radius (map.layer.paint.circle-radius). Has an effect
  only when \`type\` is set to "circle". Number.

- outlinecolor:

  Sets the fill outline color (map.layer.paint.fill-outline-color). Has
  an effect only when \`type\` is set to "fill". Color: a CSS color
  string or R color name.

- dash:

  Sets the length of dashes and gaps (map.layer.paint.line-dasharray).
  Has an effect only when \`type\` is set to "line". Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- width:

  Sets the line width (map.layer.paint.line-width). Has an effect only
  when \`type\` is set to "line". Number.

- icon:

  Sets the symbol icon image (map.layer.layout.icon-image). Full list:
  https://www.mapbox.com/maki-icons/ String.

- iconsize:

  Sets the symbol icon size (map.layer.layout.icon-size). Has an effect
  only when \`type\` is set to "symbol". Number.

- placement:

  Sets the symbol and/or text placement
  (map.layer.layout.symbol-placement). If \`placement\` is "point", the
  label is placed where the geometry is located If \`placement\` is
  "line", the label is placed along the line of the geometry If
  \`placement\` is "line-center", the label is placed on the center of
  the geometry One of `"point"`, `"line"`, `"line-center"`.

- text:

  Sets the symbol text (map.layer.layout.text-field). String.

- textfont:

  Sets the icon text font (color=map.layer.paint.text-color,
  size=map.layer.layout.text-size). Has an effect only when \`type\` is
  set to "symbol". Named list or `go_layout_map_layer_symbol_textfont()`
  object.

- textposition:

  Sets the positions of the \`text\` elements with respects to the (x,y)
  coordinates. One of `"top left"`, `"top center"`, `"top right"`,
  `"middle left"`, `"middle center"`, `"middle right"`, `"bottom left"`,
  `"bottom center"`, `"bottom right"`.

- family:

  HTML font family - the typeface that will be applied by the web
  browser. The web browser can only apply a font if it is available on
  the system where it runs. Provide multiple font families, separated by
  commas, to indicate the order in which to apply fonts if they aren't
  available. String.

- size:

  Number in the interval \[1, Inf\].

- weight:

  Sets the weight (or boldness) of the font. Integer in the interval
  \[1, 1000\].

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_map()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

Nested objects documented here:

- `go_layout_map_bounds()`:

  `layout.map.bounds`

- `go_layout_map_center()`:

  `layout.map.center`

- `go_layout_map_domain()`:

  `layout.map.domain`

- `go_layout_map_layer()`:

  `layout.map.layer`

- `go_layout_map_layer_circle()`:

  `layout.map.layer.circle`

- `go_layout_map_layer_fill()`:

  `layout.map.layer.fill`

- `go_layout_map_layer_line()`:

  `layout.map.layer.line`

- `go_layout_map_layer_symbol()`:

  `layout.map.layer.symbol`

- `go_layout_map_layer_symbol_textfont()`:

  `layout.map.layer.symbol.textfont`: Sets the icon text font
  (color=map.layer.paint.text-color, size=map.layer.layout.text-size).
  Has an effect only when \`type\` is set to "symbol".

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
