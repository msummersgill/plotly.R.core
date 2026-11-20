# Text and Annotations

### Text Mode

``` r

library(plotly.core)

Primates <- c("Potar monkey", "Gorilla", "Human", "Rhesus monkey", "Chimp")
Bodywt <- c(10.0, 207.0, 62.0, 6.8, 52.2)
Brainwt <- c(115, 406, 1320, 179, 440)
data <- data.frame(Primates, Bodywt, Brainwt)

data |>
  go_figure() |>
  add_scatter(
    x = ~Bodywt,
    y = ~Brainwt,
    mode = "text",
    text = ~Primates,
    textposition = "middle right",
    textfont = go_font(color = "#000000", size = 16)
  ) |>
  update_layout(
    title = "Primates Brain and Body Weight",
    xaxis = go_xaxis(title = "Body Weight (kg)", zeroline = TRUE, range = c(0, 250)),
    yaxis = go_yaxis(title = "Brain Weight (g)", range = c(0, 1400))
  )
```

See more options on the `textposition` argument in
[`go_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md).

### Styling Text

``` r

library(plotly.core)

data <- mtcars[which(mtcars$am == 1 & mtcars$gear == 4), ]

t <- go_font(family = "sans serif", size = 14, color = "rgb(127, 127, 127)")

data |>
  go_figure() |>
  add_scatter(x = ~wt, y = ~mpg, mode = "markers") |>
  add_scatter(
    x = ~wt,
    y = ~mpg,
    text = rownames(data),
    mode = "text",
    textfont = t,
    textposition = "top right"
  ) |>
  update_layout(xaxis = go_xaxis(range = c(1.6, 3.2)), showlegend = FALSE)
```

### Controlling text fontsize with uniformtext

For the
[pie](https://msummersgill.github.io/plotly.R.core/articles/r-docs/pie-charts.md),
[bar](https://msummersgill.github.io/plotly.R.core/articles/r-docs/bar-charts.md),
[sunburst](https://msummersgill.github.io/plotly.R.core/articles/r-docs/sunburst-charts.md)
and
[treemap](https://msummersgill.github.io/plotly.R.core/articles/r-docs/treemaps.md)
traces, it is possible to force all the text labels to have the same
size thanks to the `uniformtext` layout parameter. The `minsize`
attribute sets the font size, and the `mode` attribute sets what happens
for labels which cannot fit with the desired fontsize: either `hide`
them or `show` them with overflow.

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv", stringsAsFactors = FALSE)
df <- df[which(df$year == 2007 & df$continent == "Europe" & df$pop > 2.e6), ]

df |>
  go_figure() |>
  add_bar(
    x = ~country,
    y = ~pop,
    text = ~lifeExp,
    name = "",
    hovertemplate = paste("%{x}", "<br>lifeExp: %{text:.2s}<br>"),
    texttemplate = "%{y:.2s}",
    textposition = "outside"
  ) |>
  update_layout(uniformtext = go_uniformtext(minsize = 8, mode = "hide"))
```

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv", stringsAsFactors = FALSE)
df <- df[which(df$year == 2007 & df$continent == "Asia"), ]

df |>
  go_figure() |>
  add_pie(labels = ~country, values = ~pop, textposition = "inside") |>
  update_layout(uniformtext = go_uniformtext(minsize = 12, mode = "hide"))
```

### Adding Informations to Default Hover Text

``` r

library(plotly.core)

iris |>
  go_figure() |>
  add_scatter(
    x = ~Petal.Length,
    y = ~Petal.Width,
    mode = "markers",
    text = ~paste("Species: ", Species)
  )
```

### Custom Hover Text

``` r

library(plotly.core)

iris |>
  go_figure() |>
  add_scatter(
    x = ~Petal.Length,
    y = ~Petal.Width,
    mode = "markers",
    hoverinfo = "text",
    text = ~paste(
      "</br> Species: ", Species,
      "</br> Petal Length: ", Petal.Length,
      "</br> Petal Width: ", Petal.Width
    )
  )
```

### Single Annotation

``` r

library(plotly.core)

m <- mtcars[which.max(mtcars$mpg), ]

mtcars |>
  go_figure() |>
  add_scatter(x = ~wt, y = ~mpg, mode = "markers") |>
  add_annotation(
    x = m$wt,
    y = m$mpg,
    text = rownames(m),
    xref = "x",
    yref = "y",
    showarrow = TRUE,
    arrowhead = 7,
    ax = 20,
    ay = -40
  )
```

### Multiple Annotations

``` r

library(plotly.core)

data <- mtcars[which(mtcars$am == 1 & mtcars$gear == 4), ]

data |>
  go_figure() |>
  add_scatter(
    x = ~wt,
    y = ~mpg,
    mode = "markers",
    marker = go_scatter_marker(size = 10)
  ) |>
  add_annotation(
    x = data$wt,
    y = data$mpg,
    text = rownames(data),
    xref = "x",
    yref = "y",
    showarrow = TRUE,
    arrowhead = 4,
    arrowsize = .5,
    ax = 20,
    ay = -40
  )
```

### Subplot Annotations

``` r

library(plotly.core)

economics <- ggplot2::economics
m <- economics[which.max(economics$unemploy), ]
n <- economics[which.max(economics$uempmed), ]

# figure labels
f <- go_font(family = "Courier New, monospace", size = 18, color = "#7f7f7f")

make_subplots(rows = 1, cols = 2) |>
  add_scatter(
    data = economics,
    x = ~date,
    y = ~unemploy,
    mode = "lines",
    name = "unemploy",
    row = 1,
    col = 1
  ) |>
  add_scatter(
    data = economics,
    x = ~date,
    y = ~uempmed,
    mode = "lines",
    name = "uempmed",
    row = 1,
    col = 2
  ) |>
  add_annotation(
    x = m$date,
    y = m$unemploy,
    text = "annotation a",
    xref = "x",
    yref = "y",
    showarrow = TRUE,
    arrowhead = 7,
    ax = 20,
    ay = -40
  ) |>
  add_annotation(
    x = n$date,
    y = n$uempmed,
    text = "annotation b",
    xref = "x2",
    yref = "y2",
    showarrow = TRUE,
    arrowhead = 7,
    ax = 20,
    ay = -40
  ) |>
  update_xaxes(title = go_xaxis_title(text = "x Axis", font = f)) |>
  update_yaxes(title = go_yaxis_title(text = "y Axis", font = f))
```

### 3D Annotations

``` r

library(plotly.core)

go_figure() |>
  add_scatter3d(
    x = c("2017-01-01", "2017-02-10", "2017-03-20"),
    y = c("A", "B", "C"),
    z = c(1, 1000, 100000),
    name = "z"
  ) |>
  update_layout(
    scene = go_scene(
      aspectratio = go_scene_aspectratio(x = 1, y = 1, z = 1),
      camera = go_scene_camera(
        center = go_scene_camera_center(x = 0, y = 0, z = 0),
        eye = go_scene_camera_eye(
          x = 1.96903462608,
          y = -1.09022831971,
          z = 0.405345349304
        ),
        up = go_scene_camera_up(x = 0, y = 0, z = 1)
      ),
      dragmode = "turntable",
      xaxis = go_scene_axis(title = "", type = "date"),
      yaxis = go_scene_axis(title = "", type = "category"),
      zaxis = go_scene_axis(title = "", type = "log"),
      annotations = list(
        go_scene_annotation(
          showarrow = FALSE,
          x = "2017-01-01",
          y = "A",
          z = 0,
          text = "Point 1",
          xanchor = "left",
          xshift = 10,
          opacity = 0.7
        ),
        go_scene_annotation(
          x = "2017-02-10",
          y = "B",
          z = 4,
          text = "Point 2",
          textangle = 0,
          ax = 0,
          ay = -75,
          font = go_font(color = "black", size = 12),
          arrowcolor = "black",
          arrowsize = 3,
          arrowwidth = 1,
          arrowhead = 1
        ),
        go_scene_annotation(
          x = "2017-03-20",
          y = "C",
          z = 5,
          ax = 50,
          ay = 0,
          text = "Point 3",
          arrowhead = 1,
          xanchor = "left",
          yanchor = "bottom"
        )
      )
    ),
    xaxis = go_xaxis(title = "x"),
    yaxis = go_yaxis(title = "y")
  )
```

### Styling Annotations

``` r

library(plotly.core)

data <- mtcars[which(mtcars$am == 1 & mtcars$gear == 4), ]

data |>
  go_figure() |>
  add_scatter(
    x = ~wt,
    y = ~mpg,
    mode = "markers",
    marker = go_scatter_marker(size = 10)
  ) |>
  add_annotation(
    x = data$wt,
    y = data$mpg,
    text = rownames(data),
    xref = "x",
    yref = "y",
    showarrow = TRUE,
    arrowhead = 4,
    arrowsize = .5,
    ax = 20,
    ay = -40,
    # Styling annotations' text:
    font = go_font(color = "#264E86", family = "sans serif", size = 14)
  )
```

### Set Annotation Text Anchors

``` r

library(plotly.core)

go_figure() |>
  add_scatter(x = 1, y = 1, mode = "markers", showlegend = FALSE) |>
  add_scatter(x = 1, y = 2, mode = "markers", showlegend = FALSE) |>
  add_scatter(x = 1, y = 3, mode = "markers", showlegend = FALSE) |>
  add_annotation(
    x = 1,
    y = 1,
    xref = "x",
    yref = "y",
    text = "Right Anchor",
    xanchor = "right",
    showarrow = FALSE
  ) |>
  add_annotation(
    x = 1,
    y = 2,
    xref = "x",
    yref = "y",
    text = "Center Anchor",
    xanchor = "center",
    showarrow = FALSE
  ) |>
  add_annotation(
    x = 1,
    y = 3,
    xref = "x",
    yref = "y",
    text = "Left Anchor",
    xanchor = "left",
    showarrow = FALSE
  )
```

### Customize Displayed Text with a Text Template

To show an arbitrary text in your chart you can use `texttemplate` (see
e.g. [`go_pie()`](https://msummersgill.github.io/plotly.R.core/reference/go_pie.md)),
which is a template string used for rendering the information, and will
override `textinfo`. This template string can include `variables` in
%{variable} format, `numbers` in [d3-format’s
syntax](https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_forma),
and `date` in [d3-time-fomrat’s
syntax](https://github.com/d3/d3-3.x-api-reference/blob/master/Time-Formatting.md#format).
`texttemplate` customizes the text that appears on your plot
vs. `hovertemplate` that customizes the tooltip text.

``` r

library(plotly.core)

go_figure() |>
  add_pie(
    values = c(40000000, 20000000, 30000000, 10000000),
    labels = c("Wages", "Operating expenses", "Cost of sales", "Insurance"),
    texttemplate = "%{label}: %{value:$,s} <br>(%{percent})",
    textposition = "inside"
  )
```

### Customize Text Template

The following example uses `textfont` (see
[`go_scatterternary()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatterternary.md))
to customize the added text.

