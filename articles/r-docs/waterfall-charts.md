# Waterfall Charts

### Basic Waterfall Chart

``` r

library(plotly.core)

x <- c("Sales", "Consulting", "Net revenue", "Purchases", "Other expenses", "Profit before tax")
measure <- c("relative", "relative", "total", "relative", "relative", "total")
text <- c("+60", "+80", "", "-40", "-20", "Total")
y <- c(60, 80, 0, -40, -20, 0)
data <- data.frame(x = factor(x, levels = x), measure, text, y)

fig <- data |>
  go_figure() |>
  add_waterfall(
    name = "20",
    measure = ~measure,
    x = ~x,
    textposition = "outside",
    y = ~y,
    text = ~text,
    connector = go_waterfall_connector(
      line = go_waterfall_connector_line(color = "rgb(63, 63, 63)")
    )
  ) |>
  update_layout(
    title = "Profit and loss statement 2018",
    xaxis = go_xaxis(title = ""),
    yaxis = go_yaxis(title = ""),
    autosize = TRUE,
    showlegend = TRUE
  )

fig
```

### Setting Marker Size and Color

This example uses the `decreasing`, `increasing` and `totals` attributes
(see
[`go_waterfall()`](https://msummersgill.github.io/plotly.R.core/reference/go_waterfall.md))
to customize the bars.

``` r

library(plotly.core)

y <- c(375, 128, 78, 0, -327, -78, 0, 32, 89, 0, -45, 0)
x <- c("Sales", "Consulting", "Maintenance", "Net revenue", "Purchases",
       "Material expenses", "Operating profit", "Investment income",
       "Financial income", "Profit before tax", "Income tax (15%)",
       "Profit after tax")
measure <- c("relative", "relative", "relative", "total", "relative",
             "relative", "total", "relative", "relative", "total",
             "relative", "total")
data <- data.frame(x = factor(x, levels = x), y, measure)

fig <- data |>
  go_figure() |>
  add_waterfall(
    x = ~x,
    y = ~y,
    measure = ~measure,
    base = 300,
    decreasing = go_waterfall_decreasing(
      marker = go_waterfall_decreasing_marker(
        color = "Maroon",
        line = go_waterfall_decreasing_marker_line(color = "red", width = 2)
      )
    ),
    increasing = go_waterfall_increasing(
      marker = go_waterfall_increasing_marker(color = "Teal")
    ),
    totals = go_waterfall_totals(
      marker = go_waterfall_totals_marker(
        color = "deepskyblue",
        line = go_waterfall_totals_marker_line(color = "blue", width = 3)
      )
    )
  ) |>
  update_layout(
    title = "Profit and loss statement",
    xaxis = go_xaxis(title = "", tickfont = go_font(size = 16), ticks = "outside"),
    yaxis = go_yaxis(title = ""),
    waterfallgap = 0.3
  )

fig
```

``` r

library(plotly.core)

x <- c(375, 128, 78, 27, 0, -327, -12, -78, -12, 0, 32, 89, 0, -45, 0)
y <- c("Sales", "Consulting", "Maintenance", "Other revenue", "Net revenue",
       "Purchases", "Material expenses", "Personnel expenses",
       "Other expenses", "Operating profit", "Investment income",
       "Financial income", "Profit before tax", "Income tax (15%)",
       "Profit after tax")
measure <- c("relative", "relative", "relative", "relative", "total",
             "relative", "relative", "relative", "relative", "total",
             "relative", "relative", "total", "relative", "total")
data <- data.frame(x, y = factor(y, levels = y), measure)

fig <- data |>
  go_figure() |>
  add_waterfall(
    x = ~x,
    y = ~y,
    measure = ~measure,
    name = "2018",
    orientation = "h",
    connector = go_waterfall_connector(
      mode = "between",
      line = go_waterfall_connector_line(width = 4, color = "rgb(0, 0, 0)", dash = "solid")
    )
  ) |>
  update_layout(
    title = "Profit and loss statement 2018<br>waterfall chart displaying positive and negative",
    xaxis = go_xaxis(title = "", type = "linear", tickfont = go_font(size = 16), ticks = "outside"),
    yaxis = go_yaxis(title = "", type = "category", autorange = "reversed"),
    margin = go_margin(l = 150),
    showlegend = TRUE
  )

fig
```
