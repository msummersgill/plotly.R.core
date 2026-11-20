# 3D Line Plots

### Basic 3D Line Plot

``` r

library(plotly.core)

data <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/3d-line1.csv")
data$color <- as.factor(data$color)

fig <- data |>
  go_figure() |>
  add_scatter3d(
    x = ~x,
    y = ~y,
    z = ~z,
    mode = "lines",
    opacity = 1,
    line = go_scatter3d_line(
      width = 6,
      color = ~as.integer(color),
      reversescale = FALSE
    )
  )

fig
```

### 3D Line and Markers Plot

``` r

library(plotly.core)

x <- c()
y <- c()
z <- c()
c <- c()

for (i in 1:62) {
  r <- 20 * cos(i / 20)
  x <- c(x, r * cos(i))
  y <- c(y, r * sin(i))
  z <- c(z, i)
  c <- c(c, i)
}

data <- data.frame(x, y, z, c)

fig <- data |>
  go_figure() |>
  add_scatter3d(
    x = ~x,
    y = ~y,
    z = ~z,
    mode = "lines+markers",
    line = go_scatter3d_line(width = 6, color = ~c, colorscale = "Viridis"),
    marker = go_scatter3d_marker(
      size = 3.5,
      color = ~c,
      colorscale = "Greens",
      cmin = -20,
      cmax = 50
    )
  )

fig
```

### Custom Color Scale

``` r

library(plotly.core)

count <- 3000

x <- c()
y <- c()
z <- c()
c <- c()

for (i in 1:count) {
  r <- i * (count - i)
  x <- c(x, r * cos(i / 30))
  y <- c(y, r * sin(i / 30))
  z <- c(z, i)
  c <- c(c, i)
}

data <- data.frame(x, y, z, c)

fig <- data |>
  go_figure() |>
  add_scatter3d(
    x = ~x,
    y = ~y,
    z = ~z,
    mode = "lines",
    line = go_scatter3d_line(
      width = 4,
      color = ~c,
      colorscale = list(c(0, "#BA52ED"), c(1, "#FCB040"))
    )
  )

fig
```

### 3D Random Walk Plot

``` r

library(plotly.core)

data <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/_3d-line-plot.csv")

fig <- data |>
  go_figure() |>
  add_scatter3d(
    x = ~x1,
    y = ~y1,
    z = ~z1,
    mode = "lines",
    line = go_scatter3d_line(color = "#1f77b4", width = 1)
  ) |>
  add_scatter3d(
    x = ~x2,
    y = ~y2,
    z = ~z2,
    mode = "lines",
    line = go_scatter3d_line(color = "rgb(44, 160, 44)", width = 1)
  ) |>
  add_scatter3d(
    x = ~x3,
    y = ~y3,
    z = ~z3,
    mode = "lines",
    line = go_scatter3d_line(color = "#bcbd22", width = 1)
  )

fig
```

### 3D Density Plot

``` r

library(plotly.core)

diamonds <- ggplot2::diamonds
dens <- with(diamonds, tapply(price, INDEX = cut, density))
data <- data.frame(
  x = unlist(lapply(dens, "[[", "x")),
  y = unlist(lapply(dens, "[[", "y")),
  cut = rep(names(dens), each = length(dens[[1]]$x))
)

fig <- go_figure()
for (g in names(dens)) {
  fig <- fig |>
    add_scatter3d(
      data = data[data$cut == g, ],
      x = ~x,
      y = ~y,
      z = ~cut,
      mode = "lines",
      name = g
    )
}

fig
```

\#Reference

See
[`go_scatter3d()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter3d.md)
for more information and chart attribute options!
