# Contour Plots

### Basic Contour

``` r

library(plotly.core)

go_figure() |>
  add_contour(z = volcano)
```

### Set X and Y Coordinates

``` r

library(plotly.core)

go_figure() |>
  add_contour(
    x = c(-9, -6, -5, -3, -1),
    y = c(0, 1, 4, 5, 7),
    z = matrix(
    c(
      10, 10.625, 12.5, 15.625, 20, 5.625, 6.25, 8.125,
      11.25, 15.625, 2.5, 3.125, 5, 8.125, 12.5, 0.625,
      1.25, 3.125, 6.25, 10.625, 0, 0.625, 2.5, 5.625,
      10
    ),
    nrow = 5,
    ncol = 5
  )
  )
```

### Set Size and Range of a Contours

``` r

library(plotly.core)

go_figure() |>
  add_contour(
    z = matrix(
    c(
      10, 10.625, 12.5, 15.625, 20, 5.625, 6.25, 8.125,
      11.25, 15.625, 2.5, 3.125, 5, 8.125, 12.5, 0.625,
      1.25, 3.125, 6.25, 10.625, 0, 0.625, 2.5, 5.625,
      10
    ),
    nrow = 5,
    ncol = 5
  ),
    colorscale = "Jet",
    autocontour = FALSE,
    contours = go_contour_contours(
      start = 0,
      end = 8,
      size = 2
    )
  )
```

### Smoothing Contour Lines

``` r

library(plotly.core)

z <- matrix(
  c(
    2, 4, 7, 12, 13, 14, 15, 16, 3, 1, 6, 11, 12, 13,
    16, 17, 4, 2, 7, 7, 11, 14, 17, 18, 5, 3, 8, 8, 13,
    15, 18, 19, 7, 4, 10, 9, 16, 18, 20, 19, 9, 10, 5, 27,
    23, 21, 21, 21, 11, 14, 17, 26, 25, 24, 23, 22
  ),
  nrow = 7,
  ncol = 8
)

make_subplots(rows = 1, cols = 2) |>
  add_contour(
    z = z,
    autocontour = TRUE,
    contours = go_contour_contours(end = 26, size = 2, start = 2),
    line = go_contour_line(smoothing = 0),
    row = 1,
    col = 1
  ) |>
  add_contour(
    z = z,
    autocontour = TRUE,
    contours = go_contour_contours(end = 26, size = 2, start = 2),
    line = go_contour_line(smoothing = 0.85),
    row = 1,
    col = 2
  )
```

### Smoothing Contour Coloring

``` r

library(plotly.core)

go_figure() |>
  add_contour(
    z = matrix(
    c(
      10, 10.625, 12.5, 15.625, 20, 5.625, 6.25, 8.125,
      11.25, 15.625, 2.5, 3.125, 5, 8.125, 12.5, 0.625,
      1.25, 3.125, 6.25, 10.625, 0, 0.625, 2.5, 5.625,
      10
    ),
    nrow = 5,
    ncol = 5
  ),
    contours = go_contour_contours(coloring = "heatmap")
  )
```

### Add Contour Labels

``` r

library(plotly.core)

go_figure() |>
  add_contour(
    z = volcano,
    contours = go_contour_contours(showlabels = TRUE),
    colorbar = go_colorbar(title = go_colorbar_title(text = "Elevation <br> in meters"))
  )
```

### Create Matrix and Plot Contour

This example is based on
[this](https://www.r-statistics.com/2016/07/using-2d-contour-plots-within-ggplot2-to-visualize-relationships-between-three-variables/)
r-statistics post.

``` r

library(plotly.core)
library(stringr)
library(reshape2)

data.loess <- loess(qsec ~ wt * hp, data = mtcars)

# Create a sequence of incrementally increasing (by 0.3 units) values for both wt and hp
xgrid <-  seq(min(mtcars$wt), max(mtcars$wt), 0.3)
ygrid <-  seq(min(mtcars$hp), max(mtcars$hp), 0.3)
# Generate a dataframe with every possible combination of wt and hp
data.fit <-  expand.grid(wt = xgrid, hp = ygrid)
# Feed the dataframe into the loess model and receive a matrix output with estimates of
# acceleration for each combination of wt and hp
mtrx3d <-  predict(data.loess, newdata = data.fit)
# Abbreviated display of final matrix
mtrx3d[1:4, 1:4]
```

    ##           hp
    ## wt         hp= 52.0 hp= 52.3 hp= 52.6 hp= 52.9
    ##   wt=1.513 19.04237 19.03263 19.02285 19.01302
    ##   wt=1.813 19.25566 19.24637 19.23703 19.22764
    ##   wt=2.113 19.55298 19.54418 19.53534 19.52645
    ##   wt=2.413 20.06436 20.05761 20.05077 20.04383

``` r

# Transform data to long form
mtrx.melt <- melt(mtrx3d, id.vars = c('wt', 'hp'), measure.vars = 'qsec')
names(mtrx.melt) <- c('wt', 'hp', 'qsec')
# Return data to numeric form
mtrx.melt$wt <- as.numeric(str_sub(mtrx.melt$wt, str_locate(mtrx.melt$wt, '=')[1,1] + 1))
mtrx.melt$hp <-  as.numeric(str_sub(mtrx.melt$hp, str_locate(mtrx.melt$hp, '=')[1,1] + 1))

mtrx.melt |>
  go_figure() |>
  add_contour(x = ~wt, y = ~hp, z = ~qsec) |>
  update_layout(width = 600, height = 500)
```

### 2D Density Contour Plot

``` r

library(plotly.core)

x <- rnorm(200)
y <- rnorm(200)

make_subplots(
  rows = 2,
  cols = 2,
  row_heights = c(0.2, 0.8),
  column_widths = c(0.8, 0.2),
  horizontal_spacing = 0,
  vertical_spacing = 0,
  shared_xaxes = TRUE,
  shared_yaxes = TRUE
) |>
  add_histogram(x = x, row = 1, col = 1) |>
  add_histogram2dcontour(x = x, y = y, row = 2, col = 1) |>
  add_histogram(y = y, row = 2, col = 2) |>
  update_layout(showlegend = FALSE)
```

### Contour Colorscales

See [here](https://plotly.com/r/colorscales/) for more examples
concerning colorscales!

### Reference

See
[`go_contour()`](https://msummersgill.github.io/plotly.R.core/reference/go_contour.md)
for more information and chart attribute options!
