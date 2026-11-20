# Histograms

#### Basic Histogram

``` r

library(plotly.core)

fig <- go_figure() |>
  add_histogram(x = rnorm(50))

fig
```

#### Normalized Histogram

``` r

library(plotly.core)

fig <- go_figure() |>
  add_histogram(x = rnorm(50), histnorm = "probability")

fig
```

#### Specify Binning Function

``` r

library(plotly.core)

x <- c("Apples", "Apples", "Apples", "Organges", "Bananas")
y <- c("5", "10", "3", "10", "5")

fig <- go_figure() |>
  add_histogram(y = y, x = x, histfunc = "sum") |>
  update_layout(yaxis = go_yaxis(type = "linear"))

fig
```

#### Horizontal Histogram

``` r

library(plotly.core)

fig <- go_figure() |>
  add_histogram(y = rnorm(50))

fig
```

#### Overlaid Histograms

``` r

library(plotly.core)

fig <- go_figure() |>
  add_histogram(x = rnorm(500), opacity = 0.6) |>
  add_histogram(x = rnorm(500) + 1, opacity = 0.6) |>
  update_layout(barmode = "overlay")

fig
```

#### Stacked Histograms

``` r

library(plotly.core)

fig <- go_figure() |>
  add_histogram(x = rnorm(500), opacity = 0.6) |>
  add_histogram(x = rnorm(500) + 1, opacity = 0.6) |>
  update_layout(barmode = "stack")

fig
```

#### Cumulative Histogram

``` r

library(plotly.core)

fig <- go_figure() |>
  add_histogram(
    x = rnorm(50),
    cumulative = go_histogram_cumulative(enabled = TRUE)
  )

fig
```

### Share bins between histograms

In this example both histograms have a compatible bin settings using the
`bingroup` attribute (see
[`go_histogram()`](https://msummersgill.github.io/plotly.R.core/reference/go_histogram.md)).

``` r

library(plotly.core)

fig <- go_figure() |>
  add_histogram(x = rnorm(100, 5), bingroup = 1) |>
  add_histogram(x = rnorm(20, 5), bingroup = 1) |>
  update_layout(barmode = "overlay", bargap = 0.1)

fig
```

Note that traces on the same subplot, and with the same `barmode`
(“stack”, “relative”, “group”) are forced into the same `bingroup`,
however traces with `barmode = "overlay"` and on different axes (of the
same axis type) can have compatible bin settings. Histogram and
[histogram2d](https://msummersgill.github.io/plotly.R.core/articles/r-docs/2d-histogram.md)
trace can share the same `bingroup`.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_histogram(x = rnorm(100, 5)) |>
  add_histogram(x = rnorm(20, 5)) |>
  update_layout(barmode = "stack", bargap = 0.1)

fig
```

### Reference

See
[`go_histogram()`](https://msummersgill.github.io/plotly.R.core/reference/go_histogram.md)
for more information and chart attribute options!
