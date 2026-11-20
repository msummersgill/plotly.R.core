# Heatmaps

#### Basic Heatmap

``` r

library(plotly.core)

fig <- go_figure() |>
  add_heatmap(z = volcano)

fig
```

#### Categorical Axes

``` r

m <- matrix(rnorm(9), nrow = 3, ncol = 3)
fig <- go_figure() |>
  add_heatmap(
    x = c("a", "b", "c"),
    y = c("d", "e", "f"),
    z = m
  )

fig
```

#### Sequential Colorscales: Greys

The `colorscale` property accepts the name of a built-in colorscale (see
[`named_colorscale()`](https://msummersgill.github.io/plotly.R.core/reference/plotly.core-extending.md)).

``` r

fig <- go_figure() |>
  add_heatmap(z = volcano, colorscale = "Greys")

fig
```

#### Custom colorscales

`colorscale` also accepts a vector of colors, which are spaced evenly
from 0 to 1.

``` r

fig <- go_figure() |>
  add_heatmap(z = volcano, colorscale = c("red", "green"))

fig
```

Or, you can do the scaling yourself and give the colorscale as a
two-column data frame of stops and colors…

``` r

vals <- unique(scales::rescale(c(volcano)))
o <- order(vals, decreasing = FALSE)
cols <- scales::col_numeric("Blues", domain = NULL)(vals)
colz <- setNames(data.frame(vals[o], cols[o]), NULL)
fig <- go_figure() |>
  add_heatmap(z = volcano, colorscale = colz)

fig
```
