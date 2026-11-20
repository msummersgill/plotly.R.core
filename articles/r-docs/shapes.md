# Shapes

### Lines

``` r

library(plotly.core)

s <- seq.int(0, 15)

# one line shape per highlighted segment
lines <- lapply(c(0, 3, 5, 7, 9, 13), function(i) {
  go_shape(
    type = "line",
    line = go_shape_line(color = "pink"),
    xref = "x",
    yref = "y",
    x0 = i,
    x1 = i + 2,
    y0 = sin(i + 1),
    y1 = sin(i + 1)
  )
})

go_figure() |>
  add_scatter(x = ~s, y = ~sin(s), mode = "lines") |>
  update_layout(title = "Highlighting with Lines", shapes = lines)
```

### Rectangles

``` r

library(plotly.core)

economics <- ggplot2::economics

economics |>
  go_figure() |>
  add_scatter(x = ~date, y = ~uempmed, name = "unemployment", mode = "lines") |>
  update_layout(
    title = "Highlighting with Rectangles",
    shapes = list(
      go_shape(
        type = "rect",
        fillcolor = "blue",
        line = go_shape_line(color = "blue"),
        opacity = 0.3,
        x0 = "1980-01-01",
        x1 = "1985-01-01",
        xref = "x",
        y0 = 4,
        y1 = 12.5,
        yref = "y"
      ),
      go_shape(
        type = "rect",
        fillcolor = "blue",
        line = go_shape_line(color = "blue"),
        opacity = 0.2,
        x0 = "2000-01-01",
        x1 = "2005-01-01",
        xref = "x",
        y0 = 4,
        y1 = 12.5,
        yref = "y"
      )
    )
  )
```

### Circles

Circles are centered around ((`x0`+`x1`)/2, (`y0`+`y1`)/2))

``` r

library(plotly.core)

df <- ggplot2::diamonds[sample(nrow(ggplot2::diamonds), 1000), ]

df |>
  go_figure() |>
  add_scatter(
    x = ~carat,
    y = ~price,
    text = ~paste("Clarity: ", clarity),
    mode = "markers",
    marker = go_scatter_marker(
      color = ~carat,
      colorscale = "Viridis",
      showscale = TRUE,
      size = ~carat,
      sizemode = "area",
      sizeref = 2 * max(df$carat) / 20^2
    )
  ) |>
  update_layout(
    title = "Highlighting Regions with Circles",
    shapes = list(
      go_shape(
        type = "circle",
        xref = "x",
        x0 = .2,
        x1 = .7,
        yref = "y",
        y0 = 20,
        y1 = 3000,
        fillcolor = "rgb(50, 20, 90)",
        line = go_shape_line(color = "rgb(50, 20, 90)"),
        opacity = 0.2
      ),
      go_shape(
        type = "circle",
        xref = "x",
        x0 = .75,
        x1 = 1.5,
        yref = "y",
        y0 = 2500,
        y1 = 7500,
        fillcolor = "rgb(30, 100, 120)",
        line = go_shape_line(color = "rgb(30, 100, 120)"),
        opacity = 0.2
      ),
      go_shape(
        type = "circle",
        xref = "x",
        x0 = 1.6,
        x1 = 2.5,
        yref = "y",
        y0 = 12500,
        y1 = 18500,
        fillcolor = "rgb(90, 200, 75)",
        line = go_shape_line(color = "rgb(90, 200, 75)"),
        opacity = 0.2
      )
    )
  )
```

### Drawing Shapes on Cartesian Plots

You can create layout shapes programatically, but you can also draw
shapes manually by setting the `dragmode` to one of the shape-drawing
modes: `drawline`,`drawopenpath`, `drawclosedpath`, `drawcircle`, or
`drawrect`. If you need to switch between different shape-drawing or
other dragmodes (panning, selecting, etc.), modebar buttons can be added
in the `config` of your figure to select the dragmode.

If you switch to a different dragmode such as pan or zoom, you will need
to select the drawing tool in the modebar to go back to shape drawing.

This shape-drawing feature is particularly interesting for annotating
graphs, in particular [image
traces](https://msummersgill.github.io/plotly.R.core/articles/r-docs/displaying-images.html#drawing-shapes-on-images).

Once you have drawn shapes, you can select and modify an existing shape
by clicking on its boundary (note the arrow pointer). Its fillcolor
turns to pink to highlight the activated shape and then you can

- drag and resize it for lines, rectangles and circles/ellipses
- drag and move individual vertices for closed paths
- move individual vertices for open paths.

An activated shape is deleted by cliking on the `eraseshape` button.

Drawing or modifying a shape triggers a `relayout` event, which a Shiny
app can capture with `event_data("plotly_relayout")`.

``` r

library(plotly.core)

df <- ggplot2::diamonds[sample(nrow(ggplot2::diamonds), 1000), ]

df |>
  go_figure() |>
  add_scatter(
    x = ~carat,
    y = ~price,
    text = ~paste("Clarity: ", clarity),
    mode = "markers",
    marker = go_scatter_marker(
      color = ~carat,
      colorscale = "Viridis",
      showscale = TRUE,
      size = ~carat,
      sizemode = "area",
      sizeref = 2 * max(df$carat) / 20^2
    )
  ) |>
  update_layout(
    dragmode = "drawrect",
    xaxis = go_xaxis(
      title = "Click and drag inside the figure to draw a rectangle or select another shape in the modebar"
    )
  ) |>
  config(
    modeBarButtonsToAdd = c(
      "drawline", "drawopenpath", "drawclosedpath", "drawcircle", "drawrect", "eraseshape"
    )
  )
```

### Style of user-drawn shapes

The layout `newshape` attribute controls the visual appearance of new
shapes drawn by the user. `newshape` attributes have the same names as
layout shapes.

Note on shape opacity: having a new shape’s opacity \> 0.5 makes it
possible to activate a shape by clicking inside the shape (for opacity
\<= 0.5 you have to click on the border of the shape), but you cannot
start a new shape within an existing shape (which is possible for an
opacity \<= 0.5).

``` r

library(plotly.core)

df <- ggplot2::diamonds[sample(nrow(ggplot2::diamonds), 1000), ]

df |>
  go_figure() |>
  add_scatter(
    x = ~carat,
    y = ~price,
    text = ~paste("Clarity: ", clarity),
    mode = "markers",
    marker = go_scatter_marker(
      color = ~carat,
      colorscale = "Viridis",
      showscale = TRUE,
      size = ~carat,
      sizemode = "area",
      sizeref = 2 * max(df$carat) / 20^2
    )
  ) |>
  update_layout(
    dragmode = "drawrect",
    newshape = go_newshape(fillcolor = "yellow", opacity = 0.5),
    xaxis = go_xaxis(
      title = "Click and drag inside the figure to draw a rectangle or select another shape in the modebar"
    )
  ) |>
  config(
    modeBarButtonsToAdd = c(
      "drawline", "drawopenpath", "drawclosedpath", "drawcircle", "drawrect", "eraseshape"
    )
  )
```

### Reference

See
[`go_shape()`](https://msummersgill.github.io/plotly.R.core/reference/go_shape.md)
for more information on using shapes!
