# Horizontal and Vertical Lines and Rectangles

## Horizontal and Vertical Lines and Rectangles in R

How to add annotated horizontal and vertical lines in R.

### Horizontal and Vertical Lines and Rectangles

Horizontal and vertical lines and rectangles that span an entire plot
can be added via the `shapes` argument of
[`update_layout()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md)
(or one at a time with
[`add_shape()`](https://msummersgill.github.io/plotly.R.core/reference/add_shape.md)).
Shapes added with these methods are added as [layout
shapes](https://msummersgill.github.io/plotly.R.core/articles/r-docs/shapes.md).
These shapes are fixed to the endpoints of one axis, regardless of the
range of the plot, and fixed to data coordinates on the other axis. The
following shows some possibilities, try panning and zooming the
resulting figure to see how the shapes stick to some axes:

``` r

library(plotly.core)
data("iris")

hline <- function(y = 0, color = "black") {
  go_shape(
    type = "line",
    x0 = 0,
    x1 = 1,
    xref = "paper",
    y0 = y,
    y1 = y,
    line = go_shape_line(color = color)
  )
}

fig <- iris |>
  go_figure() |>
  add_scatter(x = ~Petal.Length, y = ~Petal.Width, mode = "markers") |>
  update_layout(
    shapes = list(
      hline(0.9),
      go_shape(type = "rect", line = go_shape_line(color = "black"), x0 = 0.9, x1 = 2)
    ),
    plot_bgcolor = "#e5ecf6"
  )

fig
```

The shapes can also be filled with a specified color using `fillcolor`
and the lines can also be changed to dotted lines using the `dash`
parameter.

``` r

library(plotly.core)
data("iris")

vline <- function(x = 0, color = "green") {
  go_shape(
    type = "line",
    y0 = 0,
    y1 = 1,
    yref = "paper",
    x0 = x,
    x1 = x,
    line = go_shape_line(color = color, dash = "dot")
  )
}

fig <- iris |>
  go_figure() |>
  add_scatter(x = ~Petal.Length, y = ~Petal.Width, mode = "markers") |>
  update_layout(
    plot_bgcolor = "#e5ecf6",
    shapes = list(
      vline(2.5),
      go_shape(
        type = "rect",
        fillcolor = "red",
        line = go_shape_line(color = "red"),
        opacity = 0.2,
        y0 = 0.9,
        y1 = 2.6,
        x0 = 0.5,
        x1 = 7.5
      )
    )
  )

fig
```

### Horizontal and Vertical Lines in Dash

[Dash for R](https://dashr.plotly.com) is an open-source framework for
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
data("iris")

vline <- function(x = 0, color = "green") {
  go_shape(
    type = "line",
    y0 = 0,
    y1 = 1,
    yref = "paper",
    x0 = x,
    x1 = x,
    line = go_shape_line(color = color, dash = "dot")
  )
}

app <- Dash$new()

app$layout(
  htmlDiv(
    list(
      dccGraph(id = "graph-with-slider"),
      htmlLabel("Position of hline"),
      dccSlider(
        id = "slider",
        min = 1,
        max = 7,
        marks = c("", "1", "", "", "", "", "", "7"),
        value = 2.5,
        step = 0.1
      )
    )
  )
)
app$callback(
  output(id = "graph-with-slider", property = "figure"),
  params = list(input(id = "slider", property = "value")),
  function(value) {
    iris |>
      go_figure() |>
      add_scatter(x = ~Petal.Length, y = ~Petal.Width, mode = "markers") |>
      update_layout(
        plot_bgcolor = "#e5ecf6",
        shapes = list(
          vline(value),
          go_shape(
            type = "rect",
            fillcolor = "red",
            line = go_shape_line(color = "red"),
            opacity = 0.2,
            y0 = 0.9,
            y1 = 2.6,
            x0 = 0.5,
            x1 = 7.5
          )
        )
      )
  }
)
```

After executing this code, give app\$run_server() in the console to
start the dash.

### Adding Text Annotations

[Text
annotations](https://msummersgill.github.io/plotly.R.core/articles/r-docs/text-and-annotations.md)
can optionally be added next to a shape with a text-only scatter trace
(`add_scatter(mode = "text")`), positioned using the `x` and `y`
arguments. The stock prices below are weekly closing prices of six tech
stocks, normalized to their value on January 1, 2018:

``` r

library(plotly.core)

stocks_url <- "https://raw.githubusercontent.com/plotly/plotly.py/main/plotly/package_data/datasets/stocks.csv.gz"
stocks_file <- tempfile(fileext = ".csv.gz")
download.file(stocks_url, stocks_file, quiet = TRUE)
stock <- read.csv(stocks_file)
names(stock) <- c("Dates", "GOOG", "AAPL", "AMZN", "META", "NFLX", "MSFT")
tickers <- c("GOOG", "AAPL", "AMZN", "META", "NFLX", "MSFT")

hline <- function(y = 0, color = "black") {
  go_shape(
    type = "line",
    x0 = 0,
    x1 = 1,
    xref = "paper",
    y0 = y,
    y1 = y,
    line = go_shape_line(color = color, dash = "dot")
  )
}

decline <- go_shape(
  type = "rect",
  fillcolor = "green",
  line = go_shape_line(color = "green"),
  opacity = 0.2,
  y0 = 0.6,
  y1 = 2.25,
  x0 = "2018-10-01",
  x1 = "2018-12-17"
)

fig <- go_figure()
for (tk in tickers) {
  fig <- fig |>
    add_scatter(x = stock$Dates, y = stock[[tk]], name = tk, mode = "lines")
}

fig <- fig |>
  add_scatter(
    showlegend = FALSE,
    mode = "text",
    x = c("2018-11-01", "2019-09-20"),
    y = c(2.2, 0.95),
    text = c("decline", "Jan 1, 2018 baseline")
  ) |>
  update_layout(
    legend = go_legend(title = go_legend_title(text = "company")),
    shapes = list(decline, hline(1)),
    xaxis = go_xaxis(title = "date"),
    yaxis = go_yaxis(title = "value"),
    plot_bgcolor = "#e5ecf6"
  )

fig
```

Extra formatting of the annotation can be done by adding `textfont`
argument.

``` r

library(plotly.core)

stocks_url <- "https://raw.githubusercontent.com/plotly/plotly.py/main/plotly/package_data/datasets/stocks.csv.gz"
stocks_file <- tempfile(fileext = ".csv.gz")
download.file(stocks_url, stocks_file, quiet = TRUE)
stock <- read.csv(stocks_file)
names(stock) <- c("Dates", "GOOG", "AAPL", "AMZN", "META", "NFLX", "MSFT")
tickers <- c("GOOG", "AAPL", "AMZN", "META", "NFLX", "MSFT")

hline <- function(y = 0, color = "black") {
  go_shape(
    type = "line",
    x0 = 0,
    x1 = 1,
    xref = "paper",
    y0 = y,
    y1 = y,
    line = go_shape_line(color = color, dash = "dot")
  )
}

decline <- go_shape(
  type = "rect",
  fillcolor = "green",
  line = go_shape_line(color = "green"),
  opacity = 0.2,
  y0 = 0.6,
  y1 = 2.25,
  x0 = "2018-10-01",
  x1 = "2018-12-17"
)

fig <- go_figure()
for (tk in tickers) {
  fig <- fig |>
    add_scatter(x = stock$Dates, y = stock[[tk]], name = tk, mode = "lines")
}

fig <- fig |>
  add_scatter(
    showlegend = FALSE,
    mode = "text",
    x = c("2018-11-10", "2019-08-20"),
    y = c(2.2, 0.95),
    text = c("decline", "Jan 1, 2018 baseline"),
    textfont = go_font(
      color = c("#000000", "blue"),
      size = c(20, 20),
      family = c("Open Sans", "Times New Roman")
    )
  ) |>
  update_layout(
    legend = go_legend(title = go_legend_title(text = "company")),
    plot_bgcolor = "#e5ecf6",
    shapes = list(decline, hline(1)),
    xaxis = go_xaxis(title = "date"),
    yaxis = go_yaxis(title = "value")
  )

fig
```

### Adding to Multiple Facets / Subplots

The same line or box can be added to several subplots of a
[`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
figure by passing `row` and `col` to
[`add_shape()`](https://msummersgill.github.io/plotly.R.core/reference/add_shape.md).
Using `"x domain"` as the `xref` makes the line span the whole width of
that subplot.

``` r

library(plotly.core)

stocks_url <- "https://raw.githubusercontent.com/plotly/plotly.py/main/plotly/package_data/datasets/stocks.csv.gz"
stocks_file <- tempfile(fileext = ".csv.gz")
download.file(stocks_url, stocks_file, quiet = TRUE)
stock <- read.csv(stocks_file)
names(stock) <- c("Dates", "GOOG", "AAPL", "AMZN", "META", "NFLX", "MSFT")
tickers <- c("GOOG", "AAPL", "AMZN", "META", "NFLX", "MSFT")

# which subplots get the baseline and the "decline" rectangle
has_hline <- c(GOOG = TRUE, AAPL = TRUE, AMZN = FALSE, META = FALSE, NFLX = FALSE, MSFT = FALSE)
has_rect <- c(GOOG = TRUE, AAPL = FALSE, AMZN = TRUE, META = FALSE, NFLX = TRUE, MSFT = FALSE)

fig <- make_subplots(
  rows = 3,
  cols = 2,
  subplot_titles = paste0("company=", tickers)
)

for (i in seq_along(tickers)) {
  tk <- tickers[[i]]
  row <- (i - 1) %/% 2 + 1
  col <- (i - 1) %% 2 + 1
  fig <- fig |>
    add_scatter(x = stock$Dates, y = stock[[tk]], name = tk, mode = "lines", row = row, col = col)
  if (has_rect[[tk]]) {
    fig <- fig |>
      add_shape(
        type = "rect",
        fillcolor = "green",
        line = go_shape_line(color = "green"),
        opacity = 0.2,
        y0 = 0.6,
        y1 = 2,
        x0 = "2018-10-01",
        x1 = "2018-12-17",
        row = row,
        col = col
      ) |>
      add_scatter(
        showlegend = FALSE,
        mode = "text",
        x = "2018-11-05",
        y = 1.9,
        text = "decline",
        row = row,
        col = col
      )
  }
  if (has_hline[[tk]]) {
    fig <- fig |>
      add_shape(
        type = "line",
        x0 = 0,
        x1 = 1,
        xref = "x domain",
        y0 = 1,
        y1 = 1,
        line = go_shape_line(color = "black", dash = "dot"),
        row = row,
        col = col
      ) |>
      add_scatter(
        showlegend = FALSE,
        mode = "text",
        x = "2019-10-20",
        y = 0.95,
        text = "Jan 1, 2018 baseline",
        row = row,
        col = col
      )
  }
}

fig <- fig |>
  update_xaxes(title = "", zeroline = FALSE, showline = FALSE, showticklabels = FALSE) |>
  update_xaxes(title = "Date", showticklabels = TRUE, row = 3) |>
  update_yaxes(range = c(0.5, 2)) |>
  update_yaxes(title = "value", col = 1) |>
  update_yaxes(title = "", showticklabels = FALSE, col = 2) |>
  update_annotations(font = go_font(size = 10)) |>
  update_layout(
    legend = go_legend(title = go_legend_title(text = "company")),
    plot_bgcolor = "#e5ecf6"
  )

fig
```

### Reference

More details are available about [layout
shapes](https://msummersgill.github.io/plotly.R.core/articles/r-docs/shapes.md)
and
[annotations](https://msummersgill.github.io/plotly.R.core/articles/r-docs/text-and-annotations.md),
[adding
line](https://msummersgill.github.io/plotly.R.core/articles/r-docs/shapes.html#lines),
[adding
rectangle](https://msummersgill.github.io/plotly.R.core/articles/r-docs/shapes.html#rectangles).
