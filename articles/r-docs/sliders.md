# Sliders

### Basic Slider Control

``` r

library(plotly.core)

df <- data.frame(
  x = c("1", "2", "3", "4", "5"),
  y = c("1", "1", "1", "1", "1")
)

# create steps for slider
steps <- list(
  go_slider_step(
    args = list("marker.color", "red"),
    label = "Red",
    method = "restyle",
    value = "1"
  ),
  go_slider_step(
    args = list("marker.color", "green"),
    label = "Green",
    method = "restyle",
    value = "2"
  ),
  go_slider_step(
    args = list("marker.color", "blue"),
    label = "Blue",
    method = "restyle",
    value = "3"
  )
)

fig <- df |>
  go_figure() |>
  add_scatter(
    x = ~x,
    y = ~y,
    mode = "markers",
    marker = go_scatter_marker(size = 20, color = "green")
  ) |>
  update_layout(
    title = "Basic Slider",
    sliders = list(
      go_slider(
        active = 1,
        currentvalue = go_slider_currentvalue(prefix = "Color: "),
        pad = go_slider_pad(t = 60),
        steps = steps
      )
    )
  )

fig
```

### Sine Wave Slider

``` r

library(plotly.core)

x <- seq(0, 10, length.out = 1000)

# create data
aval <- list()
for (step in 1:11) {
  aval[[step]] <- list(
    visible = FALSE,
    name = paste0("v = ", step),
    x = x,
    y = sin(step * x)
  )
}
aval[[3]]$visible <- TRUE

# create steps and plot all traces
steps <- list()
fig <- go_figure()
for (i in 1:11) {
  fig <- fig |>
    add_scatter(
      x = aval[[i]]$x,
      y = aval[[i]]$y,
      visible = aval[[i]]$visible,
      name = aval[[i]]$name,
      mode = "lines",
      hoverinfo = "name",
      line = go_scatter_line(color = "#00CED1"),
      showlegend = FALSE
    )

  visible <- rep(FALSE, length(aval))
  visible[i] <- TRUE
  steps[[i]] <- go_slider_step(args = list("visible", visible), method = "restyle")
}

# add slider control to plot
fig <- fig |>
  update_layout(
    sliders = list(
      go_slider(
        active = 3,
        currentvalue = go_slider_currentvalue(prefix = "Frequency: "),
        steps = steps
      )
    )
  )

fig
```

### Mulitple Slider Controls

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/globe_contours.csv")
df$id <- seq_len(nrow(df))

library(tidyr)
d <- df %>%
  gather(key, value, -id) %>%
  separate(key, c("l", "line"), "\\.") %>%
  spread(l, value)

geo <- go_geo(
  showland = TRUE,
  showlakes = TRUE,
  showcountries = TRUE,
  showocean = TRUE,
  countrywidth = 0.5,
  landcolor = "rgb(230, 145, 56)",
  lakecolor = "rgb(0, 255, 255)",
  oceancolor = "rgb(0, 255, 255)",
  projection = go_geo_projection(
    type = "orthographic",
    rotation = go_geo_projection_rotation(lon = -100, lat = 40, roll = 0)
  ),
  lonaxis = go_geo_lonaxis(
    showgrid = TRUE,
    gridcolor = "rgb(102,102,102)",
    gridwidth = 0.5
  ),
  lataxis = go_geo_lataxis(
    showgrid = TRUE,
    gridcolor = "rgb(102,102,102)",
    gridwidth = 0.5
  )
)

## add custom events

# dropdown
projections <- data.frame(type = c("equirectangular", "mercator", "orthographic", "natural earth","kavrayskiy7",
                                   "miller", "robinson", "eckert4", "azimuthal equal area","azimuthal equidistant",
                                   "conic equal area", "conic conformal", "conic equidistant", "gnomonic", "stereographic",
                                   "mollweide", "hammer", "transverse mercator", "albers usa", "winkel tripel"))

all_buttons <- lapply(projections$type, function(type) {
  go_updatemenu_button(
    method = "relayout",
    args = list(list(geo.projection.type = type)),
    label = type
  )
})

# sliders
lon_range <- seq(-180, 180, 10)
lat_range <- seq(-90, 90, 10)

all_lat <- lapply(lat_range, function(lat) {
  go_slider_step(
    method = "relayout",
    args = list(list(geo.projection.rotation.lat = lat)),
    label = lat
  )
})

all_lon <- lapply(lon_range, function(lon) {
  go_slider_step(
    method = "relayout",
    args = list(list(geo.projection.rotation.lon = lon)),
    label = lon
  )
})

# annotations
annot <- go_annotation(
  x = 0,
  y = 0.8,
  text = "Projection",
  yanchor = "bottom",
  xref = "paper",
  xanchor = "right",
  showarrow = FALSE
)

# original d3-globe with contours, one red shade per line
lines <- unique(d$line)
reds <- colorRampPalette(RColorBrewer::brewer.pal(9, "Reds"))(length(lines))

fig <- go_figure()
for (i in seq_along(lines)) {
  fig <- fig |>
    add_scattergeo(
      data = d[d$line == lines[i], ],
      lon = ~lon,
      lat = ~lat,
      mode = "lines",
      line = go_scattergeo_line(color = reds[i]),
      name = lines[i]
    )
}
fig <- fig |>
  update_layout(showlegend = FALSE, geo = geo)

# plot with custom events
fig <- fig |>
  update_layout(
    annotations = list(annot),
    updatemenus = list(
      go_updatemenu(active = 2, x = 0, y = 0.8, buttons = all_buttons)
    ),
    sliders = list(
      go_slider(
        active = (length(lon_range) - 1) / 2,
        currentvalue = go_slider_currentvalue(prefix = "Longitude: "),
        pad = go_slider_pad(t = 20),
        steps = all_lon
      ),
      go_slider(
        active = (length(lat_range) - 1) / 2,
        currentvalue = go_slider_currentvalue(prefix = "Latitude: "),
        pad = go_slider_pad(t = 100),
        steps = all_lat
      )
    )
  )

fig
```

\#Reference

See
[`go_slider()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider.md)
and
[`go_updatemenu()`](https://msummersgill.github.io/plotly.R.core/reference/go_updatemenu.md)
for more information and options!
