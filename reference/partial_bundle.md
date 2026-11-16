# Use a smaller plotly.js bundle

By default, figures load the full plotly.js bundle (about 4.8 MB).
plotly.js also publishes partial bundles with fewer trace types, which
make pages (and files saved with
[`htmlwidgets::saveWidget()`](https://rdrr.io/pkg/htmlwidgets/man/saveWidget.html))
much smaller:

## Usage

``` r
partial_bundle(p, type = "auto", local = TRUE, minified = TRUE)
```

## Arguments

- p:

  A
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
  or htmlwidget.

- type:

  `"auto"`, `"full"`, or the name of a partial bundle.

- local, minified:

  Unused: the bundles are always the minified ones shipped with the
  package (kept for compatibility with the plotly package).

## Value

The figure, which renders with that bundle.

## Details

- `"basic"`: bar, pie, scatter (about 1.2 MB)

- `"cartesian"`: also box, contour, heatmap, histogram, histogram2d,
  histogram2dcontour, image, scatterternary, violin

- `"finance"`: bar, candlestick, funnel, funnelarea, histogram,
  indicator, ohlc, pie, scatter, waterfall

- `"geo"`: choropleth, scatter, scattergeo

- `"gl2d"`: parcoords, scatter, scattergl, splom

- `"gl3d"`: cone, isosurface, mesh3d, scatter, scatter3d, streamtube,
  surface, volume

- `"map"`: choroplethmap, densitymap, scatter, scattermap

`type = "auto"` uses the smallest bundle with all the figure's trace
types (including those in animation frames), or the full bundle if none
has them all. Use `options(plotly.core.bundle = "auto")` to do this for
every figure.

A page has a single plotly.js: when it shows several figures, they
should use the same bundle (or the full one, which is used if any figure
needs it).

`partial_bundle()` is an S3 generic, so packages can add methods for
their own figure classes (the plotly package does for `plot_ly()`
objects).

## Examples

``` r
fig <- go_figure(go_bar(x = c("a", "b"), y = 1:2)) |> partial_bundle()
```
