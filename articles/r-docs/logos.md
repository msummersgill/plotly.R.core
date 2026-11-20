# Embedding Logos in Plotly Graphs

### Embed Logos on a Graph

``` r

library(plotly.core)

fig <- go_figure() |>
  add_scatter(x = c(1, 2, 3), y = c(1, 2, 3), mode = "lines") |>
  update_layout(
    images = list(
      go_layout_image(
        source = "https://images.plot.ly/language-icons/api-home/python-logo.png",
        xref = "paper",
        yref = "paper",
        x = 0,
        y = 1,
        sizex = 0.2,
        sizey = 0.2,
        opacity = 0.8
      ),
      go_layout_image(
        source = "https://images.plot.ly/language-icons/api-home/matlab-logo.png",
        xref = "x",
        yref = "paper",
        x = 2.7,
        y = 0.25,
        sizex = 0.4,
        sizey = 0.8,
        opacity = 0.8
      ),
      go_layout_image(
        source = "https://images.plot.ly/language-icons/api-home/r-logo.png",
        xref = "x",
        yref = "y",
        x = 0.9,
        y = 3.1,
        sizex = 2,
        sizey = 2,
        sizing = "stretch",
        opacity = 0.4,
        layer = "below"
      )
    )
  )

fig
```
