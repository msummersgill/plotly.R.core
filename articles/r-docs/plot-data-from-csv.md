# Plot CSV Data

CSV or comma-delimited-values is a very popular format for storing
structured data. In this tutorial, we will see how to plot beautiful
graphs using csv data. We will learn how to import csv data from an
external source (a URL), and plot it using Plotly.

First we import the data and look at it.

``` r

data <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/2014_apple_stock.csv')
head(data)
```

    ##       AAPL_x   AAPL_y
    ## 1 2014-01-02 77.44539
    ## 2 2014-01-03 77.04558
    ## 3 2014-01-06 74.89697
    ## 4 2014-01-07 75.85646
    ## 5 2014-01-08 75.09195
    ## 6 2014-01-09 76.20263

### Plot from CSV with Plotly

``` r

library(plotly.core)

data <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2014_apple_stock.csv")

go_figure() |>
  add_scatter(
    x = as.Date(data$AAPL_x),
    y = data$AAPL_y,
    mode = "lines",
    name = "Share Prices (in USD)"
  ) |>
  update_layout(
    title = "Apple Share Prices over time (2014)",
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(
      title = "AAPL_x",
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "ffff"
    ),
    yaxis = go_yaxis(
      title = "AAPL_y",
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "ffff"
    ),
    showlegend = TRUE,
    width = 1100
  )
```

#### Reference

See [Getting
Started](https://msummersgill.github.io/plotly.R.core/articles/r-docs/getting-started.md)
for more information about plotly.core!
