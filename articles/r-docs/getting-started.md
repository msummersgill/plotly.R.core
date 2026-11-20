# Getting Started with Plotly

## Getting Started with Plotly for R

[`plotly.core`](https://github.com/msummersgill/plotly.R.core) is an R
package for creating interactive web-based graphs via the open source
JavaScript graphing library
[`plotly.js`](https://plotly.com/javascript/). Figures are built from
typed graph objects
([`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`add_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md),
[`go_scatter_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter_marker.md),
…) that validate every property against the plotly.js schema.

Graphs created with `plotly.core` are rendered *locally* through the
[`htmlwidgets`](http://www.htmlwidgets.org/) framework.

### Installation

#### Download from GitHub

`plotly.core` has not been submitted to CRAN yet. Install the
development version from GitHub via the
[`remotes`](https://cran.r-project.org/package=remotes) R package:

``` r

remotes::install_github("msummersgill/plotly.R.core")
```

#### Note For `RStudio` Users

`RStudio` users should ensure that they are using the latest [RStudio
release](https://posit.co/download/rstudio-desktop/) in order to ensure
compatibility with the `htmlwidgets` R package.

### Rendering Charts

By default, figures created with `plotly.core` render locally in your
web browser or in the `RStudio` viewer.

``` r

library(plotly.core)

midwest <- ggplot2::midwest

fig <- go_figure()
for (st in sort(unique(midwest$state))) {
  fig <- fig |>
    add_box(data = midwest[midwest$state == st, ], x = ~percollege, name = st)
}

fig
```

Simply printing the figure object will render the chart locally in your
web browser or in the `RStudio` viewer.

Graphs created with `plotly.core` are interactive!

Click on legend entries to hide/show traces, click-and-drag on the chart
to zoom, double-click to autoscale, shift-and-drag to pan.

### Next Steps

Once you have installed `plotly.core`, learn more about the [structure
of a
figure](https://msummersgill.github.io/plotly.R.core/articles/r-docs/figure-structure.md)
and start making [basic
charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/bar-charts.md).
