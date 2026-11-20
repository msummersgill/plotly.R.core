# Displaying Figures

Plotly’s R graphing library, `plotly.core`, gives you a wide range of
options for how and where to display your figures.

In general, there are three different approaches you can take in order
to display `plotly.core` figures:

1.  Using the `renderers` framework in the context of a script or
    notebook (the main topic of this page)
2.  By exporting to an HTML file with
    [`write_html()`](https://msummersgill.github.io/plotly.R.core/reference/write_html.md)
    and loading that file in a browser immediately or later
3.  By rendering the figure to a static image file with
    [`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md)
    such as PNG, JPEG, SVG or PDF and loading the resulting file in any
    viewer

The first approach is discussed below.

### Displaying Figures Using The `renderers` Framework

The renderers framework is a flexible approach for displaying
`plotly.core` figures in a variety of contexts. To display a figure
using the renderers framework, you call the
[`print()`](https://rdrr.io/r/base/print.html) method on a graph object
figure. It will display the figure using the current default
renderer(s).

``` r

library(plotly.core)

fig <- go_figure() |>
  add_bar(x = c(0, 1, 2), y = c(2, 1, 3)) |>
  update_layout(
    title = "A Figure Displayed with print(fig)",
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

print(fig)
```

In most situations, you can omit the call to
[`print()`](https://rdrr.io/r/base/print.html) and allow the figure to
display itself.

``` r

library(plotly.core)

go_figure() |>
  add_bar(x = c(0, 1, 2), y = c(2, 1, 3)) |>
  update_layout(
    title = "A Figure Displaying Itself",
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

> To be precise, figures will display themselves using the current
> default renderer when the last expression in a cell must evaluate to a
> figure.

**In many contexts, an appropriate renderer will be chosen automatically
and you will not need to perform any additional configuration.**

##### Other Miscellaneous Renderers

###### JSON

In editors that support it,
[`plotly_json()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_json.md)
displays the JSON representation of a figure in a collapsible
interactive tree structure. This can be very useful for examining the
structure of complex figures.

## Performance

No matter the approach chosen to display a figure, the figure data
structure is first (automatically, internally) serialized into a JSON
string before being transferred from the R context to the browser (or to
an HTML file first) or to a headless browser for static image export
with
[`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md).

Once a figure is serialized to JSON, it must be rendered by a browser,
either immediately in the user’s browser, at some later point if the
figure is exported to HTML, or immediately in a headless browser for
static image export. Rendering time is generally proportional to the
total number of data points in the figure, the number of traces and the
number of subplots. In situations where rendering performance is slow,
we recommend considering WebGL traces such as
[`add_scattergl()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattergl.md)
to exploit GPU-accelerated rendering in the browser to render the
figure.

##### Partial Bundle

Load time of the graph on a web page can also be improved with the
[`partial_bundle()`](https://msummersgill.github.io/plotly.R.core/reference/partial_bundle.md)
function. This function reduces the size of the `plotly.js` bundle
downloaded on the initial load of the page by serving a partial bundle
with subsets of the graphing library. This is not recommended for use
when rendering multiple Plotly graphs on a single page.
