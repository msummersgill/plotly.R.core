# WebGL Heatmaps

#### Heatmap from an Image

The WebGL `heatmapgl` trace was removed from plotly.js; the regular
heatmap trace
([`add_heatmap()`](https://msummersgill.github.io/plotly.R.core/reference/go_heatmap.md))
handles large images well.

``` r

library(jpeg)
library(plotly.core)

# Image processing
url <- "https://images.plot.ly/plotly-documentation/images/heatmap-galaxy.jpg"
tmpf <- tempfile()
download.file(url, tmpf, mode = "wb")
data <- readJPEG(tmpf)
fr <- file.remove(tmpf) # remove the downloaded temp file

zdata <- rowSums(data * 255, dims = 2)

go_figure() |>
  add_heatmap(
    z = zdata,
    colorscale = c("blue", "white", "red")
  )
```

#### Reference

See
[`go_heatmap()`](https://msummersgill.github.io/plotly.R.core/reference/go_heatmap.md)
for more information and options!
