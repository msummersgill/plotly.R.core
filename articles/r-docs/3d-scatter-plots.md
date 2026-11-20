# 3D Scatter Plots

#### Basic 3D Scatter Plot

``` r

library(plotly.core)

mtcars$am[which(mtcars$am == 0)] <- 'Automatic'
mtcars$am[which(mtcars$am == 1)] <- 'Manual'
mtcars$am <- as.factor(mtcars$am)

am_colors <- c(Automatic = "#BF382A", Manual = "#0C4B8E")

mtcars |>
  go_figure() |>
  update_layout(colorway = am_colors) |>
  add_scatter3d(
    x = ~wt,
    y = ~hp,
    z = ~qsec,
    mode = "markers",
    marker = go_scatter3d_marker(color = ~am)
  ) |>
  update_layout(
    scene = go_scene(
      xaxis = go_scene_axis(title = "Weight"),
      yaxis = go_scene_axis(title = "Gross horsepower"),
      zaxis = go_scene_axis(title = "1/4 mile time")
    )
  )
```

#### 3D Scatter Plot with Color Scaling

``` r

library(plotly.core)

mtcars |>
  go_figure() |>
  add_scatter3d(
    x = ~wt,
    y = ~hp,
    z = ~qsec,
    mode = "markers",
    marker = go_scatter3d_marker(
      color = ~mpg,
      colorscale = c("#FFE1A1", "#683531"),
      showscale = TRUE,
      colorbar = go_colorbar(title = "Miles/(US) gallon")
    )
  ) |>
  update_layout(
    scene = go_scene(
      xaxis = go_scene_axis(title = "Weight"),
      yaxis = go_scene_axis(title = "Gross horsepower"),
      zaxis = go_scene_axis(title = "1/4 mile time")
    )
  )
```

#### 3D Bubble Plot

``` r

library(plotly.core)

data <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv")

data_2007 <- data[which(data$year == 2007),]
data_2007 <- data_2007[order(data_2007$continent, data_2007$country),]
# scale population to marker diameters between 5 and 150 pixels
data_2007$size <- scales::rescale(data_2007$pop, to = c(5, 150))
colors <- c('#4AC6B7', '#1972A4', '#965F8A', '#FF7070', '#C61951')
names(colors) <- sort(unique(data_2007$continent))

data_2007 |>
  go_figure() |>
  update_layout(colorway = colors) |>
  add_scatter3d(
    x = ~gdpPercap,
    y = ~lifeExp,
    z = ~pop,
    mode = "markers",
    marker = go_scatter3d_marker(
      color = ~continent,
      size = ~size,
      symbol = "circle",
      sizemode = "diameter"
    ),
    text = ~paste("Country:", country, "<br>Life Expectancy:", lifeExp,
                  "<br>GDP:", gdpPercap, "<br>Pop.:", pop)
  ) |>
  update_layout(
    title = "Life Expectancy v. Per Capita GDP, 2007",
    scene = go_scene(
      xaxis = go_scene_axis(
        title = "GDP per capita (2000 dollars)",
        gridcolor = "rgb(255, 255, 255)",
        range = c(2.003297660701705, 5.191505530708712),
        type = "log",
        zerolinewidth = 1,
        ticklen = 5,
        gridwidth = 2
      ),
      yaxis = go_scene_axis(
        title = "Life Expectancy (years)",
        gridcolor = "rgb(255, 255, 255)",
        range = c(36.12621671352166, 91.72921793264332),
        zerolinewidth = 1,
        ticklen = 5,
        gridwidth = 2
      ),
      zaxis = go_scene_axis(
        title = "Population",
        gridcolor = "rgb(255, 255, 255)",
        type = "log",
        zerolinewidth = 1,
        ticklen = 5,
        gridwidth = 2
      )
    ),
    paper_bgcolor = "rgb(243, 243, 243)",
    plot_bgcolor = "rgb(243, 243, 243)"
  )
```

### Reference

See
[`go_scatter3d()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter3d.md)
for more information and chart attribute options!
