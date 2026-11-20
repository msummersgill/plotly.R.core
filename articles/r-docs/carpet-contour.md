# Carpet Contour Plot

### Basic Carpet Plot

Set the `x` and `y` coordinates, using `x` and `y` attributes. If `x`
coordinate values are omitted a cheater plot will be created. To save
parameter values use `a` and `b` attributes. To make changes to the
axes, use `aaxis` or `baxis` attributes
([`go_carpet_aaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_carpet_aaxis.md)
and
[`go_carpet_baxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_carpet_baxis.md)).
For a more detailed list of axes attributes refer to
[`go_carpet()`](https://msummersgill.github.io/plotly.R.core/reference/go_carpet.md).

``` r

library(plotly.core)

fig <- go_figure() |>
  add_carpet(
    a = c(0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3),
    b = c(4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6),
    x = c(2, 3, 4, 5, 2.2, 3.1, 4.1, 5.1, 1.5, 2.5, 3.5, 4.5),
    y = c(1, 1.4, 1.6, 1.75, 2, 2.5, 2.7, 2.75, 3, 3.5, 3.7, 3.75),
    xaxis = "x",
    yaxis = "y",
    carpet = "c",
    aaxis = go_carpet_aaxis(
      tickprefix = "a = ",
      smoothing = 0,
      minorgridcount = 9,
      type = "linear"
    ),
    baxis = go_carpet_baxis(
      tickprefix = "b = ",
      smoothing = 0,
      minorgridcount = 9,
      type = "linear"
    )
  ) |>
  update_layout(
    margin = go_margin(t = 40, r = 30, b = 30, l = 30),
    yaxis = go_yaxis(range = c(0.388, 4.361)),
    xaxis = go_xaxis(range = c(0.667, 5.932))
  )

fig
```

### Add Contours

``` r

library(plotly.core)

fig <- go_figure() |>
  add_contourcarpet(
    a = c(0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3),
    b = c(4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6),
    z = c(1, 1.96, 2.56, 3.0625, 4, 5.0625, 1, 7.5625, 9, 12.25, 15.21, 14.0625),
    xaxis = "x",
    yaxis = "y",
    carpet = "c",
    autocontour = FALSE,
    contours = go_contourcarpet_contours(start = 1, end = 14, size = 1),
    line = go_contourcarpet_line(width = 2, smoothing = 0),
    colorbar = go_colorbar(len = 0.4, y = 0.25)
  ) |>
  add_carpet(
    a = c(0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3),
    b = c(4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6),
    x = c(2, 3, 4, 5, 2.2, 3.1, 4.1, 5.1, 1.5, 2.5, 3.5, 4.5),
    y = c(1, 1.4, 1.6, 1.75, 2, 2.5, 2.7, 2.75, 3, 3.5, 3.7, 3.75),
    xaxis = "x",
    yaxis = "y",
    carpet = "c",
    aaxis = go_carpet_aaxis(
      tickprefix = "a = ",
      smoothing = 0,
      minorgridcount = 9,
      type = "linear"
    ),
    baxis = go_carpet_baxis(
      tickprefix = "b = ",
      smoothing = 0,
      minorgridcount = 9,
      type = "linear"
    )
  ) |>
  update_layout(
    width = 600,
    height = 600,
    margin = go_margin(t = 40, r = 30, b = 30, l = 30),
    yaxis = go_yaxis(range = c(0.388, 4.361)),
    xaxis = go_xaxis(range = c(0.667, 5.932))
  )

fig
```

### Add Multiple Traces

``` r

library(plotly.core)
library(jsonlite)

# a data frame with list columns: data$x[[i]], data$y[[i]], data$z[[i]]
# hold the arrays of the i-th trace
data <- fromJSON("https://raw.githubusercontent.com/bcdunbar/datasets/master/airfoil_data.json")

fig <- go_figure() |>
  add_carpet(
    a = c(
      1.083, 1.214, 1.344, 1.475, 1.605, 1.736, 1.866, 1.997, 2.128, 2.258, 2.389, 2.519, 2.650, 2.780, 2.911, 3.041, 3.172, 3.303, 3.433, 3.564, 3.694, 3.825, 3.955, 4.086, 4.217, 4.347, 4.478, 4.608, 4.739, 4.869, 5.000
    ),
    b = c(
      0.000, 0.090, 0.180, 0.269, 0.359, 0.449, 0.539, 0.628, 0.718, 0.808, 0.898, 0.987, 1.077, 1.167, 1.257, 1.346, 1.436, 1.526, 1.616, 1.705, 1.795, 1.885, 1.975, 2.064, 2.154, 2.244, 2.334, 2.424, 2.513, 2.603, 2.693,
      2.783, 2.872, 2.962, 3.052, 3.142, 3.231, 3.321, 3.411, 3.501, 3.590, 3.680, 3.770, 3.860, 3.949, 4.039, 4.129, 4.219, 4.308, 4.398, 4.488, 4.578, 4.668, 4.757, 4.847, 4.937, 5.027, 5.116, 5.206, 5.296, 5.386, 5.475,
      5.565, 5.655, 5.745, 5.834, 5.924, 6.014, 6.104, 6.193, 6.283
    ),
    x = data$x[[1]],
    y = data$y[[1]],
    aaxis = go_carpet_aaxis(
      startlinewidth = 2,
      startline = TRUE,
      showticklabels = "none",
      endline = TRUE,
      showgrid = FALSE,
      endlinewidth = 2,
      smoothing = 0
    ),
    baxis = go_carpet_baxis(
      startline = FALSE,
      endline = FALSE,
      showticklabels = "none",
      smoothing = 0,
      showgrid = FALSE
    )
  ) |>
  add_contourcarpet(
    z = data$z[[2]],
    autocolorscale = FALSE,
    zmax = 1,
    name = "Pressure",
    colorscale = "Viridis",
    zmin = -8,
    colorbar = go_colorbar(
      y = 0,
      yanchor = "bottom",
      len = 0.75,
      title = go_colorbar_title(
        text = "Pressure coefficient, c<sub>p</sub>",
        side = "right"
      )
    ),
    contours = go_contourcarpet_contours(
      start = -1,
      size = 0.025,
      end = 1.000,
      showlines = FALSE
    ),
    line = go_contourcarpet_line(smoothing = 0),
    autocontour = FALSE,
    zauto = FALSE
  ) |>
  add_contourcarpet(
    z = data$z[[3]],
    opacity = 0.300,
    showlegend = TRUE,
    name = "Streamlines",
    autocontour = TRUE,
    ncontours = 50,
    contours = go_contourcarpet_contours(coloring = "none"),
    line = go_contourcarpet_line(color = "white", width = 1)
  ) |>
  add_contourcarpet(
    z = data$z[[4]],
    showlegend = TRUE,
    name = "Pressure<br>contours",
    autocontour = FALSE,
    line = go_contourcarpet_line(color = "rgba(0, 0, 0, 0.5)", smoothing = 1),
    contours = go_contourcarpet_contours(
      size = 0.250,
      start = -4,
      coloring = "none",
      end = 1.000,
      showlines = TRUE
    )
  ) |>
  add_scatter(
    x = data$x[[5]],
    y = data$y[[5]],
    legendgroup = "g1",
    name = "Surface<br>pressure",
    mode = "lines",
    hoverinfo = "skip",
    line = go_scatter_line(
      color = "rgba(255, 0, 0, 0.5)",
      width = 1,
      shape = "spline",
      smoothing = 1
    ),
    fill = "toself",
    fillcolor = "rgba(255, 0, 0, 0.2)"
  ) |>
  add_scatter(
    x = data$x[[6]],
    y = data$y[[6]],
    showlegend = FALSE,
    legendgroup = "g1",
    mode = "lines",
    hoverinfo = "skip",
    line = go_scatter_line(color = "rgba(255, 0, 0, 0.3)", width = 1)
  ) |>
  add_scatter(
    x = data$x[[7]],
    y = data$y[[7]],
    showlegend = FALSE,
    legendgroup = "g1",
    name = "cp",
    mode = "lines",
    line = go_scatter_line(color = "rgba(255, 0, 0, 0.2)", width = 0)
  ) |>
  update_layout(
    xaxis = go_xaxis(
      zeroline = FALSE,
      scaleratio = 1,
      scaleanchor = "y",
      range = c(-3.800, 3.800),
      showgrid = FALSE
    ),
    yaxis = go_yaxis(
      zeroline = FALSE,
      range = c(-1.800, 1.800),
      showgrid = FALSE
    ),
    title = "Flow over a Karman-Trefftz airfoil",
    hovermode = "closest",
    margin = go_margin(r = 60, b = 40, l = 40, t = 80)
  )

fig
```

### Reference

See
[`go_contourcarpet()`](https://msummersgill.github.io/plotly.R.core/reference/go_contourcarpet.md)
for more information and options!
