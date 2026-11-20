# Line Plots

### Basic Line Plot

``` r

library(plotly.core)

x <- c(1:100)
random_y <- rnorm(100, mean = 0)
data <- data.frame(x, random_y)

data |>
  go_figure() |>
  add_scatter(x = ~x, y = ~random_y, mode = "lines")
```

### Line Plots Mode

``` r

library(plotly.core)

trace_0 <- rnorm(100, mean = 5)
trace_1 <- rnorm(100, mean = 0)
trace_2 <- rnorm(100, mean = -5)
x <- c(1:100)

data <- data.frame(x, trace_0, trace_1, trace_2)

data |>
  go_figure() |>
  add_scatter(x = ~x, y = ~trace_0, name = "trace 0", mode = "lines") |>
  add_scatter(x = ~x, y = ~trace_1, name = "trace 1", mode = "lines+markers") |>
  add_scatter(x = ~x, y = ~trace_2, name = "trace 2", mode = "markers")
```

### Style Line Plots

``` r

library(plotly.core)

month <- c("January", "February", "March", "April", "May", "June", "July",
         "August", "September", "October", "November", "December")
high_2000 <- c(32.5, 37.6, 49.9, 53.0, 69.1, 75.4, 76.5, 76.6, 70.7, 60.6, 45.1, 29.3)
low_2000 <- c(13.8, 22.3, 32.5, 37.2, 49.9, 56.1, 57.7, 58.3, 51.2, 42.8, 31.6, 15.9)
high_2007 <- c(36.5, 26.6, 43.6, 52.3, 71.5, 81.4, 80.5, 82.2, 76.0, 67.3, 46.1, 35.0)
low_2007 <- c(23.6, 14.0, 27.0, 36.8, 47.6, 57.7, 58.9, 61.2, 53.3, 48.5, 31.0, 23.6)
high_2014 <- c(28.8, 28.5, 37.0, 56.8, 69.7, 79.7, 78.5, 77.8, 74.1, 62.6, 45.3, 39.9)
low_2014 <- c(12.7, 14.3, 18.6, 35.5, 49.9, 58.0, 60.0, 58.6, 51.7, 45.2, 32.2, 29.1)

data <- data.frame(month, high_2000, low_2000, high_2007, low_2007, high_2014, low_2014)

red <- "rgb(205, 12, 24)"
blue <- "rgb(22, 96, 167)"

data |>
  go_figure() |>
  add_scatter(
    x = ~month,
    y = ~high_2014,
    name = "High 2014",
    mode = "lines",
    line = go_scatter_line(color = red, width = 4)
  ) |>
  add_scatter(
    x = ~month,
    y = ~low_2014,
    name = "Low 2014",
    mode = "lines",
    line = go_scatter_line(color = blue, width = 4)
  ) |>
  add_scatter(
    x = ~month,
    y = ~high_2007,
    name = "High 2007",
    mode = "lines",
    line = go_scatter_line(color = red, width = 4, dash = "dash")
  ) |>
  add_scatter(
    x = ~month,
    y = ~low_2007,
    name = "Low 2007",
    mode = "lines",
    line = go_scatter_line(color = blue, width = 4, dash = "dash")
  ) |>
  add_scatter(
    x = ~month,
    y = ~high_2000,
    name = "High 2000",
    mode = "lines",
    line = go_scatter_line(color = red, width = 4, dash = "dot")
  ) |>
  add_scatter(
    x = ~month,
    y = ~low_2000,
    name = "Low 2000",
    mode = "lines",
    line = go_scatter_line(color = blue, width = 4, dash = "dot")
  ) |>
  update_layout(
    title = "Average High and Low Temperatures in New York",
    xaxis = go_xaxis(title = "Months"),
    yaxis = go_yaxis(title = "Temperature (degrees F)")
  )
```

Categories are drawn in the order they first appear in the data, so the
months keep their calendar order.

## Mapping data to linetype

One trace per supplement type, each with its own dash style.

