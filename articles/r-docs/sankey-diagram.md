# Sankey Diagram

### Basic Sankey Diagram

``` r

library(plotly.core)

go_figure() |>
  add_sankey(
    orientation = "h",
    node = go_sankey_node(
      label = c("A1", "A2", "B1", "B2", "C1", "C2"),
      color = c("blue", "blue", "blue", "blue", "blue", "blue"),
      pad = 15,
      thickness = 20,
      line = go_sankey_node_line(
        color = "black",
        width = 0.5
      )
    ),
    link = go_sankey_link(
      source = c(0, 1, 0, 2, 3, 3),
      target = c(2, 3, 3, 4, 4, 5),
      value = c(8, 4, 2, 8, 4, 2)
    )
  ) |>
  update_layout(
    title = "Basic Sankey Diagram",
    font = go_font(size = 10)
  )
```

### Create Canvas

``` r

library(plotly.core)

fig <- go_figure() |>
  add_sankey(
    domain = go_domain(x = c(0, 1), y = c(0, 1)),
    orientation = "h",
    valueformat = ".0f",
    valuesuffix = "TWh"
  ) |>
  update_layout(
    title = "Energy forecast for 2050, UK - Department of Energy & Climate Change",
    font = go_font(size = 10),
    xaxis = go_xaxis(showgrid = FALSE, zeroline = FALSE),
    yaxis = go_yaxis(showgrid = FALSE, zeroline = FALSE)
  )
```

### Add Nodes

``` r

library(plotly.core)
library(jsonlite)

json_file <- "https://raw.githubusercontent.com/plotly/plotly.js/master/test/image/mocks/sankey_energy.json"
json_data <- fromJSON(json_file, simplifyVector = FALSE)
sankey <- json_data$data[[1]]

fig <- go_figure() |>
  add_sankey(
    domain = go_domain(x = c(0, 1), y = c(0, 1)),
    orientation = "h",
    valueformat = ".0f",
    valuesuffix = "TWh",
    node = go_sankey_node(
      label = unlist(sankey$node$label),
      color = unlist(sankey$node$color),
      pad = 15,
      thickness = 15,
      line = go_sankey_node_line(
        color = "black",
        width = 0.5
      )
    )
  ) |>
  update_layout(
    title = "Energy forecast for 2050, UK - Department of Energy & Climate Change",
    font = go_font(size = 10),
    xaxis = go_xaxis(showgrid = FALSE, zeroline = FALSE),
    yaxis = go_yaxis(showgrid = FALSE, zeroline = FALSE)
  )
```

### Add Links

``` r

library(plotly.core)
library(jsonlite)

json_file <- "https://raw.githubusercontent.com/plotly/plotly.js/master/test/image/mocks/sankey_energy.json"
json_data <- fromJSON(json_file, simplifyVector = FALSE)
sankey <- json_data$data[[1]]

go_figure() |>
  add_sankey(
    domain = go_domain(x = c(0, 1), y = c(0, 1)),
    orientation = "h",
    valueformat = ".0f",
    valuesuffix = "TWh",
    node = go_sankey_node(
      label = unlist(sankey$node$label),
      color = unlist(sankey$node$color),
      pad = 15,
      thickness = 15,
      line = go_sankey_node_line(
        color = "black",
        width = 0.5
      )
    ),
    link = go_sankey_link(
      source = unlist(sankey$link$source),
      target = unlist(sankey$link$target),
      value = unlist(sankey$link$value),
      label = unlist(sankey$link$label)
    )
  ) |>
  update_layout(
    title = "Energy forecast for 2050<br>Source: Department of Energy & Climate Change, Tom Counsell via <a href='https://bost.ocks.org/mike/sankey/'>Mike Bostock</a>",
    font = go_font(size = 10),
    xaxis = go_xaxis(showgrid = FALSE, zeroline = FALSE),
    yaxis = go_yaxis(showgrid = FALSE, zeroline = FALSE)
  )
```

### Style Sankey Diagram

``` r

library(plotly.core)
library(jsonlite)

json_file <- "https://raw.githubusercontent.com/plotly/plotly.js/master/test/image/mocks/sankey_energy_dark.json"
json_data <- fromJSON(json_file, simplifyVector = FALSE)
sankey <- json_data$data[[1]]

go_figure() |>
  add_sankey(
    domain = go_domain(x = c(0, 1), y = c(0, 1)),
    orientation = "h",
    valueformat = ".0f",
    valuesuffix = "TWh",
    node = go_sankey_node(
      label = unlist(sankey$node$label),
      color = unlist(sankey$node$color),
      pad = 15,
      thickness = 15,
      line = go_sankey_node_line(
        color = "black",
        width = 0.5
      )
    ),
    link = go_sankey_link(
      source = unlist(sankey$link$source),
      target = unlist(sankey$link$target),
      value = unlist(sankey$link$value),
      label = unlist(sankey$link$label)
    )
  ) |>
  update_layout(
    title = "Energy forecast for 2050<br>Source: Department of Energy & Climate Change, Tom Counsell via <a href='https://bost.ocks.org/mike/sankey/'>Mike Bostock</a>",
    font = go_font(size = 10, color = "white"),
    xaxis = go_xaxis(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
    yaxis = go_yaxis(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
    plot_bgcolor = "black",
    paper_bgcolor = "black"
  )
```

### Define Node Position

The following example sets the `x` and `y` of
[`go_sankey_node()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey_node.md)
to place nodes in the specified locations, except in the
`snap arrangement` (default behaviour when `node.x` and `node.y` are not
defined) to avoid overlapping of the nodes, therefore, an automatic
snapping of elements will be set to define the padding between nodes via
the node’s `pad`. The other possible arrangements are: 1) perpendicular
2) freeform 3) fixed

``` r

library(plotly.core)

go_figure() |>
  add_sankey(
    arrangement = "snap",
    node = go_sankey_node(
      label = c("A", "B", "C", "D", "E", "F"),
      x = c(0.2, 0.1, 0.5, 0.7, 0.3, 0.5),
      y = c(0.7, 0.5, 0.2, 0.4, 0.2, 0.3),
      pad = 10 # 10 Pixel
    ),
    link = go_sankey_link(
      source = c(0, 0, 1, 2, 5, 4, 3, 5),
      target = c(5, 3, 4, 3, 0, 2, 2, 3),
      value = c(1, 2, 1, 1, 1, 1, 1, 2)
    )
  ) |>
  update_layout(title = "Sankey with manually positioned node")
```

### Reference

See
[`go_sankey()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey.md)
for more information and options!
