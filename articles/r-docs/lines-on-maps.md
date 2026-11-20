# Lines on Maps

#### Flight Paths Map

Each flight is a line segment; one
[`add_scattergeo()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattergeo.md)
trace draws them all, with `NA` separating the segments.

``` r

library(plotly.core)
# airport locations
air <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2011_february_us_airport_traffic.csv")
# flights between airports
flights <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2011_february_aa_flight_paths.csv")

# one segment per flight, separated by NA
seg_lon <- c(rbind(flights$start_lon, flights$end_lon, NA))
seg_lat <- c(rbind(flights$start_lat, flights$end_lat, NA))

# map projection
geo <- go_geo(
  scope = "north america",
  projection = go_geo_projection(type = "azimuthal equal area"),
  showland = TRUE,
  landcolor = "rgb(242,242,242)",
  countrycolor = "rgb(204,204,204)"
)

fig <- go_figure() |>
  add_scattergeo(
    data = air,
    lon = ~long,
    lat = ~lat,
    text = ~airport,
    mode = "markers",
    marker = go_scattergeo_marker(
      color = "red",
      opacity = 0.5,
      size = ~cnt,
      sizemode = "area",
      sizeref = 2 * max(air$cnt) / 30^2
    ),
    hoverinfo = "text"
  ) |>
  add_scattergeo(
    lon = seg_lon,
    lat = seg_lat,
    mode = "lines",
    line = go_scattergeo_line(color = "red", width = 1),
    opacity = 0.3,
    hoverinfo = "none"
  ) |>
  update_layout(
    title = "Feb. 2011 American Airline flight paths<br>(Hover for airport names)",
    geo = geo,
    showlegend = FALSE,
    height = 800
  )

fig
```

### London to NYC Great Circle

``` r

library(plotly.core)

fig <- go_figure() |>
  add_scattergeo(
    lat = c(40.7127, 51.5072),
    lon = c(-74.0059, 0.1275),
    mode = "lines",
    line = go_scattergeo_line(color = "blue", width = 2)
  ) |>
  update_layout(
    title = "London to NYC Great Circle",
    showlegend = FALSE,
    geo = go_geo(
      resolution = 50,
      showland = TRUE,
      showlakes = TRUE,
      landcolor = "rgb(204,204,204)",
      countrycolor = "rgb(204,204,204)",
      lakecolor = "white",
      projection = go_geo_projection(type = "equirectangular"),
      coastlinewidth = 2,
      lataxis = go_geo_lataxis(
        range = c(20, 60),
        showgrid = TRUE,
        dtick = 10
      ),
      lonaxis = go_geo_lonaxis(
        range = c(-100, 20),
        showgrid = TRUE,
        dtick = 20
      )
    )
  )

fig
```

### Contour lines on globe

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
  landcolor = "rgb(229,229,229)",
  lakecolor = "white",
  oceancolor = "white",
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

fig <- go_figure()
for (l in unique(d$line)) {
  fig <- fig |>
    add_scattergeo(data = d[d$line == l, ], lon = ~lon, lat = ~lat, mode = "lines", name = l)
}
fig <- fig |>
  update_layout(
    showlegend = FALSE,
    geo = geo,
    title = "Contour lines over globe<br>(Click and drag to rotate)"
  )

fig
```
