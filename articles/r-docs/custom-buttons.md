# Buttons

### Methods

The `method` of a
[`go_updatemenu_button()`](https://msummersgill.github.io/plotly.R.core/reference/go_updatemenu_button.md)
determines which
[plotly.js](https://plotly.com/javascript/plotlyjs-function-reference/)
function will be used to modify the chart. There are 4 possible methods:

- `"restyle"`: modify data or data attributes
- `"relayout"`: modify layout attributes
- `"update"`: modify data **and** layout attributes
- `"animate"`: start or pause an animation (see
  [Animations](https://msummersgill.github.io/plotly.R.core/articles/r-docs/animations.md))

### Restyle Buttons

The `"restyle"` method should be used when modifying the data and data
attributes of the graph  
**Update One Data Attribute** This example demostrates how to update a
single data attribute: line `color` with the `"restyle"` method.

``` r

library(plotly.core)

x <- seq(-2 * pi, 2 * pi, length.out = 1000)
df <- data.frame(x, y1 = sin(x))

fig <- df |>
  go_figure() |>
  add_scatter(x = ~x, y = ~y1, mode = "lines") |>
  update_layout(
    title = "Button Restyle",
    xaxis = go_xaxis(domain = c(0.1, 1)),
    yaxis = go_yaxis(title = "y"),
    updatemenus = list(
      go_updatemenu(
        type = "buttons",
        y = 0.8,
        buttons = list(
          go_updatemenu_button(
            method = "restyle",
            args = list("line.color", "blue"),
            label = "Blue"
          ),
          go_updatemenu_button(
            method = "restyle",
            args = list("line.color", "red"),
            label = "Red"
          )
        )
      )
    )
  )

fig
```

**Update Several Data Attributes** This example demostrates how to
update several data attributes: colorscale, chart `type`, and
`colorscale` with the “restyle” method.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_heatmap(z = volcano, colorscale = "Rainbow")

restyle_button <- function(attr, value, label) {
  go_updatemenu_button(method = "restyle", args = list(attr, value), label = label)
}

# chart option buttons
chart_types <- go_updatemenu(
  type = "buttons",
  direction = "right",
  xanchor = "center",
  yanchor = "top",
  pad = go_updatemenu_pad(r = 0, t = 10, b = 10),
  x = 0.5,
  y = 1.27,
  buttons = list(
    restyle_button("type", "heatmap", "Heatmap"),
    restyle_button("type", "contour", "Contour"),
    restyle_button("type", "surface", "Surface")
  )
)

# color option buttons
color_types <- go_updatemenu(
  type = "buttons",
  direction = "right",
  xanchor = "center",
  yanchor = "top",
  pad = go_updatemenu_pad(r = 0, t = 10, b = 10),
  x = 0.5,
  y = 1.17,
  buttons = list(
    restyle_button("colorscale", "Rainbow", "Rainbow"),
    restyle_button("colorscale", "Jet", "Jet"),
    restyle_button("colorscale", "Earth", "Earth"),
    restyle_button("colorscale", "Electric", "Electric")
  )
)

annot <- list(
  go_annotation(
    text = "Chart<br>Type",
    x = 0.2,
    y = 1.25,
    xref = "paper",
    yref = "paper",
    showarrow = FALSE
  ),
  go_annotation(
    text = "Color<br>Type",
    x = 0.2,
    y = 1.15,
    xref = "paper",
    yref = "paper",
    showarrow = FALSE
  )
)

# plot
fig <- fig |>
  update_layout(
    xaxis = go_xaxis(domain = c(0.1, 1)),
    yaxis = go_yaxis(title = "y"),
    updatemenus = list(chart_types, color_types),
    annotations = annot
  )

fig
```

### Relayout Button

The `"relayout"` method should be used when modiying the layout
attributes of the graph.  
**Update One Layout Attribute** This example demostrated how to update a
layout attribute: `shapes` with the `"relayout"` method.

``` r

library(plotly.core)

x0 <- rnorm(400, mean = 2, sd = 0.4)
y0 <- rnorm(400, mean = 2, sd = 0.4)
x1 <- rnorm(400, mean = 3, sd = 0.6)
y1 <- rnorm(400, mean = 6, sd = 0.4)
x2 <- rnorm(400, mean = 4, sd = 0.2)
y2 <- rnorm(400, mean = 4, sd = 0.4)

# shapes components
cluster_shape <- function(x, y, color) {
  go_shape(
    type = "circle",
    xref = "x",
    yref = "y",
    x0 = min(x),
    y0 = min(y),
    x1 = max(x),
    y1 = max(y),
    opacity = 0.25,
    line = go_shape_line(color = color),
    fillcolor = color
  )
}
cluster0 <- cluster_shape(x0, y0, "#835AF1")
cluster1 <- cluster_shape(x1, y1, "#7FA6EE")
cluster2 <- cluster_shape(x2, y2, "#B8F7D4")

shapes_button <- function(label, shapes) {
  go_updatemenu_button(
    label = label,
    method = "relayout",
    args = list(list(shapes = shapes))
  )
}

# updatemenus component
updatemenus <- list(
  go_updatemenu(
    active = -1,
    type = "buttons",
    buttons = list(
      shapes_button("None", list()),
      shapes_button("Cluster 0", list(cluster0)),
      shapes_button("Cluster 1", list(cluster1)),
      shapes_button("Cluster 2", list(cluster2)),
      shapes_button("All", list(cluster0, cluster1, cluster2))
    )
  )
)

fig <- go_figure() |>
  add_scatter(
    x = x0,
    y = y0,
    mode = "markers",
    marker = go_scatter_marker(color = "#835AF1")
  ) |>
  add_scatter(
    x = x1,
    y = y1,
    mode = "markers",
    marker = go_scatter_marker(color = "#7FA6EE")
  ) |>
  add_scatter(
    x = x2,
    y = y2,
    mode = "markers",
    marker = go_scatter_marker(color = "#B8F7D4")
  ) |>
  update_layout(
    title = "Highlight Clusters",
    showlegend = FALSE,
    updatemenus = updatemenus
  )

fig
```

### Update Button

The `"update"` method should be used when modifying the data and layout
sections of the graph. This example demostrates how to update which
traces are diplayed while simultaneously updating layout attributes such
as the chart title and annotations.

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/finance-charts-apple.csv")
df$Date <- as.Date(df$Date)

high_annotations <- go_annotation(
  x = df$Date[df$AAPL.High == max(df$AAPL.High)][[1]],
  y = max(df$AAPL.High),
  xref = "x",
  yref = "y",
  text = paste0("High: $", max(df$AAPL.High)),
  ax = 0,
  ay = -40
)

low_annotations <- go_annotation(
  x = df$Date[df$AAPL.Low == min(df$AAPL.Low)][[1]],
  y = min(df$AAPL.Low),
  xref = "x",
  yref = "y",
  text = paste0("Low: $", min(df$AAPL.Low)),
  ax = 0,
  ay = 40
)

update_button <- function(label, visible, title, annotations) {
  go_updatemenu_button(
    label = label,
    method = "update",
    args = list(
      list(visible = visible),
      list(title = title, annotations = annotations)
    )
  )
}

# updatemenus component
updatemenus <- list(
  go_updatemenu(
    active = -1,
    type = "buttons",
    buttons = list(
      update_button("High", c(FALSE, TRUE), "Apple High", list(high_annotations)),
      update_button("Low", c(TRUE, FALSE), "Apple Low", list(low_annotations)),
      update_button(
        "Both",
        c(TRUE, TRUE),
        "Apple",
        list(low_annotations, high_annotations)
      ),
      update_button("Reset", c(TRUE, TRUE), "Apple", list())
    )
  )
)

fig <- df |>
  go_figure() |>
  add_scatter(
    x = ~Date,
    y = ~AAPL.High,
    name = "High",
    mode = "lines",
    line = go_scatter_line(color = "#33CFA5")
  ) |>
  add_scatter(
    x = ~Date,
    y = ~AAPL.Low,
    name = "Low",
    mode = "lines",
    line = go_scatter_line(color = "#F06A6A")
  ) |>
  update_layout(
    title = "Apple",
    showlegend = FALSE,
    xaxis = go_xaxis(title = "Date"),
    yaxis = go_yaxis(title = "Price ($)"),
    updatemenus = updatemenus
  )

fig
```

### Animate Button

See
[Animations](https://msummersgill.github.io/plotly.R.core/articles/r-docs/animations.md)
for figures with play and pause buttons.

### Style Buttons

When adding buttons to Plotly charts, users have the option of styling
the color, font, padding, and position of the buttons. The example below
demostrates hot to apply different styling options. See all updatemenus
styling attributes in
[`go_updatemenu()`](https://msummersgill.github.io/plotly.R.core/reference/go_updatemenu.md).

#### Tile Maps

Tile maps
([`add_scattermap()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattermap.md)
and
[`go_map()`](https://msummersgill.github.io/plotly.R.core/reference/go_map.md))
are drawn with MapLibre and need no access token. See our [Map
Layers](https://msummersgill.github.io/plotly.R.core/articles/r-docs/mapbox-layers.md)
documentation for more information.

``` r

library(plotly.core)

# read in wind turbines data
df_wind <- read.csv("https://raw.githubusercontent.com/plotly/plotly.r-docs/master/r/data/2805.csv")

# subset and clean data
df_sub <- subset(df_wind, manufac != "unknown", select = c(lat_DD, long_DD, manufac))

# the largest wind farms (by number of turbines), at their median location
df_farms <- subset(df_wind, !grepl("^unknown", site_name))
df_farms <- aggregate(
  cbind(Latitude = lat_DD, Longitude = long_DD) ~ site_name,
  data = df_farms,
  FUN = median
)
turbines <- table(df_wind$site_name)
df_farms$turbines <- as.vector(turbines[df_farms$site_name])
df_farms <- df_farms[order(-df_farms$turbines), ]
df_farms$Wind.Farm <- df_farms$site_name
rm(df_wind)


# location buttons
usa <- go_updatemenu_button(
  method = "relayout",
  args = list(list(
    map.center.lat = median(df_sub$lat_DD),
    map.center.lon = median(df_sub$long_DD),
    map.zoom = 3
  )),
  label = "USA"
)

buttons <- function(i) {
  go_updatemenu_button(
    method = "relayout",
    args = list(list(
      map.center.lat = df_farms$Latitude[i],
      map.center.lon = df_farms$Longitude[i],
      map.zoom = 9
    )),
    label = df_farms$Wind.Farm[i]
  )
}

# map style buttons
style_button <- function(style, label) {
  go_updatemenu_button(
    method = "relayout",
    args = list(list(map.style = style)),
    label = label
  )
}
basic <- style_button("open-street-map", "Basic")
dark <- style_button("carto-darkmatter", "Dark")
satellite <- style_button("satellite", "Satellite")

# plot one scattermap trace per manufacturer, with buttons
fig <- go_figure()
for (m in unique(df_sub$manufac)) {
  fig <- fig |>
    add_scattermap(
      data = df_sub[df_sub$manufac == m, ],
      lat = ~lat_DD,
      lon = ~long_DD,
      mode = "markers",
      marker = go_scattermap_marker(size = 3),
      name = m
    )
}

fig <- fig |>
  add_annotation(
    x = 0.05,
    y = 0.05,
    text = "All US wind turbines (scroll to zoom)",
    xref = "paper",
    yref = "paper",
    showarrow = FALSE,
    font = go_font(color = "magenta", size = 14)
  ) |>
  update_layout(
    plot_bgcolor = "black",
    paper_bgcolor = "black",
    map = go_map(
      center = go_map_center(
        lat = median(df_sub$lat_DD),
        lon = median(df_sub$long_DD)
      ),
      zoom = 3,
      style = "carto-darkmatter"
    ),
    updatemenus = list(
      go_updatemenu(
        type = "buttons",
        direction = "right",
        xanchor = "center",
        yanchor = "top",
        pad = go_updatemenu_pad(r = 0, t = 10, b = 10),
        x = 0.5,
        y = 1,
        showactive = FALSE,
        buttons = list(usa, buttons(1), buttons(2), buttons(3), buttons(4))
      ),
      go_updatemenu(
        type = "buttons",
        direction = "right",
        xanchor = "center",
        yanchor = "top",
        pad = go_updatemenu_pad(r = 0, t = 10, b = 10),
        x = 0.5,
        y = 0.935,
        showactive = FALSE,
        buttons = list(buttons(6), buttons(7), buttons(8), buttons(9))
      ),
      go_updatemenu(
        type = "buttons",
        direction = "right",
        yanchor = "bottom",
        x = 1,
        y = 0,
        buttons = list(dark, basic, satellite)
      )
    )
  )

fig
```

\#Reference

See
[`go_updatemenu()`](https://msummersgill.github.io/plotly.R.core/reference/go_updatemenu.md)
for more information and options!
