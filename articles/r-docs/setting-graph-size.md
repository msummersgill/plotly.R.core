# Setting Graph Size

### Customize Margins and Plot Size

``` r

library(plotly.core)

m <- go_margin(
  l = 50,
  r = 50,
  b = 100,
  t = 100,
  pad = 4
)
fig <- go_figure() |>
  add_scatter(x = seq(0, 8), y = seq(0, 8)) |>
  update_layout(autosize = FALSE, width = 500, height = 500, margin = m)

fig
```

### Automatically Adjust Margins

``` r

library(plotly.core)

yaxis <- go_yaxis(
  title = go_yaxis_title(text = "Y-axis Title", font = go_font(size = 30)),
  ticktext = c("long label", "Very long label", "3", "label"),
  tickvals = c(1, 2, 3, 4),
  tickmode = "array",
  automargin = TRUE
)
fig <- go_figure() |>
  add_bar(
    x = c("Apples", "Oranges", "Watermelon", "Pears"),
    y = c(3, 1, 2, 4)
  ) |>
  update_layout(autosize = FALSE, width = 500, height = 500, yaxis = yaxis)

fig
```
