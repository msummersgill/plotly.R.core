# Dumbbell Plots

## Dot and Dumbbell Plots

``` r

s <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/school_earnings.csv")
# order schools by men's income
s <- s[order(s$Men), ]

library(plotly.core)

# one line trace for all segments, with NA between segments
seg_x <- as.vector(rbind(s$Women, s$Men, NA))
seg_y <- as.vector(rbind(s$School, s$School, NA))

s |>
  go_figure() |>
  add_scatter(
    x = seg_x,
    y = seg_y,
    mode = "lines",
    line = go_scatter_line(color = "gray80"),
    showlegend = FALSE
  ) |>
  add_scatter(
    x = ~Women,
    y = ~School,
    mode = "markers",
    name = "Women",
    marker = go_scatter_marker(color = "pink")
  ) |>
  add_scatter(
    x = ~Men,
    y = ~School,
    mode = "markers",
    name = "Men",
    marker = go_scatter_marker(color = "blue")
  ) |>
  update_layout(
    title = "Gender earnings disparity",
    xaxis = go_xaxis(title = "Annual Salary (in thousands)"),
    yaxis = go_yaxis(categoryorder = "array", categoryarray = s$School),
    margin = go_margin(l = 65)
  )
```

\#Reference

See
[`go_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md)
for more information and chart attribute options!
