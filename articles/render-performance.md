# Rendering performance

plotly.core makes large figures much quicker to build, save, load and
draw than the CRAN plotly release, and lighter on browser memory, for
[`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) code
unchanged and even more so for
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
with
[`as_float32()`](https://msummersgill.github.io/plotly.R.core/reference/as_float32.md).
This vignette shows the results first, then how the gains were made; the
numbers and how the benchmarks are run are in the [appendix](#appendix).

| Variant | Code | Data sent to the browser as |
|----|----|----|
| `release` | [`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) with the CRAN plotly release | JSON numbers / date strings |
| `core_backend` | the same [`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) code with the development plotly, which renders with plotly.core | base64 typed arrays (float64) |
| `go_figure_f32` | [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md) and `add_*()` with [`as_float32()`](https://msummersgill.github.io/plotly.R.core/reference/as_float32.md), saved with [`write_html()`](https://msummersgill.github.io/plotly.R.core/reference/write_html.md) | base64 typed arrays (float32) |
| `plotly_py` | plotly.py `go.Figure()` with numpy float64 | base64 typed arrays (float64), ISO date strings |
| `plotly_py_f32` | plotly.py `go.Figure()` with numpy float32 | base64 typed arrays (float32), ISO date strings |

## Results

Each chart shows one measurement for the three cases, against the number
of values plotted (both axes on log scales), medians over 3 runs
(2026-11-16, Apple M3 Pro, Chrome/157.0.8103.78). Lower is better
throughout. The numbers are in the [results tables](#results-tables).

Show the chart code

``` r

# one panel per case; x: values plotted, y: the measurement
metric_chart <- function(col, label) {
  d <- res[order(res$variant, res$case, res$values), c("variant", "case", "values", col)]
  names(d)[4] <- "value"
  fig <- px_line(
    d, x = "values", y = "value", color = "variant", facet_col = "case",
    markers = TRUE, log_x = TRUE, log_y = TRUE,
    category_orders = list(variant = variants, case = levels(res$case)),
    # R in blues, Python in oranges; the darkest of each is the float32 variant
    color_discrete_map = list(release = "#6baed6", core_backend = "#2171b5", go_figure_f32 = "#08306b",
                              plotly_py = "#fd8d3c", plotly_py_f32 = "#a63603"),
    labels = list(values = "values plotted", value = label, variant = ""),
    template = "plotly_white"
  )
  # each panel its own y range: the cases differ in scale
  for (ax in grep("^yaxis", names(fig$layout), value = TRUE)) {
    fig$layout[[ax]]$matches <- NULL
    fig$layout[[ax]]$showticklabels <- TRUE
  }
  for (ax in grep("^xaxis", names(fig$layout), value = TRUE)) fig$layout[[ax]]$dtick <- 1
  fig |>
    for_each_annotation(function(a) {
      a$text <- sub("^[^=]*=", "", a$text) # "case=heatmap" -> "heatmap"
      a
    }) |>
    update_layout(legend = list(orientation = "h", y = 1.12, yanchor = "bottom", x = 0)) |>
    partial_bundle("auto")
}
```

### Build + write time

Show the chart code

``` r

metric_chart("build_sec", "build + write (s)")
```

This is the wait in R before anything can be shown: in the console or
RStudio, while knitting a report, or on every re-render in a Shiny app.
For the 2000 × 2000 heatmap, CRAN plotly keeps R busy for 12.7 s; the
same [`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) code
with plotly.core takes 0.8 s, and
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
with
[`as_float32()`](https://msummersgill.github.io/plotly.R.core/reference/as_float32.md)
0.10 s, faster than plotly.py.

### Page size

Show the chart code

``` r

metric_chart("html_mb", "HTML (MB)")
```

The size of the saved page or the data a Shiny app sends: it’s what a
viewer on a remote server or slow connection waits to download, and what
makes self-contained reports too big to email or attach. The 1M-point
time series goes from 96 MB with CRAN plotly to 21 MB, and 10 series
sharing x from 67 MB to 6.4 MB, since x is sent once.

### Load time

Show the chart code

``` r

metric_chart("load_sec", "load (s)")
```

The time from opening the page to the plot appearing, here with no
network in between. A heatmap that CRAN plotly takes 8.4 s to show
appears in 2.2 s with plotly.core (1.5 s with float32). For small
figures (under about 100,000 values) CRAN plotly loads slightly faster,
because plotly.js 4 is a larger script; see
[`partial_bundle()`](https://msummersgill.github.io/plotly.R.core/reference/partial_bundle.md).

### Drawing time (`newPlot`)

Show the chart code

``` r

metric_chart("newplot_sec", "newPlot (s)")
```

The part of the load plotly.js spends drawing, about the same for every
variant (0.77 s and 0.67 s for the heatmap). The gains come from getting
data to plotly.js faster, not from plotly.js drawing faster, so zooming
and other redraws after load feel the same.

### Peak browser memory

Show the chart code

``` r

metric_chart("peak_renderer_mb", "peak renderer (MB)")
```

The most memory the page’s browser process uses while loading; when a
tab exceeds what the browser or machine allows, it crashes (“Aw, Snap!”
in Chrome), which is most likely on laptops with little memory, on
phones, or with several large plots on one page. The heatmap peaks at
1039 MB with CRAN plotly and 590 MB with
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
and float32.

### Memory held after load

Show the chart code

``` r

metric_chart("js_heap_mb", "JS heap after load (MB)")
```

The JavaScript memory the plot keeps while it stays open, which adds up
on dashboards and reports with many plots. For the 1M-point time series
it falls from 291 MB with CRAN plotly to 205 MB with plotly.core and 187
MB with float32.

## How the gains were made

Numbers here are medians from the results, at the largest size of each
case, unless marked as a standalone timing (measured separately, during
development).

### How plotly.core sends data to the browser

**Numeric arrays as base64 typed arrays.** Numeric vectors and matrices
in traces are sent as `{dtype, bdata, shape}`, as plotly.py does, rather
than as JSON numbers; whole numbers are narrowed to the smallest integer
type without loss. A double takes 10.7 bytes of base64 instead of about
18–20 characters of JSON, and the browser decodes the bytes straight
into a typed array instead of parsing text. For the heatmap this takes
the page from 164.4 MB (CRAN plotly) to 42.7 MB
([`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) with
plotly.core), the load time from 8.39 s to 2.20 s, and the renderer’s
peak memory from 1039 MB to 650 MB. plotly.js’s own `newPlot()` time is
about the same for every variant, so the faster loads come from
fetching, parsing and decoding less data, not from plotly.js itself.

**Date-times as numbers.** Dates and date-times are sent as typed arrays
of days or milliseconds; the widget’s JavaScript turns them back into
the strings R would have written. UTC offsets are looked up once per
15-minute bin rather than once per value. For the 1M-point time series,
CRAN plotly writes a page of 95.9 MB in 7.63 s; with plotly.core the
same [`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) code
writes 21.3 MB in 0.41 s. plotly.py writes date-times as text, so its
time series pages are larger (43.3 MB).

**Encoding in C.** The typed arrays are encoded in C
(`src/typed_array.c`): one pass to find the narrowest type, then base64
written straight into one buffer, as data.table’s `fwrite()` writes its
output. jsonlite writes the rest of the figure with placeholders and C
copies the encoded arrays in, so the large strings never pass through R.
For the 2000 × 2000 float32 heatmap the whole JSON step takes about 0.06
s (standalone timing).

**Arrays repeated in a figure are sent once.** An array used by several
traces, like the x of the 10 time series, is encoded once and referenced
after that; in the browser every trace uses the same object, and date
strings are restored once. With 10 series of 100,000 points,
[`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) with
plotly.core writes 11.7 MB and
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
6.4 MB, against 67.4 MB for CRAN plotly and 43.3 MB for plotly.py, which
repeat x in each trace. Those pages are smaller than the single 1M-point
series and load faster (1.00 s against 1.28 s for
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)).

**[`as_float32()`](https://msummersgill.github.io/plotly.R.core/reference/as_float32.md).**
Doubles marked with
[`as_float32()`](https://msummersgill.github.io/plotly.R.core/reference/as_float32.md)
are sent in single precision, 4 bytes instead of 8 (about 7 significant
digits, which is what WebGL draws with). It halves the heatmap’s page
(42.7 to 21.3 MB) and cuts the JavaScript memory left after loading (153
to 115 MB) and the load time (2.20 to 1.49 s). For the time series only
y is halved; x stays in double precision.

**[`write_html()`](https://msummersgill.github.io/plotly.R.core/reference/write_html.md).**
htmlwidgets lays out the page and the figure’s data is then written to
the file directly, rather than passed through htmltools as one long
string, which is searched and copied several times. This is most of the
difference between
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
and [`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) in
build + write time: 0.103 s for the heatmap (0.133 s for plotly.py with
float32), and 0.080 s for the 1M-point time series (0.475 s).
[`write_html()`](https://msummersgill.github.io/plotly.R.core/reference/write_html.md)
also takes [`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html)
figures: saving the
[`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) heatmap takes
about 0.2 s with it instead of about 0.8 s with `saveWidget()`
(standalone timing).

### Building `plot_ly()` figures in plotly

**A faster
[`plotly_build()`](https://rdrr.io/pkg/plotly/man/plotly_build.html).**
The development plotly computes each group’s rows once rather than once
per column, sorts with radix
[`order()`](https://rdrr.io/r/base/order.html) only when rows are out of
order, and replaces the dplyr, tibble, rlang, tidyr and purrr calls in
the build with base R. That’s about twice as fast on large plots (three
1M-point WebGL traces: 0.70 s to 0.30 s, standalone timing).

**Heatmaps.** Checking whether a heatmap’s z holds a single colour value
used [`unique()`](https://rdrr.io/r/base/unique.html) on its rows; it
now uses [`rowSums()`](https://rdrr.io/r/base/colSums.html).
[`plotly_build()`](https://rdrr.io/pkg/plotly/man/plotly_build.html) of
the 2000 × 2000 heatmap takes 0.04 s instead of 0.15 s (standalone
timing). Most of the
[`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) heatmap’s
remaining 0.79 s is
[`htmlwidgets::saveWidget()`](https://rdrr.io/pkg/htmlwidgets/man/saveWidget.html)
handling the large page, which
[`write_html()`](https://msummersgill.github.io/plotly.R.core/reference/write_html.md)
avoids.

### What doesn’t help (yet)

- **Partial bundles.**
  [`partial_bundle()`](https://msummersgill.github.io/plotly.R.core/reference/partial_bundle.md)
  loads a smaller plotly.js with only the trace types a figure uses, but
  every variant here loads the full bundle.
- **A larger plotly.js.** plotly.js 4 is larger to load than the 2.x
  CRAN plotly bundles, so for small figures (under about 100,000 values)
  CRAN plotly loads faster; the data dominates above that.
- **plotly.js 4 itself** draws in about the same time as plotly.js 2
  (`newPlot` above).

## Appendix

### Results tables

Medians over 3 runs.

#### Largest sizes

| case | variant | build + write (s) | HTML (MB) | load (s) | peak renderer (MB) |
|:---|:---|---:|---:|---:|---:|
| timeseries | release | 7.633 | 95.9 | 2.98 | 1013 |
| timeseries | core_backend | 0.412 | 21.3 | 1.63 | 822 |
| timeseries | go_figure_f32 | 0.080 | 16.0 | 1.28 | 798 |
| timeseries | plotly_py | 0.506 | 43.3 | 1.73 | 785 |
| timeseries | plotly_py_f32 | 0.475 | 37.7 | 1.48 | 746 |
| multiseries | release | 4.754 | 67.4 | 2.64 | 750 |
| multiseries | core_backend | 0.411 | 11.7 | 1.17 | 549 |
| multiseries | go_figure_f32 | 0.040 | 6.4 | 1.00 | 539 |
| multiseries | plotly_py | 0.479 | 43.3 | 1.41 | 616 |
| multiseries | plotly_py_f32 | 0.467 | 37.7 | 1.28 | 617 |
| heatmap | release | 12.692 | 164.4 | 8.39 | 1039 |
| heatmap | core_backend | 0.790 | 42.7 | 2.20 | 650 |
| heatmap | go_figure_f32 | 0.103 | 21.3 | 1.49 | 590 |
| heatmap | plotly_py | 0.308 | 54.0 | 2.49 | 669 |
| heatmap | plotly_py_f32 | 0.133 | 25.6 | 1.59 | 594 |

#### Large time series (`scattergl` lines)

| size | variant | build + write (s) | HTML (MB) | load (s) | newPlot (s) | JS transferred (MB) | peak renderer (MB) | JS heap after (MB) |
|:---|:---|---:|---:|---:|---:|---:|---:|---:|
| 10,000 | release | 0.068 | 0.97 | 0.242 | 0.075 | 1.20 | 220 | 15.5 |
| 10,000 | core_backend | 0.025 | 0.22 | 0.374 | 0.083 | 1.54 | 243 | 17.4 |
| 10,000 | go_figure_f32 | 0.016 | 0.17 | 0.362 | 0.080 | 1.50 | 240 | 16.5 |
| 10,000 | plotly_py | 0.005 | 0.44 | 0.363 | 0.080 | 1.47 | 236 | 16.3 |
| 10,000 | plotly_py_f32 | 0.005 | 0.38 | 0.352 | 0.077 | 1.47 | 235 | 16.2 |
| 100,000 | release | 0.620 | 9.61 | 0.486 | 0.151 | 1.20 | 326 | 41.0 |
| 100,000 | core_backend | 0.060 | 2.14 | 0.510 | 0.155 | 1.54 | 325 | 35.0 |
| 100,000 | go_figure_f32 | 0.023 | 1.61 | 0.471 | 0.141 | 1.50 | 314 | 32.6 |
| 100,000 | plotly_py | 0.050 | 4.34 | 0.479 | 0.136 | 1.47 | 301 | 32.4 |
| 100,000 | plotly_py_f32 | 0.047 | 3.77 | 0.457 | 0.138 | 1.47 | 304 | 31.5 |
| 1,000,000 | release | 7.633 | 95.92 | 2.975 | 0.725 | 1.20 | 1013 | 291.2 |
| 1,000,000 | core_backend | 0.412 | 21.34 | 1.627 | 0.745 | 1.54 | 822 | 204.7 |
| 1,000,000 | go_figure_f32 | 0.080 | 16.01 | 1.284 | 0.627 | 1.50 | 798 | 186.7 |
| 1,000,000 | plotly_py | 0.506 | 43.28 | 1.725 | 0.667 | 1.47 | 785 | 187.7 |
| 1,000,000 | plotly_py_f32 | 0.475 | 37.66 | 1.484 | 0.622 | 1.47 | 746 | 178.4 |

#### 10 time series sharing x (`scattergl` lines)

| size | variant | build + write (s) | HTML (MB) | load (s) | newPlot (s) | JS transferred (MB) | peak renderer (MB) | JS heap after (MB) |
|:---|:---|---:|---:|---:|---:|---:|---:|---:|
| 10 × 10,000 | release | 0.405 | 6.81 | 0.444 | 0.138 | 1.20 | 306 | 31.2 |
| 10 × 10,000 | core_backend | 0.084 | 1.18 | 0.463 | 0.142 | 1.54 | 271 | 24.4 |
| 10 × 10,000 | go_figure_f32 | 0.024 | 0.65 | 0.424 | 0.129 | 1.50 | 264 | 22.0 |
| 10 × 10,000 | plotly_py | 0.054 | 4.35 | 0.467 | 0.130 | 1.47 | 285 | 22.9 |
| 10 × 10,000 | plotly_py_f32 | 0.081 | 3.78 | 0.447 | 0.129 | 1.47 | 281 | 21.9 |
| 10 × 50,000 | release | 2.212 | 33.99 | 1.380 | 0.336 | 1.20 | 515 | 100.0 |
| 10 × 50,000 | core_backend | 0.225 | 5.87 | 0.699 | 0.311 | 1.54 | 418 | 54.6 |
| 10 × 50,000 | go_figure_f32 | 0.029 | 3.21 | 0.652 | 0.292 | 1.50 | 380 | 45.6 |
| 10 × 50,000 | plotly_py | 0.247 | 21.68 | 0.769 | 0.289 | 1.47 | 423 | 51.3 |
| 10 × 50,000 | plotly_py_f32 | 0.220 | 18.86 | 0.751 | 0.280 | 1.47 | 446 | 46.7 |
| 10 × 100,000 | release | 4.754 | 67.40 | 2.641 | 0.676 | 1.20 | 750 | 246.3 |
| 10 × 100,000 | core_backend | 0.411 | 11.74 | 1.174 | 0.643 | 1.54 | 549 | 153.5 |
| 10 × 100,000 | go_figure_f32 | 0.040 | 6.41 | 1.000 | 0.608 | 1.50 | 539 | 135.4 |
| 10 × 100,000 | plotly_py | 0.479 | 43.30 | 1.409 | 0.610 | 1.47 | 616 | 147.2 |
| 10 × 100,000 | plotly_py_f32 | 0.467 | 37.66 | 1.276 | 0.606 | 1.47 | 617 | 137.9 |

#### Large matrix heatmap

| size | variant | build + write (s) | HTML (MB) | load (s) | newPlot (s) | JS transferred (MB) | peak renderer (MB) | JS heap after (MB) |
|:---|:---|---:|---:|---:|---:|---:|---:|---:|
| 100² | release | 0.035 | 0.42 | 0.194 | 0.033 | 1.20 | 195 | 11.9 |
| 100² | core_backend | 0.022 | 0.11 | 0.333 | 0.050 | 1.54 | 227 | 14.7 |
| 100² | go_figure_f32 | 0.016 | 0.06 | 0.323 | 0.049 | 1.50 | 224 | 14.1 |
| 100² | plotly_py | 0.002 | 0.14 | 0.326 | 0.049 | 1.47 | 223 | 13.9 |
| 100² | plotly_py_f32 | 0.002 | 0.07 | 0.318 | 0.049 | 1.47 | 222 | 13.8 |
| 500² | release | 0.443 | 10.28 | 0.657 | 0.084 | 1.20 | 283 | 21.6 |
| 500² | core_backend | 0.066 | 2.67 | 0.462 | 0.090 | 1.54 | 273 | 23.1 |
| 500² | go_figure_f32 | 0.022 | 1.34 | 0.428 | 0.086 | 1.50 | 261 | 20.2 |
| 500² | plotly_py | 0.020 | 3.39 | 0.456 | 0.088 | 1.47 | 275 | 22.2 |
| 500² | plotly_py_f32 | 0.010 | 1.60 | 0.411 | 0.085 | 1.47 | 261 | 19.9 |
| 1000² | release | 2.345 | 41.11 | 2.184 | 0.214 | 1.20 | 463 | 51.6 |
| 1000² | core_backend | 0.213 | 10.67 | 0.719 | 0.207 | 1.54 | 390 | 49.1 |
| 1000² | go_figure_f32 | 0.035 | 5.34 | 0.559 | 0.185 | 1.50 | 357 | 39.3 |
| 1000² | plotly_py | 0.080 | 13.52 | 0.772 | 0.199 | 1.47 | 399 | 48.3 |
| 1000² | plotly_py_f32 | 0.037 | 6.39 | 0.575 | 0.186 | 1.47 | 357 | 39.0 |
| 2000² | release | 12.692 | 164.43 | 8.386 | 0.766 | 1.20 | 1039 | 171.8 |
| 2000² | core_backend | 0.790 | 42.67 | 2.198 | 0.665 | 1.54 | 650 | 153.2 |
| 2000² | go_figure_f32 | 0.103 | 21.34 | 1.490 | 0.598 | 1.50 | 590 | 115.4 |
| 2000² | plotly_py | 0.308 | 54.03 | 2.487 | 0.628 | 1.47 | 669 | 152.4 |
| 2000² | plotly_py_f32 | 0.133 | 25.55 | 1.589 | 0.582 | 1.47 | 594 | 115.1 |

#### Relative to the CRAN release

Release median ÷ variant median at each size (above 1 means faster or
smaller than the release).

| case | size | variant | build + write | HTML | load | peak renderer | JS heap |
|:---|:---|:---|---:|---:|---:|---:|---:|
| timeseries | 10,000 | core_backend | 2.7 | 4.5 | 0.6 | 0.9 | 0.9 |
| timeseries | 10,000 | go_figure_f32 | 4.3 | 5.8 | 0.7 | 0.9 | 0.9 |
| timeseries | 10,000 | plotly_py | 13.0 | 2.2 | 0.7 | 0.9 | 0.9 |
| timeseries | 10,000 | plotly_py_f32 | 13.7 | 2.5 | 0.7 | 0.9 | 1.0 |
| timeseries | 100,000 | core_backend | 10.3 | 4.5 | 1.0 | 1.0 | 1.2 |
| timeseries | 100,000 | go_figure_f32 | 27.0 | 6.0 | 1.0 | 1.0 | 1.3 |
| timeseries | 100,000 | plotly_py | 12.4 | 2.2 | 1.0 | 1.1 | 1.3 |
| timeseries | 100,000 | plotly_py_f32 | 13.2 | 2.5 | 1.1 | 1.1 | 1.3 |
| timeseries | 1,000,000 | core_backend | 18.5 | 4.5 | 1.8 | 1.2 | 1.4 |
| timeseries | 1,000,000 | go_figure_f32 | 95.4 | 6.0 | 2.3 | 1.3 | 1.6 |
| timeseries | 1,000,000 | plotly_py | 15.1 | 2.2 | 1.7 | 1.3 | 1.6 |
| timeseries | 1,000,000 | plotly_py_f32 | 16.1 | 2.5 | 2.0 | 1.4 | 1.6 |
| multiseries | 10 × 10,000 | core_backend | 4.8 | 5.8 | 1.0 | 1.1 | 1.3 |
| multiseries | 10 × 10,000 | go_figure_f32 | 16.9 | 10.5 | 1.0 | 1.2 | 1.4 |
| multiseries | 10 × 10,000 | plotly_py | 7.6 | 1.6 | 0.9 | 1.1 | 1.4 |
| multiseries | 10 × 10,000 | plotly_py_f32 | 5.0 | 1.8 | 1.0 | 1.1 | 1.4 |
| multiseries | 10 × 50,000 | core_backend | 9.8 | 5.8 | 2.0 | 1.2 | 1.8 |
| multiseries | 10 × 50,000 | go_figure_f32 | 76.3 | 10.6 | 2.1 | 1.4 | 2.2 |
| multiseries | 10 × 50,000 | plotly_py | 9.0 | 1.6 | 1.8 | 1.2 | 1.9 |
| multiseries | 10 × 50,000 | plotly_py_f32 | 10.1 | 1.8 | 1.8 | 1.2 | 2.1 |
| multiseries | 10 × 100,000 | core_backend | 11.6 | 5.7 | 2.3 | 1.4 | 1.6 |
| multiseries | 10 × 100,000 | go_figure_f32 | 118.8 | 10.5 | 2.6 | 1.4 | 1.8 |
| multiseries | 10 × 100,000 | plotly_py | 9.9 | 1.6 | 1.9 | 1.2 | 1.7 |
| multiseries | 10 × 100,000 | plotly_py_f32 | 10.2 | 1.8 | 2.1 | 1.2 | 1.8 |
| heatmap | 100² | core_backend | 1.6 | 3.8 | 0.6 | 0.9 | 0.8 |
| heatmap | 100² | go_figure_f32 | 2.2 | 6.8 | 0.6 | 0.9 | 0.8 |
| heatmap | 100² | plotly_py | 14.5 | 2.9 | 0.6 | 0.9 | 0.9 |
| heatmap | 100² | plotly_py_f32 | 18.2 | 5.8 | 0.6 | 0.9 | 0.9 |
| heatmap | 500² | core_backend | 6.7 | 3.9 | 1.4 | 1.0 | 0.9 |
| heatmap | 500² | go_figure_f32 | 20.1 | 7.7 | 1.5 | 1.1 | 1.1 |
| heatmap | 500² | plotly_py | 22.6 | 3.0 | 1.4 | 1.0 | 1.0 |
| heatmap | 500² | plotly_py_f32 | 45.1 | 6.4 | 1.6 | 1.1 | 1.1 |
| heatmap | 1000² | core_backend | 11.0 | 3.9 | 3.0 | 1.2 | 1.1 |
| heatmap | 1000² | go_figure_f32 | 67.0 | 7.7 | 3.9 | 1.3 | 1.3 |
| heatmap | 1000² | plotly_py | 29.3 | 3.0 | 2.8 | 1.2 | 1.1 |
| heatmap | 1000² | plotly_py_f32 | 63.8 | 6.4 | 3.8 | 1.3 | 1.3 |
| heatmap | 2000² | core_backend | 16.1 | 3.9 | 3.8 | 1.6 | 1.1 |
| heatmap | 2000² | go_figure_f32 | 123.2 | 7.7 | 5.6 | 1.8 | 1.5 |
| heatmap | 2000² | plotly_py | 41.2 | 3.0 | 3.4 | 1.6 | 1.1 |
| heatmap | 2000² | plotly_py_f32 | 95.5 | 6.4 | 5.3 | 1.8 | 1.5 |

#### Notes

- The variants use different plotly.js versions (see above), so
  `newPlot` times include plotly.js differences as well as the data
  format; plotly.js 4 is also larger to load (all variants load a full
  bundle). “JS transferred (MB)” is all JavaScript the page fetched
  (plotly.js, htmlwidgets, bindings) as sent by the server, which
  compresses it.
- Load times are from localhost: on a real network, the HTML size adds
  transfer time.
- Chrome runs headless on the machine’s GPU where it has one (WebGL via
  ANGLE), so WebGL drawing reflects the hardware.
- float32 keeps about 7 significant digits (see
  [`?as_float32`](https://msummersgill.github.io/plotly.R.core/reference/as_float32.md)).
  Date-times are unaffected: plotly.core sends them as float64
  milliseconds; plotly.py and the release send ISO strings.
- Renderer memory is resident set size as the OS reports it, sampled
  every 20 ms, so short spikes can be missed; the GPU process’s memory
  (WebGL buffers) is not included.

### Running the benchmarks

The benchmarks take several minutes and need software outside R
(headless Chrome via chromote, and Python with plotly, numpy and
pandas), so building this vignette shows results saved from an earlier
run, read from the `render-performance/` folder next to it. To rerun
them, render this file with the environment variable
`PLOTLY_CORE_RUN_BENCHMARKS=true`; the code below then runs before the
results are shown, and new results are saved to `render-performance/`:

``` sh
PLOTLY_CORE_RUN_BENCHMARKS=true quarto render vignettes/render-performance.qmd \
  -P python:/path/to/python -P release_lib:/path/to/lib-with-cran-plotly
```

Parameters (`-P name:value`): `python`, a Python with plotly, numpy and
pandas; `release_lib`, a library with the CRAN plotly (installed there
if missing); `core_lib`, a library with the development plotly and
plotly.core (default: the first of
[`.libPaths()`](https://rdrr.io/r/base/libPaths.html)); `ts_sizes`,
`ms_sizes`, `hm_sizes` and `reps`.

### What is measured

Three use cases, over a range of sizes:

- **Large time series**: one `scattergl` line trace with date-time x (1
  s steps) and a random walk y.
- **10 time series**: ten `scattergl` line traces, one per column of a
  wide data frame, sharing the same date-time x. plotly.core sends an
  array repeated in a figure once (see `widget_to_JSON()`), so x is sent
  once rather than ten times.
- **Large matrix heatmap**: one `heatmap` trace of an n × n matrix.

Metrics:

- **Build + write (s)**: R or Python time from the figure-making call to
  the standalone HTML page written to disk
  ([`htmlwidgets::saveWidget()`](https://rdrr.io/pkg/htmlwidgets/man/saveWidget.html)
  for [`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html),
  [`write_html()`](https://msummersgill.github.io/plotly.R.core/reference/write_html.md)
  for
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
  `fig.write_html()` in Python), after one untimed warm-up run, in a
  fresh process per variant.
- **HTML (MB)**: the size of the page, which holds the figure data
  (plotly.js is a separate file).
- **Load time (s)**: in headless Chrome, from navigation start to the
  first frame painted after plotly.js’s `newPlot()` resolves. Pages are
  served over HTTP from localhost with the browser cache disabled, so
  the time covers fetching and parsing plotly.js and the page, decoding
  the data and plotting, but no network latency.
- **newPlot (s)**: the time plotly.js itself spends in `newPlot()`, part
  of the load time.
- **Peak renderer memory (MB)**: the largest resident memory of the
  page’s renderer process while loading, sampled every 20 ms.
- **JS heap after load (MB)**: JavaScript heap in use after load and a
  forced garbage collection, plus array buffers (where Chrome reports
  them).

### Libraries

``` r

dir.create(file.path(wd, "data"), recursive = TRUE, showWarnings = FALSE)
dir.create(pages_dir, showWarnings = FALSE)
dir.create(results_dir, recursive = TRUE, showWarnings = FALSE)

release_lib <- if (nzchar(params$release_lib)) params$release_lib else file.path(wd, "lib-release")
core_lib <- if (nzchar(params$core_lib)) params$core_lib else .libPaths()[1]
if (!file.exists(file.path(release_lib, "plotly", "DESCRIPTION"))) {
  dir.create(release_lib, recursive = TRUE, showWarnings = FALSE)
  install.packages("plotly", lib = release_lib, repos = "https://cloud.r-project.org",
                   type = "source", dependencies = FALSE)
}
libs <- list(release = release_lib, core_backend = core_lib, go_figure_f32 = core_lib)
python <- params$python
```

### Data

The data is generated once in R and written as little-endian doubles, so
that every variant (R and Python) plots the same values.

``` r

cases <- rbind(
  data.frame(case = "timeseries", size = params$ts_sizes, values = params$ts_sizes),
  data.frame(case = "multiseries", size = params$ms_sizes, values = params$ms_sizes * 10),
  data.frame(case = "heatmap", size = params$hm_sizes, values = params$hm_sizes^2)
)
cases$file <- file.path(wd, "data", sprintf("%s-%d.bin", cases$case, cases$size))
```

``` r

set.seed(2024)
for (i in seq_len(nrow(cases))) {
  n <- cases$size[i]
  v <- if (cases$case[i] == "timeseries") {
    cumsum(rnorm(n))
  } else if (cases$case[i] == "multiseries") {
    as.vector(apply(matrix(rnorm(n * 10), n), 2, cumsum))
  } else {
    s <- seq(0, 6 * pi, length.out = n)
    as.vector(outer(sin(s), cos(s)) + rnorm(n * n, sd = 0.1))
  }
  writeBin(v, cases$file[i], endian = "little")
}
```

### Figure code

The R code for each variant. Every function gets the time series as `t`
(POSIXct, UTC) and `y`; the 10 series as a data frame `d` with columns
`t` and `y01`, …, `y10`; or the heatmap as the matrix `z`.

``` r

figures <- list(
  release = list(
    timeseries = function(t, y) plot_ly(x = t, y = y, type = "scattergl", mode = "lines"),
    multiseries = function(d) {
      p <- plot_ly(d, x = ~t)
      for (col in names(d)[-1]) {
        p <- add_trace(p, y = d[[col]], name = col, type = "scattergl", mode = "lines")
      }
      p
    },
    heatmap = function(z) plot_ly(z = z, type = "heatmap")
  ),
  go_figure_f32 = list(
    timeseries = function(t, y) {
      go_figure() |> add_scattergl(x = t, y = as_float32(y), mode = "lines")
    },
    multiseries = function(d) {
      fig <- go_figure()
      for (col in names(d)[-1]) {
        fig <- add_scattergl(fig, x = d$t, y = as_float32(d[[col]]), name = col, mode = "lines")
      }
      fig
    },
    heatmap = function(z) go_figure() |> add_heatmap(z = as_float32(z))
  )
)
# the same plot_ly() code, run with the development plotly
figures$core_backend <- figures$release

# how each variant writes its page
writers <- list(
  release = function(p, file) htmlwidgets::saveWidget(p, file, selfcontained = FALSE, libdir = "lib"),
  core_backend = function(p, file) htmlwidgets::saveWidget(p, file, selfcontained = FALSE, libdir = "lib"),
  go_figure_f32 = function(fig, file) write_html(fig, file, selfcontained = FALSE, libdir = "lib")
)
```

The plotly.py equivalents (`plotly_py_f32` converts the arrays with
`astype(np.float32)` before timing starts, as
[`as_float32()`](https://msummersgill.github.io/plotly.R.core/reference/as_float32.md)
only marks them):

``` python
import gc, json, sys, time
import numpy as np, pandas as pd, plotly.graph_objects as go

variant, cases_file, reps, outdir = sys.argv[1], sys.argv[2], int(sys.argv[3]), sys.argv[4]
f32 = variant == "plotly_py_f32"

def timeseries(t, y):
    return go.Figure(go.Scattergl(x=t, y=y, mode="lines"))

def multiseries(t, Y):
    fig = go.Figure()
    for j in range(Y.shape[1]):
        fig.add_trace(go.Scattergl(x=t, y=Y[:, j], name=f"y{j + 1:02d}", mode="lines"))
    return fig

def heatmap(z):
    return go.Figure(go.Heatmap(z=z))

out = []
for case in json.load(open(cases_file)):
    n, kind = case["size"], case["case"]
    v = np.fromfile(case["file"], dtype="<f8")
    if f32:
        v = v.astype(np.float32)
    if kind == "timeseries":
        args = (pd.date_range("2024-01-01", periods=n, freq="s"), v)
        make = timeseries
    elif kind == "multiseries":
        args = (pd.date_range("2024-01-01", periods=n, freq="s"), v.reshape((n, 10), order="F"))
        make = multiseries
    else:
        args = (v.reshape((n, n), order="F"),)
        make = heatmap
    page = f"{outdir}/{kind}-{n}.html"
    save = lambda: make(*args).write_html(page, include_plotlyjs="directory", full_html=True)
    save()  # warm-up; also the page the browser loads
    for rep in range(reps):
        gc.collect()
        t0 = time.perf_counter()
        save()
        out.append(dict(variant=variant, case=kind, size=n, rep=rep + 1,
                        build_sec=time.perf_counter() - t0))
json.dump(out, sys.stdout)
```

### Build + write timings

Each variant runs in its own fresh process: R variants with callr and
the library holding the right plotly version first on the library path.

``` r

r_worker <- function(variant, fns, write, cases, reps, outdir) {
  suppressPackageStartupMessages(
    if (variant == "go_figure_f32") library(plotly.core) else library(plotly)
  )
  dir.create(outdir, recursive = TRUE, showWarnings = FALSE)
  out <- list()
  for (i in seq_len(nrow(cases))) {
    n <- cases$size[i]
    v <- readBin(cases$file[i], "double", n = cases$values[i], endian = "little")
    t <- as.POSIXct("2024-01-01", tz = "UTC") + seq_len(n) - 1
    if (cases$case[i] == "timeseries") {
      args <- list(t = t, y = v)
    } else if (cases$case[i] == "multiseries") {
      y <- matrix(v, n, 10, dimnames = list(NULL, sprintf("y%02d", 1:10)))
      args <- list(d = data.frame(t = t, y))
    } else {
      args <- list(z = matrix(v, n, n))
    }
    make <- fns[[cases$case[i]]]
    page <- file.path(outdir, sprintf("%s-%d.html", cases$case[i], n))
    save <- function() write(do.call(make, args), page)
    save() # warm-up; also the page the browser loads
    for (rep in seq_len(reps)) {
      gc()
      out[[length(out) + 1]] <- data.frame(
        variant = variant, case = cases$case[i], size = n, rep = rep,
        build_sec = system.time(save())[["elapsed"]]
      )
    }
  }
  do.call(rbind, out)
}

build_r <- do.call(rbind, lapply(names(figures), function(v) {
  callr::r(r_worker, list(v, figures[[v]], writers[[v]], cases, reps, file.path(pages_dir, v)),
           libpath = c(libs[[v]], .libPaths()))
}))
```

``` r

cases_json <- file.path(wd, "cases.json")
jsonlite::write_json(cases[c("case", "size", "file")], cases_json)
build_py <- do.call(rbind, lapply(c("plotly_py", "plotly_py_f32"), function(v) {
  outdir <- file.path(pages_dir, v)
  dir.create(outdir, showWarnings = FALSE)
  res <- system2(python, c(shQuote(file.path(wd, "bench.py")), v, shQuote(cases_json), reps,
                           shQuote(outdir)), stdout = TRUE)
  jsonlite::fromJSON(paste(res, collapse = ""))
}))
build <- rbind(build_r, build_py)
pages <- expand.grid(variant = variants, i = seq_len(nrow(cases)), stringsAsFactors = FALSE)
pages <- cbind(pages["variant"], cases[pages$i, c("case", "size", "values")])
pages$path <- sprintf("%s/%s-%d.html", pages$variant, pages$case, pages$size)
pages$html_mb <- file.size(file.path(pages_dir, pages$path)) / 1e6
```

### Browser measurements

A script injected before any page script runs wraps plotly.js’s
`newPlot()`/`react()`/[`plot()`](https://rdrr.io/r/graphics/plot.default.html)
to time the first plot, and marks the first frame painted after it:

``` js
(function () {
  var B = window.__bench = { done: false };
  function finish() {
    if (B.end != null) return;
    B.end = performance.now();
    requestAnimationFrame(function () {
      setTimeout(function () { B.painted = performance.now(); B.done = true; }, 0);
    });
  }
  // plotly.js 3+ exports are read-only, so the wrapper is a new object
  // inheriting from Plotly, with timed newPlot()/react()/plot()
  function wrap(P) {
    if (!P || P.__benchWrapped) return P;
    var W = Object.create(P);
    ["newPlot", "react", "plot"].forEach(function (k) {
      var orig = P[k];
      if (typeof orig !== "function") return;
      W[k] = function () {
        if (B.start == null) B.start = performance.now();
        var r = orig.apply(P, arguments);
        Promise.resolve(r).then(finish, function (e) { B.error = String(e); B.done = true; });
        return r;
      };
    });
    W.__benchWrapped = true;
    return W;
  }
  var plotly;
  Object.defineProperty(window, "Plotly", {
    configurable: true,
    get: function () { return plotly; },
    set: function (v) { plotly = wrap(v); }
  });
  window.addEventListener("error", function (e) { B.error = String(e.message); B.done = true; });
})();
```

``` r

hook_js <- paste(readLines(file.path(wd, "hook.js")), collapse = "\n")
chrome <- chromote::Chromote$new()

# serve the pages over HTTP from localhost
port <- httpuv::randomPort()
server <- callr::r_bg(function(dir, port) httpuv::runStaticServer(dir, port = port, browse = FALSE),
                      list(pages_dir, port))
for (i in 1:50) {
  if (!inherits(try(suppressWarnings(readLines(sprintf("http://127.0.0.1:%d/", port), n = 1)),
                    silent = TRUE), "try-error")) break
  Sys.sleep(0.1)
}

# samples the largest renderer process's memory (RSS) every 20 ms until killed
sampler <- function(browser_pid, out) {
  peak <- 0
  writeLines("0", out) # started
  repeat {
    procs <- try(ps::ps_children(ps::ps_handle(browser_pid), recursive = TRUE), silent = TRUE)
    if (!inherits(procs, "try-error")) {
      for (p in procs) {
        rss <- try({
          if (any(grepl("--type=renderer", ps::ps_cmdline(p), fixed = TRUE))) ps::ps_memory_info(p)[["rss"]] else 0
        }, silent = TRUE)
        if (is.numeric(rss) && rss > peak) {
          peak <- rss
          writeLines(format(peak, scientific = FALSE), out)
        }
      }
    }
    Sys.sleep(0.02)
  }
}
browser_pid <- chrome$get_browser()$get_process()$get_pid()

measure_page <- function(url, timeout = 300) {
  s <- chromote::ChromoteSession$new(parent = chrome, width = 1000, height = 600)
  on.exit(s$close(), add = TRUE)
  s$Network$enable()
  s$Network$setCacheDisabled(cacheDisabled = TRUE)
  s$Page$enable() # needed for the injected script to run
  s$Page$addScriptToEvaluateOnNewDocument(source = hook_js)
  peak_file <- tempfile()
  smp <- callr::r_bg(sampler, list(browser_pid, peak_file))
  on.exit(smp$kill(), add = TRUE)
  # wait for the sampler to start
  for (i in 1:100) if (file.exists(peak_file)) break else Sys.sleep(0.05)
  Sys.sleep(0.1)
  s$Page$navigate(url, wait_ = FALSE) # large pages can take a while to commit
  t0 <- Sys.time()
  repeat {
    done <- s$Runtime$evaluate("!!(window.__bench && window.__bench.done)", timeout_ = timeout)$result$value
    if (isTRUE(done)) break
    if (difftime(Sys.time(), t0, units = "secs") > timeout) stop("timed out loading ", url)
    Sys.sleep(0.05)
  }
  Sys.sleep(0.3)
  smp$kill()
  b <- jsonlite::fromJSON(s$Runtime$evaluate(
    "JSON.stringify(Object.assign({}, window.__bench, {js_bytes: performance.getEntriesByType('resource')
       .filter(e => /\\.js$/.test(e.name)).reduce((a, e) => a + e.encodedBodySize, 0)}))"
  )$result$value)
  if (!is.null(b$error)) stop(url, ": ", b$error)
  s$HeapProfiler$collectGarbage()
  heap <- s$Runtime$getHeapUsage()
  data.frame(
    load_sec = b$painted / 1000,
    newplot_sec = (b$end - b$start) / 1000,
    js_mb = b$js_bytes / 1e6,
    peak_renderer_mb = as.numeric(readLines(peak_file, warn = FALSE)) / 1e6,
    js_heap_mb = (heap$usedSize + if (is.null(heap$backingStorageSize)) 0 else heap$backingStorageSize) / 1e6
  )
}

# on a failure (e.g. Chrome not responding), restart Chrome and try the page once more
measure_retry <- function(url) {
  tryCatch(measure_page(url), error = function(e) {
    message("retrying ", url, " after: ", conditionMessage(e))
    try(chrome$close(), silent = TRUE)
    chrome <<- chromote::Chromote$new()
    browser_pid <<- chrome$get_browser()$get_process()$get_pid()
    measure_page(url)
  })
}

set.seed(1)
browser <- do.call(rbind, lapply(seq_len(reps), function(rep) {
  # shuffle the page order each round, so drift doesn't favour a variant
  do.call(rbind, lapply(sample(nrow(pages)), function(i) {
    cbind(pages[i, c("variant", "case", "size")], rep = rep,
          measure_retry(sprintf("http://127.0.0.1:%d/%s", port, pages$path[i])))
  }))
}))
server$kill()
```

### Environment

Results above are from a run on 2026-11-16 on macOS 26.5.1 (Apple M3
Pro), with R version 4.4.2 (2024-10-31) and Chrome/157.0.8103.78
(headless), and these versions:

| variant | plotly | plotly.core | plotly.js |
|:---|:---|:---|:---|
| release | 4.12.1 |  | 2.25.2 |
| core_backend, go_figure_f32 | 4.12.1.9000 | 0.1.0 | 4.3.0 |
| plotly_py, plotly_py_f32 | 7.1.0 (Python; numpy 2.0.2, pandas 2.3.3) |  | 4.1.1 |

``` r

r_versions <- function(lib) {
  callr::r(function() {
    js_version <- function(pkg, file) {
      f <- system.file("htmlwidgets", "lib", "plotlyjs", file, package = pkg)
      if (!nzchar(f)) return(NA_character_)
      head <- readChar(f, 500)
      sub("^v", "", regmatches(head, regexpr("v[0-9]+\\.[0-9]+\\.[0-9]+", head)))
    }
    # the development plotly draws with plotly.core's plotly.js
    uses_core <- grepl("plotly.core", utils::packageDescription("plotly")$Imports, fixed = TRUE)
    data.frame(
      plotly = as.character(utils::packageVersion("plotly")),
      plotly.core = if (uses_core) as.character(utils::packageVersion("plotly.core")) else NA,
      plotly.js = if (uses_core) js_version("plotly.core", "plotly.min.js") else js_version("plotly", "plotly-latest.min.js")
    )
  }, libpath = c(lib, .libPaths()))
}
py <- jsonlite::fromJSON(system2(python, c("-c", shQuote(paste(
  "import json, plotly, numpy, pandas, plotly.offline as o;",
  "print(json.dumps(dict(plotly=plotly.__version__, numpy=numpy.__version__,",
  "pandas=pandas.__version__, plotlyjs=o.get_plotlyjs_version())))"))), stdout = TRUE))
versions <- rbind(
  cbind(variant = "release", r_versions(release_lib)),
  cbind(variant = "core_backend, go_figure_f32", r_versions(core_lib)),
  data.frame(variant = "plotly_py, plotly_py_f32",
             plotly = paste0(py$plotly, " (Python; numpy ", py$numpy, ", pandas ", py$pandas, ")"),
             plotly.core = NA, plotly.js = py$plotlyjs)
)
cpu <- if (Sys.info()[["sysname"]] == "Darwin") {
  system("sysctl -n machdep.cpu.brand_string", intern = TRUE)
} else {
  NA_character_
}
meta <- list(date = format(Sys.Date()), R = R.version.string, os = utils::sessionInfo()$running,
             cpu = cpu, browser = chrome$Browser$getVersion()$product, reps = reps)
chrome$close()

write.csv(build, file.path(results_dir, "build.csv"), row.names = FALSE)
write.csv(browser, file.path(results_dir, "browser.csv"), row.names = FALSE)
write.csv(pages[c("variant", "case", "size", "values", "html_mb")], file.path(results_dir, "pages.csv"), row.names = FALSE)
write.csv(versions, file.path(results_dir, "versions.csv"), row.names = FALSE)
jsonlite::write_json(meta, file.path(results_dir, "meta.json"), auto_unbox = TRUE, pretty = TRUE)
```
