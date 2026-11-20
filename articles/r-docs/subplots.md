# Subplots

### Subplots with Plotly

Plotly’s R graphing library makes it easy to create interactive,
publication-quality graphs.

Plotly also has subplot capabilities. This page documents the usage of
the
[`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
function.

#### Simple Subplot

Figures with subplots are created using the
[`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
function, and traces are added to a given subplot with the `row` and
`col` arguments of `add_*()`.

Here is an example of creating a figure that includes two `scatter`
traces which are side-by-side since there are 2 columns and 1 row in the
subplot layout.

``` r

library(plotly.core)

make_subplots(rows = 1, cols = 2) |>
  add_scatter(
    x = c(1, 2, 3),
    y = c(4, 5, 6),
    mode = "lines+markers",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 1,
    col = 1
  ) |>
  add_scatter(
    x = c(20, 30, 40),
    y = c(50, 60, 70),
    mode = "lines+markers",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 1,
    col = 2
  ) |>
  update_layout(plot_bgcolor = "#e5ecf6") |>
  update_xaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  ) |>
  update_yaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  ) |>
  update_layout(title = "Side By Side Subplots")
```

#### Stacked Subplots

Here is an example of creating a figure with subplots that are stacked
on top of each other since there are 3 rows and 1 column in the subplot
layout.

``` r

library(plotly.core)

make_subplots(rows = 3, cols = 1) |>
  add_scatter(
    x = c(3, 4, 5),
    y = c(1000, 1100, 1200),
    mode = "lines+markers",
    row = 1,
    col = 1
  ) |>
  add_scatter(
    x = c(2, 3, 4),
    y = c(100, 110, 120),
    mode = "lines+markers",
    row = 2,
    col = 1
  ) |>
  add_scatter(
    x = c(0, 1, 2),
    y = c(10, 11, 12),
    mode = "lines+markers",
    row = 3,
    col = 1
  ) |>
  update_layout(title = "Stacked Subplots") |>
  update_layout(plot_bgcolor = "#e5ecf6") |>
  update_xaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  ) |>
  update_yaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  )
```

#### Multiple Subplots

Here is an example of creating a 2 x 2 subplot grid and populating each
subplot with `scatter` trace.

``` r

library(plotly.core)

make_subplots(rows = 2, cols = 2) |>
  add_scatter(
    x = c(1, 2, 3),
    y = c(4, 5, 6),
    mode = "lines+markers",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 1,
    col = 1
  ) |>
  add_scatter(
    x = c(20, 30, 40),
    y = c(50, 60, 70),
    mode = "lines+markers",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 1,
    col = 2
  ) |>
  add_scatter(
    x = c(300, 400, 500),
    y = c(600, 700, 800),
    mode = "lines+markers",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 2,
    col = 1
  ) |>
  add_scatter(
    x = c(4000, 5000, 6000),
    y = c(7000, 8000, 9000),
    mode = "lines+markers",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 2,
    col = 2
  ) |>
  update_layout(plot_bgcolor = "#e5ecf6") |>
  update_xaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  ) |>
  update_yaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  )
```

#### Multiple Subplots with Titles

The `subplot_titles` argument of
[`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
can be used to position text annotations as titles for each subplot.

Here is an example of adding subplot titles to a 2 x 2 subplot grid of
scatter traces.

``` r

library(plotly.core)

make_subplots(
  rows = 2,
  cols = 2,
  subplot_titles = c("Plot 1", "Plot 2", "Plot 3", "Plot 4")
) |>
  add_scatter(
    x = c(1, 2, 3),
    y = c(4, 5, 6),
    mode = "lines+markers",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 1,
    col = 1
  ) |>
  add_scatter(
    x = c(20, 30, 40),
    y = c(50, 60, 70),
    mode = "lines+markers",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 1,
    col = 2
  ) |>
  add_scatter(
    x = c(300, 400, 500),
    y = c(600, 700, 800),
    mode = "lines+markers",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 2,
    col = 1
  ) |>
  add_scatter(
    x = c(4000, 5000, 6000),
    y = c(7000, 8000, 9000),
    mode = "lines+markers",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 2,
    col = 2
  ) |>
  update_layout(title = "Multiple Subplots with Titles") |>
  update_layout(plot_bgcolor = "#e5ecf6") |>
  update_xaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  ) |>
  update_yaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  )
