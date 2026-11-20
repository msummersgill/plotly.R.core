# Group By

#### Basic Example

The `groupby` transform was removed from plotly.js. Split the data in R
instead and add one trace per group, styling each one as needed.

``` r

library(plotly.core)

cyl_colors <- c("4" = "blue", "6" = "red", "8" = "black")

fig <- go_figure()
for (cyl in names(cyl_colors)) {
  cars <- mtcars[mtcars$cyl == as.numeric(cyl), ]
  fig <- fig |>
    add_scatter(
      x = cars$hp,
      y = cars$qsec,
      text = paste("Make: ", rownames(cars),
                   "<br>hp: ", cars$hp,
                   "<br>qsec: ", cars$qsec,
                   "<br>Cyl: ", cars$cyl),
      hoverinfo = "text",
      mode = "markers",
      name = cyl,
      marker = go_scatter_marker(color = cyl_colors[[cyl]])
    )
}

fig
```

#### Reference

See
[`go_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md)
for more information and options!
