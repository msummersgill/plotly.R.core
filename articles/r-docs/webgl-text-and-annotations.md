# WebGL Text and Annotations

### Heatmap with Annotations

``` r

library(plotly.core)

n <- 250
t <- 12
x <- rep(0:(n - 1), times = t)
y <- rep(0:(t - 1), each = n)
z <- matrix(sample(1:10, n * t, replace = TRUE), ncol = n)
text <- sample(c("A", "T", "G", "C"), t * n, replace = TRUE)

steps <- lapply(1:(n - 30), function(e) {
  go_slider_step(
    args = list("xaxis.range", c(-0.5 + e, 30.5 + e)),
    method = "relayout",
    label = e,
    value = e
  )
})

go_figure() |>
  add_heatmap(z = z) |>
  add_scattergl(
    mode = "text",
    text = text,
    textfont = go_font(size = 20),
    x = x,
    y = y
  ) |>
  update_layout(
    xaxis = go_xaxis(
      range = c(-0.5, 30.5),
      showline = FALSE,
      zeroline = FALSE,
      showgrid = FALSE
    ),
    yaxis = go_yaxis(showline = FALSE, zeroline = FALSE, showgrid = FALSE),
    sliders = list(go_slider(active = 0, steps = steps))
  )
```

\#Reference

See
[`go_scattergl()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattergl.md)
for more information and chart attribute options!
