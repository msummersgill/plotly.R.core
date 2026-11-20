# Carpet Scatter Plot

### Basic Carpet Plot

``` r

library(plotly.core)

go_figure() |>
  add_carpet(
    a = c(4, 4, 4, 4.5, 4.5, 4.5, 5, 5, 5, 6, 6, 6),
    b = c(1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3),
    y = c(2, 3.5, 4, 3, 4.5, 5, 5.5, 6.5, 7.5, 8, 8.5, 10),
    aaxis = go_carpet_aaxis(
      tickprefix = "a = ",
      ticksuffix = "m",
      smoothing = 1,
      minorgridcount = 9
    ),
    baxis = go_carpet_baxis(
      tickprefix = "b = ",
      ticksuffix = "Pa",
      smoothing = 1,
      minorgridcount = 9
    )
  )
```

### Add Carpet Scatter Trace

``` r

library(plotly.core)

go_figure() |>
  add_carpet(
    a = c(4, 4, 4, 4.5, 4.5, 4.5, 5, 5, 5, 6, 6, 6),
    b = c(1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3),
    y = c(2, 3.5, 4, 3, 4.5, 5, 5.5, 6.5, 7.5, 8, 8.5, 10),
    aaxis = go_carpet_aaxis(
      tickprefix = "a = ",
      ticksuffix = "m",
      smoothing = 1,
      minorgridcount = 9
    ),
    baxis = go_carpet_baxis(
      tickprefix = "b = ",
      ticksuffix = "Pa",
      smoothing = 1,
      minorgridcount = 9
    )
  ) |>
  add_scattercarpet(
    a = c(4, 4.5, 5, 6),
    b = c(2.5, 2.5, 2.5, 2.5),
    line = go_scattercarpet_line(shape = "spline", smoothing = 1, color = "blue"),
    marker = go_scattercarpet_marker(color = "blue")
  )
```

### Adding Multiple Traces

``` r

library(plotly.core)

go_figure() |>
  add_carpet(
    a = c(4, 4, 4, 4.5, 4.5, 4.5, 5, 5, 5, 6, 6, 6),
    b = c(1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3),
    y = c(2, 3.5, 4, 3, 4.5, 5, 5.5, 6.5, 7.5, 8, 8.5, 10),
    aaxis = go_carpet_aaxis(
      tickprefix = "a = ",
      ticksuffix = "m",
      smoothing = 1,
      minorgridcount = 9
    ),
    baxis = go_carpet_baxis(
      tickprefix = "b = ",
      ticksuffix = "Pa",
      smoothing = 1,
      minorgridcount = 9
    )
  ) |>
  add_scattercarpet(
    a = c(4, 4.5, 5, 6),
    b = c(2.5, 2.5, 2.5, 2.5),
    mode = "markers+lines",
    line = go_scattercarpet_line(shape = "spline", smoothing = 1, color = "blue"),
    marker = go_scattercarpet_marker(color = "blue")
  ) |>
  add_scattercarpet(
    a = c(4, 4.5, 5, 6),
    b = c(1.5, 1.5, 1.5, 1.5),
    mode = "lines",
    line = go_scattercarpet_line(shape = "spline", smoothing = 1, color = "green")
  ) |>
  add_scattercarpet(
    a = c(5, 5, 5, 5),
    b = c(1, 1.5, 2, 3),
    mode = "markers",
    marker = go_scattercarpet_marker(color = "red", size = c(0, 0, 20, 0))
  ) |>
  add_scattercarpet(
    a = c(4.5, 4.5, 4.5, 4.5),
    b = c(1, 1.5, 2, 3),
    mode = "markers",
    marker = go_scattercarpet_marker(color = "black", size = c(0, 0, 30, 0))
  )
```

\#Reference

See
[`go_scattercarpet()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattercarpet.md)
for more information and options!
