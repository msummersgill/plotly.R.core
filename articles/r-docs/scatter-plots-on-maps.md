# Scatter Plots on Maps

### Basic Scatter on Map

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2011_february_us_airport_traffic.csv")

# geo styling
g <- go_geo(
  scope = "usa",
  projection = go_geo_projection(type = "albers usa"),
  showland = TRUE,
  landcolor = "rgb(242, 242, 242)",
  subunitcolor = "rgb(217, 217, 217)",
  countrycolor = "rgb(217, 217, 217)",
  countrywidth = 0.5,
  subunitwidth = 0.5
)

fig <- df |>
  go_figure() |>
  add_scattergeo(
    lat = ~lat,
    lon = ~long,
    text = ~paste(airport, city, state, paste("Arrivals:", cnt), sep = "<br />"),
    hoverinfo = "text",
    mode = "markers",
    marker = go_scattergeo_marker(
      color = ~cnt,
      colorscale = "Viridis",
      showscale = TRUE,
      symbol = "square",
      size = 8,
      colorbar = go_colorbar(title = go_colorbar_title(text = "Incoming flights<br />February 2011"))
    )
  ) |>
  update_layout(
    title = "Most trafficked US airports<br />(Hover for airport)",
    geo = g
  )

fig
```

### Style Scatter Map Layout

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2015_06_30_precipitation.csv")

# geo styling
g <- go_geo(
  scope = "north america",
  showland = TRUE,
  landcolor = "rgb(212, 212, 212)",
  subunitcolor = "white",
  countrycolor = "white",
  showlakes = TRUE,
  lakecolor = "white",
  showsubunits = TRUE,
  showcountries = TRUE,
  resolution = 50,
  projection = go_geo_projection(
    type = "conic conformal",
    rotation = go_geo_projection_rotation(lon = -100)
  ),
  lonaxis = go_geo_lonaxis(
    showgrid = TRUE,
    gridwidth = 0.5,
    range = c(-140, -55),
    dtick = 5
  ),
  lataxis = go_geo_lataxis(
    showgrid = TRUE,
    gridwidth = 0.5,
    range = c(20, 60),
    dtick = 5
  )
)

fig <- df |>
  go_figure() |>
  add_scattergeo(
    lat = ~Lat,
    lon = ~Lon,
    text = ~paste(Globvalue, "inches"),
    hoverinfo = "text",
    mode = "markers",
    marker = go_scattergeo_marker(
      color = ~Globvalue,
      colorscale = "Viridis",
      showscale = TRUE
    )
  ) |>
  update_layout(
    title = "US Precipitation 06-30-2015<br>Source: NOAA",
    geo = g
  )

fig
```
