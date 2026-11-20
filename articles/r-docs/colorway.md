# Colorway

### Set Default Trace Colors with `colorway`

``` r

library(plotly.core)

x <- seq(-1, 3, length = 50)
ones <- rep(1, 50)
a_list <- seq(1, 3, length = 7)
b_list <- seq(2, 14, length = 7)
df <- data.frame(cbind(x, (outer((x * x), a_list) + outer(ones, b_list))))

fig <- df |>
  go_figure() |>
  add_scatter(x = ~x, y = ~V2, mode = "lines") |>
  add_scatter(x = ~x, y = ~V3, mode = "lines") |>
  add_scatter(x = ~x, y = ~V4, mode = "lines") |>
  add_scatter(x = ~x, y = ~V5, mode = "lines") |>
  add_scatter(x = ~x, y = ~V6, mode = "lines") |>
  add_scatter(x = ~x, y = ~V7, mode = "lines") |>
  add_scatter(x = ~x, y = ~V8, mode = "lines") |>
  update_layout(
    colorway = c(
      "#f3cec9", "#e7a4b6", "#cd7eaf", "#a262a9",
      "#6f4d96", "#3d3b72", "#182844"
    )
  )

fig
```

\#Reference

See
[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
for more information about the `colorway` attribute.
