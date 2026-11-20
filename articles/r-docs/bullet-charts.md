# Bullet Charts

### Basic Bullet Charts

Stephen Few’s Bullet Chart was invented to replace dashboard
[gauges](https://msummersgill.github.io/plotly.R.core/articles/r-docs/gauge-charts.md)
and meters, combining both types of charts into simple bar charts with
qualitative bars (steps), quantitative bar (bar) and performance line
(threshold); all into one simple layout. Steps typically are broken into
several values, which are defined with an array. The bar represent the
actual value that a particular variable reached, and the threshold
usually indicate a goal point relative to the value achieved by the bar.
See [indicator
page](https://msummersgill.github.io/plotly.R.core/articles/r-docs/gauge-charts.md)
for more detail.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_indicator(
    mode = "number+gauge+delta",
    gauge = go_indicator_gauge(shape = "bullet"),
    delta = go_indicator_delta(reference = 300),
    value = 220,
    domain = go_domain(x = c(0, 1), y = c(0, 1)),
    title = go_indicator_title(text = "Profit")
  ) |>
  update_layout(height = 150)

fig
```

### Add Steps, and Threshold

Below is the same example using “steps” attribute, which is shown as
shading, and “threshold” to determine boundaries that visually alert you
if the value cross a defined threshold.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_indicator(
    mode = "number+gauge+delta",
    value = 220,
    domain = go_domain(x = c(0, 1), y = c(0, 1)),
    title = go_indicator_title(text = "<b>Profit</b>"),
    delta = go_indicator_delta(reference = 200),
    gauge = go_indicator_gauge(
      shape = "bullet",
      axis = go_indicator_gauge_axis(range = c(NA, 300)),
      threshold = go_indicator_gauge_threshold(
        line = go_indicator_gauge_threshold_line(color = "red", width = 2),
        thickness = 0.75,
        value = 280
      ),
      steps = list(
        go_indicator_gauge_step(range = c(0, 150), color = "lightgray"),
        go_indicator_gauge_step(range = c(150, 250), color = "gray")
      )
    )
  ) |>
  update_layout(height = 150, width = 600, margin = go_margin(l = 100, r = 10))

fig
```

### Custom Bullet Chart

The following example shows how to customize your charts. For more
information about all possible options see
[`go_indicator()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator.md).

``` r

library(plotly.core)

fig <- go_figure() |>
  add_indicator(
    mode = "number+gauge+delta",
    value = 220,
    domain = go_domain(x = c(0, 1), y = c(0, 1)),
    delta = go_indicator_delta(reference = 280, position = "top"),
    title = go_indicator_title(
      text = "<b>Profit</b><br><span style='color: gray; font-size:0.8em'>U.S. $</span>",
      font = go_font(size = 14)
    ),
    gauge = go_indicator_gauge(
      shape = "bullet",
      axis = go_indicator_gauge_axis(range = c(NA, 300)),
      threshold = go_indicator_gauge_threshold(
        line = go_indicator_gauge_threshold_line(color = "red", width = 2),
        thickness = 0.75,
        value = 270
      ),
      bgcolor = "white",
      steps = list(go_indicator_gauge_step(range = c(0, 150), color = "cyan")),
      bar = go_indicator_gauge_bar(color = "darkblue")
    )
  ) |>
  update_layout(height = 150)

fig
```

### Multi Bullet

Bullet charts can be stacked for comparing several values at once as
illustrated below:

``` r

library(plotly.core)

bullet_gauge <- function(range_max, threshold, steps) {
  go_indicator_gauge(
    shape = "bullet",
    axis = go_indicator_gauge_axis(range = c(NA, range_max)),
    threshold = go_indicator_gauge_threshold(
      line = go_indicator_gauge_threshold_line(color = "black", width = 2),
      thickness = 0.75,
      value = threshold
    ),
    steps = list(
      go_indicator_gauge_step(range = c(0, steps[[1]]), color = "gray"),
      go_indicator_gauge_step(range = steps, color = "lightgray")
    ),
    bar = go_indicator_gauge_bar(color = "black")
  )
}

fig <- go_figure() |>
  add_indicator(
    mode = "number+gauge+delta",
    value = 180,
    delta = go_indicator_delta(reference = 200),
    domain = go_domain(x = c(0.25, 1), y = c(0.08, 0.25)),
    title = go_indicator_title(text = "Revenue"),
    gauge = bullet_gauge(300, 170, c(150, 250))
  ) |>
  add_indicator(
    mode = "number+gauge+delta",
    value = 35,
    delta = go_indicator_delta(reference = 200),
    domain = go_domain(x = c(0.25, 1), y = c(0.4, 0.6)),
    title = go_indicator_title(text = "Profit"),
    gauge = bullet_gauge(100, 50, c(25, 75))
  ) |>
  add_indicator(
    mode = "number+gauge+delta",
    value = 220,
    delta = go_indicator_delta(reference = 300),
    domain = go_domain(x = c(0.25, 1), y = c(0.7, 0.9)),
    title = go_indicator_title(text = "Satisfaction"),
    gauge = bullet_gauge(300, 210, c(100, 250))
  )

fig
```

### Reference

See
[`go_indicator()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator.md)
for more information and chart attribute options!
