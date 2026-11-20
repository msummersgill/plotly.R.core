# Funnel Charts

### Introduction

Funnel charts are often used to represent data in different stages of a
business process. It’s an important mechanism in Business Intelligence
to identify potential problem areas of a process. For example, it’s used
to observe the revenue or loss in a sales process for each stage, and
displays values that are decreasing progressively. Each stage is
illustrated as a percentage of the total of all values.

### Basic Funnel Plot

``` r

library(plotly.core)

stages <- c("Website visit", "Downloads", "Potential customers", "Requested price", "invoice sent")

go_figure() |>
  add_funnel(y = stages, x = c(39, 27.4, 20.6, 11, 2)) |>
  update_layout(yaxis = go_yaxis(categoryarray = stages))
```

### Setting Marker Size and Color

This example uses `textposition` and `textinfo` (see
[`go_funnel()`](https://msummersgill.github.io/plotly.R.core/reference/go_funnel.md))
to determine information apears on the graph, and shows how to customize
the bars.

``` r

library(plotly.core)

stages <- c("Website visit", "Downloads", "Potential customers", "Requested price", "Finalized")

go_figure() |>
  add_funnel(
    y = stages,
    x = c(39, 27.4, 20.6, 11, 2),
    textposition = "inside",
    textinfo = "value+percent initial",
    opacity = 0.65,
    marker = go_funnel_marker(
      color = c("deepskyblue", "lightsalmon", "tan", "teal", "silver"),
      line = go_funnel_marker_line(
        width = c(4, 2, 2, 3, 1, 1),
        color = c("wheat", "wheat", "blue", "wheat", "wheat")
      )
    ),
    connector = go_funnel_connector(
      line = go_funnel_connector_line(color = "royalblue", dash = "dot", width = 3)
    )
  ) |>
  update_layout(yaxis = go_yaxis(categoryarray = stages))
```

### Stacked Funnel Plot

``` r

library(plotly.core)

go_figure() |>
  add_funnel(
    name = "Montreal",
    y = c("Website visit", "Downloads", "Potential customers", "Requested price"),
    x = c(120, 60, 30, 20),
    textinfo = "value+percent initial"
  ) |>
  add_funnel(
    name = "Toronto",
    orientation = "h",
    y = c("Website visit", "Downloads", "Potential customers", "Requested price", "invoice sent"),
    x = c(100, 60, 40, 30, 20),
    textposition = "inside",
    textinfo = "value+percent previous"
  ) |>
  add_funnel(
    name = "Vancouver",
    orientation = "h",
    y = c("Website visit", "Downloads", "Potential customers", "Requested price", "invoice sent", "Finalized"),
    x = c(90, 70, 50, 30, 10, 5),
    textposition = "outside",
    textinfo = "value+percent total"
  ) |>
  update_layout(
    yaxis = go_yaxis(
      categoryarray = c("Website visit", "Downloads", "Potential customers", "Requested price", "invoice sent", "Finalized")
    )
  )
```

### Basic Area Funnel Plot

``` r

library(plotly.core)

go_figure() |>
  add_funnelarea(
    text = c("The 1st", "The 2nd", "The 3rd", "The 4th", "The 5th"),
    values = c(5, 4, 3, 2, 1)
  )
```

### Set Marker Size and Color in Area Funnel Plots

``` r

library(plotly.core)

go_figure() |>
  add_funnelarea(
    values = c(5, 4, 3, 2, 1),
    text = c("The 1st", "The 2nd", "The 3rd", "The 4th", "The 5th"),
    marker = go_funnelarea_marker(
      colors = c("deepskyblue", "lightsalmon", "tan", "teal", "silver"),
      line = go_funnelarea_marker_line(
        color = c("wheat", "wheat", "blue", "wheat", "wheat"),
        width = c(0, 1, 5, 0, 4)
      )
    ),
    textfont = go_font(family = "Old Standard TT, serif", size = 13, color = "black"),
    opacity = 0.65
  )
```

### Multiple Area Funnels

``` r

library(plotly.core)

go_figure() |>
  add_funnelarea(
    scalegroup = "first",
    values = c(500, 450, 340, 230, 220, 110),
    textinfo = "value",
    title = go_funnelarea_title(position = "top center", text = "Sales for Sale Person A in U.S."),
    domain = go_domain(x = c(0.01, 0.48), y = c(0, 0.5))
  ) |>
  add_funnelarea(
    scalegroup = "first",
    values = c(600, 500, 400, 300, 200, 100),
    textinfo = "value",
    title = go_funnelarea_title(position = "top center", text = "Sales of Sale Person B in Canada"),
    domain = go_domain(x = c(0.01, 0.48), y = c(0.56, 1))
  ) |>
  add_funnelarea(
    scalegroup = "second",
    values = c(510, 480, 440, 330, 220, 100),
    textinfo = "value",
    title = go_funnelarea_title(position = "top left", text = "Sales of Sale Person A in Canada"),
    domain = go_domain(x = c(0.56, 0.98), y = c(0, 0.5))
  ) |>
  add_funnelarea(
    scalegroup = "second",
    values = c(360, 250, 240, 130, 120, 60),
    textinfo = "value",
    title = go_funnelarea_title(position = "top left", text = "Sales of Sale Person B in U.S."),
    domain = go_domain(x = c(0.56, 0.98), y = c(0.56, 1))
  ) |>
  update_layout(
    margin = go_margin(l = 200, r = 200),
    shapes = list(
      go_shape(x0 = 0, x1 = 0.5, y0 = 0, y1 = 0.5),
      go_shape(x0 = 0, x1 = 0.5, y0 = 0.55, y1 = 1),
      go_shape(x0 = 0.55, x1 = 1, y0 = 0, y1 = 0.5),
      go_shape(x0 = 0.55, x1 = 1, y0 = 0.55, y1 = 1)
    )
  )
```

\#Reference

See
[`go_funnel()`](https://msummersgill.github.io/plotly.R.core/reference/go_funnel.md)
and
[`go_funnelarea()`](https://msummersgill.github.io/plotly.R.core/reference/go_funnelarea.md)
for more information and chart attribute options!
