# Pie Charts

### Basic Pie Chart

``` r

library(plotly.core)

USPersonalExpenditure <- data.frame("Categorie"=rownames(USPersonalExpenditure), USPersonalExpenditure)
data <- USPersonalExpenditure[,c('Categorie', 'X1960')]

data |>
  go_figure() |>
  add_pie(labels = ~Categorie, values = ~X1960) |>
  update_layout(title = "United States Personal Expenditures by Categories in 1960")
```

### Styled Pie Chart

``` r

library(plotly.core)

USPersonalExpenditure <- data.frame("Categorie" = rownames(USPersonalExpenditure), USPersonalExpenditure)
data <- USPersonalExpenditure[, c('Categorie', 'X1960')]

colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')

data |>
  go_figure() |>
  add_pie(
    labels = ~Categorie,
    values = ~X1960,
    textposition = "inside",
    textinfo = "label+percent",
    insidetextfont = go_font(color = "#FFFFFF"),
    hoverinfo = "text",
    text = ~paste("$", X1960, " billions"),
    marker = go_pie_marker(
      colors = colors,
      line = go_pie_marker_line(color = "#FFFFFF", width = 1)
    ),
    # The 'pull' attribute can also be used to create space between the sectors
    showlegend = FALSE
  ) |>
  update_layout(title = "United States Personal Expenditures by Categories in 1960")
```

### Subplots

In order to create pie chart subplots, you need to use the `domain`
attribute
([`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)).
It is important to note that the `x` array sets the horizontal position
whilst the `y` array sets the vertical. For example,
`x = c(0, 0.5), y = c(0, 0.5)` would mean the bottom left position of
the plot.

``` r

library(plotly.core)
library(dplyr)

diamonds <- ggplot2::diamonds

go_figure() |>
  add_pie(
    data = count(diamonds, cut),
    labels = ~cut,
    values = ~n,
    name = "Cut",
    domain = go_domain(x = c(0, 0.4), y = c(0.4, 1))
  ) |>
  add_pie(
    data = count(diamonds, color),
    labels = ~color,
    values = ~n,
    name = "Color",
    domain = go_domain(x = c(0.6, 1), y = c(0.4, 1))
  ) |>
  add_pie(
    data = count(diamonds, clarity),
    labels = ~clarity,
    values = ~n,
    name = "Clarity",
    domain = go_domain(x = c(0.25, 0.75), y = c(0, 0.6))
  ) |>
  update_layout(title = "Pie Charts with Subplots", showlegend = FALSE)
```

### Subplots Using Grid

This example uses the layout `grid` attribute
([`go_grid()`](https://msummersgill.github.io/plotly.R.core/reference/go_grid.md))
for the subplots. Reference the row and column destination using the
`domain` attribute
([`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)).

``` r

library(plotly.core)
library(dplyr)

diamonds <- ggplot2::diamonds

go_figure() |>
  add_pie(
    data = count(diamonds, cut),
    labels = ~cut,
    values = ~n,
    name = "Cut",
    domain = go_domain(row = 0, column = 0)
  ) |>
  add_pie(
    data = count(diamonds, color),
    labels = ~color,
    values = ~n,
    name = "Color",
    domain = go_domain(row = 0, column = 1)
  ) |>
  add_pie(
    data = count(diamonds, clarity),
    labels = ~clarity,
    values = ~n,
    name = "Clarity",
    domain = go_domain(row = 1, column = 0)
  ) |>
  add_pie(
    data = count(diamonds, cut),
    labels = ~cut,
    values = ~n,
    name = "Clarity",
    domain = go_domain(row = 1, column = 1)
  ) |>
  update_layout(
    title = "Pie Charts with Subplots",
    showlegend = FALSE,
    grid = go_grid(rows = 2, columns = 2)
  )
```

[`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
with `specs` of `type = "domain"` can also place pies in a grid. See
more examples of subplots
[here](https://msummersgill.github.io/plotly.R.core/articles/r-docs/subplots.md).

#### Controlling text orientation inside sunburst sectors

The `insidetextorientation` attribute controls the orientation of text
inside sectors. With “auto” the texts may automatically be rotated to
fit with the maximum size inside the slice. Using “horizontal” (resp.
“radial”, “tangential”) forces text to be horizontal (resp. radial or
tangential). Note that plotly.js may reduce the font size in order to
fit the text with the requested orientation.

``` r

library(plotly.core)

labels = c('Oxygen','Hydrogen','Carbon_Dioxide','Nitrogen')
values = c(4500, 2500, 1053, 500)

go_figure() |>
  add_pie(
    labels = labels,
    values = values,
    textinfo = "label+percent",
    insidetextorientation = "radial"
  )
```

### Donut Chart

``` r

library(plotly.core)
library(dplyr)

# Get Manufacturer
mtcars$manuf <- sapply(strsplit(rownames(mtcars), " "), "[[", 1)

df <- mtcars
df <- df %>% group_by(manuf)
df <- df %>% summarize(count = n())
df |>
  go_figure() |>
  add_pie(labels = ~manuf, values = ~count, hole = 0.6) |>
  update_layout(title = "Donut charts using Plotly", showlegend = FALSE)
```

### Reference

See
[`go_pie()`](https://msummersgill.github.io/plotly.R.core/reference/go_pie.md)
for more information and chart attribute options!
