# WebGL in Plotly and R

## WebGL for time series data (24381 points)

``` r

library(plotly.core)

# Read some weather data
df <- read.csv(
  "https://raw.githubusercontent.com/plotly/datasets/master/2016-weather-data-seattle.csv"
)

# Convert to dates
df$Date <- as.Date(df$Date, format = "%m/%d/%Y")

df |>
  go_figure() |>
  add_scattergl(
    x = ~Date,
    y = ~Mean_TemperatureC,
    mode = "lines",
    line = go_scattergl_line(color = "purple")
  ) |>
  update_layout(
    title = "Mean Temparature in Seattle (1948 - 2015)",
    yaxis = go_yaxis(title = "Temperature (<sup>o</sup>C)")
  )
```
