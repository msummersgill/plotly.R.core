# Multiple Axes

### Multiple Y Axes and Plotly

## Two Y Axes

``` r

library(plotly.core)

ay <- go_yaxis(
  tickfont = go_font(color = "red"),
  overlaying = "y",
  side = "right",
  title = "<b>secondary</b> yaxis title"
)

fig <- go_figure() |>
  add_scatter(x = 1:3, y = 10 * (4:6), name = "yaxis data", mode = "lines+markers") |>
  add_scatter(
    x = 2:4,
    y = 4:6,
    name = "yaxis 2 data",
    yaxis = "y2",
    mode = "lines+markers"
  ) |>
  # Set figure title, x and y-axes titles
  update_layout(
    title = "Double Y Axis Example",
    yaxis2 = ay,
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(
      title = "xaxis title",
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "ffff"
    ),
    yaxis = go_yaxis(
      title = "<b>primary</b> yaxis title",
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "ffff"
    )
  )

fig
```

## Multiple axes in Dash

[Dash for R](https://dashr.plotly.com) is an open-source framework for
building analytical applications, with no Javascript required, and it is
tightly integrated with the Plotly graphing library.

Learn about how to install Dash for R at
<https://dashr.plot.ly/installation>.

Everywhere in this page that you see fig, you can display the same
figure in a Dash for R application by passing it to the figure argument.

``` r

library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)
library(plotly.core)

app <- Dash$new()

app$layout(
  htmlDiv(
    list(
      dccGraph(id = "graph"),
      htmlLabel("Red line's axis:"),
      dccRadioItems(
        id = "radio",
        options = list(
          list(label = "Primary", value = "Primary"),
          list(label = "Secondary", value = "Secondary")
        ),
        value = "Secondary"
      )
    )
  )
)
app$callback(
  output(id = "graph", property = "figure"),
  params = list(input(id = "radio", property = "value")),
  function(value) {
    secondary <- value != "Primary"
    fig <- go_figure() |>
      add_scatter(x = 1:3, y = 10 * (4:6), name = "yaxis data", mode = "lines+markers") |>
      add_scatter(
        x = 2:4,
        y = 4:6,
        name = "yaxis 2 data",
        yaxis = if (secondary) "y2" else "y",
        mode = "lines+markers"
      ) |>
      update_layout(
        title = "Double Y Axis Example",
        plot_bgcolor = "#e5ecf6",
        xaxis = go_xaxis(
          title = "xaxis title",
          zerolinecolor = "#ffff",
          zerolinewidth = 2,
          gridcolor = "ffff"
        ),
        yaxis = go_yaxis(
          title = "<b>primary</b> yaxis title",
          zerolinecolor = "#ffff",
          zerolinewidth = 2,
          gridcolor = "ffff"
        )
      )
    if (secondary) {
      fig <- fig |>
        update_layout(
          yaxis2 = go_yaxis(
            overlaying = "y",
            side = "right",
            title = "<b>secondary</b> yaxis title"
          )
        )
    }
    fig
  }
)
# app$run_server()
```

Use `app$run_server()` to run the dash file.

## Multiple Y-Axes Subplots

Use
[`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
with `specs` that request a secondary y axis in each cell, then add
traces with `secondary_y = TRUE`.

``` r

library(plotly.core)

cell <- list(secondary_y = TRUE)

fig <- make_subplots(
  rows = 2,
  cols = 2,
  specs = list(list(cell, cell), list(cell, cell)),
  horizontal_spacing = 0.1,
  vertical_spacing = 0.1
)

n <- 1
for (row in 1:2) {
  for (col in 1:2) {
    fig <- fig |>
      add_scatter(
        x = c(1, 2, 3),
        y = c(2, 52, 62),
        mode = "lines+markers",
        name = paste0("yaxis", if (n == 1) "" else n, " data"),
        row = row,
        col = col
      ) |>
      add_scatter(
        x = c(1, 2, 3),
        y = c(40, 50, 60),
        mode = "lines+markers",
        name = paste0("yaxis", n + 1, " data"),
        row = row,
        col = col,
        secondary_y = TRUE
      )
    n <- n + 2
  }
}

fig <- fig |>
  update_xaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff") |>
  update_yaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff") |>
  update_layout(
    legend = go_legend(x = 1.05, y = 1),
    plot_bgcolor = "#e5ecf6"
  )

fig
```

## Multiple Axes

Using plotly.core for creating a figure with multiple axes

``` r

library(plotly.core)

colored_axis <- function(color, title, ...) {
  go_yaxis(
    tickfont = go_font(color = color),
    title = go_yaxis_title(text = title, font = go_font(color = color)),
    ...
  )
}

fig <- go_figure() |>
  add_scatter(x = 1:3, y = 4:6, name = "yaxis1 data", mode = "lines+markers") |>
  add_scatter(x = 2:4, y = 10 * (4:6), name = "yaxis2 data", yaxis = "y2", mode = "lines+markers") |>
  add_scatter(x = 4:6, y = 1000 * (4:6), name = "yaxis3 data", yaxis = "y3", mode = "lines+markers") |>
  add_scatter(x = 5:7, y = 10000 * (4:6), name = "yaxis4 data", yaxis = "y4", mode = "lines+markers") |>
  update_layout(
    width = 700,
    title = "multiple y-axes example",
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(
      title = "",
      domain = c(0.3, 0.7),
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "ffff"
    ),
    yaxis = colored_axis(
      "#1f77b4",
      "yaxis title",
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "ffff"
    ),
    yaxis2 = colored_axis(
      "#ff7f0e",
      "yaxis2 title",
      overlaying = "y",
      side = "left",
      anchor = "free",
      position = 0.15
    ),
    yaxis3 = colored_axis("#d62728", "yaxis3 title", overlaying = "y", side = "right"),
    yaxis4 = colored_axis(
      "#9467bd",
      "yaxis4 title",
      overlaying = "y",
      side = "right",
      anchor = "free",
      position = 0.85
    )
  )

fig
```

### Reference

All of the y-axis properties are documented in
[`go_yaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_yaxis.md).
For more information on creating subplots see the [Subplots in
R](https://msummersgill.github.io/plotly.R.core/articles/r-docs/subplots.md)
section.