``` r

library(plotly.core)

go_figure() |>
  add_scatterternary(
    a = c(3, 2, 5),
    b = c(2, 5, 2),
    c = c(5, 2, 2),
    mode = "markers+text",
    text = c("A", "B", "C"),
    texttemplate = "%{text}<br>(%{a:.2f}, %{b:.2f}, %{c:.2f})",
    textposition = "bottom center",
    textfont = go_font(
      family = "Times",
      size = c(18, 21, 20),
      color = c("IndianRed", "MediumPurple", "DarkOrange")
    )
  )
```

### Set Date in Text Template

The following example shows how to show date by setting the axis `type`
(see
[`go_yaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_yaxis.md))
in [funnel
charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/funnel-charts.md).
As you can see `textinfo` and `texttemplate` (see
[`go_funnel()`](https://msummersgill.github.io/plotly.R.core/reference/go_funnel.md))
have the same functionality when you want to determine ‘just’ the trace
information on the graph.

``` r

library(plotly.core)

go_figure() |>
  add_funnel(
    name = "Montreal",
    orientation = "h",
    y = c("2018-01-01", "2018-07-01", "2019-01-01", "2020-01-01"),
    x = c(100, 60, 40, 20),
    textposition = "inside",
    texttemplate = "%{y| %a. %_d %b %Y}"
  ) |>
  add_funnel(
    name = "Vancouver",
    orientation = "h",
    y = c("2018-01-01", "2018-07-01", "2019-01-01", "2020-01-01"),
    x = c(90, 70, 50, 10),
    textposition = "inside",
    textinfo = "label"
  ) |>
  update_layout(yaxis = go_yaxis(type = "date"))
```

### Set Annotation Coordinate References

``` r

library(plotly.core)

go_figure() |>
  add_scatter(x = 0.5, y = 1, mode = "markers", showlegend = FALSE) |>
  add_annotation(
    x = 0.5,
    y = 1,
    xref = "paper",
    yref = "paper",
    text = "<b>paper reference = [0.5, 1]</b>",
    showarrow = FALSE
  ) |>
  add_annotation(
    x = 0.5,
    y = 1,
    xref = "x",
    yref = "y",
    text = "x + y reference = [0.5, 1]",
    showarrow = TRUE,
    ax = 20,
    ay = -40
  ) |>
  update_layout(
    xaxis = go_xaxis(zeroline = FALSE),
    yaxis = go_yaxis(zeroline = FALSE)
  )
```

\#Reference

See
[`go_annotation()`](https://msummersgill.github.io/plotly.R.core/reference/go_annotation.md)
for more information and chart attribute options!
