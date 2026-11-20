# Discrete Colors

### Discrete vs Continuous Color

In the same way as the X or Y position of a mark in cartesian
coordinates can be used to represent continuous values (i.e. amounts or
moments in time) or categories (i.e. labels), color can be used to
represent continuous or discrete data. This page is about using color to
represent **categorical** data using discrete colors, but Plotly can
also [represent continuous values with
color](https://msummersgill.github.io/plotly.R.core/articles/r-docs/builtin-colorscales.md).

### Discrete Color Concepts

This document explains the following discrete-color-related concepts:

- **color sequences** are lists of colors to be mapped onto discrete
  data values. No interpolation occurs when using color sequences,
  unlike with [continuous color
  scales](https://msummersgill.github.io/plotly.R.core/articles/r-docs/builtin-colorscales.md),
  and each color is used as-is. The default color sequence comes from
  the layout’s `colorway` attribute and can be explicitly specified
  using a vector of colors, as in `update_layout(colorway = c(...))`.
- **legends** are visible representations of the mapping between colors
  and data values. Legend markers also change shape when used with
  various kinds of traces, such as symbols or lines for scatter-like
  traces. [Legends are
  configurable](https://msummersgill.github.io/plotly.R.core/articles/r-docs/legend.md)
  under the `layout.legend` attribute
  ([`go_legend()`](https://msummersgill.github.io/plotly.R.core/reference/go_legend.md)).
  Legends are the discrete equivalent of [continuous color
  bars](https://msummersgill.github.io/plotly.R.core/articles/r-docs/builtin-colorscales.md)

### Discrete Color with Plotly

With plotly.core, discrete colors come from mapping a color property
(such as a marker’s `color`) to a **factor, character or logical**
column: the data is split into **one trace per category**, and each
trace gets the next color of the color sequence and its own legend
entry. Continuous color comes from passing **numeric** values to a
marker’s `color` together with a `colorscale`. This means that numeric
strings must be parsed to be used for continuous color, and conversely,
numbers used as category codes are best converted to strings.

For example, in the `tips` dataset, the `smoker` column is a factor, so
its values get discrete colors:

``` r

library(plotly.core)
data("tips", package = "reshape2")

tips |>
  go_figure() |>
  add_scatter(
    x = ~total_bill,
    y = ~tip,
    mode = "markers",
    marker = go_scatter_marker(color = ~smoker)
  ) |>
  update_layout(
    title = "String 'smoker' values mean discrete colors",
    legend = go_legend(title = go_legend_title(text = "smoker")),
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    ),
    yaxis = go_yaxis(
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    )
  )
```

The `size` column, however, contains numbers:

``` r

library(plotly.core)
data("tips", package = "reshape2")

tips |>
  go_figure() |>
  add_scatter(
    x = ~total_bill,
    y = ~tip,
    mode = "markers",
    marker = go_scatter_marker(
      color = ~size,
      colorscale = "Viridis",
      showscale = TRUE
    )
  ) |>
  update_layout(
    title = "Numeric 'size' values mean continuous color",
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    ),
    yaxis = go_yaxis(
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    )
  )
```

Converting this column to strings is very straightforward, and
`split = ~size` then adds one trace per value, but note that the legend
lists the values in sorted order, which is the order in which their
traces are added (see below for how to control discrete order):

``` r

library(plotly.core)
data("tips", package = "reshape2")

tips$size <- as.character(tips$size) #convert to string

tips |>
  go_figure() |>
  add_scatter(
    x = ~total_bill,
    y = ~tip,
    mode = "markers",
    split = ~size
  ) |>
  update_layout(
    title = "String 'size' values mean discrete colors",
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    ),
    yaxis = go_yaxis(
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    )
  )
```

### Color Sequences in Plotly

By default, Plotly uses the color sequence from the layout’s `colorway`
attribute, which comes from the default `plotly` template. You can
choose any of the following built-in qualitative color sequences
however, or define your own.

``` r

library("RColorBrewer")
display.brewer.all(type = "qual")
```

Here is an example that creates a scatter plot using Plotly, with points
colored using the qualitative `Accent` color sequence from RColorBrewer,
passed to `colorway`. Set `colorway` before adding the traces: the
colors are taken from it when the column is mapped.

``` r

library(plotly.core)
library(gapminder)
data("gapminder")

gapminder |>
  go_figure() |>
  update_layout(colorway = RColorBrewer::brewer.pal(5, "Accent")) |>
  add_scatter(
    x = ~year,
    y = ~lifeExp,
    mode = "lines",
    line = go_scatter_line(color = ~continent)
  ) |>
  update_layout(
    title = "Built-in Accent color sequence",
    legend = go_legend(title = go_legend_title(text = "continent")),
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    ),
    yaxis = go_yaxis(
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    )
  )
```

### Explicitly Constructing a Color Sequence

The layout’s `colorway` attribute accepts explicitly-constructed color
sequences as well, as vectors of CSS colors:

``` r

library(plotly.core)
library(gapminder)
data("gapminder")

data <- gapminder[gapminder$year == 2007, ]

data |>
  go_figure() |>
  update_layout(colorway = c("red", "green", "blue", "goldenrod", "magenta")) |>
  add_bar(
    x = ~pop,
    y = ~continent,
    width = 1,
    orientation = "h",
    text = ~country,
    hovertemplate = paste(
      "<b>%{text}</b>",
      "<br><b>Continent</b>: %{y}<br>",
      "<i>pop</i>: $%{x}"
    ),
    marker = go_bar_marker(color = ~continent)
  ) |>
  update_layout(
    title = "Explicit color sequence",
    legend = go_legend(title = go_legend_title(text = "continent")),
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    ),
    yaxis = go_yaxis(
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    )
  )
```

***Warning***: If you give colors to fewer traces than the number of
unique values in the column you are splitting on, the given colors will
be used for some values and the default color sequence for the other
values:

``` r

library(plotly.core)
data("tips", package = "reshape2")

pal <- c("red", "blue")

fig <- go_figure()
days <- unique(tips$day)
for (k in seq_along(days)) {
  fig <- fig |>
    add_scatter(
      data = tips[tips$day == days[[k]], ],
      x = ~total_bill,
      y = ~tip,
      mode = "markers",
      name = as.character(days[[k]]),
      marker = if (k <= length(pal)) go_scatter_marker(color = pal[[k]])
    )
}
fig <- fig |>
  update_layout(
    title = "Ambiguous! given colors mapped to some values only",
    legend = go_legend(title = go_legend_title(text = "day")),
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    ),
    yaxis = go_yaxis(
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    )
  )

fig
```

### Directly Mapping Colors to Data Values

The example above assigned colors to data values on a
first-come-first-served basis, but you can directly map colors to data
values if this is important to your application, by looking up the
colors of the column’s levels in a named vector and passing them, in
level order, as the `colorway`. Note that this does not change the order
in which values appear in the figure or legend, as can be controlled
below:

``` r

library(plotly.core)
library(gapminder)
data("gapminder")

pal <- c("red", "green", "blue", "goldenrod", "magenta")
pal <- setNames(pal, c("Europe", "Asia", "Americas", "Oceania", "Africa"))

data |>
  go_figure() |>
  update_layout(colorway = unname(pal[levels(data$continent)])) |>
  add_bar(
    x = ~pop,
    y = ~continent,
    width = 1,
    orientation = "h",
    text = ~country,
    hovertemplate = paste(
      "<b>%{text}</b>",
      "<br><b>Continent</b>: %{y}<br>",
      "<i>pop</i>: $%{x}"
    ),
    marker = go_bar_marker(color = ~continent)
  ) |>
  update_layout(
    title = "Explicit color mapping",
    legend = go_legend(title = go_legend_title(text = "continent")),
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    ),
    yaxis = go_yaxis(
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    )
  )
```

If your data set already contains valid CSS colors which you wish to use
directly, you can pass them to the marker’s `color`
(e.g. `go_bar_marker(color = ...)`) of a single trace, in which case
there is no legend entry per color, and the color does not appear in the
hover label:

``` r

library(plotly.core)

go_figure() |>
  add_bar(
    x = c("a", "b", "c"),
    y = c(1, 3, 2),
    marker = go_bar_marker(color = c("red", "goldenrod", "#00D"))
  ) |>
  update_layout(
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(
      title = "x",
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    ),
    yaxis = go_yaxis(
      title = "y",
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    )
  )
```

### Controlling Discrete Color Order

Plotly lets you specify an ordering over categorical variables with
`categoryorder`, which will apply to
[axes](https://msummersgill.github.io/plotly.R.core/articles/r-docs/axes.md);
the legend follows the order in which traces are added. This can be used
with either `colorway` or explicitly mapped colors.

``` r

library(plotly.core)
library(gapminder)
data("gapminder")

data <- gapminder[gapminder$year == 2007, ]

pal <- c("green", "blue", "magenta", "red", "goldenrod")
pal <- setNames(pal, c("Europe", "Asia", "Americas", "Oceania", "Africa"))

data |>
  go_figure() |>
  update_layout(colorway = unname(pal[levels(data$continent)])) |>
  add_bar(
    x = ~pop,
    y = ~continent,
    width = 1,
    orientation = "h",
    text = ~country,
    hovertemplate = paste(
      "<b>%{text}</b>",
      "<br><b>Continent</b>: %{y}<br>",
      "<i>pop</i>: $%{x}"
    ),
    marker = go_bar_marker(color = ~continent)
  ) |>
  update_layout(
    title = "Explicit color sequence with explicit ordering",
    legend = go_legend(title = go_legend_title(text = "continent")),
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    ),
    yaxis = go_yaxis(
      categoryorder = "array",
      categoryarray = c("Asia", "Oceania", "Europe", "Africa", "Americas"),
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    ),
    bargap = 1
  )
```

``` r

library(plotly.core)
library(gapminder)
data("gapminder")

data <- gapminder[gapminder$year == 2007, ]

pal <- c("red", "green", "blue", "goldenrod", "magenta")
pal <- setNames(pal, c("Europe", "Asia", "Americas", "Oceania", "Africa"))

data |>
  go_figure() |>
  update_layout(colorway = unname(pal[levels(data$continent)])) |>
  add_bar(
    x = ~pop,
    y = ~continent,
    width = 1,
    orientation = "h",
    text = ~country,
    hovertemplate = paste(
      "<b>%{text}</b>",
      "<br><b>Continent</b>: %{y}<br>",
      "<i>pop</i>: $%{x}"
    ),
    marker = go_bar_marker(color = ~continent)
  ) |>
  update_layout(
    title = "Explicit color mapping with explicit ordering",
    legend = go_legend(title = go_legend_title(text = "continent")),
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    ),
    yaxis = go_yaxis(
      categoryorder = "array",
      categoryarray = c("Asia", "Oceania", "Europe", "Africa", "Americas"),
      zerolinecolor = "#ffff",
      zerolinewidth = 2,
      gridcolor = "#ffff"
    ),
    bargap = 1
  )
```
