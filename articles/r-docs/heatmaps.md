# Heatmaps

#### Basic Heatmap

``` r

library(plotly.core)

go_figure() |>
  add_heatmap(z = volcano)
```

#### Categorical Axes

``` r

m <- matrix(rnorm(9), nrow = 3, ncol = 3)
go_figure() |>
  add_heatmap(
    x = c("a", "b", "c"),
    y = c("d", "e", "f"),
    z = m
  )
```

#### Sequential Colorscales: Greys

The `colorscale` property accepts the name of a built-in colorscale (see
[`named_colorscale()`](https://msummersgill.github.io/plotly.R.core/reference/plotly.core-extending.md)).

``` r

go_figure() |>
  add_heatmap(z = volcano, colorscale = "Greys")
```

#### Custom colorscales

`colorscale` also accepts a vector of colors, which are spaced evenly
from 0 to 1.

``` r

go_figure() |>
  add_heatmap(z = volcano, colorscale = c("red", "green"))
```

Or, you can do the scaling yourself and give the colorscale as a
two-column data frame of stops and colors…

``` r

vals <- unique(scales::rescale(c(volcano)))
o <- order(vals, decreasing = FALSE)
cols <- scales::col_numeric("Blues", domain = NULL)(vals)
colz <- setNames(data.frame(vals[o], cols[o]), NULL)
go_figure() |>
  add_heatmap(z = volcano, colorscale = colz)
```