```

#### Subplots with Annotations

``` r

library(plotly.core)

make_subplots(rows = 1, cols = 2) |>
  add_scatter(
    x = c(1, 2, 3),
    y = c(4, 5, 6),
    mode = "markers+text",
    text = c("Text D", "Text E", "Text F"),
    textposition = "bottom center",
    texttemplate = "%{text}",
    row = 1,
    col = 1
  ) |>
  add_scatter(
    x = c(20, 30, 40),
    y = c(50, 60, 70),
    mode = "markers+text",
    text = c("Text D", "Text E", "Text F"),
    textposition = "bottom center",
    texttemplate = "%{text}",
    row = 1,
    col = 2
  ) |>
  update_layout(title = "Subplots with Annotations") |>
  update_layout(plot_bgcolor = "#e5ecf6") |>
  update_xaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  ) |>
  update_yaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  )
```

#### Customize Subplot Column Widths and Row Heights

The `column_widths` argument of
[`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
can be used to customize the relative widths of the columns in a subplot
grid. It should be set to a vector of numbers so that they sum to 1, and
used to compute the relative widths of the subplot grid columns. The
`row_heights` argument serves the same purpose for controlling the
relative heights of rows in the subplot grid.

Here is an example of creating a figure with two scatter traces in
side-by-side subplots. The left subplot is set to be wider than the
right one.

``` r

library(plotly.core)

make_subplots(rows = 1, cols = 2, column_widths = c(0.7, 0.3)) |>
  add_scatter(
    x = c(1, 2, 3),
    y = c(4, 5, 6),
    mode = "lines+markers",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 1,
    col = 1
  ) |>
  add_scatter(
    x = c(20, 30, 40),
    y = c(50, 60, 70),
    mode = "lines+markers",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 1,
    col = 2
  ) |>
  update_layout(plot_bgcolor = "#e5ecf6") |>
  update_xaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  ) |>
  update_yaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  )
```

#### Customizing Subplot Axes

After a figure with subplots is created using the
[`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
function, its axis properties (title, font, range, grid style, etc.) can
be customized using the
[`update_xaxes()`](https://msummersgill.github.io/plotly.R.core/reference/update_xaxes.md)
and
[`update_yaxes()`](https://msummersgill.github.io/plotly.R.core/reference/update_yaxes.md)
figure functions. By default, these functions apply to all of the x axes
or y axes in the figure. The `row` and `col` arguments can be used to
control which axes are targeted by the update.

Here is an example that creates a figure with a 2 x 2 subplot grid,
populates each subplot with a scatter trace, and then updates the x and
y axis titles for each subplot individually.

``` r

library(plotly.core)

# initialize figure with subplots
fig <- make_subplots(
  rows = 2,
  cols = 2,
  subplot_titles = c("Plot 1", "Plot 2", "Plot 3", "Plot 4"),
  horizontal_spacing = 0.1,
  vertical_spacing = 0.15
) |>
  add_scatter(
    x = c(1, 2, 3),
    y = c(4, 5, 6),
    mode = "lines+markers",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 1,
    col = 1
  ) |>
  add_scatter(
    x = c(20, 30, 40),
    y = c(50, 60, 70),
    mode = "lines+markers",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 1,
    col = 2
  ) |>
  add_scatter(
    x = c(300, 400, 500),
    y = c(600, 700, 800),
    mode = "lines+markers",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 2,
    col = 1
  ) |>
  add_scatter(
    x = c(4000, 5000, 6000),
    y = c(7000, 8000, 9000),
    mode = "lines+markers",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 2,
    col = 2
  ) |>
  update_layout(title = "Customizing Subplot Axes") |>
  update_layout(plot_bgcolor = "#e5ecf6") |>
  update_xaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  ) |>
  update_yaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  )

