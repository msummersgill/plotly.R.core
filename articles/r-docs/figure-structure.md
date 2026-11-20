# The Figure Data Structure

### Overview

plotly.core is an R package for making interactive, publication-quality
graphs: line plots, scatter plots, area charts, bar charts, error bars,
box plots, histograms, heatmaps, subplots, multiple-axes, and 3D (WebGL
based) charts. It is free and open source and you can view the source,
report issues or contribute [on
GitHub](https://github.com/msummersgill/plotly.R.core). The rendering
process uses the [Plotly.js JavaScript
library](https://plotly.com/javascript/) under the hood. Figures are
represented in R as `go_figure` objects: nested lists of typed graph
objects
([`go_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md),
[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md),
[`go_xaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis.md),
…), which are serialized as text in [JavaScript Object Notation
(JSON)](https://json.org/) before being passed to Plotly.js.

Viewing the underlying data structure of a figure can be done with
[`str()`](https://rdrr.io/r/utils/str.html), or as the JSON sent to
Plotly.js with `plotly_json(fig)`.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_scatter(x = c("a", "b", "c"), y = c(1, 3, 2), mode = "lines") |>
  update_layout(
    title = "sample figure",
    xaxis = go_xaxis(title = "x"),
    yaxis = go_yaxis(title = "y"),
    plot_bgcolor = "#c7daec"
  )

str(unclass(fig), max.level = 2)
```

    ## List of 3
    ##  $ data  :List of 1
    ##   ..$ :List of 4
    ##   .. ..- attr(*, "class")= chr [1:2] "go_scatter" "plotly_obj"
    ##  $ layout:List of 4
    ##   ..$ plot_bgcolor: chr "#c7daec"
    ##   ..$ title       :List of 1
    ##   .. ..- attr(*, "class")= chr [1:2] "go_layout_title" "plotly_obj"
    ##   ..$ xaxis       :List of 1
    ##   .. ..- attr(*, "class")= chr [1:2] "go_layout_xaxis" "plotly_obj"
    ##   ..$ yaxis       :List of 1
    ##   .. ..- attr(*, "class")= chr [1:2] "go_layout_yaxis" "plotly_obj"
    ##   ..- attr(*, "class")= chr [1:2] "go_layout" "plotly_obj"
    ##  $ frames: list()

``` r

plotly_json(fig)
```

    ## {
    ##   "data": [
    ##     {
    ##       "type": "scatter",
    ##       "mode": "lines",
    ##       "x": ["a", "b", "c"],
    ##       "y": [1,3,2]
    ##     }
    ##   ],
    ##   "layout": {
    ##     "plot_bgcolor": "#c7daec",
    ##     "title": {
    ##       "text": "sample figure"
    ##     },
    ##     "xaxis": {
    ##       "title": {
    ##         "text": "x"
    ##       }
    ##     },
    ##     "yaxis": {
    ##       "title": {
    ##         "text": "y"
    ##       }
    ##     },
    ##     "template": {
    ##       "layout": {
    ##         "margin": {
    ##           "b": 40,
    ##           "l": 60,
    ##           "t": 25,
    ##           "r": 10
    ##         },
    ##         "colorscale": {
    ##           "sequential": [
    ##             [
    ##               0,
    ##               "#440154"
    ##             ],
    ##             [
    ##               0.0627450980392157,
    ##               "#48186a"
    ##             ],
    ##             [
    ##               0.125490196078431,
    ##               "#472d7b"
    ##             ],
    ##             [
    ##               0.188235294117647,
    ##               "#424086"
    ##             ],
    ##             [
    ##               0.250980392156863,
    ##               "#3b528b"
    ##             ],
    ##             [
    ##               0.313725490196078,
    ##               "#33638d"
    ##             ],
    ##             [
    ##               0.376470588235294,
    ##               "#2c728e"
    ##             ],
    ##             [
    ##               0.43921568627451,
    ##               "#26828e"
    ##             ],
    ##             [
    ##               0.501960784313725,
    ##               "#21918c"
    ##             ],
    ##             [
    ##               0.564705882352941,
    ##               "#1fa088"
    ##             ],
    ##             [
    ##               0.627450980392157,
    ##               "#28ae80"
    ##             ],
    ##             [
    ##               0.690196078431373,
    ##               "#3fbc73"
    ##             ],
    ##             [
    ##               0.752941176470588,
    ##               "#5ec962"
    ##             ],
    ##             [
    ##               0.815686274509804,
    ##               "#84d44b"
    ##             ],
    ##             [
    ##               0.87843137254902,
    ##               "#addc30"
    ##             ],
    ##             [
    ##               0.941176470588235,
    ##               "#d8e219"
    ##             ],
    ##             [
    ##               1,
    ##               "#fde725"
    ##             ]
    ##           ],
    ##           "sequentialminus": [
    ##             [
    ##               0,
    ##               "#440154"
    ##             ],
    ##             [
    ##               0.0627450980392157,
    ##               "#48186a"
    ##             ],
    ##             [
    ##               0.125490196078431,
    ##               "#472d7b"
    ##             ],
    ##             [
    ##               0.188235294117647,
    ##               "#424086"
    ##             ],
    ##             [
    ##               0.250980392156863,
    ##               "#3b528b"
    ##             ],
    ##             [
    ##               0.313725490196078,
    ##               "#33638d"
    ##             ],
    ##             [
    ##               0.376470588235294,
    ##               "#2c728e"
    ##             ],
    ##             [
    ##               0.43921568627451,
    ##               "#26828e"
    ##             ],
    ##             [
    ##               0.501960784313725,
    ##               "#21918c"
    ##             ],
    ##             [
    ##               0.564705882352941,
    ##               "#1fa088"
    ##             ],
    ##             [
    ##               0.627450980392157,
    ##               "#28ae80"
    ##             ],
    ##             [
    ##               0.690196078431373,
    ##               "#3fbc73"
    ##             ],
    ##             [
    ##               0.752941176470588,
    ##               "#5ec962"
    ##             ],
    ##             [
    ##               0.815686274509804,
    ##               "#84d44b"
    ##             ],
    ##             [
    ##               0.87843137254902,
    ##               "#addc30"
    ##             ],
    ##             [
    ##               0.941176470588235,
    ##               "#d8e219"
    ##             ],
    ##             [
    ##               1,
    ##               "#fde725"
    ##             ]
    ##           ],
    ##           "diverging": [
    ##             [
    ##               0,
    ##               "#440154"
    ##             ],
    ##             [
    ##               0.0627450980392157,
    ##               "#48186a"
    ##             ],
    ##             [
    ##               0.125490196078431,
    ##               "#472d7b"
    ##             ],
    ##             [
    ##               0.188235294117647,
    ##               "#424086"
    ##             ],
    ##             [
    ##               0.250980392156863,
    ##               "#3b528b"
    ##             ],
    ##             [
    ##               0.313725490196078,
    ##               "#33638d"
    ##             ],
    ##             [
    ##               0.376470588235294,
    ##               "#2c728e"
    ##             ],
    ##             [
    ##               0.43921568627451,
    ##               "#26828e"
    ##             ],
    ##             [
    ##               0.501960784313725,
    ##               "#21918c"
    ##             ],
    ##             [
    ##               0.564705882352941,
    ##               "#1fa088"
    ##             ],
    ##             [
    ##               0.627450980392157,
    ##               "#28ae80"
    ##             ],
    ##             [
    ##               0.690196078431373,
    ##               "#3fbc73"
    ##             ],
    ##             [
    ##               0.752941176470588,
    ##               "#5ec962"
    ##             ],
    ##             [
    ##               0.815686274509804,
    ##               "#84d44b"
    ##             ],
    ##             [
    ##               0.87843137254902,
    ##               "#addc30"
    ##             ],
    ##             [
    ##               0.941176470588235,
    ##               "#d8e219"
    ##             ],
    ##             [
    ##               1,
    ##               "#fde725"
    ##             ]
    ##           ]
    ##         }
    ##       }
    ##     }
    ##   },
    ##   "frames": [],
    ##   "config": {}
    ## }

``` r

fig
```

### Figures as Trees of Attributes

Plotly.js supports inputs adhering to a well-defined schema, whose
overall architecture is explained in this page and which is exhaustively
documented in the [Figure Reference](https://plotly.com/r/reference/)
(which is itself generated from a [machine-readable JSON representation
of the
schema](https://raw.githubusercontent.com/plotly/plotly.js/master/dist/plot-schema.json)).
Figures are represented as trees with named nodes called “attributes”.

Attributes are referred to in text and in the [Figure
Reference](https://plotly.com/r/reference/) by their names. For example
`layout$width` refers to the attribute whose key is `"width"` inside a
list which is the value associated with a key `"layout"` at the root of
the figure.

When manipulating a `go_figure` object, attributes can be set directly
with R list assignment,
e.g. `fig$layout$title$font$family <- "Open Sans"`, or using
`fig |> update_layout(title = go_layout_title(font = go_font(family = "Open Sans")))`.

When building a figure, it is *not necessary to populate every
attribute* of every object. At render-time, the JavaScript layer will
compute default values for each required unspecified attribute,
depending upon the ones that are specified, as documented in the [Figure
Reference](https://plotly.com/r/reference/). An example of this would be
`layout.xaxis.range`, which may be specified explicitly, but if not will
be computed based on the range of `x` values for every trace linked to
that axis. The JavaScript layer will ignore unknown attributes or
malformed values, although plotly.core validates every attribute in R as
the figure is built, and reports invalid properties with an error naming
the valid ones.

### The Top-Level `data` Attribute

The first of the three top-level attributes of a figure is `data`, whose
value must be a list referred to as “traces”.

- Each trace has one of more than 40 possible types (see below for a
  list organized by subplot type, including
  e.g. [`scatter`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/line-and-scatter.md),
  [`bar`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/bar-charts.md),
  [`pie`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/pie-charts.md),
  [`surface`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-surface-plots.md),
  [`choropleth`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/choropleth-maps.md)
  etc), and represents a set of related graphical marks in a figure.
  Each trace must have a `type` attribute which defines the other
  allowable attributes.
- Each trace is drawn on a single
  [subplot](https://msummersgill.github.io/plotly.R.core/articles/r-docs/subplots.md)
  whose type must be compatible with the trace’s type, or is its own
  subplot (see below).
- Traces may have a single
  [legend](https://msummersgill.github.io/plotly.R.core/articles/r-docs/legend.md)
  entry, with the exception of pie and funnelarea traces (see below).
- Certain trace types support [continuous color, with an associated
  colorbar](https://plotly.com/r/colorscales/), which can be controlled
  by attributes either within the trace, or within the layout when using
  the coloraxis attribute (see
  [`go_coloraxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_coloraxis.md)).

### The Top-Level `layout` Attribute

The second of the three top-level attributes of a figure is `layout`,
whose value is referred to in text as “the layout” and must be a list,
containing attributes that control positioning and configuration of
non-data-related parts of the figure such as:

- Dimensions and margins, which define the bounds of “paper coordinates”
  (see below)
- Title and
  [legend](https://msummersgill.github.io/plotly.R.core/articles/r-docs/legend.md)
  (positionable in container and/or paper coordinates)
- [Color axes and associated color
  bars](https://plotly.com/r/colorscales/) (positionable in paper
  coordinates)
- Subplots of various types on which can be drawn multiple traces and
  which are positioned in paper coordinates:
  - `xaxis`, `yaxis`, `xaxis2`, `yaxis3` etc: X and Y cartesian axes,
    the intersections of which are cartesian subplots
  - `scene`, `scene2`, `scene3` etc: 3d scene subplots
  - `ternary`, `ternary2`, `ternary3`, `polar`, `polar2`, `polar3`,
    `geo`, `geo2`, `geo3`, `map`, `map2`, `map3` etc: ternary, polar,
    geo or map subplots
- Non-data marks which can be positioned in paper coordinates, or in
  data coordinates linked to 2d cartesian subplots:
  - `annotations`: [textual annotations with or without
    arrows](https://msummersgill.github.io/plotly.R.core/articles/r-docs/text-and-annotations.md)
  - `shapes`: [lines, rectangles, ellipses or open or closed
    paths](https://msummersgill.github.io/plotly.R.core/articles/r-docs/shapes.md)
- Controls which can be positioned in paper coordinates and which can
  trigger Plotly.js functions when interacted with by a user:
  - `updatemenus`: [single buttons,
    toggles](https://msummersgill.github.io/plotly.R.core/articles/r-docs/custom-buttons.md)
    and [dropdown
    menus](https://msummersgill.github.io/plotly.R.core/articles/r-docs/dropdowns.md)
  - `sliders`: [slider
    controls](https://msummersgill.github.io/plotly.R.core/articles/r-docs/sliders.md)

### The Top-Level `frames` Attribute

The third of the three top-level attributes of a figure is `frames`,
whose value must be a list that define sequential frames in an [animated
plot](https://msummersgill.github.io/plotly.R.core/articles/r-docs/animations.md).
Each frame contains its own data attribute as well as other parameters.
Animations are usually triggered and controlled via controls defined in
layout.sliders and/or layout.updatemenus

### Positioning With Paper, Container Coordinates, or Axis Domain Coordinates

Various figure components configured within the layout of the figure
support positioning attributes named `x` or `y`, whose values may be
specified in “paper coordinates” (sometimes referred to as “plot
fractions” or “normalized coordinates”). Examples include
`layout.xaxis.domain` or `layout.legend.x` or `layout.annotation.x`.

Positioning in paper coordinates is *not* done in absolute pixel terms,
but rather in terms relative to a coordinate system defined with an
origin `(0,0)` at `(layout.margin.l, layout.margin.b)` and a point
`(1,1)` at
`(layout.width-layout.margin.r, layout.height-layout.margin.t)` (note:
`layout.margin` values are pixel values, as are `layout.width` and
`layout.height`). Paper coordinate values less than 0 or greater than 1
are permitted, and refer to areas within the plot margins.

To position an object in “paper” coordinates, the corresponding axis
reference is set to `"paper"`. For instance a shape’s `xref` attribute
would be set to `"paper"` so that the `x` value of the shape refers to
its position in paper coordinates.

Note that the contents of the `layout.margin` attribute are by default
computed based on the position and dimensions of certain items like the
title or legend, and may be made dependent on the position and
dimensions of tick labels as well when setting the
`layout.xaxis.automargin` attribute to `True`. This has the effect of
automatically increasing the margin values and therefore shrinking the
physical area defined between the `(0,0)` and `(1,1)` points.
Positioning certain items at paper coordinates less than 0 or greater
than 1 will also trigger this behavior. The `layout.width` and
`layout.height`, however, are taken as givens, so a figure will never
grow or shrink based on its contents.

The figure title may be positioned using “container coordinates” which
have `(0,0)` and `(1,1)` anchored at the bottom-left and top-right of
the figure, respectively, and therefore are independent of the values of
layout.margin.

Furthermore, shapes, annotations, and images can be placed relative to
an axis’s domain so that, for instance, an `x` value of `0.5` would
place the object halfway along the x-axis, regardless of the domain as
specified in the `layout.xaxis.domain` attribute. This behavior can be
specified by adding `' domain'` to the axis reference in the axis
referencing attribute of the object. For example, setting
`yref = 'y2 domain'` for a shape will refer to the length and position
of the axis named `y2`.

### 2D Cartesian Trace Types and Subplots

The most commonly-used kind of subplot is a [two-dimensional Cartesian
subplot](https://msummersgill.github.io/plotly.R.core/articles/r-docs/axes.md).
Traces compatible with these subplots support `xaxis` and `yaxis`
attributes whose values must refer to corresponding objects in the
layout portion of the figure. For example, if `xaxis="x"`, and
`yaxis="y"` (which is the default) then this trace is drawn on the
subplot at the intersection of the axes configured under `layout.xaxis`
and `layout.yaxis`, but if `xaxis="x2"` and `yaxis="y3"` then the trace
is drawn at the intersection of the axes configured under
`layout.xaxis2` and `layout.yaxis3`. Note that attributes such as
`layout.xaxis` and `layout.xaxis2` etc do not have to be explicitly
defined, in which case default values will be inferred. Multiple traces
of different types can be drawn on the same subplot.

X- and Y-axes support the `type` attribute, which enables them to
represent [continuous values (`type="linear"`,
`type="log"`)](https://msummersgill.github.io/plotly.R.core/articles/r-docs/axes.md),
temporal values (`type="date"`) or [categorical values
(`type="category"`,
`type="multicategory`)](https://msummersgill.github.io/plotly.R.core/articles/r-docs/bar-charts.md).
Axes can also be overlaid on top of one another to create [dual-axis or
multiple-axis
charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/multiple-axes.md).
2-d cartesian subplots lend themselves very well to creating “small
multiples” figures, also known as facet or trellis plots.

The following trace types are compatible with 2d-cartesian subplots via
the `xaxis` and `yaxis` attributes:

- scatter-like trace types:
  [`scatter`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/line-and-scatter.md)
  and
  [`scattergl`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/webgl-vs-svg.md),
  which can be used to draw [scatter
  plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/line-and-scatter.md),
  [line plots and
  curves](https://msummersgill.github.io/plotly.R.core/articles/r-docs/line-charts.md),
  [bubble
  charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/bubble-charts.md),
  [dot
  plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/dot-plots.md)
  and [filled
  areas](https://msummersgill.github.io/plotly.R.core/articles/r-docs/filled-area-plots.md)
  and also support [error
  bars](https://msummersgill.github.io/plotly.R.core/articles/r-docs/error-bars.md)
- [`bar`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/bar-charts.md),
  [`funnel`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/funnel-charts.md),
  [`waterfall`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/waterfall-charts.md):
  bar-like trace types which can also be used to draw [timelines and
  Gantt
  charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/gantt.md)
- [`histogram`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/histograms.md):
  an *aggregating* bar-like trace type
- [`box`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/box-plots.md)
  and
  [`violin`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/violin.md):
  1-dimensional distribution-like trace types
- [`heatmap`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/heatmaps.md)
  and
  [`contour`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/contour-plots.md):
  matrix trace types
- [`histogram2d`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/2d-histogram.md)
  and
  [`histogram2dcontour`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/2d-histogram-contour.md):
  2-dimensional distribution-like density trace types
- [`ohlc`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/ohlc-charts.md)
  and
  [`candlestick`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/candlestick-charts.md):
  stock-like trace types
- [`carpet`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/carpet-plot.md):
  a special trace type for building [carpet
  plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/carpet-plot.md),
  in that other traces can use as subplots (see below)
- [`splom`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/splom.md):
  multi-dimensional scatter plots which implicitly refer to many 2-d
  cartesian subplots at once.

### 3D, Polar and Ternary Trace Types and Subplots

Beyond 2D cartesian subplots, figures can include [three-dimensional
cartesian subplots](https://plotly.com/r/3d-charts/), [polar
subplots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/polar-chart.md)
and [ternary
subplots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/ternary-plots.md).
The following trace types support attributes named `scene`, `polar` or
`ternary`, whose values must refer to corresponding objects in the
layout portion of the figure i.e. `ternary="ternary2"` etc. Note that
attributes such as `layout.scene` and `layout.ternary2` etc do not have
to be explicitly defined, in which case default values will be inferred.
Multiple traces of a compatible type can be placed on the same subplot.

The following trace types are compatible with 3D subplots via the
`scene` attribute, which contains special camera controls (see
[`go_scene_camera()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_camera.md)):

- [`scatter3d`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-scatter-plots.md),
  which can be used to draw [individual
  markers](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-scatter-plots.md),
  [lines and
  curves](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-line-plots.md)
- [`surface`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-surface-plots.md)
  and
  [`mesh`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-mesh.md):
  3d surface trace types
- [`cone`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/cone-plot.md)
  and
  [`streamtube`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/streamtube-plot.md):
  3d vector field trace types
- `volume` (see
  [`go_volume()`](https://msummersgill.github.io/plotly.R.core/reference/go_volume.md))
  and
  [`isosurface`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-isosurface-plots.md):
  3d volume trace types

The following trace types are compatible with polar subplots via the
`polar` attribute:

- scatter-like trace types: [`scatterpolar` and
  `scatterpolargl`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/polar-chart.md),
  which can be used to draw individual markers, [curves and filled areas
  (i.e. radar or spider
  charts)](https://msummersgill.github.io/plotly.R.core/articles/r-docs/radar-chart.md)
- [`barpolar`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/polar-chart.md)

The following trace types are compatible with ternary subplots via the
`ternary` attribute:

- [`scatterternary`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/ternary-plots.md),
  which can be used to draw individual markers, [curves and filled
  areas](https://msummersgill.github.io/plotly.R.core/articles/r-docs/ternary-contour.md)

### Map Trace Types and Subplots

Figures can include two different types of map subplots: [geo subplots
for outline
maps](https://msummersgill.github.io/plotly.R.core/articles/r-docs/choropleth-maps.html#base-map-configuration)
and [map subplots for tile
maps](https://msummersgill.github.io/plotly.R.core/articles/r-docs/mapbox-layers.md).
The following trace types support attributes named `geo` or `map`, whose
values must refer to corresponding objects in the layout
i.e. `geo="geo2"` etc. Note that attributes such as `layout.geo2` and
`layout.map` etc do not have to be explicitly defined, in which case
default values will be inferred. Multiple traces of a compatible type
can be placed on the same subplot.

The following trace types are compatible with geo subplots via the `geo`
attribute:

- [`scattergeo`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/scatter-plots-on-maps.md),
  which can be used to draw [individual
  markers](https://msummersgill.github.io/plotly.R.core/articles/r-docs/scatter-plots-on-maps.md),
  [line and
  curves](https://msummersgill.github.io/plotly.R.core/articles/r-docs/lines-on-maps.md)
  and filled areas on outline maps
- [`choropleth`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/choropleth-maps.md):
  [colored
  polygons](https://msummersgill.github.io/plotly.R.core/articles/r-docs/choropleth-maps.md)
  on outline maps

The following trace types are compatible with map subplots (MapLibre
tile maps, which replace the removed Mapbox subplots) via the `map`
attribute:

- [`scattermap`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/scatter-plots-on-maps.md),
  which can be used to draw [individual
  markers](https://msummersgill.github.io/plotly.R.core/articles/r-docs/scatter-plots-on-maps.md),
  [lines and
  curves](https://msummersgill.github.io/plotly.R.core/articles/r-docs/lines-on-maps.md)
  and [filled
  areas](https://msummersgill.github.io/plotly.R.core/articles/r-docs/filled-area-on-mapbox.md)
  on tile maps
- [`choroplethmap`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/choropleth-maps.md):
  colored polygons on tile maps
- [`densitymap`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/mapbox-density-heatmaps.md):
  density heatmaps on tile maps

### Traces Which Are Their Own Subplots

Certain trace types cannot share subplots, and hence have no attribute
to map to a corresponding subplot in the layout. Instead, these traces
are their own subplot and support a `domain` attribute for position,
which enables the trace to be positioned in paper coordinates (see
below). With the exception of `pie` and `funnelarea`, such traces also
do not support legends (see below)

The following trace types are their own subplots and support a domain
attribute:

- [`pie`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/pie-charts.md)
  and
  [`funnelarea`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/waterfall-charts.md):
  one-level part-to-whole relationships with legend items
- [`sunburst`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/sunburst-charts.md)
  and
  [`treemap`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/treemaps.md):
  hierarchical multi-level part-to-whole relationships
- [`parcoords`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/parallel-coordinates-plot.md)
  and `parcats` (see
  [`go_parcats()`](https://msummersgill.github.io/plotly.R.core/reference/go_parcats.md)):
  continuous and categorical multidimensional figures with [parallel
  coordinates](https://msummersgill.github.io/plotly.R.core/articles/r-docs/parallel-coordinates-plot.md)
  and parallel sets
- [`sankey`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/sankey-diagram.md):
  [flow
  diagrams](https://msummersgill.github.io/plotly.R.core/articles/r-docs/sankey-diagram.md)
- [`table`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/table.md):
  [text-based
  tables](https://msummersgill.github.io/plotly.R.core/articles/r-docs/table.md)
- `indicator` (see
  [`go_indicator()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator.md)):
  big numbers,
  [gauges](https://msummersgill.github.io/plotly.R.core/articles/r-docs/gauge-charts.md),
  and [bullet
  charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/bullet-charts.md)

### Carpet Trace Types and Subplots

Certain trace types use [traces of type `carpet` as a
subplot](https://msummersgill.github.io/plotly.R.core/articles/r-docs/carpet-plot.md).
These support a `carpet` attribute whose value must match the value of
the `carpet` attribute of the `carpet` trace they are to be drawn on.
Multiple compatible traces can be placed on the same `carpet` trace.

The following trace types are compatible with `carpet` trace subplots
via the `carpet` attribute:

- [`scattercarpet`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/carpet-scatter.md),
  which can be used to draw individual markers, curves and filled areas
- [`contourcarpet`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/carpet-plot.md)

### Trace Types, Legends and Color Bars

Traces of most types can be optionally associated with a single legend
item in the
[legend](https://msummersgill.github.io/plotly.R.core/articles/r-docs/legend.md).
Whether or not a given trace appears in the legend is controlled via the
`showlegend` attribute. Traces which are their own subplots (see above)
do not support this, with the exception of traces of type `pie` and
`funnelarea` for which every distinct color represented in the trace
gets a separate legend item. Users may show or hide traces by clicking
or double-clicking on their associated legend item. Traces that support
legend items also support the `legendgroup` attribute, and all traces
with the same legend group are treated the same way during
click/double-click interactions.

The fact that legend items are linked to traces means that when using
[discrete color](https://plotly.com/r/colorscales/), a figure must have
one trace per color in order to get a meaningful legend.

Traces which support [continuous
color](https://plotly.com/r/colorscales/) can also be associated with
color axes in the layout via the `coloraxis` attribute. Multiple traces
can be linked to the same color axis. Color axes have a legend-like
component called color bars. Alternatively, color axes can be configured
within the trace itself.
