# Gauge Chart

### Basic Gauge

A radial gauge chart has a circular arc, which displays a single value
to estimate progress toward a goal. The bar shows the target value, and
the shading represents the progress toward that goal. Gauge charts,
known as speedometer charts as well. This chart type is usually used to
illustrate key business indicators.

The example below displays a basic gauge chart with default attributes.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_indicator(
    domain = go_domain(x = c(0, 1), y = c(0, 1)),
    value = 270,
    title = go_indicator_title(text = "Speed"),
    mode = "gauge+number"
  ) |>
  update_layout(margin = go_margin(l = 20, r = 30))

fig
```

### Add Steps, Threshold, and Delta

The following examples include “steps” attribute shown as shading inside
the radial arc, “delta” which is the difference of the value and goal
(reference - value), and “threshold” to determine boundaries that
visually alert you if the value cross a defined threshold.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_indicator(
    domain = go_domain(x = c(0, 1), y = c(0, 1)),
    value = 450,
    title = go_indicator_title(text = "Speed"),
    mode = "gauge+number+delta",
    delta = go_indicator_delta(reference = 380),
    gauge = go_indicator_gauge(
      axis = go_indicator_gauge_axis(range = list(NULL, 500)),
      steps = list(
        go_indicator_gauge_step(range = c(0, 250), color = "lightgray"),
        go_indicator_gauge_step(range = c(250, 400), color = "gray")
      ),
      threshold = go_indicator_gauge_threshold(
        line = go_indicator_gauge_threshold_line(color = "red", width = 4),
        thickness = 0.75,
        value = 490
      )
    )
  ) |>
  update_layout(margin = go_margin(l = 20, r = 30))

fig
```

### Custom Gauge Chart

The following example shows how to style your gauge charts. For more
information about all possible options see
[`go_indicator()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator.md).

``` r

library(plotly.core)

fig <- go_figure() |>
  add_indicator(
    mode = "gauge+number+delta",
    value = 420,
    title = go_indicator_title(text = "Speed", font = go_font(size = 24)),
    delta = go_indicator_delta(
      reference = 400,
      increasing = go_indicator_delta_increasing(color = "RebeccaPurple")
    ),
    gauge = go_indicator_gauge(
      axis = go_indicator_gauge_axis(
        range = list(NULL, 500),
        tickwidth = 1,
        tickcolor = "darkblue"
      ),
      bar = go_indicator_gauge_bar(color = "darkblue"),
      bgcolor = "white",
      borderwidth = 2,
      bordercolor = "gray",
      steps = list(
        go_indicator_gauge_step(range = c(0, 250), color = "cyan"),
        go_indicator_gauge_step(range = c(250, 400), color = "royalblue")
      ),
      threshold = go_indicator_gauge_threshold(
        line = go_indicator_gauge_threshold_line(color = "red", width = 4),
        thickness = 0.75,
        value = 490
      )
    )
  ) |>
  update_layout(
    margin = go_margin(l = 20, r = 30),
    paper_bgcolor = "lavender",
    font = go_font(color = "darkblue", family = "Arial")
  )

fig
```

\#Reference

See
[`go_indicator()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator.md)
for more information and chart attribute options!
