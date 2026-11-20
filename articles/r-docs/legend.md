# Legends

### Legend Names

``` r

library(plotly.core)
library(tidyr)
library(plyr)

data <- spread(Orange, Tree, circumference)
data <- rename(data, c("1" = "Tree1", "2" = "Tree2", "3" = "Tree3", "4" = "Tree4", "5" = "Tree5"))

data |>
  go_figure() |>
  add_scatter(x = ~age, y = ~Tree1, mode = "lines", name = "Tree 1") |>
  add_scatter(x = ~age, y = ~Tree2, mode = "lines", name = "Tree 2") |>
  add_scatter(x = ~age, y = ~Tree3, mode = "lines", name = "Tree 3") |>
  add_scatter(x = ~age, y = ~Tree4, mode = "lines", name = "Tree 4") |>
  add_scatter(x = ~age, y = ~Tree5, mode = "lines", name = "Tree 5")
```

### Hiding the Legend

``` r

library(plotly.core)
library(tidyr)
library(plyr)

data <- spread(Orange, Tree, circumference)
data <- rename(data, c("1" = "Tree1", "2" = "Tree2", "3" = "Tree3", "4" = "Tree4", "5" = "Tree5"))

data |>
  go_figure() |>
  add_scatter(x = ~age, y = ~Tree1, mode = "lines") |>
  add_scatter(x = ~age, y = ~Tree2, mode = "lines") |>
  add_scatter(x = ~age, y = ~Tree3, mode = "lines") |>
  add_scatter(x = ~age, y = ~Tree4, mode = "lines") |>
  add_scatter(x = ~age, y = ~Tree5, mode = "lines") |>
  update_layout(showlegend = FALSE)
```

### Hiding Legend Entries

``` r

library(plotly.core)
library(tidyr)
library(plyr)

data <- spread(Orange, Tree, circumference)
data <- rename(data, c("1" = "Tree1", "2" = "Tree2", "3" = "Tree3", "4" = "Tree4", "5" = "Tree5"))

data |>
  go_figure() |>
  add_scatter(x = ~age, y = ~Tree1, mode = "lines", name = "Tree 1") |>
  add_scatter(x = ~age, y = ~Tree2, mode = "lines", name = "Tree 2") |>
  add_scatter(
    x = ~age,
    y = ~Tree3,
    mode = "lines",
    name = "Tree 3",
    showlegend = FALSE
  ) |>
  add_scatter(x = ~age, y = ~Tree4, mode = "lines", name = "Tree 4") |>
  add_scatter(x = ~age, y = ~Tree5, mode = "lines", name = "Tree 5")
```

### Positioning the Legend Inside the Plot

``` r

library(plotly.core)
library(tidyr)
library(plyr)

data <- spread(Orange, Tree, circumference)
data <- rename(data, c("1" = "Tree1", "2" = "Tree2", "3" = "Tree3", "4" = "Tree4", "5" = "Tree5"))

data |>
  go_figure() |>
  add_scatter(x = ~age, y = ~Tree1, mode = "lines", name = "Tree 1") |>
  add_scatter(x = ~age, y = ~Tree2, mode = "lines", name = "Tree 2") |>
  add_scatter(x = ~age, y = ~Tree3, mode = "lines", name = "Tree 3") |>
  add_scatter(x = ~age, y = ~Tree4, mode = "lines", name = "Tree 4") |>
  add_scatter(x = ~age, y = ~Tree5, mode = "lines", name = "Tree 5") |>
  update_layout(legend = go_legend(x = 0.1, y = 0.9))
```

### Positioning the Legend Outside the Plot

``` r

library(plotly.core)
library(tidyr)
library(plyr)

data <- spread(Orange, Tree, circumference)
data <- rename(data, c("1" = "Tree1", "2" = "Tree2", "3" = "Tree3", "4" = "Tree4", "5" = "Tree5"))

data |>
  go_figure() |>
  add_scatter(x = ~age, y = ~Tree1, mode = "lines", name = "Tree 1") |>
  add_scatter(x = ~age, y = ~Tree2, mode = "lines", name = "Tree 2") |>
  add_scatter(x = ~age, y = ~Tree3, mode = "lines", name = "Tree 3") |>
  add_scatter(x = ~age, y = ~Tree4, mode = "lines", name = "Tree 4") |>
  add_scatter(x = ~age, y = ~Tree5, mode = "lines", name = "Tree 5") |>
  update_layout(legend = go_legend(x = 1.1, y = 0.5))
```

### Changing the Legend Orientation

``` r

library(plotly.core)
library(tidyr)
library(plyr)

data <- spread(Orange, Tree, circumference)
data <- rename(data, c("1" = "Tree1", "2" = "Tree2", "3" = "Tree3", "4" = "Tree4", "5" = "Tree5"))

data |>
  go_figure() |>
  add_scatter(x = ~age, y = ~Tree1, mode = "lines", name = "Tree 1") |>
  add_scatter(x = ~age, y = ~Tree2, mode = "lines", name = "Tree 2") |>
  add_scatter(x = ~age, y = ~Tree3, mode = "lines", name = "Tree 3") |>
  add_scatter(x = ~age, y = ~Tree4, mode = "lines", name = "Tree 4") |>
  add_scatter(x = ~age, y = ~Tree5, mode = "lines", name = "Tree 5") |>
  update_layout(legend = go_legend(orientation = "h"))
```

