# Display Image Data

This tutorial shows how to display and explore image data. If you would
like instead a logo or static image, use
[`go_layout_image()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_image.md)
as explained
[here](https://msummersgill.github.io/plotly.R.core/articles/r-docs/logos.md).

### Display RGB Image Data with Image Trace

Note that the image trace
([`add_image()`](https://msummersgill.github.io/plotly.R.core/reference/go_image.md))
only accepts multichannel images. For single images, use a
[heatmap](https://msummersgill.github.io/plotly.R.core/articles/r-docs/heatmaps.md).
The image trace is different from layout images
([`go_layout_image()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_image.md)),
which can be used for adding background images or logos to figures.

``` r

library(plotly.core)

img_rgb <- list(
  list(c(255, 0, 0), c(0, 255, 0), c(0, 0, 255)),
  list(c(0, 255, 0), c(0, 0, 255), c(255, 0, 0))
)
go_figure() |>
  add_image(z = img_rgb)
```

### Read image arrays from image files

In order to create a numerical array to be passed to the image trace,
you can use a third-party library like
[png](https://cran.r-project.org/package=png) or
[jpeg](https://cran.r-project.org/package=jpeg) to read an image file.
[`png::readPNG()`](https://rdrr.io/pkg/png/man/readPNG.html) returns a
height x width x channel array with values between 0 and 1; here we keep
the red, green and blue channels of the R logo that ships with the png
package.

``` r

library(plotly.core)

img <- png::readPNG(system.file("img", "Rlogo.png", package = "png"))[, , 1:3]

go_figure() |>
  add_image(z = img * 255)
```

### Define the data range covered by the color range with zmin and zmax

The data range and color range are mapped together using the parameters
`zmin` and `zmax`, which correspond respectively to the data values
mapped to black `[0, 0, 0]` and white `[255, 255, 255]`. The default
value of `zmin` and `zmax` depends on the `colormodel` value. In this
example `colormodel` is `"rgb"` (by default), so the default value of
`zmin` is `[0, 0, 0]` and `zmax` is `[255, 255, 255]`. `zmin` and `zmax`
take four values (one per channel of the `"rgba"` color model); the
fourth is ignored for `"rgb"` images.

``` r

library(plotly.core)

img <- png::readPNG(system.file("img", "Rlogo.png", package = "png"))[, , 1:3]
# Stretch the contrast of the red channel only, resulting in a more red image
go_figure() |>
  add_image(
    z = img * 250,
    zmin = c(10, 0, 0, 0),
    zmax = c(200, 250, 250, 1)
  )
```

### Set Ticks and Margins

``` r

library(plotly.core)

img <- png::readPNG(system.file("img", "Rlogo.png", package = "png"))[, , 1:3]
go_figure() |>
  add_image(z = img * 250) |>
  update_layout(
    margin = go_margin(l = 10, r = 10, b = 0, t = 0),
    xaxis = go_xaxis(showticklabels = FALSE, ticks = ""),
    yaxis = go_yaxis(showticklabels = FALSE, ticks = "")
  )
```

### Drawing Shapes on Images

You can create layout shapes programatically, but you can also draw
shapes manually by setting the `dragmode` to one of the shape-drawing
modes: `drawline`,`drawopenpath`, `drawclosedpath`, `drawcircle`, or
`drawrect`. If you need to switch between different shape-drawing or
other dragmodes (panning, selecting, etc.), modebar buttons can be added
in the `config` of your figure to select the dragmode.

If you switch to a different dragmode such as pan or zoom, you will need
to select the drawing tool in the modebar to go back to shape drawing.

This shape-drawing feature is particularly interesting for annotating
graphs, in particular image traces.

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

img <- png::readPNG(system.file("img", "Rlogo.png", package = "png"))[, , 1:3]

go_figure() |>
  add_image(z = img * 255) |>
  update_layout(
    dragmode = "drawrect",
    xaxis = go_xaxis(
      title = "Click and drag inside the figure to draw a rectangle or select another shape in the modebar"
    )
  ) |>
  config(
    modeBarButtonsToAdd = list(
      "drawline",
      "drawopenpath",
      "drawclosedpath",
      "drawcircle",
      "drawrect",
      "eraseshape"
    )
  )
```

### Reference

See
[`go_image()`](https://msummersgill.github.io/plotly.R.core/reference/go_image.md)
for more information and chart attribute options!
