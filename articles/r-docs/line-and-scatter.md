# Scatter and Line Plots

### Basic Scatter Plot

``` r

library(plotly.core)

fig <- iris |>
  go_figure() |>
  add_scatter(x = ~Sepal.Length, y = ~Petal.Length, mode = "markers")

fig
```

### Styled Scatter Plot

``` r

library(plotly.core)

fig <- iris |>
  go_figure() |>
  add_scatter(
    x = ~Sepal.Length,
    y = ~Petal.Length,
    mode = "markers",
    marker = go_scatter_marker(
      size = 10,
      color = "rgba(255, 182, 193, .9)",
      line = go_scatter_marker_line(color = "rgba(152, 0, 0, .8)", width = 2)
    )
  ) |>
  update_layout(
    title = "Styled Scatter",
    yaxis = go_yaxis(zeroline = FALSE),
    xaxis = go_xaxis(zeroline = FALSE)
  )

fig
```

### Plotting Markers and Lines

``` r

library(plotly.core)

trace_0 <- rnorm(100, mean = 5)
trace_1 <- rnorm(100, mean = 0)
trace_2 <- rnorm(100, mean = -5)
x <- c(1:100)

data <- data.frame(x, trace_0, trace_1, trace_2)

fig <- data |>
  go_figure() |>
  add_scatter(x = ~x, y = ~trace_0, name = "trace 0", mode = "lines") |>
  add_scatter(x = ~x, y = ~trace_1, name = "trace 1", mode = "lines+markers") |>
  add_scatter(x = ~x, y = ~trace_2, name = "trace 2", mode = "markers")

fig
```

Each
[`add_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md)
call adds one trace; `mode` decides whether it is drawn with lines,
markers, or both.

See more examples of line charts
[here](https://msummersgill.github.io/plotly.R.core/articles/r-docs/line-charts.md).

### Qualitative Colorscales

One trace per species gives each species its own color (from the default
colorway) and legend entry.

``` r

library(plotly.core)

fig <- go_figure()
for (sp in levels(iris$Species)) {
  fig <- fig |>
    add_scatter(
      data = iris[iris$Species == sp, ],
      x = ~Sepal.Length,
      y = ~Petal.Length,
      mode = "markers",
      name = sp
    )
}

fig
```

### ColorBrewer Palette Names

``` r

library(plotly.core)

pal <- RColorBrewer::brewer.pal(3, "Set1")

fig <- go_figure()
for (sp in levels(iris$Species)) {
  fig <- fig |>
    add_scatter(
      data = iris[iris$Species == sp, ],
      x = ~Sepal.Length,
      y = ~Petal.Length,
      mode = "markers",
      name = sp
    )
}
fig <- fig |>
  update_layout(colorway = pal)

fig
```

### Custom Color Scales

A character vector of any valid CSS color code(s) can be used as the
figure’s `colorway`.

``` r

library(plotly.core)

pal <- c("red", "blue", "green")

fig <- go_figure()
for (sp in levels(iris$Species)) {
  fig <- fig |>
    add_scatter(
      data = iris[iris$Species == sp, ],
      x = ~Sepal.Length,
      y = ~Petal.Length,
      mode = "markers",
      name = sp
    )
}
fig <- fig |>
  update_layout(colorway = pal)

fig
```

To ensure a particular data value gets mapped to particular color, use a
named character vector of color codes and look the color up for each
trace.

``` r

library(plotly.core)

pal <- c("red", "blue", "green")
pal <- setNames(pal, c("virginica", "setosa", "versicolor"))

fig <- go_figure()
for (sp in levels(iris$Species)) {
  fig <- fig |>
    add_scatter(
      data = iris[iris$Species == sp, ],
      x = ~Sepal.Length,
      y = ~Petal.Length,
      mode = "markers",
      name = sp,
      marker = go_scatter_marker(color = pal[[sp]])
    )
}

fig
```

### Mapping Data to Symbols

``` r

library(plotly.core)

symbols <- setNames(c("circle", "x", "circle-open"), levels(iris$Species))

fig <- go_figure()
for (sp in levels(iris$Species)) {
  fig <- fig |>
    add_scatter(
      data = iris[iris$Species == sp, ],
      x = ~Sepal.Length,
      y = ~Petal.Length,
      mode = "markers",
      name = sp,
      marker = go_scatter_marker(symbol = symbols[[sp]], color = "black", size = 10)
    )
}

fig
```

### Adding Color and Size Mapping

``` r

library(plotly.core)

d <- ggplot2::diamonds[sample(nrow(ggplot2::diamonds), 1000), ]

fig <- d |>
  go_figure() |>
  add_scatter(
    x = ~carat,
    y = ~price,
    mode = "markers",
    marker = go_scatter_marker(
      color = ~carat,
      colorscale = "Viridis",
      showscale = TRUE,
      size = ~carat,
      sizemode = "area",
      sizeref = 2 * max(d$carat) / 40^2,
      sizemin = 2
    )
  )

fig
```

### Data Labels on Hover

``` r

library(plotly.core)

d <- ggplot2::diamonds[sample(nrow(ggplot2::diamonds), 1000), ]

fig <- d |>
  go_figure() |>
  add_scatter(
    x = ~carat,
    y = ~price,
    mode = "markers",
    # Hover text:
    text = ~paste("Price: ", price, "$<br>Cut:", cut),
    marker = go_scatter_marker(
      color = ~carat,
      colorscale = "Viridis",
      showscale = TRUE,
      size = ~carat,
      sizemode = "area",
      sizeref = 2 * max(d$carat) / 40^2,
      sizemin = 2
    )
  )

fig
```

\#Reference

See
[`go_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md)
for more information and chart attribute options!
