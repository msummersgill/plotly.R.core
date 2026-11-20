# Polar Charts

#### Polar Charts 1.0

Looking for the old polar chart docs? See [legacy polar
charts](https://plotly.com/r/legacy-polar-chart/). The legacy polar
attributes were removed from plotly.js; use
[`add_scatterpolar()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatterpolar.md)
with
[`go_polar()`](https://msummersgill.github.io/plotly.R.core/reference/go_polar.md)
as shown here.

#### Basic Polar Charts

``` r

library(plotly.core)

fig <- go_figure() |>
  add_scatterpolar(
    r = c(0, 1, 2, 2),
    theta = c(0, 45, 90, 0),
    mode = "markers"
  )

fig
```

#### Line Polar Charts

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/polar_dataset.csv")

fig <- df |>
  go_figure() |>
  add_scatterpolar(
    r = ~x1,
    theta = ~y,
    mode = "lines",
    name = "Figure8",
    line = go_scatterpolar_line(color = "peru")
  ) |>
  add_scatterpolar(
    r = ~x2,
    theta = ~y,
    mode = "lines",
    name = "Cardioid",
    line = go_scatterpolar_line(color = "darkviolet")
  ) |>
  add_scatterpolar(
    r = ~x3,
    theta = ~y,
    mode = "lines",
    name = "Hypercardioid",
    line = go_scatterpolar_line(color = "deepskyblue")
  ) |>
  add_scatterpolar(
    r = ~x4,
    theta = ~y,
    mode = "lines",
    name = "Subcardioid",
    line = go_scatterpolar_line(color = "orangered")
  ) |>
  add_scatterpolar(
    r = ~x5,
    theta = ~y,
    mode = "lines",
    name = "Supercardioid",
    line = go_scatterpolar_line(color = "green")
  ) |>
  update_layout(
    title = "Mic Patterns",
    font = go_font(family = "Arial", size = 12, color = "#000"),
    showlegend = FALSE
  )

fig
```

#### Area Polar Charts

``` r

library(plotly.core)

add_wedge <- function(fig, r, theta, fillcolor) {
  add_scatterpolar(
    fig,
    r = r,
    theta = theta,
    mode = "lines",
    fill = "toself",
    fillcolor = fillcolor,
    line = go_scatterpolar_line(color = "black")
  )
}

fig <- go_figure() |>
  add_wedge(c(0, 1.5, 1.5, 0, 2.5, 2.5, 0), c(0, 10, 25, 0, 205, 215, 0), "#709Bff") |>
  add_wedge(c(0, 3.5, 3.5, 0), c(0, 55, 75, 0), "#E4FF87") |>
  add_wedge(c(0, 4.5, 4.5, 0, 4.5, 4.5, 0), c(0, 100, 120, 0, 305, 320, 0), "#FFAA70") |>
  add_wedge(c(0, 4, 4, 0), c(0, 165, 195, 0), "#FFDF70") |>
  add_wedge(c(0, 3, 3, 0), c(0, 262.5, 277.5, 0), "#B6FFB4") |>
  update_layout(
    polar = go_polar(
      radialaxis = go_polar_radialaxis(visible = TRUE, range = c(0, 5))
    ),
    showlegend = FALSE
  )

fig
```

#### Categorical Polar Charts

``` r

library(plotly.core)

fig <- go_figure() |>
  add_scatterpolar(
    r = c(5, 4, 2, 4, 5),
    theta = c("a", "b", "c", "d", "a"),
    mode = "lines",
    name = "angular categories",
    fill = "toself"
  ) |>
  add_scatterpolar(
    r = c("a", "b", "c", "d", "b", "f", "a"),
    theta = c(1, 4, 2, 1.5, 1.5, 6, 5),
    thetaunit = "radians",
    mode = "lines",
    name = "radial categories",
    fill = "toself",
    subplot = "polar2"
  ) |>
  add_scatterpolar(
    r = c(5, 4, 2, 4, 5),
    theta = c("a", "b", "c", "d", "a"),
    mode = "lines",
    name = "angular categories (w/ categoryarray)",
    fill = "toself",
    subplot = "polar3"
  ) |>
  add_scatterpolar(
    r = c("a", "b", "c", "d", "b", "f", "a", "a"),
    theta = c(45, 90, 180, 200, 300, 15, 20, 45),
    mode = "lines",
    name = "radial categories (w/ category descending)",
    fill = "toself",
    subplot = "polar4"
  ) |>
  update_layout(
    polar = go_polar(
      domain = go_domain(x = c(0, 0.46), y = c(0.56, 1)),
      radialaxis = go_polar_radialaxis(angle = 45),
      angularaxis = go_polar_angularaxis(direction = "clockwise", period = 6)
    ),
    polar2 = go_polar(
      domain = go_domain(x = c(0, 0.46), y = c(0, 0.44)),
      radialaxis = go_polar_radialaxis(angle = 180, tickangle = -180)
    ),
    polar3 = go_polar(
      domain = go_domain(x = c(0.54, 1), y = c(0.56, 1)),
      sector = c(150, 400),
      radialaxis = go_polar_radialaxis(angle = -45),
      angularaxis = go_polar_angularaxis(categoryarray = c("d", "a", "c", "b"))
    ),
    polar4 = go_polar(
      domain = go_domain(x = c(0.54, 1), y = c(0, 0.44)),
      radialaxis = go_polar_radialaxis(categoryorder = "category descending"),
      angularaxis = go_polar_angularaxis(thetaunit = "radians", dtick = 0.3141592653589793)
    )
  )

fig
```

#### Polar Charts Directions

``` r

library(plotly.core)

small_ticks <- go_font(size = 8)

fig <- go_figure() |>
  add_scatterpolar(
    r = c(1, 2, 3, 4, 5),
    theta = c(0, 90, 180, 360, 0),
    mode = "lines+markers",
    line = go_scatterpolar_line(color = "#ff66ab"),
    marker = go_scatterpolar_marker(color = "#8090c7", symbol = "square", size = 8),
    text = "sector: 135->225<br>rotation: 90<br>direction: counterclockwise"
  ) |>
  add_scatterpolar(
    r = c(1, 2, 3, 4, 5),
    theta = c(0, 90, 180, 360, 0),
    mode = "lines+markers",
    line = go_scatterpolar_line(color = "#ff66ab"),
    marker = go_scatterpolar_marker(color = "#8090c7", symbol = "square", size = 8),
    text = "sector: 135->225<br>rotation: 90<br>direction: counterclockwise",
    subplot = "polar2"
  ) |>
  update_layout(
    polar = go_polar(
      domain = go_domain(x = c(0, 0.4), y = c(0, 1)),
      radialaxis = go_polar_radialaxis(tickfont = small_ticks),
      angularaxis = go_polar_angularaxis(
        tickfont = small_ticks,
        rotation = 90,
        direction = "counterclockwise"
      )
    ),
    polar2 = go_polar(
      domain = go_domain(x = c(0.6, 1), y = c(0, 1)),
      radialaxis = go_polar_radialaxis(tickfont = small_ticks),
      angularaxis = go_polar_angularaxis(
        tickfont = small_ticks,
        rotation = 90,
        direction = "clockwise"
      )
    ),
    showlegend = FALSE
  )

fig
```

#### Polar Charts Sector

``` r

library(plotly.core)

small_ticks <- go_font(size = 8)

fig <- go_figure() |>
  add_scatterpolar(
    r = c(1, 2, 3, 4, 5),
    theta = c(0, 90, 180, 360, 0),
    mode = "lines+markers",
    line = go_scatterpolar_line(color = "#ff66ab"),
    marker = go_scatterpolar_marker(color = "#8090c7", symbol = "square", size = 8)
  ) |>
  add_scatterpolar(
    r = c(1, 2, 3, 4, 5),
    theta = c(0, 90, 180, 360, 0),
    mode = "lines+markers",
    line = go_scatterpolar_line(color = "#ff66ab"),
    marker = go_scatterpolar_marker(color = "#8090c7", symbol = "square", size = 8),
    subplot = "polar2"
  ) |>
  update_layout(
    polar = go_polar(
      domain = go_domain(x = c(0, 0.4), y = c(0, 1)),
      sector = c(150, 210),
      radialaxis = go_polar_radialaxis(tickfont = small_ticks),
      angularaxis = go_polar_angularaxis(tickfont = small_ticks)
    ),
    polar2 = go_polar(
      domain = go_domain(x = c(0.6, 1), y = c(0, 1)),
      radialaxis = go_polar_radialaxis(tickfont = small_ticks),
      angularaxis = go_polar_angularaxis(tickfont = small_ticks)
    ),
    showlegend = FALSE
  )

fig
```

#### Polar Charts Subplot

``` r

library(plotly.core)

fig <- go_figure() |>
  add_scatterpolar(
    r = c(1, 2, 3),
    theta = c(50, 100, 200),
    mode = "lines",
    marker = go_scatterpolar_marker(symbol = "square")
  ) |>
  add_scatterpolar(
    r = c(1, 2, 3),
    theta = c(1, 2, 3),
    mode = "lines",
    thetaunit = "radians"
  ) |>
  add_scatterpolar(
    r = c("a", "b", "c", "d"),
    theta = c("D", "C", "B", "A"),
    mode = "lines",
    subplot = "polar2"
  ) |>
  add_scatterpolar(
    r = c(50, 300, 900),
    theta = c(0, 90, 180),
    mode = "lines",
    subplot = "polar3"
  ) |>
  add_scatterpolar(
    r = c(3, 3, 4, 3),
    theta = c(0, 45, 90, 270),
    mode = "lines",
    fill = "toself",
    subplot = "polar4"
  ) |>
  update_layout(
    polar = go_polar(
      domain = go_domain(x = c(0, 0.46), y = c(0.56, 1)),
      radialaxis = go_polar_radialaxis(range = c(1, 4)),
      angularaxis = go_polar_angularaxis(thetaunit = "radians")
    ),
    polar2 = go_polar(
      domain = go_domain(x = c(0, 0.46), y = c(0, 0.42))
    ),
    polar3 = go_polar(
      domain = go_domain(x = c(0.54, 1), y = c(0.56, 1)),
      sector = c(0, 180),
      radialaxis = go_polar_radialaxis(type = "log", angle = 45)
    ),
    polar4 = go_polar(
      domain = go_domain(x = c(0.54, 1), y = c(0, 0.44)),
      radialaxis = go_polar_radialaxis(visible = FALSE, range = c(0, 6))
    ),
    showlegend = FALSE
  )

fig
```

#### Webgl Polar Charts

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/hobbs-pearson-trials.csv")

fig <- go_figure()

j <- 1
k <- 2
for (i in 1:(length(df) / 2)) {
  fig <- fig |>
    add_scatterpolargl(
      r = df[, j],
      theta = df[, k],
      mode = "markers",
      name = paste("Trial ", i),
      marker = go_scatterpolargl_marker(
        size = 15,
        line = go_scatterpolargl_marker_line(color = "#FFF"),
        opacity = 0.7
      )
    )
  j <- j + 2
  k <- k + 2
}

fig <- fig |>
  update_layout(
    title = "Hobbs-Pearson Trials",
    showlegend = FALSE,
    paper_bgcolor = "rgb(223, 223, 223)",
    polar = go_polar(
      bgcolor = "rgb(223, 223, 223)",
      angularaxis = go_polar_angularaxis(
        tickwidth = 2,
        linewidth = 3,
        layer = "below traces"
      ),
      radialaxis = go_polar_radialaxis(
        side = "counterclockwise",
        showline = TRUE,
        linewidth = 2,
        tickwidth = 2,
        gridcolor = "#FFF",
        gridwidth = 2
      )
    )
  )

fig
```

#### Reference

See
[`go_polar()`](https://msummersgill.github.io/plotly.R.core/reference/go_polar.md)
and
[`go_scatterpolar()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatterpolar.md)
for more information and options!
