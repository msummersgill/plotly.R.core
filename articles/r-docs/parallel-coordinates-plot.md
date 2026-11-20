# Parallel Coordinates Plot

### Adding Dimensions

``` r

library(plotly.core)

go_figure() |>
  add_parcoords(
    line = go_parcoords_line(color = "blue"),
    dimensions = list(
      go_parcoords_dimension(
        range = c(1, 5),
        constraintrange = c(1, 2),
        label = "A",
        values = c(1, 4)
      ),
      go_parcoords_dimension(
        range = c(1, 5),
        tickvals = c(1.5, 3, 4.5),
        label = "B",
        values = c(3, 1.5)
      ),
      go_parcoords_dimension(
        range = c(1, 5),
        tickvals = c(1, 2, 4, 5),
        label = "C",
        values = c(2, 4),
        ticktext = c("text 1", "text 2", "text 3", "text 4")
      ),
      go_parcoords_dimension(range = c(1, 5), label = "D", values = c(4, 2))
    )
  )
```

### Basic Parallel Cordinates Plot

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/bcdunbar/datasets/master/iris.csv")

df |>
  go_figure() |>
  add_parcoords(
    line = go_parcoords_line(
      color = ~species_id,
      colorscale = list(c(0, "red"), c(0.5, "green"), c(1, "blue"))
    ),
    dimensions = list(
      go_parcoords_dimension(range = c(2, 4.5), label = "Sepal Width", values = ~sepal_width),
      go_parcoords_dimension(
        range = c(4, 8),
        constraintrange = c(5, 6),
        label = "Sepal Length",
        values = ~sepal_length
      ),
      go_parcoords_dimension(range = c(0, 2.5), label = "Petal Width", values = ~petal_width),
      go_parcoords_dimension(range = c(1, 7), label = "Petal Length", values = ~petal_length)
    )
  )
```

### Advanced Parallel Coordinates Plot

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/bcdunbar/datasets/master/parcoords_data.csv")

df |>
  go_figure() |>
  add_parcoords(
    line = go_parcoords_line(
      color = ~colorVal,
      colorscale = "Jet",
      showscale = TRUE,
      reversescale = TRUE,
      cmin = -4000,
      cmax = -100
    ),
    dimensions = list(
      go_parcoords_dimension(
        range = range(df$blockHeight),
        constraintrange = c(100000, 150000),
        label = "Block Height",
        values = ~blockHeight
      ),
      go_parcoords_dimension(
        range = range(df$blockWidth),
        label = "Block Width",
        values = ~blockWidth
      ),
      go_parcoords_dimension(
        tickvals = c(0, 0.5, 1, 2, 3),
        ticktext = c("A", "AB", "B", "Y", "Z"),
        label = "Cyclinder Material",
        values = ~cycMaterial
      ),
      go_parcoords_dimension(
        range = c(-1, 4),
        tickvals = c(0, 1, 2, 3),
        label = "Block Material",
        values = ~blockMaterial
      ),
      go_parcoords_dimension(
        range = range(df$totalWeight),
        visible = TRUE,
        label = "Total Weight",
        values = ~totalWeight
      ),
      go_parcoords_dimension(
        range = range(df$assemblyPW),
        label = "Assembly Penalty Weight",
        values = ~assemblyPW
      ),
      go_parcoords_dimension(range = range(df$HstW), label = "Height st Width", values = ~HstW),
      go_parcoords_dimension(range = range(df$minHW), label = "Min Height Width", values = ~minHW),
      go_parcoords_dimension(range = range(df$minWD), label = "Min Width Diameter", values = ~minWD),
      go_parcoords_dimension(range = range(df$rfBlock), label = "RF Block", values = ~rfBlock)
    )
  ) |>
  update_layout(width = 1000, height = 600)
```

\#Reference

See
[`go_parcoords()`](https://msummersgill.github.io/plotly.R.core/reference/go_parcoords.md)
for more information and options!