# update axis properties
fig <- fig |>
  update_xaxes(title = "xaxis1 title", row = 1, col = 1) |>
  update_xaxes(title = "xaxis2 title", range = c(10, 50), row = 1, col = 2) |>
  update_xaxes(title = "xaxis3 title", showgrid = FALSE, row = 2, col = 1) |>
  update_xaxes(title = "xaxis4 title", type = "log", row = 2, col = 2) |>
  update_yaxes(title = "yaxis1 title", row = 1, col = 1) |>
  update_yaxes(title = "yaxis2 title", range = c(40, 80), row = 1, col = 2) |>
  update_yaxes(title = "yaxis3 title", showgrid = FALSE, row = 2, col = 1) |>
  update_yaxes(title = "yaxis4 title", row = 2, col = 2)

fig
```

#### Subplots with Shared X-Axes

The `shared_xaxes` argument of
[`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
can be used to link the x axes of subplots in the resulting figure. The
`vertical_spacing` argument is used to control the vertical spacing
between rows in the subplot grid.

Here is an example that creates a figure with 3 vertically stacked
subplots with linked x axes. A small `vertical_spacing` value is used to
reduce the spacing between subplot rows.

``` r

library(plotly.core)

make_subplots(
  rows = 3,
  cols = 1,
  shared_xaxes = TRUE,
  vertical_spacing = 0.02
) |>
  add_scatter(
    x = c(3, 4, 5),
    y = c(1000, 1100, 1200),
    mode = "lines+markers",
    row = 1,
    col = 1
  ) |>
  add_scatter(
    x = c(2, 3, 4),
    y = c(100, 110, 120),
    mode = "lines+markers",
    row = 2,
    col = 1
  ) |>
  add_scatter(
    x = c(0, 1, 2),
    y = c(10, 11, 12),
    mode = "lines+markers",
    row = 3,
    col = 1
  ) |>
  update_layout(title = "Stacked Subplots with Shared X-Axes") |>
  update_layout(plot_bgcolor = "#e5ecf6") |>
  update_xaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  ) |>
  update_yaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  )
```

#### Subplots with Shared Y-Axes

The `shared_yaxes` argument can be used to link the y axes of subplots
in the resulting figure.

Here is an example that creates a figure with a 2 x 2 subplot grid,
where the y axes of each row are linked.

``` r

library(plotly.core)

make_subplots(rows = 2, cols = 2, shared_yaxes = TRUE) |>
  add_scatter(
    x = c(1, 2, 3),
    y = c(2, 3, 4),
    mode = "lines+markers",
    row = 1,
    col = 1
  ) |>
  add_scatter(
    x = c(20, 30, 40),
    y = c(5, 5, 5),
    mode = "lines+markers",
    row = 1,
    col = 2
  ) |>
  add_scatter(
    x = c(2, 3, 4),
    y = c(600, 700, 800),
    mode = "lines+markers",
    row = 2,
    col = 1
  ) |>
  add_scatter(
    x = c(4000, 5000, 6000),
    y = c(7000, 8000, 9000),
    mode = "lines+markers",
    row = 2,
    col = 2
  ) |>
  update_layout(title = "Multiple Subplots with Shared Y-Axes") |>
  update_layout(plot_bgcolor = "#e5ecf6") |>
  update_xaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  ) |>
  update_yaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  )
```

### Subplots with Shared Colorscale