``` r

library(plotly.core)
library(plyr)

tg <- ddply(ToothGrowth, c("supp", "dose"), summarise, length=mean(len))

dashes <- c(OJ = "solid", VC = "dot")

fig <- go_figure()
for (s in levels(tg$supp)) {
  fig <- fig |>
    add_scatter(
      data = tg[tg$supp == s, ],
      x = ~dose,
      y = ~length,
      mode = "lines",
      name = s,
      line = go_scatter_line(color = "black", dash = dashes[[s]])
    )
}
fig <- fig |>
  update_layout(
    title = "The Effect of Vitamin C on Tooth Growth in Guinea Pigs by Supplement Type",
    xaxis = go_xaxis(title = "Dose in milligrams/day"),
    yaxis = go_yaxis(title = "Tooth length")
  )

fig
```

### Connect Data Gaps

``` r

library(plotly.core)

x <- c(1:15)
y <- c(10, 20, NA, 15, 10, 5, 15, NA, 20, 10, 10, 15, 25, 20, 10)

data <- data.frame(x, y)

data |>
  go_figure() |>
  add_scatter(x = ~x, y = ~y, name = "Gaps", mode = "lines") |>
  add_scatter(
    x = ~x,
    y = ~y - 5,
    name = "<b>No</b> Gaps",
    mode = "lines",
    connectgaps = TRUE
  )
```

### Line Interpolation Options

``` r

library(plotly.core)

x <- c(1:5)
y <- c(1, 3, 2, 3, 1)

shapes <- c("linear", "spline", "vhv", "hvh", "vh", "hv")

fig <- go_figure()
for (i in seq_along(shapes)) {
  fig <- fig |>
    add_scatter(
      x = x,
      y = y + 5 * (i - 1),
      mode = "lines",
      name = shapes[[i]],
      line = go_scatter_line(shape = shapes[[i]])
    )
}

fig
```

### Label Lines with Annotations

``` r

library(plotly.core)

x <- c(2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2013)
y_television <- c(74, 82, 80, 74, 73, 72, 74, 70, 70, 66, 66, 69)
y_internet <- c(13, 14, 20, 24, 20, 24, 24, 40, 35, 41, 43, 50)
data <- data.frame(x, y_television, y_internet)

xaxis <- go_xaxis(
  title = "",
  showline = TRUE,
  showgrid = FALSE,
  showticklabels = TRUE,
  linecolor = "rgb(204, 204, 204)",
  linewidth = 2,
  tickmode = "linear",
  ticks = "outside",
  tickcolor = "rgb(204, 204, 204)",
  tickwidth = 2,
  ticklen = 5,
  tickfont = go_font(family = "Arial", size = 12, color = "rgb(82, 82, 82)")
)

yaxis <- go_yaxis(
  title = "",
  showgrid = FALSE,
  zeroline = FALSE,
  showline = FALSE,
  showticklabels = FALSE
)

margin <- go_margin(autoexpand = FALSE, l = 100, r = 100, t = 110)

# Build the annotations

label_font <- function(color) go_font(family = "Arial", size = 16, color = color)

television_1 <- go_annotation(
  xref = "paper",
  yref = "y",
  x = 0.05,
  y = y_television[1],
  xanchor = "right",
  yanchor = "middle",
  text = paste("Television ", y_television[1], "%"),
  font = label_font("rgba(67,67,67,1)"),
  showarrow = FALSE
)

internet_1 <- go_annotation(
  xref = "paper",
  yref = "y",
  x = 0.05,
  y = y_internet[1],
  xanchor = "right",
  yanchor = "middle",
  text = paste("Internet ", y_internet[1], "%"),
  font = label_font("rgba(49,130,189, 1)"),
  showarrow = FALSE
)

television_2 <- go_annotation(
  xref = "paper",
  x = 0.95,
  y = y_television[12],
  xanchor = "left",
  yanchor = "middle",
  text = paste("Television ", y_television[12], "%"),
  font = label_font("rgba(67,67,67,1)"),
  showarrow = FALSE
)

internet_2 <- go_annotation(
  xref = "paper",
  x = 0.95,
  y = y_internet[12],
  xanchor = "left",
  yanchor = "middle",
  text = paste("Internet ", y_internet[12], "%"),
  font = label_font("rgba(67,67,67,1)"),
  showarrow = FALSE
)

data |>
  go_figure() |>
  add_scatter(
    x = ~x,
    y = ~y_television,
    mode = "lines",
    line = go_scatter_line(color = "rgba(67,67,67,1)", width = 2)
  ) |>
  add_scatter(
    x = ~x,
    y = ~y_internet,
    mode = "lines",
    line = go_scatter_line(color = "rgba(49,130,189, 1)", width = 4)
  ) |>
  add_scatter(
    x = ~c(x[1], x[12]),
    y = ~c(y_television[1], y_television[12]),
    mode = "markers",
    marker = go_scatter_marker(color = "rgba(67,67,67,1)", size = 8)
  ) |>
  add_scatter(
    x = ~c(x[1], x[12]),
    y = ~c(y_internet[1], y_internet[12]),
    mode = "markers",
    marker = go_scatter_marker(color = "rgba(49,130,189, 1)", size = 12)
  ) |>
  update_layout(
    title = "Main Source for News",
    xaxis = xaxis,
    yaxis = yaxis,
    margin = margin,
    autosize = FALSE,
    showlegend = FALSE,
    annotations = list(television_1, internet_1, television_2, internet_2)
  )
```

