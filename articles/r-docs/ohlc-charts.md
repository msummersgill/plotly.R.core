# OHLC Charts

### Basic OHLC Chart

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/finance-charts-apple.csv")
df$Date <- as.Date(df$Date)
df <- tail(df, 30)

fig <- df |>
  go_figure() |>
  add_ohlc(
    x = ~Date,
    open = ~AAPL.Open,
    close = ~AAPL.Close,
    high = ~AAPL.High,
    low = ~AAPL.Low
  ) |>
  update_layout(title = "Basic OHLC Chart")

fig
```

### OHLC Chart without Rangeslider

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/finance-charts-apple.csv")
df$Date <- as.Date(df$Date)
df <- tail(df, 30)

fig <- df |>
  go_figure() |>
  add_ohlc(
    x = ~Date,
    open = ~AAPL.Open,
    close = ~AAPL.Close,
    high = ~AAPL.High,
    low = ~AAPL.Low
  ) |>
  update_layout(
    title = "Basic OHLC Chart",
    xaxis = go_xaxis(rangeslider = go_xaxis_rangeslider(visible = FALSE))
  )

fig
```

### Customise the Figure with Shapes and Annotations

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/finance-charts-apple.csv")
df$Date <- as.Date(df$Date)

# annotation
a <- go_annotation(
  text = "Brexit vote",
  x = "2016-06-23",
  y = 1.02,
  xref = "x",
  yref = "paper",
  xanchor = "left",
  showarrow = FALSE
)

# use shapes to create a line
l <- go_shape(
  type = "line",
  x0 = "2016-06-23",
  x1 = "2016-06-23",
  y0 = 0,
  y1 = 1,
  xref = "x",
  yref = "paper",
  line = go_shape_line(color = "black", width = 0.5)
)

fig <- df |>
  go_figure() |>
  add_ohlc(
    x = ~Date,
    open = ~AAPL.Open,
    close = ~AAPL.Close,
    high = ~AAPL.High,
    low = ~AAPL.Low
  ) |>
  update_layout(
    title = "Custom Colors",
    annotations = list(a),
    shapes = list(l)
  )

fig
```

### Custom OHLC Chart Colors

``` r

library(plotly.core)

# basic example of ohlc charts
df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/finance-charts-apple.csv")
df$Date <- as.Date(df$Date)
df <- tail(df, 30)

# custom colors
i <- go_ohlc_increasing(line = go_ohlc_increasing_line(color = "#FFD700"))
d <- go_ohlc_decreasing(line = go_ohlc_decreasing_line(color = "#0000ff"))

fig <- df |>
  go_figure() |>
  add_ohlc(
    x = ~Date,
    open = ~AAPL.Open,
    close = ~AAPL.Close,
    high = ~AAPL.High,
    low = ~AAPL.Low,
    increasing = i,
    decreasing = d
  )

fig
```

\#Reference

See
[`go_ohlc()`](https://msummersgill.github.io/plotly.R.core/reference/go_ohlc.md)
for more information and chart attribute options!