To share colorscale information in multiple subplots, you can use a
`coloraxis` (see
[`go_coloraxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_coloraxis.md)).

``` r

library(plotly.core)

make_subplots(rows = 1, cols = 2, shared_yaxes = TRUE) |>
  add_bar(
    x = c(1, 2, 3),
    y = c(4, 5, 6),
    marker = go_bar_marker(color = c(4, 5, 6), coloraxis = "coloraxis"),
    row = 1,
    col = 1
  ) |>
  add_bar(
    x = c(1, 2, 3),
    y = c(2, 3, 5),
    marker = go_bar_marker(color = c(2, 3, 5), coloraxis = "coloraxis"),
    row = 1,
    col = 2
  ) |>
  update_layout(
    showlegend = FALSE,
    coloraxis = go_coloraxis(colorscale = "RdBu")
  ) |>
  update_layout(plot_bgcolor = "#e5ecf6") |>
  update_xaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  ) |>
  update_yaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  )
```

#### Custom Sized Subplot with Subplot Titles

The `specs` argument of
[`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
is used to custom size the individual plots in the subplot: a subplot
can span several columns (`colspan`) or rows (`rowspan`), and `NULL`
marks an empty cell.

Here is an example that creates a 2 by 2 subplot grid containing 3
subplots.

``` r

library(plotly.core)

make_subplots(
  rows = 2,
  cols = 2,
  specs = list(
    list(list(), list()),
    list(list(colspan = 2), NULL)
  ),
  subplot_titles = c("First Subplot", "Second Subplot", "Third Subplot")
) |>
  add_scatter(
    x = c(1, 2),
    y = c(1, 2),
    mode = "lines+markers",
    row = 1,
    col = 1
  ) |>
  add_scatter(
    x = c(1, 2),
    y = c(1, 2),
    mode = "lines+markers",
    row = 1,
    col = 2
  ) |>
  add_scatter(
    x = c(1, 2, 3),
    y = c(2, 1, 2),
    mode = "lines+markers",
    row = 2,
    col = 1
  ) |>
  update_layout(title = "Specs with Subplot Title", showlegend = FALSE) |>
  update_layout(plot_bgcolor = "#e5ecf6") |>
  update_xaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  ) |>
  update_yaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  )
```

#### Multiple Custom Sized Subplots

Here is an example that uses the `rowspan` and `colspan` subplot options
to create a custom subplot layout with subplots of mixed sizes.

``` r

library(plotly.core)

make_subplots(
  rows = 5,
  cols = 2,
  specs = list(
    list(list(), list(rowspan = 2)),
    list(list(), NULL),
    list(list(rowspan = 2, colspan = 2), NULL),
    list(NULL, NULL),
    list(list(), list())
  ),
  print_grid = TRUE
) |>
  add_scatter(
    x = c(1, 2),
    y = c(1, 2),
    mode = "lines+markers",
    name = "(1,1)",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 1,
    col = 1
  ) |>
  add_scatter(
    x = c(1, 2),
    y = c(1, 2),
    mode = "lines+markers",
    name = "(2,1)",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 2,
    col = 1
  ) |>
  add_scatter(
    x = c(1, 2),
    y = c(1, 2),
    mode = "lines+markers",
    name = "(1,2)",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 1,
    col = 2
  ) |>
  add_scatter(
    x = c(1, 2),
    y = c(1, 2),
    mode = "lines+markers",
    name = "(3,1)",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 3,
    col = 1
  ) |>
  add_scatter(
    x = c(1, 2),
    y = c(1, 2),
    mode = "lines+markers",
    name = "(5,1)",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 5,
    col = 1
  ) |>
  add_scatter(
    x = c(1, 2),
    y = c(1, 2),
    mode = "lines+markers",
    name = "(5,2)",
    marker = go_scatter_marker(line = go_scatter_marker_line(width = 3)),
    row = 5,
    col = 2
  ) |>
  update_layout(plot_bgcolor = "#e5ecf6") |>
  update_xaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  ) |>
  update_yaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  )
```

    ## This is the format of your plot grid:
    ## [ (1,1) x,y   ]  ⎡ (1,2) x2,y2 ⎤
    ## [ (2,1) x3,y3 ]  ⎣      :      ⎦
    ## ⎡ (3,1) x4,y4           -      ⎤
    ## ⎣      :                :      ⎦
    ## [ (5,1) x5,y5 ]  [ (5,2) x6,y6 ]

