# Dot Plots

## Dot and Dumbbell Plots

``` r

library(plotly.core)

s <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/school_earnings.csv")
s <- s[order(s$Men), ]

fig <- s |>
  go_figure() |>
  add_scatter(
    x = ~Women,
    y = ~School,
    name = "Women",
    mode = "markers",
    marker = go_scatter_marker(color = "pink")
  ) |>
  add_scatter(
    x = ~Men,
    y = ~School,
    name = "Men",
    mode = "markers",
    marker = go_scatter_marker(color = "blue")
  ) |>
  update_layout(
    title = "Gender earnings disparity",
    xaxis = go_xaxis(title = "Annual Salary (in thousands)"),
    margin = go_margin(l = 100)
  )

fig
```

\#Reference

See
[`go_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md)
for more information and chart attribute options!
