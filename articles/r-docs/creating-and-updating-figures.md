# Creating and Updating Figures

The plotly.core R package exists to create, manipulate and
[render](https://plotly.com/r/getting-started/#rendering-charts)
graphical figures (i.e. charts, plots, maps and diagrams) represented by
data structures also referred to as figures. The rendering process uses
the [Plotly.js JavaScript library](https://plotly.com/javascript/) under
the hood although R developers using this package very rarely need to
interact with the Javascript library directly, if ever. Figures can be
represented in R either as lists or as
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
objects, and are serialized as text in [JavaScript Object Notation
(JSON)](https://json.org/) before being passed to Plotly.js.

### Figures As Lists

Figures can be represented as plain R lists and passed to
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
which validates them and returns a figure that can be displayed. The
`fig` list in the example below describes a figure. It contains a single
`bar` trace and a title.

``` r

library(plotly.core)
fig = list(
  data = list(
    list(
      x = c(1, 2, 3),
      y = c(1, 3, 2),
      type = 'bar'
    )
  ),
  layout = list(
    title = 'A Figure Specified By R List',
    plot_bgcolor = '#e5ecf6',
    xaxis = list(zerolinecolor = '#ffff', zerolinewidth = 2, gridcolor = '#ffff'),
    yaxis = list(zerolinecolor = '#ffff', zerolinewidth = 2, gridcolor = '#ffff')
  )
)
# To display the figure defined by this list, pass it to go_figure()
go_figure(fig)
```

### Graph Objects

The `go_*()` functions
([`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
[`go_bar()`](https://msummersgill.github.io/plotly.R.core/reference/go_bar.md),
[`go_bar_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_bar_marker.md),
[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md),
[`go_xaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis.md),
…) provide an automatically-generated hierarchy of classes that may be
used to represent figures.

Graph objects have several benefits compared to plain R lists.

1.  Graph objects provide precise data validation. If you provide an
    invalid property name or an invalid property value, an error will be
    raised with a helpful message describing the problem.
2.  Graph objects contain descriptions of each valid property in their R
    documentation. You can use the help pages
    (e.g. [`?go_bar`](https://msummersgill.github.io/plotly.R.core/reference/go_bar.md))
    to learn about the available properties as an alternative to
    consulting the online [Full
    Reference](https://plotly.com/r/reference/).
3.  Properties of graph objects can be accessed using list-style lookup
    (e.g. `fig$data[[1]]$x`).
4.  Figures support higher-level convenience functions for making
    updates to already constructed figures
    ([`update_layout()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md),
    [`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md),
    [`update_traces()`](https://msummersgill.github.io/plotly.R.core/reference/select_traces.md),
    etc).
5.  Figures can be displayed directly, saved as HTML with
    [`write_html()`](https://msummersgill.github.io/plotly.R.core/reference/write_html.md)
    and exported as static images with
    [`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md).

Below you can find an example of one way that the figure in the example
above could be specified using graph objects instead of a list.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_bar(x = c(1, 2, 3), y = c(1, 3, 2)) |>
  update_layout(
    title = "A Plotly Figure",
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff"),
    yaxis = go_yaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff")
  )
fig
```

### Converting Figures To Lists and JSON

A
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
is an R list with `data`, `layout` and `frames` elements. You can also
retrieve the JSON string representation of a figure using
[`plotly_json()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_json.md).

``` r

library(plotly.core)
fig <- go_figure() |>
  add_bar(x = c(1, 2, 3), y = c(1, 3, 2))
jfig <- plotly_json(fig, jsonedit = FALSE)

cat("List Representation of a figure:")
```

```
## List Representation of a figure:
```

``` r

str(unclass(fig), max.level = 2)
```

```
## List of 3
##  $ data  :List of 1
##   ..$ :List of 3
##   .. ..- attr(*, "class")= chr [1:2] "go_bar" "plotly_obj"
##  $ layout: Named list()
##   ..- attr(*, "class")= chr [1:2] "go_layout" "plotly_obj"
##  $ frames: list()
```

``` r

cat("JSON Representation of a figure:", jfig, sep = "\n\n")
```

```
## JSON Representation of a figure:
## 
## {
##   "data": [
##     {
##       "type": "bar",
##       "x": [1,2,3],
##       "y": [1,3,2]
##     }
##   ],
##   "layout": {
##     "template": {
##       "layout": {
##         "margin": {
##           "b": 40,
##           "l": 60,
##           "t": 25,
##           "r": 10
##         }
##       }
##     }
##   },
##   "frames": [],
##   "config": {}
## }
```

### Representing Figures in Dash

[Dash for R](https://dashr.plotly.com/) is an open-source framework for
building analytical applications, with no Javascript required, and it is
tightly integrated with the Plotly graphing library.

Learn about how to install Dash for R at
<https://dashr.plot.ly/installation>.

Everywhere in this page that you see fig, you can display the same
figure in a Dash for R application by passing it to the figure argument.

``` r

library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)
library(plotly.core)

fig <- go_figure() |>
  add_scatter(x = c("a", "b", "c"), y = c(1, 3, 2), mode = "lines") |>
  update_layout(title = "sample figure")

app <- Dash$new()

app$layout(
  htmlDiv(
    list(
      dccGraph(id = 'graph', figure=fig),
      htmlPre(
        id='structure',
        style = list(border = 'thin lightgrey solid',
                     overflowY = 'scroll',
                     height = '275px')
      )
    )
  )
)
app$callback(
  output(id = 'structure', property='children'),
  params=list(input(id='graph', property='figure')),
  function(fig_json) {
    jfig <- plotly_json(fig, jsonedit = FALSE)
    return(jfig)
  })
#app$run_server()
```

Use `app$run_server()` to run the dash app.

### Creating Figures

This section summarizes several ways to create new figures with the
plotly.core graphing library.

#### Plotly Scatter Plot

``` r

library(plotly.core)
data(iris)

fig <- go_figure()
for (sp in levels(iris$Species)) {
  fig <- fig |>
    add_scatter(
      data = iris[iris$Species == sp, ],
      x = ~Sepal.Width,
      y = ~Sepal.Length,
      mode = "markers",
      name = sp
    )
}
fig <- fig |>
  update_layout(
    title = "A Plotly Figure",
    legend = go_legend(title = go_legend_title(text = "species")),
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff"),
    yaxis = go_yaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff")
  )
fig
```

#### Make Subplots

The
[`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
function produces a figure that is preconfigured with a grid of subplots
that traces can be added to.

``` r

library(plotly.core)

fig <- make_subplots(rows = 1, cols = 2) |>
  add_scatter(y = c(4, 2, 1), mode = "lines", row = 1, col = 1) |>
  add_bar(y = c(2, 1, 3), row = 1, col = 2) |>
  update_xaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff") |>
  update_yaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff") |>
  update_layout(plot_bgcolor = "#e5ecf6")
fig
```

### Updating Figures

Regardless of how a figure was constructed, it can be updated by adding
additional traces to it and modifying its properties.

#### Adding Traces

New traces can be added to a figure using
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md)
(with a graph object such as
[`go_bar()`](https://msummersgill.github.io/plotly.R.core/reference/go_bar.md))
or the `add_<type>()` functions such as
[`add_bar()`](https://msummersgill.github.io/plotly.R.core/reference/go_bar.md).
This allows you to start with an empty figure, and add traces to it
sequentially.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_trace(go_bar(x = c(1, 2, 3), y = c(1, 3, 2))) |>
  update_xaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff") |>
  update_yaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff") |>
  update_layout(plot_bgcolor = "#e5ecf6")
fig
```

``` r

library(plotly.core)
data(iris)

fig <- go_figure()
for (sp in levels(iris$Species)) {
  fig <- fig |>
    add_scatter(
      data = iris[iris$Species == sp, ],
      x = ~Sepal.Width,
      y = ~Sepal.Length,
      mode = "markers",
      name = sp
    )
}
fig <- fig |>
  update_layout(
    title = "Using The add_trace() method With A Plotly Figure",
    legend = go_legend(title = go_legend_title(text = "species")),
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff"),
    yaxis = go_yaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff")
  ) |>
  add_trace(
    go_scatter(
      x = c(2, 4),
      y = c(4, 8),
      mode = "lines",
      line = go_scatter_line(color = "grey"),
      showlegend = FALSE
    )
  )
fig
```

#### Updating Figure Layouts

Figures support an
[`update_layout()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md)
function that may be used to update multiple nested properties of a
figure’s layout.

Here is an example of updating the font size of a figure’s title using
[`update_layout()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md).

``` r

library(plotly.core)

fig <- go_figure() |>
  add_bar(x = c(1, 2, 3), y = c(1, 3, 2)) |>
  update_layout(
    title = go_layout_title(
      text = "Using update_layout() With Plotly Figures",
      font = go_font(size = 17)
    ),
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff"),
    yaxis = go_yaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff")
  )
fig
```

#### Updating Traces

Figures support an
[`update_traces()`](https://msummersgill.github.io/plotly.R.core/reference/select_traces.md)
function that may be used to update multiple nested properties of one or
more of a figure’s traces.

To show some examples, we will start with a figure that contains `bar`
and `scatter` traces across two subplots.

``` r

library(plotly.core)

fig <- make_subplots(rows = 1, cols = 2) |>
  add_bar(
    x = c(0, 1, 2),
    y = c(2, 1, 3),
    name = "b",
    marker = go_bar_marker(color = "red"),
    row = 1,
    col = 1
  ) |>
  add_scatter(
    x = c(0, 1, 2),
    y = c(4, 2, 3.5),
    mode = "markers",
    name = "a",
    marker = go_scatter_marker(size = 20, color = "rgb(51, 204, 51)"),
    row = 1,
    col = 1
  ) |>
  add_bar(
    x = c(0, 1, 2),
    y = c(1, 3, 2),
    name = "c",
    marker = go_bar_marker(color = "#33cc33"),
    row = 1,
    col = 2
  ) |>
  add_scatter(
    x = c(0, 1, 2),
    y = c(2, 3.5, 4),
    mode = "markers",
    name = "d",
    marker = go_scatter_marker(size = 20, color = "rgb(255, 0, 0)"),
    row = 1,
    col = 2
  ) |>
  update_xaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff") |>
  update_yaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff") |>
  update_layout(plot_bgcolor = "#e5ecf6")
fig
```

Note that both `scatter` and `bar` traces have a `marker.color` property
to control their coloring. Here is an example of using
[`update_traces()`](https://msummersgill.github.io/plotly.R.core/reference/select_traces.md)
to modify the color of all traces.

``` r

library(plotly.core)

fig <- make_subplots(rows = 1, cols = 2) |>
  add_bar(
    x = c(0, 1, 2),
    y = c(2, 1, 3),
    name = "b",
    marker = go_bar_marker(color = "red"),
    row = 1,
    col = 1
  ) |>
  add_scatter(
    x = c(0, 1, 2),
    y = c(4, 2, 3.5),
    mode = "markers",
    name = "a",
    marker = go_scatter_marker(size = 20, color = "rgb(51, 204, 51)"),
    row = 1,
    col = 1
  ) |>
  add_bar(
    x = c(0, 1, 2),
    y = c(1, 3, 2),
    name = "c",
    marker = go_bar_marker(color = "#33cc33"),
    row = 1,
    col = 2
  ) |>
  add_scatter(
    x = c(0, 1, 2),
    y = c(2, 3.5, 4),
    mode = "markers",
    name = "d",
    marker = go_scatter_marker(size = 20, color = "rgb(255, 0, 0)"),
    row = 1,
    col = 2
  ) |>
  update_xaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff") |>
  update_yaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff") |>
  update_layout(plot_bgcolor = "#e5ecf6") |>
  update_traces(marker = go_bar_marker(color = "blue"))
fig
```

The
[`update_traces()`](https://msummersgill.github.io/plotly.R.core/reference/select_traces.md)
function supports a `selector` argument to control which traces should
be updated. Only traces that match the selector (a trace type, trace
indices, a named list of property values, or a function) will be
updated. `row` and `col` restrict the update to the traces of one
subplot. Here is an example of using a selector to only update the color
of the `bar` traces.

``` r

library(plotly.core)

fig <- make_subplots(rows = 1, cols = 2) |>
  add_bar(
    x = c(0, 1, 2),
    y = c(2, 1, 3),
    name = "b",
    marker = go_bar_marker(color = "red"),
    row = 1,
    col = 1
  ) |>
  add_scatter(
    x = c(0, 1, 2),
    y = c(4, 2, 3.5),
    mode = "markers",
    name = "a",
    marker = go_scatter_marker(size = 20, color = "rgb(51, 204, 51)"),
    row = 1,
    col = 1
  ) |>
  add_bar(
    x = c(0, 1, 2),
    y = c(1, 3, 2),
    name = "c",
    marker = go_bar_marker(color = "#33cc33"),
    row = 1,
    col = 2
  ) |>
  add_scatter(
    x = c(0, 1, 2),
    y = c(2, 3.5, 4),
    mode = "markers",
    name = "d",
    marker = go_scatter_marker(size = 20, color = "rgb(255, 0, 0)"),
    row = 1,
    col = 2
  ) |>
  update_xaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff") |>
  update_yaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff") |>
  update_layout(plot_bgcolor = "#e5ecf6") |>
  update_traces(marker = go_bar_marker(color = "blue"), selector = "bar")
fig
```

### Overwrite Existing Properties When Using Update Methods

[`update_traces()`](https://msummersgill.github.io/plotly.R.core/reference/select_traces.md)
and
[`update_layout()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md)
merge the new values into existing nested properties. Use
`overwrite = TRUE` to replace the prior value of existing properties
with the provided value instead.

In the example below, the red color of markers is overwritten when
updating `marker` with `overwrite = TRUE`.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_bar(x = c(1, 2, 3), y = c(1, 3, 2), marker = go_bar_marker(color = "red")) |>
  update_xaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff") |>
  update_yaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff") |>
  update_layout(plot_bgcolor = "#e5ecf6")

update_traces(fig, marker = go_bar_marker(opacity = 0.4), overwrite = TRUE)
```

#### Updating Figure Axes

Figures support
[`update_xaxes()`](https://msummersgill.github.io/plotly.R.core/reference/update_xaxes.md)
and
[`update_yaxes()`](https://msummersgill.github.io/plotly.R.core/reference/update_yaxes.md)
functions that may be used to update multiple nested properties of one
or more of a figure’s axes. Here is an example of using
[`update_xaxes()`](https://msummersgill.github.io/plotly.R.core/reference/update_xaxes.md)
to disable the vertical grid lines across all subplots in a figure.

``` r

library(plotly.core)
data(iris)

species <- levels(iris$Species)
fig <- make_subplots(
  rows = 1,
  cols = 3,
  shared_yaxes = TRUE,
  subplot_titles = paste0("species=", species)
)
for (i in seq_along(species)) {
  fig <- fig |>
    add_scatter(
      data = iris[iris$Species == species[[i]], ],
      x = ~Sepal.Width,
      y = ~Sepal.Length,
      mode = "markers",
      name = species[[i]],
      row = 1,
      col = i
    )
}
fig <- fig |>
  update_annotations(font = go_font(size = 10)) |>
  update_layout(
    title = "Updating x axis in a Plotly Figure",
    legend = go_legend(title = go_legend_title(text = "species")),
    plot_bgcolor = "#e5ecf6"
  ) |>
  update_yaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff") |>
  update_xaxes(zerolinecolor = "#ffff", zerolinewidth = 2, showgrid = FALSE)

fig
```

### Other Update Methods

Figures created with the plotly.core graphing library also support:

- [`update_layout_images()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout_images.md)
  in order to [update background layout
  images](https://msummersgill.github.io/plotly.R.core/articles/r-docs/images.md),
- [`update_annotations()`](https://msummersgill.github.io/plotly.R.core/reference/update_annotations.md)
  in order to [update
  annotations](https://msummersgill.github.io/plotly.R.core/articles/r-docs/text-and-annotations.md),
- and
  [`update_shapes()`](https://msummersgill.github.io/plotly.R.core/reference/update_shapes.md)
  in order to [update
  shapes](https://msummersgill.github.io/plotly.R.core/articles/r-docs/shapes.md).

#### Chaining Figure Operations

All of the figure update operations described above are functions that
return the modified figure. This makes it possible to chain multiple
figure modification operations together into a single expression with
the pipe.

Here is an example of a chained expression that:

- sets the title font size using `layout.title.font.size`,
- disables vertical grid lines using
  [`update_xaxes()`](https://msummersgill.github.io/plotly.R.core/reference/update_xaxes.md),
- updates the size and color of the markers and bar using
  [`update_traces()`](https://msummersgill.github.io/plotly.R.core/reference/select_traces.md),
- and then displaying the figure.

``` r

library(plotly.core)

t <- go_font(size = 15)

fig <- go_figure() |>
  add_bar(x = c(0, 1, 2), y = c(2, 1, 3), name = "b", marker = go_bar_marker(color = "red")) |>
  add_scatter(
    x = c(0, 1, 2),
    y = c(4, 2, 3.5),
    mode = "markers",
    name = "a",
    marker = go_scatter_marker(size = 10, color = "rgb(51, 204, 51)")
  ) |>
  # updates the size and color of the markers and bar
  update_traces(marker = go_scatter_marker(size = 20, color = "blue"), selector = "scatter") |>
  update_traces(
    marker = go_bar_marker(
      color = "yellow",
      line = go_bar_marker_line(color = "rgb(8,48,107)", width = 1.5)
    ),
    selector = "bar"
  ) |>
  update_layout(
    title = go_layout_title(
      text = "Chaining Multiple Figure Operations With A Plotly Figure",
      # setting the title font size
      font = t
    ),
    plot_bgcolor = "#e5ecf6"
  ) |>
  # disables vertical grid lines
  update_xaxes(showgrid = FALSE, zerolinecolor = "#ffff", zerolinewidth = 2) |>
  update_yaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff")
# displaying the figure
fig 
```

#### Property Assignment

Trace and layout properties can be updated using property assignment
syntax. Here is an example of setting the figure title using property
assignment.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_bar(x = c(1, 2, 3), y = c(1, 3, 2)) |>
  update_xaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff") |>
  update_yaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff") |>
  update_layout(plot_bgcolor = "#e5ecf6")
fig$layout$title <- go_layout_title(text = "Using Property Assignment Syntax With A Plotly Figure")

fig
```

And here is an example of updating the bar outline using property
assignment.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_bar(x = c(1, 2, 3), y = c(1, 3, 2)) |>
  update_xaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff") |>
  update_yaxes(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "#ffff") |>
  update_layout(plot_bgcolor = "#e5ecf6")
fig$data[[1]]$marker$line$color <- "black"
fig$data[[1]]$marker$line$width <- 4

fig
```
