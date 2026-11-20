# Plotly R examples

These examples are adapted from the [Plotly R
documentation](https://plotly.com/r/), rewritten with plotly.core’s
graph objects:
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
`add_<trace>()`,
[`update_layout()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md)
and the `go_*()` constructors.

## Fundamentals

[![](thumb-figure-structure.png)The Figure Data
Structure](https://msummersgill.github.io/plotly.R.core/articles/r-docs/figure-structure.md)
[![](thumb-creating-and-updating-figures.png)Creating and Updating
Figures](https://msummersgill.github.io/plotly.R.core/articles/r-docs/creating-and-updating-figures.md)
[![](thumb-renderers.png)Displaying
Figures](https://msummersgill.github.io/plotly.R.core/articles/r-docs/renderers.md)
[](https://msummersgill.github.io/plotly.R.core/articles/r-docs/static-image-export.md)

Exporting Graphs as Static Images
[![](thumb-configuration-options.png)Configuration](https://msummersgill.github.io/plotly.R.core/articles/r-docs/configuration-options.md)
[![](thumb-setting-graph-size.png)Setting Graph
Size](https://msummersgill.github.io/plotly.R.core/articles/r-docs/setting-graph-size.md)
[![](thumb-tick-formatting.png)Formatting
Ticks](https://msummersgill.github.io/plotly.R.core/articles/r-docs/tick-formatting.md)
[![](thumb-figure-labels.png)Setting the Font, Title, Legend Entries,
and Axis
Titles](https://msummersgill.github.io/plotly.R.core/articles/r-docs/figure-labels.md)
[![](thumb-axes.png)Axes](https://msummersgill.github.io/plotly.R.core/articles/r-docs/axes.md)
[![](thumb-legend.png)Legends](https://msummersgill.github.io/plotly.R.core/articles/r-docs/legend.md)
[![](thumb-multiple-axes.png)Multiple
Axes](https://msummersgill.github.io/plotly.R.core/articles/r-docs/multiple-axes.md)
[![](thumb-shapes.png)Shapes](https://msummersgill.github.io/plotly.R.core/articles/r-docs/shapes.md)
[![](thumb-subplots.png)Subplots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/subplots.md)
[![](thumb-graphing-multiple-chart-types.png)Multiple Chart
Types](https://msummersgill.github.io/plotly.R.core/articles/r-docs/graphing-multiple-chart-types.md)
[![](thumb-marker-style.png)Marker
Styling](https://msummersgill.github.io/plotly.R.core/articles/r-docs/marker-style.md)
[![](thumb-text-and-annotations.png)Text and
Annotations](https://msummersgill.github.io/plotly.R.core/articles/r-docs/text-and-annotations.md)
[![](thumb-hover-text-and-formatting.png)Hover Text and
Formatting](https://msummersgill.github.io/plotly.R.core/articles/r-docs/hover-text-and-formatting.md)
[![](thumb-images.png)Images](https://msummersgill.github.io/plotly.R.core/articles/r-docs/images.md)
[](https://msummersgill.github.io/plotly.R.core/articles/r-docs/builtin-colorscales.md)

Built-in Continuous Color Scales [![](thumb-discrete-color.png)Discrete
Colors](https://msummersgill.github.io/plotly.R.core/articles/r-docs/discrete-color.md)
[![](thumb-styling-figures.png)Styling Plotly Figures in
R](https://msummersgill.github.io/plotly.R.core/articles/r-docs/styling-figures.md)
[![](thumb-horizontal-vertical-shapes.png)Horizontal and Vertical Lines
and
Rectangles](https://msummersgill.github.io/plotly.R.core/articles/r-docs/horizontal-vertical-shapes.md)
[![](thumb-3d-axes.png)3D
Axes](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-axes.md)
[![](thumb-3d-hover.png)3D Hover
Options](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-hover.md)
[![](thumb-3d-surface-lighting.png)3D Surface
Lighting](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-surface-lighting.md)
[![](thumb-latex.png)LaTeX Typesetting in R
Graphs](https://msummersgill.github.io/plotly.R.core/articles/r-docs/latex.md)
[![](thumb-logos.png)Embedding Logos in Plotly
Graphs](https://msummersgill.github.io/plotly.R.core/articles/r-docs/logos.md)
[](https://msummersgill.github.io/plotly.R.core/articles/r-docs/locales.md)

Locales [![](thumb-webgl-text-and-annotations.png)WebGL Text and
Annotations](https://msummersgill.github.io/plotly.R.core/articles/r-docs/webgl-text-and-annotations.md)
[![](thumb-colorway.png)Colorway](https://msummersgill.github.io/plotly.R.core/articles/r-docs/colorway.md)
[](https://msummersgill.github.io/plotly.R.core/articles/r-docs/troubleshooting.md)

Troubleshooting

## Basic Charts

[![](thumb-line-and-scatter.png)Scatter and Line
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/line-and-scatter.md)
[![](thumb-line-charts.png)Line
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/line-charts.md)
[![](thumb-bar-charts.png)Bar
Charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/bar-charts.md)
[![](thumb-pie-charts.png)Pie
Charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/pie-charts.md)
[![](thumb-bubble-charts.png)Bubble
Charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/bubble-charts.md)
[](https://msummersgill.github.io/plotly.R.core/articles/r-docs/webgl-vs-svg.md)

WebGL vs SVG in R

[![](thumb-filled-area-plots.png)Filled Area
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/filled-area-plots.md)
[![](thumb-horizontal-bar-charts.png)Horizontal Bar
Charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/horizontal-bar-charts.md)
[![](thumb-gantt.png)Gantt
Charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/gantt.md)
[![](thumb-sunburst-charts.png)Sunburst
Charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/sunburst-charts.md)
[![](thumb-table.png)Tables](https://msummersgill.github.io/plotly.R.core/articles/r-docs/table.md)
[![](thumb-dot-plots.png)Dot
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/dot-plots.md)
[![](thumb-dumbbell-plots.png)Dumbbell
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/dumbbell-plots.md)
[![](thumb-sankey-diagram.png)Sankey
Diagram](https://msummersgill.github.io/plotly.R.core/articles/r-docs/sankey-diagram.md)
[![](thumb-treemaps.png)Treemap
Charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/treemaps.md)

## Statistical Charts

[![](thumb-2d-histogram.png)2D
Histograms](https://msummersgill.github.io/plotly.R.core/articles/r-docs/2d-histogram.md)
[![](thumb-box-plots.png)Box
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/box-plots.md)
[![](thumb-histograms.png)Histograms](https://msummersgill.github.io/plotly.R.core/articles/r-docs/histograms.md)
[![](thumb-error-bars.png)Error
Bars](https://msummersgill.github.io/plotly.R.core/articles/r-docs/error-bars.md)
[![](thumb-violin.png)Violin
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/violin.md)
[![](thumb-2d-histogram-contour.png)2D Histogram
Contour](https://msummersgill.github.io/plotly.R.core/articles/r-docs/2d-histogram-contour.md)
[![](thumb-splom.png)Splom](https://msummersgill.github.io/plotly.R.core/articles/r-docs/splom.md)
[](https://msummersgill.github.io/plotly.R.core/articles/r-docs/distplot.md)

Distplots

## Scientific Charts

[![](thumb-log-plot.png)Log
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/log-plot.md)
[![](thumb-contour-plots.png)Contour
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/contour-plots.md)
[![](thumb-heatmaps.png)Heatmaps](https://msummersgill.github.io/plotly.R.core/articles/r-docs/heatmaps.md)
[![](thumb-network-graphs.png)Network
Graph](https://msummersgill.github.io/plotly.R.core/articles/r-docs/network-graphs.md)
[![](thumb-ternary-contour.png)Ternary Contour
Plot](https://msummersgill.github.io/plotly.R.core/articles/r-docs/ternary-contour.md)
[![](thumb-parallel-coordinates-plot.png)Parallel Coordinates
Plot](https://msummersgill.github.io/plotly.R.core/articles/r-docs/parallel-coordinates-plot.md)
[![](thumb-carpet-plot.png)Carpet
Plot](https://msummersgill.github.io/plotly.R.core/articles/r-docs/carpet-plot.md)
[![](thumb-carpet-scatter.png)Carpet Scatter
Plot](https://msummersgill.github.io/plotly.R.core/articles/r-docs/carpet-scatter.md)
[![](thumb-carpet-contour.png)Carpet Contour
Plot](https://msummersgill.github.io/plotly.R.core/articles/r-docs/carpet-contour.md)
[![](thumb-polar-chart.png)Polar
Charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/polar-chart.md)
[![](thumb-radar-chart.png)Radar
Charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/radar-chart.md)
[![](thumb-heatmap-webgl.png)WebGL
Heatmaps](https://msummersgill.github.io/plotly.R.core/articles/r-docs/heatmap-webgl.md)
[![](thumb-ternary-plots.png)Ternary
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/ternary-plots.md)
[![](thumb-displaying-images.png)Display Image
Data](https://msummersgill.github.io/plotly.R.core/articles/r-docs/displaying-images.md)

## Financial Charts

[![](thumb-time-series.png)Time Series and Date
Axes](https://msummersgill.github.io/plotly.R.core/articles/r-docs/time-series.md)
[![](thumb-candlestick-charts.png)Candlestick
Charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/candlestick-charts.md)
[![](thumb-ohlc-charts.png)OHLC
Charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/ohlc-charts.md)
[![](thumb-waterfall-charts.png)Waterfall
Charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/waterfall-charts.md)
[![](thumb-funnel-charts.png)Funnel
Charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/funnel-charts.md)
[![](thumb-gauge-charts.png)Gauge
Chart](https://msummersgill.github.io/plotly.R.core/articles/r-docs/gauge-charts.md)
[![](thumb-bullet-charts.png)Bullet
Charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/bullet-charts.md)

## Maps

[![](thumb-choropleth-maps.png)Choropleth
Maps](https://msummersgill.github.io/plotly.R.core/articles/r-docs/choropleth-maps.md)
[![](thumb-scatter-plots-on-maps.png)Scatter Plots on
Maps](https://msummersgill.github.io/plotly.R.core/articles/r-docs/scatter-plots-on-maps.md)
[![](thumb-mapbox-density-heatmaps.png)Mapbox
Density](https://msummersgill.github.io/plotly.R.core/articles/r-docs/mapbox-density-heatmaps.md)
[![](thumb-lines-on-maps.png)Lines on
Maps](https://msummersgill.github.io/plotly.R.core/articles/r-docs/lines-on-maps.md)
[![](thumb-mapbox-layers.png)Mapbox
Layers](https://msummersgill.github.io/plotly.R.core/articles/r-docs/mapbox-layers.md)
[![](thumb-scattermapbox.png)Scattermapbox](https://msummersgill.github.io/plotly.R.core/articles/r-docs/scattermapbox.md)
[![](thumb-mapbox-county-choropleth.png)Mapbox Choropleth
Maps](https://msummersgill.github.io/plotly.R.core/articles/r-docs/mapbox-county-choropleth.md)
[![](thumb-filled-area-on-mapbox.png)Filled Area in
Mapbox](https://msummersgill.github.io/plotly.R.core/articles/r-docs/filled-area-on-mapbox.md)
[![](thumb-lines-on-mapbox.png)Lines on
Mapbox](https://msummersgill.github.io/plotly.R.core/articles/r-docs/lines-on-mapbox.md)
[![](thumb-maps-sf.png)Simple
Features](https://msummersgill.github.io/plotly.R.core/articles/r-docs/maps-sf.md)
[![](thumb-bubble-maps.png)Bubble
Maps](https://msummersgill.github.io/plotly.R.core/articles/r-docs/bubble-maps.md)
[![](thumb-map-configuration.png)Map Configuration and
Styling](https://msummersgill.github.io/plotly.R.core/articles/r-docs/map-configuration.md)

## 3D Charts

[![](thumb-3d-scatter-plots.png)3D Scatter
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-scatter-plots.md)
[![](thumb-3d-line-plots.png)3D Line
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-line-plots.md)
[![](thumb-3d-surface-plots.png)3D Surface
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-surface-plots.md)
[![](thumb-3d-mesh.png)3D Mesh
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-mesh.md)
[![](thumb-cone-plot.png)3D Cone
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/cone-plot.md)
[![](thumb-streamtube-plot.png)3D Streamtube
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/streamtube-plot.md)
[![](thumb-3d-isosurface-plots.png)3D Isosurface
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-isosurface-plots.md)
[![](thumb-trisurf.png)3D Tri-Surf
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/trisurf.md)

## Subplots and Multiple Axes

[![](thumb-map-subplots-and-small-multiples.png)Map Subplots And Small
Multiples](https://msummersgill.github.io/plotly.R.core/articles/r-docs/map-subplots-and-small-multiples.md)
[![](thumb-insets.png)Inset
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/insets.md)
[![](thumb-3d-subplots.png)3D
Subplots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-subplots.md)

## Artificial Intelligence and Machine Learning

[![](thumb-ml-regression.png)ML
Regression](https://msummersgill.github.io/plotly.R.core/articles/r-docs/ml-regression.md)
[![](thumb-knn-classification.png)kNN
Classification](https://msummersgill.github.io/plotly.R.core/articles/r-docs/knn-classification.md)
[![](thumb-roc-and-pr-curves.png)ROC and PR
Curves](https://msummersgill.github.io/plotly.R.core/articles/r-docs/roc-and-pr-curves.md)
[![](thumb-pca-visualization.png)PCA
Visualization](https://msummersgill.github.io/plotly.R.core/articles/r-docs/pca-visualization.md)
[![](thumb-t-sne-and-umap-projections.png)t-SNE and UMAP
projections](https://msummersgill.github.io/plotly.R.core/articles/r-docs/t-sne-and-umap-projections.md)

## Controls

[![](thumb-custom-buttons.png)Buttons](https://msummersgill.github.io/plotly.R.core/articles/r-docs/custom-buttons.md)
[![](thumb-dropdowns.png)Dropdown
Events](https://msummersgill.github.io/plotly.R.core/articles/r-docs/dropdowns.md)
[![](thumb-range-slider.png)Range Sliders and
Selectors](https://msummersgill.github.io/plotly.R.core/articles/r-docs/range-slider.md)
[![](thumb-sliders.png)Sliders](https://msummersgill.github.io/plotly.R.core/articles/r-docs/sliders.md)

## Animations

[![](thumb-animations.png)Intro to
Animations](https://msummersgill.github.io/plotly.R.core/articles/r-docs/animations.md)
[![](thumb-cumulative-animations.png)Cumulative
Animations](https://msummersgill.github.io/plotly.R.core/articles/r-docs/cumulative-animations.md)

## Advanced

[![](thumb-plot-data-from-csv.png)Plot CSV
Data](https://msummersgill.github.io/plotly.R.core/articles/r-docs/plot-data-from-csv.md)

## Transforms

[![](thumb-filter.png)Filter](https://msummersgill.github.io/plotly.R.core/articles/r-docs/filter.md)
[![](thumb-group-by.png)Group
By](https://msummersgill.github.io/plotly.R.core/articles/r-docs/group-by.md)
[![](thumb-aggregations.png)Aggregations](https://msummersgill.github.io/plotly.R.core/articles/r-docs/aggregations.md)

## Legacy Charts

[![](thumb-legacy-polar-chart.png)Polar Charts
\[legacy\]](https://msummersgill.github.io/plotly.R.core/articles/r-docs/legacy-polar-chart.md)

## Other

[![](thumb-getting-started.png)Getting Started with
Plotly](https://msummersgill.github.io/plotly.R.core/articles/r-docs/getting-started.md)
[](https://msummersgill.github.io/plotly.R.core/articles/r-docs/github-getting-started-for-data-scientists.md)

GitHub for Data Scientists without the Terminal

[![](thumb-webgl-vs-svg-million-points.png)WebGL in Plotly and
R](https://msummersgill.github.io/plotly.R.core/articles/r-docs/webgl-vs-svg-million-points.md)
[![](thumb-webgl-vs-svg-time-series.png)WebGL in Plotly and
R](https://msummersgill.github.io/plotly.R.core/articles/r-docs/webgl-vs-svg-time-series.md)
