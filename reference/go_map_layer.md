# Layout map layer objects

The object for an element of the `layers` list of the layout's `map`
([`go_map()`](https://msummersgill.github.io/plotly.R.core/reference/go_map.md)).
`go_map_layer()` creates one, with exactly its properties; a named list
with the same properties works too.

## Usage

``` r
go_map_layer(
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
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- below:

  Determines if the layer will be inserted before the layer with the
  specified ID. If omitted or set to ”, the layer will be inserted above
  every existing layer. String.

- circle:

  A
  [`go_map_layer_circle()`](https://msummersgill.github.io/plotly.R.core/reference/go_map_layer_circle.md)
  object or named list, with properties `radius` (see
  [`go_map_layer_circle()`](https://msummersgill.github.io/plotly.R.core/reference/go_map_layer_circle.md)).

- color:

  Sets the primary layer color. If \`type\` is "circle", color
  corresponds to the circle color (map.layer.paint.circle-color) If
  \`type\` is "line", color corresponds to the line color
  (map.layer.paint.line-color) If \`type\` is "fill", color corresponds
  to the fill color (map.layer.paint.fill-color) If \`type\` is
  "symbol", color corresponds to the icon color
  (map.layer.paint.icon-color) Color: a CSS color string or R color
  name.

- coordinates:

  Sets the coordinates array contains \[longitude, latitude\] pairs for
  the image corners listed in clockwise order: top left, top right,
  bottom right, bottom left. Only has an effect for "image"
  \`sourcetype\`. Any value.

- fill:

  A
  [`go_map_layer_fill()`](https://msummersgill.github.io/plotly.R.core/reference/go_map_layer_fill.md)
  object or named list, with properties `outlinecolor` (see
  [`go_map_layer_fill()`](https://msummersgill.github.io/plotly.R.core/reference/go_map_layer_fill.md)).

- line:

  A
  [`go_map_layer_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_map_layer_line.md)
  object or named list, with properties `dash` and `width` (see
  [`go_map_layer_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_map_layer_line.md)).

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

  A
  [`go_map_layer_symbol()`](https://msummersgill.github.io/plotly.R.core/reference/go_map_layer_symbol.md)
  object or named list, with properties `icon`, `iconsize`, `placement`,
  `text`, `textfont` and `textposition` (see
  [`go_map_layer_symbol()`](https://msummersgill.github.io/plotly.R.core/reference/go_map_layer_symbol.md)).

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

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_map_layer` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
quakes |>
  go_figure() |>
  add_scattermap(lat = ~lat, lon = ~long) |>
  update_layout(
    map = go_map(layers = list(go_map_layer(color = "red")))
  )
```
