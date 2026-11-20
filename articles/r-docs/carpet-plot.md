# Carpet Plot

### Set the Coordinates

To set the `x` and `y` coordinates use `x` and `y` attributes. If `x`
coorindate values are ommitted a cheater plot will be created.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_carpet(y = c(2, 3.5, 4, 3, 4.5, 5, 5.5, 6.5, 7.5, 8, 8.5, 10))
```

### Add Parameter Values

To save parameter values use `a` and `b` attributes.

``` r

library(plotly.core)

go_figure() |>
  add_carpet(
    a = c(4, 4, 4, 4.5, 4.5, 4.5, 5, 5, 5, 6, 6, 6),
    b = c(1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3),
    y = c(2, 3.5, 4, 3, 4.5, 5, 5.5, 6.5, 7.5, 8, 8.5, 10)
  )
```

### Add Carpet Axes

Use `aaxis` and `baxis`
([`go_carpet_aaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_carpet_aaxis.md)
and
[`go_carpet_baxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_carpet_baxis.md))
to make changes to the axes. For a more detailed list of attributes
refer to
[`go_carpet_aaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_carpet_aaxis.md).

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

### Style Carpet Axes

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
      minorgridcount = 9,
      minorgridwidth = 0.6,
      minorgridcolor = "white",
      gridcolor = "white",
      color = "white"
    ),
    baxis = go_carpet_baxis(
      tickprefix = "b = ",
      ticksuffix = "Pa",
      smoothing = 1,
      minorgridcount = 9,
      minorgridwidth = 0.6,
      gridcolor = "white",
      minorgridcolor = "white",
      color = "white"
    )
  ) |>
  update_layout(
    plot_bgcolor = "black",
    paper_bgcolor = "black",
    xaxis = go_xaxis(showgrid = FALSE, showticklabels = FALSE),
    yaxis = go_yaxis(showgrid = FALSE, showticklabels = FALSE)
  )
```

### Add Points and Contours

To add points and lines to see [Carpet Scatter
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/carpet-scatter.md)
or to add contours see [Carpet Contour
Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/carpet-contour.md)

### Reference

See
[`go_carpet()`](https://msummersgill.github.io/plotly.R.core/reference/go_carpet.md)
for more information and options!
