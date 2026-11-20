# Multiple Chart Types

## Multiple Chart Types in R

How to design figures with multiple chart types in R.

### Chart Types versus Trace Types

Plotly’s figure data structure supports defining
[subplots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/subplots.md)
of [various
types](https://msummersgill.github.io/plotly.R.core/articles/r-docs/subplots.md)
(e.g. [cartesian](https://msummersgill.github.io/plotly.R.core/articles/r-docs/axes.md),
[polar](https://msummersgill.github.io/plotly.R.core/articles/r-docs/polar-chart.md),
[3-dimensional](https://msummersgill.github.io/plotly.R.core/articles/r-docs/index.html#d-charts),
[maps](https://msummersgill.github.io/plotly.R.core/articles/r-docs/index.html#maps)
etc) with attached traces of various compatible types (e.g. scatter,
bar, choropleth, surface etc). This means that **Plotly figures are not
constrained to representing a fixed set of “chart types”** such as
scatter plots only or bar charts only or line charts only: any subplot
can contain multiple traces of different types.

### Multiple Trace Types with Plotly

Every trace type has its own `add_<type>()` function
([`add_bar()`](https://msummersgill.github.io/plotly.R.core/reference/go_bar.md),
[`add_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md),
…), so it is easy to start with a figure containing only traces of a
given type, and add traces of another type.

``` r

library(plotly.core)

data <- data.frame(
  Fruits = c("apples", "bananas", "oranges"),
  Line = c(1, 3, 2),
  Bar = c(2, 1, 3)
)

data |>
  go_figure() |>
  add_bar(x = ~Fruits, y = ~Bar, name = "Last Year") |>
  add_scatter(x = ~Fruits, y = ~Line, mode = "lines", name = "This year") |>
  update_layout(
    yaxis = go_yaxis(title = "Amount"),
    legend = go_legend(title = go_legend_title(text = "<b> Time Period </b>"))
  )
```

#### Line Chart and a Bar Chart

``` r

library(plotly.core)

data <- data.frame(
  X = c(0, 1, 2, 3, 4, 5),
  Line = c(1.5, 1, 1.3, 0.7, 0.8, 0.9),
  Bar = c(1, 0.5, 0.7, -1.2, 0.3, 0.4)
)

data |>
  go_figure() |>
  add_bar(x = ~X, y = ~Bar) |>
  add_scatter(x = ~X, y = ~Line, mode = "lines+markers")
```

#### A Contour and Scatter Plot of the Method of Steepest Descent

``` r

library(plotly.core)
library(jsonlite)

urlfile <- "https://raw.githubusercontent.com/plotly/datasets/master/steepest.json"
data <- fromJSON(url(urlfile))
X <- data[["contour_x"]][, ]
Y <- data[["contour_y"]][, ]
Z <- data[["contour_z"]][, , ]

go_figure() |>
  add_contour(x = X, y = Y, z = Z, showscale = FALSE) |>
  add_scatter(
    x = data$trace_x,
    y = data$trace_y,
    mode = "lines+markers",
    name = "steepest",
    marker = go_scatter_marker(color = "black"),
    line = go_scatter_line(color = "black")
  ) |>
  update_layout(showlegend = FALSE)
```

#### Reference

See
[`go_bar()`](https://msummersgill.github.io/plotly.R.core/reference/go_bar.md),
[`go_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md)
and
[`go_contour()`](https://msummersgill.github.io/plotly.R.core/reference/go_contour.md)
for more information and attribute options!