#### Subplots Types

By default, the
[`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
function assumes that the traces that will be added to all subplots are
2-dimensional cartesian traces (e.g. `scatter`, `bar`, `histogram`,
`violin`, etc.). Other subplot types (e.g. `"scene"`, `"polar"`,
`"domain"`) are set with the `type` of a cell in `specs`:

- trace type: A trace type name (e.g. `"bar"`, `"contour"`, `"pie"`,
  `"scatter"`, etc.) which will be used to determine the appropriate
  subplot type for that trace.

Here is an example that creates and populates a 2 x 2 subplot grid
containing 4 different trace types.

``` r

library(plotly.core)

data <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/school_earnings.csv")
density <- density(ggplot2::diamonds$carat)

make_subplots(
  rows = 2,
  cols = 2,
  horizontal_spacing = 0.1,
  vertical_spacing = 0.1
) |>
  add_bar(y = c(2, 3, 1), row = 1, col = 1) |>
  add_scatter(
    data = data,
    x = ~Women,
    y = ~Men,
    text = ~School,
    mode = "markers",
    marker = go_scatter_marker(
      color = ~Gap,
      colorscale = "Reds",
      showscale = FALSE,
      size = ~Gap,
      opacity = 0.5
    ),
    row = 1,
    col = 2
  ) |>
  add_contour(z = ~volcano, showscale = FALSE, row = 2, col = 1) |>
  add_scatter(
    x = density$x,
    y = density$y,
    mode = "lines",
    fill = "tozeroy",
    row = 2,
    col = 2
  ) |>
  update_xaxes(showgrid = FALSE, row = 1, col = 2) |>
  update_yaxes(showgrid = FALSE, row = 1, col = 2) |>
  update_xaxes(title = "Carat", row = 2, col = 2) |>
  update_yaxes(title = "Density", row = 2, col = 2) |>
  update_layout(showlegend = FALSE) |>
  update_layout(plot_bgcolor = "#e5ecf6") |>
  update_xaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  ) |>
  update_yaxes(
    zerolinecolor = "#ffff",
    zerolinewidth = 2,
    gridcolor = "#ffff"
  )
```

#### Reference

All of the axis properties are found in
[`go_xaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis.md)
and
[`go_yaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_yaxis.md);
see also
[Axes](https://msummersgill.github.io/plotly.R.core/articles/r-docs/axes.md).

``` r

help_file <- help(make_subplots, package = "plotly.core")
tools:::Rd2ex(utils:::.getHelpFile(as.character(help_file)))
```

    ## ### Name: make_subplots
    ## ### Title: Create a figure with a grid of subplots
    ## ### Aliases: make_subplots
    ## 
    ## ### ** Examples
    ## 
    ## fig <- make_subplots(rows = 1, cols = 2, subplot_titles = c("Left", "Right")) |>
    ##   add_scatter(x = 1:3, y = c(4, 5, 6), row = 1, col = 1) |>
    ##   add_scatter(x = 20:22, y = c(50, 60, 70), row = 1, col = 2) |>
    ##   update_yaxes(title = "y", row = 1, col = 1)
    ## 
    ## # Mixed subplot types and a secondary y axis
    ## fig <- make_subplots(
    ##   rows = 2, cols = 2,
    ##   specs = list(
    ##     list(list(secondary_y = TRUE), list(type = "domain")),
    ##     list(list(colspan = 2), NULL)
    ##   ),
    ##   print_grid = TRUE
    ## )
