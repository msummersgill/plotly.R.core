# Radar Charts

#### Basic Radar Charts

``` r

library(plotly.core)

fig <- go_figure() |>
  add_scatterpolar(
    r = c(39, 28, 8, 7, 28, 39),
    theta = c("A", "B", "C", "D", "E", "A"),
    fill = "toself"
  ) |>
  update_layout(
    polar = go_polar(
      radialaxis = go_polar_radialaxis(visible = TRUE, range = c(0, 50))
    ),
    showlegend = FALSE
  )

fig
```

#### Multiple Trace Radar Charts

``` r

library(plotly.core)

fig <- go_figure() |>
  add_scatterpolar(
    r = c(39, 28, 8, 7, 28, 39),
    theta = c("A", "B", "C", "D", "E", "A"),
    fill = "toself",
    name = "Group A"
  ) |>
  add_scatterpolar(
    r = c(1.5, 10, 39, 31, 15, 1.5),
    theta = c("A", "B", "C", "D", "E", "A"),
    fill = "toself",
    name = "Group B"
  ) |>
  update_layout(
    polar = go_polar(
      radialaxis = go_polar_radialaxis(visible = TRUE, range = c(0, 50))
    )
  )

fig
```

#### Reference

See
[`go_scatterpolar()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatterpolar.md)
for more information and options!