### Styling the Legend

``` r

library(plotly.core)
library(tidyr)
library(plyr)

data <- spread(Orange, Tree, circumference)
data <- rename(data, c("1" = "Tree1", "2" = "Tree2", "3" = "Tree3", "4" = "Tree4", "5" = "Tree5"))

l <- go_legend(
  font = go_font(
    family = "sans-serif",
    size = 12,
    color = "#000"
  ),
  bgcolor = "#E2E2E2",
  bordercolor = "#FFFFFF",
  borderwidth = 2
)

data |>
  go_figure() |>
  add_scatter(x = ~age, y = ~Tree1, mode = "lines", name = "Tree 1") |>
  add_scatter(x = ~age, y = ~Tree2, mode = "lines", name = "Tree 2") |>
  add_scatter(x = ~age, y = ~Tree3, mode = "lines", name = "Tree 3") |>
  add_scatter(x = ~age, y = ~Tree4, mode = "lines", name = "Tree 4") |>
  add_scatter(x = ~age, y = ~Tree5, mode = "lines", name = "Tree 5") |>
  update_layout(legend = l)
```

### Size of Legend Items

In this example, since the `itemsizing` attribute of
[`go_legend()`](https://msummersgill.github.io/plotly.R.core/reference/go_legend.md)
is set to `constant`, the size of legend items symbols remains the same,
regardless of how tiny/huge the bubbles are in the graph.

``` r

library(plotly.core)

go_figure() |>
  add_scatter(
    x = c(1, 2, 3, 4, 5),
    y = c(1, 2, 3, 4, 5),
    mode = "markers",
    marker = go_scatter_marker(size = 10)
  ) |>
  add_scatter(
    x = c(1, 2, 3, 4, 5),
    y = c(5, 4, 3, 2, 1),
    mode = "markers",
    marker = go_scatter_marker(size = 100)
  ) |>
  update_layout(legend = go_legend(itemsizing = "constant"))
```

### Legend Title

``` r

library(plotly.core)

go_figure() |>
  add_scatter(
    mode = "lines",
    x = c(1, 2, 3, 4, 5),
    y = c(1, 2, 3, 4, 5),
    name = "Increasing"
  ) |>
  add_scatter(
    mode = "lines",
    x = c(1, 2, 3, 4, 5),
    y = c(5, 4, 3, 2, 1),
    name = "Decreasing"
  ) |>
  update_layout(
    legend = go_legend(title = go_legend_title(text = "<b> Trend </b>"))
  )
```

### Grouped Legend

Plotly legends are interactive. Click on the legend entries to hide and
show traces. The *legendgroup* key groups legend entries so that
clicking on one legend entry will hide or show all of the traces in that
group.

``` r

library(plotly.core)
library(tidyr)
library(plyr)

data <- spread(Orange, Tree, circumference)
data <- rename(data, c("1" = "Tree1", "2" = "Tree2", "3" = "Tree3", "4" = "Tree4", "5" = "Tree5"))

data |>
  go_figure() |>
  add_scatter(
    x = ~age,
    y = ~Tree1,
    mode = "lines",
    legendgroup = "group1",
    name = "Zone 1 - Tree 1"
  ) |>
  add_scatter(
    x = ~age,
    y = ~Tree2,
    mode = "lines",
    legendgroup = "group2",
    name = "Zone 2 - Tree 1"
  ) |>
  add_scatter(
    x = ~age,
    y = ~Tree3,
    mode = "lines",
    legendgroup = "group1",
    name = "Zone 1 - Tree 2"
  ) |>
  add_scatter(
    x = ~age,
    y = ~Tree4,
    mode = "lines",
    legendgroup = "group2",
    name = "Zone 2 - Tree 2"
  ) |>
  add_scatter(
    x = ~age,
    y = ~Tree5,
    mode = "lines",
    legendgroup = "group1",
    name = "Zone 1 - Tree 3"
  )
```

### Subplot Grouped Legend

``` r

library(plotly.core)

df <- data.frame(x = c("a", "b", "c"), y = c(2, 3, 2), y2 = c(4, 2, 4))

make_subplots(rows = 2, cols = 1, shared_xaxes = TRUE) |>
  update_layout(colorway = c("#66C2A5", "#FC8D62", "#8DA0CB")) |>
  add_bar(
    data = df,
    x = ~x,
    y = ~y,
    legendgroup = ~x,
    marker = go_bar_marker(color = ~x),
    row = 1,
    col = 1
  ) |>
  add_bar(
    data = df,
    x = ~x,
    y = ~y2,
    legendgroup = ~x,
    showlegend = FALSE,
    marker = go_bar_marker(color = ~x),
    row = 2,
    col = 1
  ) |>
  update_xaxes(showgrid = FALSE) |>
  update_yaxes(showgrid = FALSE)
```

Reference

See
[`go_legend()`](https://msummersgill.github.io/plotly.R.core/reference/go_legend.md)
for more information and chart attribute options!
