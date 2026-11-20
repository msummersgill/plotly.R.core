# R docs examples: follow-ups

Examples from the [Plotly R docs](https://github.com/plotly/plotly.r-docs)
that were not converted to plotly.core, and data that was substituted. The
`r/` pages were copied; the `ggplot2/` pages (all `ggplotly()`) were not.

## Skipped examples

### ggplotly() / ggplot2

- distplot.Rmd — whole page (9 examples: "Basic Distplot", "Plot Multiple
  Datasets", "Use Multiple Bin Sizes", "Plot Only Curve and Rug", "Plot Only
  Hist and Rug", "Plot Only Hist and Curve", "Plot Hist and Rug with Different
  Bin Sizes", "Plot Normal Curve", "Combined statistical representations with
  histogram")
- webgl-vs-svg.Rmd — whole page ("WebGL with 50,000 points")
- ml-regression.Rmd — "Simple actual vs predicted plot", "Enhanced prediction
  error analysis using `ggplotly`", "Residual plots"
- styling-figures.Rmd — "How ggplot2 Express Works with Templates"

### Packages not installed

- t-sne-and-umap-projections.Rmd — "Project data into 2D with t-SNE", "Project
  data into 3D with t-SNE" (`tsne`), "Projections with UMAP" (`umap`),
  "Visualizing image datasets" (`umap`, `rsvd`)
- trisurf.Rmd — "Helicopter" (`geomorph`, to read the plotly.r-docs `r/data/chopper.ply`)
- figure-labels.Rmd — "Fonts and Labels in Dash" (Dash for R)

### Data no longer available

- aggregations.Rmd — "Histogram Binning": `plotly.com/~public.health/17.csv`
  returns HTTP 410

### Legacy-only features

- renderers.Rmd — "Overriding The Default Renderer" (`toWebGL()` on a bar
  chart) and the "Multiple Renderers" stub
- legacy-polar-chart.Rmd — "Polar Area Chart" (legacy `area` trace; already
  commented out in the source)

### Duplicates dropped

- configuration-options.Rmd — the two "You can also use a pipe" variants
- line-charts.Rmd — "Line Plots Mode", second chunk (a `plot_ly()` calling
  convention)

## Substituted data and models (review)

Packages that weren't installed were replaced with data from
[plotly/datasets](https://github.com/plotly/datasets) or base R:

- quantmod / tidyquant stock downloads → `finance-charts-apple.csv`,
  `stockdata.csv` or plotly.py's `stocks.csv.gz` (weekly, 2018–2019, FB
  renamed META): axes, candlestick-charts, custom-buttons,
  cumulative-animations, horizontal-vertical-shapes, ohlc-charts,
  range-slider, time-series.
- candlestick-charts, ohlc-charts — the 2014 "Stock Split" annotation is now a
  2016-06-23 "Brexit vote" marker, inside the substitute data's range.
- custom-buttons — the wind-farm CSV is gone (HTTP 410); the zoom buttons use
  the largest sites in `data/2805.csv`.
- displaying-images — the Crab Nebula image (Wikimedia refuses downloads) is
  replaced by the R logo shipped with the png package.
- network-graphs — `igraphdata` karate club → igraph's `make_graph("Zachary")`.
- knn-classification, ml-regression, roc-and-pr-curves, pca-visualization —
  tidymodels / kknn / kernlab / mlbench replaced by `class::knn()`, `lm()`,
  `e1071::svm()`, `glm()`, `nnet::multinom()`, base-R ROC/PR helpers and
  plotly's `diabetes.csv`.
- legacy-polar-chart — `plotly::mic` rebuilt from its formula; `plotly::hobbs`
  read from `hobbs-pearson-trials.csv`.
- Maps — Mapbox traces and styles became MapLibre (`scattermap`,
  `choroplethmap`, `densitymap`, `go_map()`) with `open-street-map` /
  `carto-*` styles; Stamen styles are gone.
- Transforms (aggregations, filter, group-by) are computed in R.

## Known limitation

`print(fig)` inside a knitted chunk (e.g. in a loop) shows nothing, as with
the legacy package: knitr only draws a widget that is a chunk's visible value.
Collect figures with `htmltools::tagList()` instead.
