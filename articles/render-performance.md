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
| `core_backend` | the same [`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) code with the development plotly, which renders with plotly.core, saved with [`write_html()`](https://msummersgill.github.io/plotly.R.core/reference/write_html.md) | base64 typed arrays (float64) |
| `go_figure_f32` | [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md) and `add_*()` with [`as_float32()`](https://msummersgill.github.io/plotly.R.core/reference/as_float32.md) and [`partial_bundle()`](https://msummersgill.github.io/plotly.R.core/reference/partial_bundle.md), saved with [`write_html()`](https://msummersgill.github.io/plotly.R.core/reference/write_html.md) | base64 typed arrays (float32) |
| `plotly_py` | plotly.py `go.Figure()` with numpy float64 | base64 typed arrays (float64), ISO date strings |
| `plotly_py_f32` | plotly.py `go.Figure()` with numpy float32 | base64 typed arrays (float32), ISO date strings |

## Results

Each chart shows one measurement for the three cases, by figure size,
medians over 3 runs (2026-11-17, Apple M3 Pro, Chrome/157.0.8103.79).
Lower is better throughout. The numbers are in the [results
tables](#results-tables).

Show the chart code

``` r

# one panel per case; x: values plotted, y: the measurement
metric_chart <- function(col, label) {
  # res is sorted by case, size and variant, so each panel's sizes appear in order
  d <- res[, .(variant, case, label, value = get(col))]
  # "10 × 100,000" on two lines, so the labels stay horizontal
  d[, label := sub("10 × ", "10 ×<br>", label, fixed = TRUE)]
  fig <- px_bar(
    d, x = "label", y = "value", color = "variant", facet_col = "case", barmode = "group",
    category_orders = list(variant = variants, case = levels(res$case)),
    # R in blues, Python in oranges; the darkest of each is the float32 variant
    color_discrete_map = list(release = "#6baed6", core_backend = "#2171b5", go_figure_f32 = "#08306b",
                              plotly_py = "#fd8d3c", plotly_py_f32 = "#a63603"),
    labels = list(label = "", value = label, variant = ""),
    facet_col_spacing = 0.02,
    template = "plotly_white"
  )
  fig |>
    for_each_annotation(function(a) {
      a$text <- sub("^[^=]*=", "", a$text) # "case=heatmap" -> "heatmap"
      a
    }) |>
    # little margin around the panels (room below for the labels' descenders),
    # legend above them
    update_layout(
      margin = list(l = 65, r = 5, t = 25, b = 20),
      legend = list(orientation = "h", y = 1.08, yanchor = "bottom", x = 0)
    ) |>
    # each panel its own sizes, as categories: every bar the same width
    update_xaxes(matches = NULL, type = "category") |>
    # one y axis shared by the panels, from 0
    update_yaxes(matches = "y", rangemode = "tozero") |>
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
For the 2000 × 2000 heatmap, CRAN plotly keeps R busy for 11.2 s; the
same [`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) code
with plotly.core takes 0.2 s, and
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
with
[`as_float32()`](https://msummersgill.github.io/plotly.R.core/reference/as_float32.md)
0.10 s, faster than plotly.py.

### Load time

Show the chart code

``` r

metric_chart("load_sec", "load (s)")
```

The time from opening the page to the plot appearing, here with no
network in between. A heatmap that CRAN plotly takes 8.0 s to show
appears in 2.2 s with plotly.core (1.3 s with float32). For small
figures (under about 100,000 values) CRAN plotly loads slightly faster,
because plotly.js 4 is a larger script; see
[`partial_bundle()`](https://msummersgill.github.io/plotly.R.core/reference/partial_bundle.md).
The largest 10-series case is 10 × 500,000 because CRAN plotly couldn’t
show 10 × 1,000,000 at all: in an earlier run, Chrome never finished
drawing its 678 MB page in two tries of 5 minutes each, while
plotly.core showed the same figure in about 9 s. At 10 × 500,000, CRAN
plotly takes 12.4 s and plotly.core 4.6 s.

### Page size

Show the chart code

``` r

metric_chart("html_mb", "HTML (MB)")
```

The size of the saved page or the data a Shiny app sends: it’s what a
viewer on a remote server or slow connection waits to download, and what
makes self-contained reports too big to email or attach. The 1M-point
time series goes from 96 MB with CRAN plotly to 21 MB, and 10 series
sharing x from 338 MB to 32.0 MB, since x is sent once.

### Peak browser memory

Show the chart code

``` r

metric_chart("peak_renderer_mb", "peak renderer (MB)")
```

The most memory the page’s browser process uses while loading; when a
tab exceeds what the browser or machine allows, it crashes (“Aw, Snap!”
in Chrome), which is most likely on laptops with little memory, on
phones, or with several large plots on one page. The heatmap peaks at
1057 MB with CRAN plotly and 524 MB with
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
and float32.

### Memory held after load

Show the chart code

``` r

metric_chart("js_heap_mb", "JS heap after load (MB)")
```

The JavaScript memory the plot keeps while it stays open, which adds up
on dashboards and reports with many plots. For the 1M-point time series
it falls from 291 MB with CRAN plotly to 205 MB with plotly.core and 179
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
plotly.core), the load time from 8.03 s to 2.15 s, and the renderer’s
peak memory from 1057 MB to 660 MB. plotly.js’s own `newPlot()` time is
about the same for every variant, so the faster loads come from
fetching, parsing and decoding less data, not from plotly.js itself.

**Date-times as numbers.** Dates and date-times are sent as typed arrays
of days or milliseconds; the widget’s JavaScript turns them back into
the strings R would have written. UTC offsets are looked up once per
15-minute bin rather than once per value. For the 1M-point time series,
CRAN plotly writes a page of 95.9 MB in 6.64 s; with plotly.core the
same [`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) code
writes 21.3 MB in 0.17 s. plotly.py writes date-times as text, so its
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
6.4 MB, against 67.7 MB for CRAN plotly and 43.3 MB for plotly.py, which
repeat x in each trace. Those pages are smaller than the single 1M-point
series and load faster (0.82 s against 1.15 s for
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)).

**[`as_float32()`](https://msummersgill.github.io/plotly.R.core/reference/as_float32.md).**
Doubles marked with
[`as_float32()`](https://msummersgill.github.io/plotly.R.core/reference/as_float32.md)
are sent in single precision, 4 bytes instead of 8 (about 7 significant
digits, which is what WebGL draws with). It halves the heatmap’s page
(42.7 to 21.3 MB) and cuts the JavaScript memory left after loading (153
to 107 MB) and the load time (2.15 to 1.33 s). For the time series only
y is halved; x stays in double precision.

**[`write_html()`](https://msummersgill.github.io/plotly.R.core/reference/write_html.md).**
htmlwidgets lays out the page and the figure’s data is then written to
the file directly, rather than passed through htmltools as one long
string, which is searched and copied several times. It saves
[`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) figures as
well as
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
ones, and both plotly.core variants here use it: the
[`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) heatmap takes
0.19 s to build and save, against about 0.8 s with
[`htmlwidgets::saveWidget()`](https://rdrr.io/pkg/htmlwidgets/man/saveWidget.html)
(an earlier run of these benchmarks). With
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
and float32 it is 0.099 s for the heatmap (0.138 s for plotly.py with
float32), and 0.062 s for the 1M-point time series (0.430 s).

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
timing). With
[`write_html()`](https://msummersgill.github.io/plotly.R.core/reference/write_html.md),
the whole build and save of the
[`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) heatmap now
takes 0.19 s.

### What doesn’t help (yet)

- **Partial bundles.**
  [`partial_bundle()`](https://msummersgill.github.io/plotly.R.core/reference/partial_bundle.md)
  loads a smaller plotly.js with only the trace types a figure uses. The
  `go_figure_f32` variant uses it (the “JS transferred” column in the
  [results tables](#results-tables)); the
  [`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) variants
  load the full bundle.
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
| timeseries | release | 6.641 | 95.9 | 2.83 | 1016 |
| timeseries | core_backend | 0.171 | 21.3 | 1.50 | 820 |
| timeseries | go_figure_f32 | 0.062 | 16.0 | 1.15 | 750 |
| timeseries | plotly_py | 0.467 | 43.3 | 1.58 | 794 |
| timeseries | plotly_py_f32 | 0.430 | 37.7 | 1.39 | 760 |
| multiseries | release | 21.260 | 337.7 | 12.36 | 3128 |
| multiseries | core_backend | 0.814 | 58.7 | 4.59 | 1514 |
| multiseries | go_figure_f32 | 0.123 | 32.0 | 3.49 | 1299 |
| multiseries | plotly_py | 2.268 | 216.5 | 5.87 | 1836 |
| multiseries | plotly_py_f32 | 2.098 | 188.3 | 4.89 | 1719 |
| heatmap | release | 11.202 | 164.4 | 8.03 | 1057 |
| heatmap | core_backend | 0.193 | 42.7 | 2.15 | 660 |
| heatmap | go_figure_f32 | 0.099 | 21.3 | 1.33 | 524 |
| heatmap | plotly_py | 0.288 | 54.0 | 2.44 | 668 |
| heatmap | plotly_py_f32 | 0.138 | 25.5 | 1.55 | 582 |

#### Large time series (`scattergl` lines)

| size | variant | build + write (s) | HTML (MB) | load (s) | newPlot (s) | JS transferred (MB) | peak renderer (MB) | JS heap after (MB) |
|:---|:---|---:|---:|---:|---:|---:|---:|---:|
| 10,000 | release | 0.062 | 0.97 | 0.238 | 0.080 | 1.20 | 221 | 15.5 |
| 10,000 | core_backend | 0.018 | 0.22 | 0.358 | 0.077 | 1.54 | 243 | 17.4 |
| 10,000 | go_figure_f32 | 0.014 | 0.17 | 0.171 | 0.069 | 0.52 | 176 | 8.6 |
| 10,000 | plotly_py | 0.005 | 0.44 | 0.340 | 0.078 | 1.47 | 236 | 16.3 |
| 10,000 | plotly_py_f32 | 0.005 | 0.38 | 0.340 | 0.071 | 1.47 | 236 | 16.2 |
| 100,000 | release | 0.535 | 9.61 | 0.453 | 0.147 | 1.20 | 327 | 41.0 |
| 100,000 | core_backend | 0.028 | 2.14 | 0.481 | 0.144 | 1.54 | 322 | 35.0 |
| 100,000 | go_figure_f32 | 0.019 | 1.61 | 0.275 | 0.130 | 0.52 | 257 | 24.6 |
| 100,000 | plotly_py | 0.047 | 4.34 | 0.465 | 0.135 | 1.47 | 302 | 32.4 |
| 100,000 | plotly_py_f32 | 0.043 | 3.77 | 0.448 | 0.136 | 1.47 | 298 | 31.5 |
| 1,000,000 | release | 6.641 | 95.92 | 2.829 | 0.673 | 1.20 | 1016 | 291.2 |
| 1,000,000 | core_backend | 0.171 | 21.34 | 1.499 | 0.666 | 1.54 | 820 | 204.7 |
| 1,000,000 | go_figure_f32 | 0.062 | 16.01 | 1.145 | 0.614 | 0.52 | 750 | 178.7 |
| 1,000,000 | plotly_py | 0.467 | 43.28 | 1.585 | 0.582 | 1.47 | 794 | 187.7 |
| 1,000,000 | plotly_py_f32 | 0.430 | 37.66 | 1.394 | 0.584 | 1.47 | 760 | 178.4 |

#### 10 time series sharing x (`scattergl` lines)

| size | variant | build + write (s) | HTML (MB) | load (s) | newPlot (s) | JS transferred (MB) | peak renderer (MB) | JS heap after (MB) |
|:---|:---|---:|---:|---:|---:|---:|---:|---:|
| 10 × 10,000 | release | 0.381 | 6.81 | 0.427 | 0.132 | 1.20 | 302 | 31.2 |
| 10 × 10,000 | core_backend | 0.063 | 1.18 | 0.439 | 0.130 | 1.54 | 272 | 24.4 |
| 10 × 10,000 | go_figure_f32 | 0.019 | 0.65 | 0.241 | 0.121 | 0.52 | 208 | 13.9 |
| 10 × 10,000 | plotly_py | 0.050 | 4.35 | 0.448 | 0.126 | 1.47 | 287 | 22.9 |
| 10 × 10,000 | plotly_py_f32 | 0.051 | 3.78 | 0.428 | 0.129 | 1.47 | 281 | 21.9 |
| 10 × 100,000 | release | 4.052 | 67.74 | 2.628 | 0.667 | 1.20 | 784 | 246.7 |
| 10 × 100,000 | core_backend | 0.196 | 11.74 | 1.143 | 0.614 | 1.54 | 547 | 153.8 |
| 10 × 100,000 | go_figure_f32 | 0.036 | 6.41 | 0.822 | 0.589 | 0.52 | 489 | 127.8 |
| 10 × 100,000 | plotly_py | 0.456 | 43.33 | 1.426 | 0.602 | 1.47 | 615 | 147.6 |
| 10 × 100,000 | plotly_py_f32 | 0.442 | 37.69 | 1.196 | 0.585 | 1.47 | 613 | 138.3 |
| 10 × 500,000 | release | 21.260 | 337.68 | 12.358 | 2.967 | 1.20 | 3128 | 1199.1 |
| 10 × 500,000 | core_backend | 0.814 | 58.67 | 4.588 | 2.576 | 1.54 | 1514 | 723.3 |
| 10 × 500,000 | go_figure_f32 | 0.123 | 32.01 | 3.486 | 2.489 | 0.52 | 1299 | 627.9 |
| 10 × 500,000 | plotly_py | 2.268 | 216.53 | 5.871 | 2.462 | 1.47 | 1836 | 696.2 |
| 10 × 500,000 | plotly_py_f32 | 2.098 | 188.32 | 4.889 | 2.441 | 1.47 | 1719 | 649.6 |

#### Large matrix heatmap

| size | variant | build + write (s) | HTML (MB) | load (s) | newPlot (s) | JS transferred (MB) | peak renderer (MB) | JS heap after (MB) |
|:---|:---|---:|---:|---:|---:|---:|---:|---:|
| 100² | release | 0.029 | 0.41 | 0.186 | 0.032 | 1.20 | 195 | 11.9 |
| 100² | core_backend | 0.018 | 0.11 | 0.323 | 0.048 | 1.54 | 227 | 14.7 |
| 100² | go_figure_f32 | 0.014 | 0.06 | 0.152 | 0.047 | 0.52 | 175 | 6.2 |
| 100² | plotly_py | 0.002 | 0.14 | 0.312 | 0.048 | 1.47 | 223 | 13.9 |
| 100² | plotly_py_f32 | 0.002 | 0.07 | 0.302 | 0.046 | 1.47 | 223 | 13.8 |
| 500² | release | 0.388 | 10.28 | 0.611 | 0.076 | 1.20 | 284 | 21.6 |
| 500² | core_backend | 0.028 | 2.67 | 0.446 | 0.085 | 1.54 | 273 | 23.1 |
| 500² | go_figure_f32 | 0.019 | 1.34 | 0.218 | 0.081 | 0.52 | 204 | 12.3 |
| 500² | plotly_py | 0.017 | 3.39 | 0.439 | 0.084 | 1.47 | 275 | 22.2 |
| 500² | plotly_py_f32 | 0.010 | 1.60 | 0.390 | 0.080 | 1.47 | 261 | 19.9 |
| 1000² | release | 2.164 | 41.11 | 2.085 | 0.207 | 1.20 | 468 | 51.6 |
| 1000² | core_backend | 0.060 | 10.67 | 0.699 | 0.199 | 1.54 | 390 | 49.1 |
| 1000² | go_figure_f32 | 0.033 | 5.34 | 0.396 | 0.175 | 0.52 | 294 | 31.4 |
| 1000² | plotly_py | 0.075 | 13.51 | 0.766 | 0.192 | 1.47 | 401 | 48.3 |
| 1000² | plotly_py_f32 | 0.040 | 6.39 | 0.551 | 0.178 | 1.47 | 354 | 39.0 |
| 2000² | release | 11.202 | 164.43 | 8.031 | 0.725 | 1.20 | 1057 | 171.8 |
| 2000² | core_backend | 0.193 | 42.67 | 2.152 | 0.650 | 1.54 | 660 | 153.2 |
| 2000² | go_figure_f32 | 0.099 | 21.34 | 1.329 | 0.572 | 0.52 | 524 | 107.5 |
| 2000² | plotly_py | 0.288 | 54.04 | 2.436 | 0.610 | 1.47 | 668 | 152.4 |
| 2000² | plotly_py_f32 | 0.138 | 25.54 | 1.550 | 0.573 | 1.47 | 582 | 115.1 |

#### Relative to the CRAN release

Release median ÷ variant median at each size (above 1 means faster or
smaller than the release).

| case | size | variant | build + write | HTML | load | peak renderer | JS heap |
|:---|:---|:---|---:|---:|---:|---:|---:|
| timeseries | 10,000 | core_backend | 3.4 | 4.5 | 0.7 | 0.9 | 0.9 |
| timeseries | 10,000 | go_figure_f32 | 4.4 | 5.8 | 1.4 | 1.3 | 1.8 |
| timeseries | 10,000 | plotly_py | 12.6 | 2.2 | 0.7 | 0.9 | 1.0 |
| timeseries | 10,000 | plotly_py_f32 | 13.5 | 2.5 | 0.7 | 0.9 | 1.0 |
| timeseries | 100,000 | core_backend | 19.1 | 4.5 | 0.9 | 1.0 | 1.2 |
| timeseries | 100,000 | go_figure_f32 | 28.2 | 6.0 | 1.6 | 1.3 | 1.7 |
| timeseries | 100,000 | plotly_py | 11.3 | 2.2 | 1.0 | 1.1 | 1.3 |
| timeseries | 100,000 | plotly_py_f32 | 12.4 | 2.5 | 1.0 | 1.1 | 1.3 |
| timeseries | 1,000,000 | core_backend | 38.8 | 4.5 | 1.9 | 1.2 | 1.4 |
| timeseries | 1,000,000 | go_figure_f32 | 107.1 | 6.0 | 2.5 | 1.4 | 1.6 |
| timeseries | 1,000,000 | plotly_py | 14.2 | 2.2 | 1.8 | 1.3 | 1.6 |
| timeseries | 1,000,000 | plotly_py_f32 | 15.4 | 2.5 | 2.0 | 1.3 | 1.6 |
| multiseries | 10 × 10,000 | core_backend | 6.0 | 5.8 | 1.0 | 1.1 | 1.3 |
| multiseries | 10 × 10,000 | go_figure_f32 | 20.1 | 10.5 | 1.8 | 1.5 | 2.2 |
| multiseries | 10 × 10,000 | plotly_py | 7.6 | 1.6 | 1.0 | 1.1 | 1.4 |
| multiseries | 10 × 10,000 | plotly_py_f32 | 7.5 | 1.8 | 1.0 | 1.1 | 1.4 |
| multiseries | 10 × 100,000 | core_backend | 20.7 | 5.8 | 2.3 | 1.4 | 1.6 |
| multiseries | 10 × 100,000 | go_figure_f32 | 112.6 | 10.6 | 3.2 | 1.6 | 1.9 |
| multiseries | 10 × 100,000 | plotly_py | 8.9 | 1.6 | 1.8 | 1.3 | 1.7 |
| multiseries | 10 × 100,000 | plotly_py_f32 | 9.2 | 1.8 | 2.2 | 1.3 | 1.8 |
| multiseries | 10 × 500,000 | core_backend | 26.1 | 5.8 | 2.7 | 2.1 | 1.7 |
| multiseries | 10 × 500,000 | go_figure_f32 | 172.8 | 10.5 | 3.5 | 2.4 | 1.9 |
| multiseries | 10 × 500,000 | plotly_py | 9.4 | 1.6 | 2.1 | 1.7 | 1.7 |
| multiseries | 10 × 500,000 | plotly_py_f32 | 10.1 | 1.8 | 2.5 | 1.8 | 1.8 |
| heatmap | 100² | core_backend | 1.6 | 3.8 | 0.6 | 0.9 | 0.8 |
| heatmap | 100² | go_figure_f32 | 2.1 | 6.8 | 1.2 | 1.1 | 1.9 |
| heatmap | 100² | plotly_py | 14.1 | 2.9 | 0.6 | 0.9 | 0.9 |
| heatmap | 100² | plotly_py_f32 | 14.3 | 5.8 | 0.6 | 0.9 | 0.9 |
| heatmap | 500² | core_backend | 13.9 | 3.9 | 1.4 | 1.0 | 0.9 |
| heatmap | 500² | go_figure_f32 | 20.4 | 7.7 | 2.8 | 1.4 | 1.8 |
| heatmap | 500² | plotly_py | 22.6 | 3.0 | 1.4 | 1.0 | 1.0 |
| heatmap | 500² | plotly_py_f32 | 37.1 | 6.4 | 1.6 | 1.1 | 1.1 |
| heatmap | 1000² | core_backend | 36.1 | 3.9 | 3.0 | 1.2 | 1.1 |
| heatmap | 1000² | go_figure_f32 | 65.6 | 7.7 | 5.3 | 1.6 | 1.6 |
| heatmap | 1000² | plotly_py | 29.0 | 3.0 | 2.7 | 1.2 | 1.1 |
| heatmap | 1000² | plotly_py_f32 | 54.0 | 6.4 | 3.8 | 1.3 | 1.3 |
| heatmap | 2000² | core_backend | 58.0 | 3.9 | 3.7 | 1.6 | 1.1 |
| heatmap | 2000² | go_figure_f32 | 113.2 | 7.7 | 6.0 | 2.0 | 1.6 |
| heatmap | 2000² | plotly_py | 38.9 | 3.0 | 3.3 | 1.6 | 1.1 |
| heatmap | 2000² | plotly_py_f32 | 81.0 | 6.4 | 5.2 | 1.8 | 1.5 |

#### Notes

- The variants use different plotly.js versions (see above), so
  `newPlot` times include plotly.js differences as well as the data
  format; plotly.js 4 is also larger to load (all variants but
  `go_figure_f32` load a full bundle). “JS transferred (MB)” is all
  JavaScript the page fetched (plotly.js, htmlwidgets, bindings) as sent
  by the server, which compresses it.
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
  wide data.table, sharing the same date-time x. plotly.core sends an
  array repeated in a figure once (see `widget_to_JSON()`), so x is sent
  once rather than ten times.
- **Large matrix heatmap**: one `heatmap` trace of an n × n matrix.

Metrics:

- **Build + write (s)**: R or Python time from the figure-making call to
  the standalone HTML page written to disk
  ([`htmlwidgets::saveWidget()`](https://rdrr.io/pkg/htmlwidgets/man/saveWidget.html)
  for the CRAN release, plotly.core’s
  [`write_html()`](https://msummersgill.github.io/plotly.R.core/reference/write_html.md)
  for [`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) with
  the development plotly and for
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

cases <- rbindlist(list(
  data.table(case = "timeseries", size = unlist(params$ts_sizes), values = as.integer(unlist(params$ts_sizes))),
  data.table(case = "multiseries", size = unlist(params$ms_sizes), values = as.integer(unlist(params$ms_sizes) * 10)),
  data.table(case = "heatmap", size = unlist(params$hm_sizes), values = as.integer(unlist(params$hm_sizes)^2))
))
cases[, file := file.path(wd, "data", sprintf("%s-%d.bin", case, size))]
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
(POSIXct, UTC) and `y`; the 10 series as a data.table `d` with columns
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
# go_figure() figures load the smallest plotly.js bundle with their trace types
figures$go_figure_f32 <- lapply(figures$go_figure_f32, function(make) {
  function(...) partial_bundle(make(...))
})
# the same plot_ly() code, run with the development plotly
figures$core_backend <- figures$release

# how each variant writes its page
writers <- list(
  release = function(p, file) htmlwidgets::saveWidget(p, file, selfcontained = FALSE, libdir = "lib"),
  core_backend = function(p, file) plotly.core::write_html(p, file, selfcontained = FALSE, libdir = "lib"),
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
      args <- list(d = data.table::data.table(t = t, y))
    } else {
      args <- list(z = matrix(v, n, n))
    }
    make <- fns[[cases$case[i]]]
    page <- file.path(outdir, sprintf("%s-%d.html", cases$case[i], n))
    save <- function() write(do.call(make, args), page)
    save() # warm-up; also the page the browser loads
    for (rep in seq_len(reps)) {
      gc()
      out[[length(out) + 1]] <- list(
        variant = variant, case = cases$case[i], size = n, rep = rep,
        build_sec = system.time(save())[["elapsed"]]
      )
    }
  }
  data.table::rbindlist(out)
}

build_r <- rbindlist(lapply(names(figures), function(v) {
  callr::r(r_worker, list(v, figures[[v]], writers[[v]], cases, reps, file.path(pages_dir, v)),
           libpath = c(libs[[v]], .libPaths()))
}))
```

``` r

cases_json <- file.path(wd, "cases.json")
jsonlite::write_json(cases[, .(case, size, file)], cases_json)
build_py <- rbindlist(lapply(c("plotly_py", "plotly_py_f32"), function(v) {
  outdir <- file.path(pages_dir, v)
  dir.create(outdir, showWarnings = FALSE)
  res <- system2(python, c(shQuote(file.path(wd, "bench.py")), v, shQuote(cases_json), reps,
                           shQuote(outdir)), stdout = TRUE)
  as.data.table(jsonlite::fromJSON(paste(res, collapse = "")))
}))
build <- rbindlist(list(build_r, build_py))
# one page per variant and case size
pages <- CJ(variant = variants, i = seq_len(nrow(cases)), sorted = FALSE)[
  , c(.(variant = variant), cases[i, .(case, size, values)])]
pages[, path := sprintf("%s/%s-%d.html", variant, case, size)]
pages[, html_mb := file.size(file.path(pages_dir, path)) / 1e6]
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
  data.table(
    load_sec = b$painted / 1000,
    newplot_sec = (b$end - b$start) / 1000,
    js_mb = b$js_bytes / 1e6,
    peak_renderer_mb = as.numeric(readLines(peak_file, warn = FALSE)) / 1e6,
    js_heap_mb = (heap$usedSize + if (is.null(heap$backingStorageSize)) 0 else heap$backingStorageSize) / 1e6
  )
}

restart_chrome <- function() {
  try(chrome$close(), silent = TRUE)
  chrome <<- chromote::Chromote$new()
  browser_pid <<- chrome$get_browser()$get_process()$get_pid()
}
# on a failure (e.g. Chrome not responding), restart Chrome and try the page
# once more; a page that fails twice (e.g. too large to load) is recorded as
# missing values, and not tried again in later rounds
failed <- character()
measure_retry <- function(url) {
  missing <- data.table(load_sec = NA_real_, newplot_sec = NA_real_, js_mb = NA_real_,
                        peak_renderer_mb = NA_real_, js_heap_mb = NA_real_)
  if (url %in% failed) return(missing)
  for (attempt in 1:2) {
    r <- tryCatch(measure_page(url), error = identity)
    if (!inherits(r, "error")) return(r)
    message("attempt ", attempt, " at ", url, " failed: ", conditionMessage(r))
    restart_chrome()
  }
  failed <<- c(failed, url)
  missing
}

set.seed(1)
browser <- rbindlist(lapply(seq_len(reps), function(rep) {
  # shuffle the page order each round, so drift doesn't favour a variant
  rbindlist(lapply(sample(nrow(pages)), function(i) {
    cbind(pages[i, .(variant, case, size)], rep = rep,
          measure_retry(sprintf("http://127.0.0.1:%d/%s", port, pages$path[i])))
  }))
}))
server$kill()
```

### Environment

Results above are from a run on 2026-11-17 on macOS 26.5.1 (Apple M3
Pro), with R version 4.4.2 (2024-10-31) and Chrome/157.0.8103.79
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
    list(
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
versions <- rbindlist(list(
  c(variant = "release", r_versions(release_lib)),
  c(variant = "core_backend, go_figure_f32", r_versions(core_lib)),
  list(variant = "plotly_py, plotly_py_f32",
       plotly = paste0(py$plotly, " (Python; numpy ", py$numpy, ", pandas ", py$pandas, ")"),
       plotly.core = NA_character_, plotly.js = py$plotlyjs)
))
cpu <- if (Sys.info()[["sysname"]] == "Darwin") {
  system("sysctl -n machdep.cpu.brand_string", intern = TRUE)
} else {
  NA_character_
}
meta <- list(date = format(Sys.Date()), R = R.version.string, os = utils::sessionInfo()$running,
             cpu = cpu, browser = chrome$Browser$getVersion()$product, reps = reps)
chrome$close()

fwrite(build, file.path(results_dir, "build.csv"))
fwrite(browser, file.path(results_dir, "browser.csv"))
fwrite(pages[, .(variant, case, size, values, html_mb)], file.path(results_dir, "pages.csv"))
fwrite(versions, file.path(results_dir, "versions.csv"))
jsonlite::write_json(meta, file.path(results_dir, "meta.json"), auto_unbox = TRUE, pretty = TRUE)
```
