# Layout modebar objects

Properties of `layout.modebar`.

## Usage

``` r
go_layout_modebar(
  arg = NULL,
  ...,
  activecolor = NULL,
  add = NULL,
  bgcolor = NULL,
  color = NULL,
  orientation = NULL,
  remove = NULL,
  uirevision = NULL,
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

- activecolor:

  Sets the color of the active or hovered on icons in the modebar.
  Color: a CSS color string or R color name.

- add:

  Determines which predefined modebar buttons to add. Please note that
  these buttons will only be shown if they are compatible with all trace
  types used in a graph. Similar to \`config.modeBarButtonsToAdd\`
  option. This may include "v1hovermode", "hoverclosest",
  "hovercompare", "togglehover", "togglespikelines", "drawline",
  "drawopenpath", "drawclosedpath", "drawcircle", "drawrect",
  "eraseshape", "downloadJson". String, or a vector of these.

- bgcolor:

  Sets the background color of the modebar. Color: a CSS color string or
  R color name.

- color:

  Sets the color of the icons in the modebar. Color: a CSS color string
  or R color name.

- orientation:

  Sets the orientation of the modebar. One of `"v"`, `"h"`.

- remove:

  Determines which predefined modebar buttons to remove. Similar to
  \`config.modeBarButtonsToRemove\` option. This may include
  "autoScale2d", "autoscale", "hoverCompareCartesian", "hovercompare",
  "lasso", "lasso2d", "orbitRotation", "orbitrotation", "pan", "pan2d",
  "pan3d", "reset", "resetCameraDefault3d", "resetCameraLastSave3d",
  "resetGeo", "resetSankeyGroup", "resetScale2d", "resetViewMap",
  "resetViews", "resetcameradefault", "resetcameralastsave",
  "resetsankeygroup", "resetscale", "resetview", "resetviews", "select",
  "select2d", "sendChartToCloud", "sendcharttocloud", "tableRotation",
  "tablerotation", "toImage", "toggleHover", "toggleSpikelines",
  "togglehover", "togglespikelines", "toimage", "zoom", "zoom2d",
  "zoom3d", "zoomIn2d", "zoomInGeo", "zoomInMap", "zoomOut2d",
  "zoomOutGeo", "zoomOutMap", "zoomin", "zoomout". String, or a vector
  of these.

- uirevision:

  Controls persistence of user-driven changes related to the modebar,
  including \`hovermode\`, \`dragmode\`, and \`showspikes\` at both the
  root level and inside subplots. Defaults to \`layout.uirevision\`. Any
  value.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_modebar()` create validated graph objects (named lists).
Every property is checked against the plotly.js schema when an object is
created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
