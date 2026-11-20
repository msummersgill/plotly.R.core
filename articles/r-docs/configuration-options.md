# Configuration

## Configuration Options

The
[`config()`](https://msummersgill.github.io/plotly.R.core/reference/config.md)
function sets the configuration options for your figure.

Pipe your figure into
[`config()`](https://msummersgill.github.io/plotly.R.core/reference/config.md)
and pass the options you want to set as named arguments.

If you don’t set an option’s value, it will automatically be set to the
default value for that option.

For the complete list of configuration options and their defaults see:
<https://github.com/plotly/plotly.js/blob/master/src/plot_api/plot_config.js>

### Enabling Scroll Zoom

This option allows users to zoom in and out of figures using the scroll
wheel on their mouse and/or a two-finger scroll.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_scatter(x = c(1, 2, 3), y = c(1, 3, 1), mode = "lines+markers") |>
  update_layout(
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff"),
    yaxis = go_yaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff")
  ) |>
  config(scrollZoom = TRUE)

fig
```

### Turning Off Responsiveness

By default, figures you create with the `plotly.core` package are
[responsive](https://en.wikipedia.org/wiki/Responsive_web_design).
Responsive figures automatically change their height and width when the
size of the window they are displayed in changes. This is true for
figures which are displayed in web browsers on desktops and mobile,
Jupyter Notebooks, and other rendering environments.

Try resizing your browser window to see this behavior in effect on this
page.

If you would like to disable this default behavior and force your
figures to always have the same height and width regardless of the
window size, set the value of the `responsive` key to `FALSE` in your
figure’s configuration dictionary.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_scatter(x = c(1, 2, 3), y = c(1, 3, 1), mode = "lines+markers") |>
  update_layout(
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff"),
    yaxis = go_yaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff")
  ) |>
  config(responsive = FALSE)

fig
```

### Making A Static Chart

``` r

library(plotly.core)

fig <- go_figure() |>
  add_scatter(x = c(1, 2, 3), y = c(1, 3, 1), mode = "lines+markers") |>
  update_layout(
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff"),
    yaxis = go_yaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff")
  ) |>
  config(staticPlot = TRUE)

fig
```

### Forcing The Modebar to Always Be Visible

When users hover over a figure generated with `plotly.core`, a
**modebar** appears in the top-right of the figure. This presents users
with several options for interacting with the figure.

By default, the modebar is only visible while the user is hovering over
the chart. If you would like the modebar to always be visible regardless
of whether or not the user is currently hovering over the figure, set
the displayModeBar attribute in the configuration of your figure to
true.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_scatter(x = c(1, 2, 3), y = c(1, 3, 1), mode = "lines+markers") |>
  update_layout(
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff"),
    yaxis = go_yaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff")
  ) |>
  config(displayModeBar = TRUE)

fig
```

### Preventing the Modebar from Appearing

When users hover over a figure generated with `plotly.core`, a modebar
appears in the top-right of the figure. This presents users with several
options for interacting with the figure.

By default, the modebar is only visible while the user is hovering over
the chart. If you would like the modebar to never be visible, then set
the `displayModeBar` attribute in the config of your figure to FALSE.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_scatter(x = c(1, 2, 3), y = c(1, 3, 1), mode = "lines+markers") |>
  update_layout(
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff"),
    yaxis = go_yaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff")
  ) |>
  config(displayModeBar = FALSE)

fig
```

### Hiding the Plotly Logo on the Modebar

``` r

library(plotly.core)

fig <- go_figure() |>
  add_scatter(x = c(1, 2, 3), y = c(1, 3, 1), mode = "lines+markers") |>
  update_layout(
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff"),
    yaxis = go_yaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff")
  ) |>
  config(displaylogo = FALSE)

fig
```

### Customizing Modebar “Download Plot” Button

The camera icon on the modebar causes a static version of the figure to
be downloaded via the user’s browser. The default behaviour is to
download a PNG of size 700 by 450 pixels.

This behavior can be controlled via the `toImageButtonOptions`
configuration key.

``` r

library(plotly.core)

fig <- go_figure() |>
  add_bar(x = c(1, 2, 3), y = c(1, 3, 1)) |>
  update_layout(
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff"),
    yaxis = go_yaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff")
  ) |>
  config(
    toImageButtonOptions = list(
      format = "svg", # one of png, svg, jpeg, webp
      filename = "custom_image",
      height = 500,
      width = 700,
      scale = 1
    )
  )

fig
```

Figures can be set to download at the currently-rendered size by setting
`height` and `width` to `NULL`:

``` r

library(plotly.core)

fig <- go_figure() |>
  add_bar(x = c(1, 2, 3), y = c(1, 3, 1)) |>
  update_layout(
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff"),
    yaxis = go_yaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff")
  ) |>
  config(
    toImageButtonOptions = list(height = NULL, width = NULL)
  )

fig
```

### Removing Modebar Buttons

To delete buttons from the modebar, pass an array of strings containing
the names of the buttons you want to remove to the
`modeBarButtonsToRemove` attribute in the figure’s configuration
dictionary. Note that different chart types have different default
modebars. The following is a list of all the modebar buttons and the
chart types they are associated with:

- **High-level**: `zoom`, `pan`, `select`, `zoomIn`, `zoomOut`,
  `autoScale`, `resetScale`
- **2D**: `zoom2d`, `pan2d`, `select2d`, `lasso2d`, `zoomIn2d`,
  `zoomOut2d`, `autoScale2d`, `resetScale2d`
- **2D Shape Drawing**: `drawline`, `drawopenpath`, `drawclosedpath`,
  `drawcircle`, `drawrect`, `eraseshape`
- **3D**: `zoom3d`, `pan3d`, `orbitRotation`, `tableRotation`,
  `handleDrag3d`, `resetCameraDefault3d`, `resetCameraLastSave3d`,
  `hoverClosest3d`
- **Cartesian**: `hoverClosestCartesian`, `hoverCompareCartesian`
- **Geo**: `zoomInGeo`, `zoomOutGeo`, `resetGeo`, `hoverClosestGeo`
- **Other**: `hoverClosestGl2d`, `hoverClosestPie`, `toggleHover`,
  `resetViews`, `toImage`, `sendDataToCloud`, `toggleSpikelines`,
  `resetViewMapbox`

``` r

library(plotly.core)

fig <- go_figure() |>
  add_scatter(x = c(1, 2, 3), y = c(1, 3, 1), mode = "lines+markers") |>
  update_layout(
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff"),
    yaxis = go_yaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff")
  ) |>
  config(modeBarButtonsToRemove = c("zoom2d", "pan2d"))

fig
```

### Add optional shape-drawing buttons to modebar

Some modebar buttons of Cartesian plots are optional and have to be
added explicitly, using the `modeBarButtonsToAdd` config attribute.
These buttons are used for drawing or erasing shapes. See [the tutorial
on shapes and shape
drawing](https://msummersgill.github.io/plotly.R.core/articles/r-docs/shapes.html#drawing-shapes-on-cartesian-plots)
for more details.

``` r

library(plotly.core)
data(iris)

fig <- go_figure()
for (sp in levels(iris$Species)) {
  fig <- fig |>
    add_scatter(
      data = iris[iris$Species == sp, ],
      x = ~Petal.Width,
      y = ~Sepal.Length,
      mode = "markers",
      name = sp
    )
}

fig <- fig |>
  update_layout(
    legend = go_legend(title = go_legend_title(text = "species")),
    dragmode = "drawopenpath",
    newshape = go_newshape(line = go_newshape_line(color = "cyan")),
    title = "Draw a path to separate versicolor and virginica"
  ) |>
  update_layout(
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff"),
    yaxis = go_yaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff")
  )

# Add modebar buttons
fig <- fig |>
  config(
    modeBarButtonsToAdd = c(
      "drawline", "drawopenpath", "drawclosedpath", "drawcircle", "drawrect", "eraseshape"
    )
  )

fig
```

### Double-Click Delay

Sets the maximum delay between two consecutive clicks to be interpreted
as a double-click in milliseconds. This is the time interval between
first mousedown and second mouseup. The default timing is 300 ms (less
than half a second). This setting propagates to all on-subplot double
clicks (except for `geo` and `mapbox`).

``` r

library(plotly.core)

fig <- go_figure() |>
  add_bar(
    y = c(3, 5, 3, 2),
    x = c("2019-09-02", "2019-10-10", "2019-11-12", "2019-12-22"),
    texttemplate = "%{label}",
    textposition = "inside"
  ) |>
  update_layout(
    plot_bgcolor = "#e5ecf6",
    xaxis = go_xaxis(type = "date", zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff"),
    yaxis = go_yaxis(zerolinecolor = "#ffff", zerolinewidth = 2, gridcolor = "ffff")
  ) |>
  config(doubleClickDelay = 1000)

fig
```

### Configuring Figures in Dash Apps

The same configuration options that you pass to
[`config()`](https://msummersgill.github.io/plotly.R.core/reference/config.md)
can also be passed to the [config property of a `dcc.Graph`
component](https://dashr.plotly.com/dash-core-components/graph).

#### Reference

See config options at
<https://github.com/plotly/plotly.js/blob/master/src/plot_api/plot_config.js#L6>