### Filled Lines

``` r

library(plotly.core)

month <- c("January", "February", "March", "April", "May", "June", "July",
           "August", "September", "October", "November", "December")
high_2014 <- c(28.8, 28.5, 37.0, 56.8, 69.7, 79.7, 78.5, 77.8, 74.1, 62.6, 45.3, 39.9)
low_2014 <- c(12.7, 14.3, 18.6, 35.5, 49.9, 58.0, 60.0, 58.6, 51.7, 45.2, 32.2, 29.1)
data <- data.frame(month, high_2014, low_2014)
data$average_2014 <- rowMeans(data[,c("high_2014", "low_2014")])

data |>
  go_figure() |>
  add_scatter(
    x = ~month,
    y = ~high_2014,
    mode = "lines",
    line = go_scatter_line(color = "transparent"),
    showlegend = FALSE,
    name = "High 2014"
  ) |>
  add_scatter(
    x = ~month,
    y = ~low_2014,
    mode = "lines",
    fill = "tonexty",
    fillcolor = "rgba(0,100,80,0.2)",
    line = go_scatter_line(color = "transparent"),
    showlegend = FALSE,
    name = "Low 2014"
  ) |>
  add_scatter(
    x = ~month,
    y = ~average_2014,
    mode = "lines",
    line = go_scatter_line(color = "rgb(0,100,80)"),
    name = "Average"
  ) |>
  update_layout(
    title = "Average, High and Low Temperatures in New York",
    paper_bgcolor = "rgb(255,255,255)",
    plot_bgcolor = "rgb(229,229,229)",
    xaxis = go_xaxis(
      title = "Months",
      gridcolor = "rgb(255,255,255)",
      showgrid = TRUE,
      showline = FALSE,
      showticklabels = TRUE,
      tickcolor = "rgb(127,127,127)",
      ticks = "outside",
      zeroline = FALSE
    ),
    yaxis = go_yaxis(
      title = "Temperature (degrees F)",
      gridcolor = "rgb(255,255,255)",
      showgrid = TRUE,
      showline = FALSE,
      showticklabels = TRUE,
      tickcolor = "rgb(127,127,127)",
      ticks = "outside",
      zeroline = FALSE
    )
  )
```

See more examples of filled line charts
[here](https://msummersgill.github.io/plotly.R.core/articles/r-docs/filled-area-plots.md).

### Density Plot

``` r

library(plotly.core)

diamonds <- ggplot2::diamonds

dens <- with(diamonds, tapply(price, INDEX = cut, density))
df <- data.frame(
  x = unlist(lapply(dens, "[[", "x")),
  y = unlist(lapply(dens, "[[", "y")),
  cut = factor(rep(names(dens), each = length(dens[[1]]$x)), levels = names(dens))
)

df |>
  go_figure() |>
  add_scatter(x = ~x, y = ~y, mode = "lines", line = go_scatter_line(color = ~cut))
```

\#Reference

See
[`go_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md)
for more information and chart attribute options!
