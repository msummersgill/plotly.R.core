# plotly.core

Interactive web graphics for R built on
[plotly.js](https://github.com/plotly/plotly.js). plotly.core is a
rendering engine for the [plotly R
package](https://github.com/plotly/plotly.R) and can also be used
stand-alone.

- **Faster plots, less browser memory** plotly.core leverages advances
  in plotly.js to improve browser rendering performance, and implements
  optimizations to on the R backend to cut down plot generation time and
  size in memory. Rendering large time series plots and heatmaps is
  10-100x faster. DateTime optimizations and support for single
  precision floats allows up to 2x reduction of browser memory. *(See
  the render-performance vignette for more details)*
- **Machine-generated code and documentation from the plotly.js
  schema.** Every object in the schema has a machine-generated `go_*()`
  constructor with exactly its properties: traces
  ([`go_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md)),
  the layout, objects shared across the schema
  ([`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md),
  [`go_colorbar()`](https://msummersgill.github.io/plotly.R.core/reference/go_colorbar.md),
  …) and every other nested object
  ([`go_scatter_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter_marker.md),
  [`go_xaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis.md),
  [`go_sankey_link()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey_link.md),
  …), with comprehensive R documentation and thorough validation
  generated from the schema. Future changes to the plotly.js schema can
  be ported to the R implementation without hand-writing any R code or
  documentation.
- **Full backwards compatibility with the plotly R package.** plotly’s
  `plot_ly()` and `ggplotly()` plots are rendered by plotly.core, so
  existing plotly R code gets the same performance work and plotly.js
  version. *([Working branch:
  msummersgill/plotly@plotly-core-render](https://github.com/msummersgill/plotly/tree/plotly-core-render))*
  Helper functions in the plotly package back-port functionality for
  features and behavior deprecated between the last CRAN release
  plotly.js/2.25.2 and plotly-js/latest
- **Shiny, R Markdown, Quarto, and static image export**
  [`plotlyOutput()`](https://msummersgill.github.io/plotly.R.core/reference/plotlyOutput.md)/[`renderPlotly()`](https://msummersgill.github.io/plotly.R.core/reference/plotlyOutput.md),
  [`event_data()`](https://msummersgill.github.io/plotly.R.core/reference/event_data.md)
  and
  [`plotlyProxy()`](https://msummersgill.github.io/plotly.R.core/reference/plotlyProxy.md)
  work as in the plotly R package; figures render inline in documents,
  as static images in PDF/Word
  output.[`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md)
  exports PNG, JPEG, WebP, SVG, PDF and EPS with headless Chrome (no
  Python needed).

## Installation

plotly.core has not been submitted to CRAN yet. Install the development
version from GitHub with remotes.

``` r

# install.packages("remotes")
# plotly.core
remotes::install_github("msummersgill/plotly.R.core")
# plotly with plotly.core rendering
remotes::install_github("msummersgill/plotly@plotly-core-render")
```

## Example: a 2D scatter plot with graph objects

``` r

library(plotly.core)

mtcars |>
  go_figure() |>
  add_scatter(
    x = ~wt,
    y = ~mpg,
    mode = "markers",
    text = rownames(mtcars),
    marker = go_scatter_marker(
      size = 12,
      color = ~cyl,
      colorscale = "Viridis",
      showscale = TRUE,
      colorbar = go_colorbar(title = "Cylinders")
    ),
    hovertemplate = "%{text}<br>Weight: %{x} (1000 lbs)<br>MPG: %{y}<extra></extra>"
  ) |>
  update_layout(title = "Fuel economy vs. weight (mtcars)") |>
  update_xaxes(title = "Weight (1000 lbs)") |>
  update_yaxes(title = "Miles per gallon")
```

![](reference/figures/README-mtcars-scatter.png)

## Example: subplots

``` r

fig <- make_subplots(
  rows = 2, cols = 2,
  specs = list(
    list(list(secondary_y = TRUE), list(type = "domain")),
    list(list(colspan = 2), NULL)
  ),
  subplot_titles = c("Scatter + secondary y", "Pie", "Bar across both columns")
) |>
  add_scatter(x = mtcars$wt, y = mtcars$mpg, mode = "markers", name = "mpg", row = 1, col = 1) |>
  add_scatter(x = sort(mtcars$wt), y = sort(mtcars$hp), mode = "lines", name = "hp",
              row = 1, col = 1, secondary_y = TRUE) |>
  add_pie(labels = c("4", "6", "8"), values = as.vector(table(mtcars$cyl)), row = 1, col = 2) |>
  add_bar(x = rownames(mtcars), y = mtcars$qsec, name = "qsec", row = 2, col = 1) |>
  update_yaxes(title = "hp", row = 1, col = 1, secondary_y = TRUE) |>
  update_layout(showlegend = FALSE)
```

![A 2x2 subplot grid with a scatter plot and secondary y axis, a pie
chart, and a bar chart spanning the bottom
row](reference/figures/README-subplots.png)

A 2x2 subplot grid with a scatter plot and secondary y axis, a pie
chart, and a bar chart spanning the bottom row

## Graph objects and validation

Every object in the plotly.js schema has a `go_*()` constructor with
exactly its properties, so autocomplete shows only what is valid there:

- traces and the layout:
  [`go_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md),
  [`go_bar()`](https://msummersgill.github.io/plotly.R.core/reference/go_bar.md),
  …,
  [`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md);
- objects nested in them, named after their path:
  [`go_scatter_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter_marker.md),
  [`go_scatter_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter_marker_line.md),
  [`go_xaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis.md),
  [`go_scene_camera()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_camera.md),
  [`go_annotation()`](https://msummersgill.github.io/plotly.R.core/reference/go_annotation.md),
  [`go_slider_step()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider_step.md),
  …;
- objects that appear in many places, with one constructor for all of
  them:
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md),
  [`go_colorbar()`](https://msummersgill.github.io/plotly.R.core/reference/go_colorbar.md),
  [`go_hoverlabel()`](https://msummersgill.github.io/plotly.R.core/reference/go_hoverlabel.md),
  [`go_error_bar()`](https://msummersgill.github.io/plotly.R.core/reference/go_error_bar.md),
  [`go_scene_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_axis.md),
  [`go_selected()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected.md),
  ….

Named lists work wherever a constructor does
(`marker = list(size = 12)`). One-sided formulas such as `color = ~cyl`
are kept by constructors and evaluated in the figure’s data when the
trace is added:

``` r

mtcars |>
  go_figure() |>
  add_bar(
    x = ~factor(cyl), y = ~mpg,
    marker = go_bar_marker(color = ~hp, line = go_bar_marker_line(width = 1)),
    textfont = go_font(size = 14)
  ) |>
  update_layout(xaxis = go_xaxis(title = "Cylinders"))
```

Every property is checked against the plotly.js schema when an object is
created, and again when it is placed in a figure, so mistakes are caught
immediately:

``` r

add_scatter(fig, x = mtcars$wt, y = mtcars$mpg, mode = "dots")
#> Error: Invalid value of type 'character' received for the 'mode' property of scatter
#>     Received value: "dots"
#>
#>     The 'mode' property is a flaglist and may be specified as a string containing:
#>       - Any combination of "lines", "markers", "text" joined with '+' characters (e.g. 'lines+markers')
#>         OR exactly one of "none"

add_bar(fig, x = mtcars$cyl, y = mtcars$mpg, marker = go_font(size = 3))
#> Error: A go_font() object can't be used for bar.marker, which is an object (a named list)
```

plotly.py’s “magic underscore” names are not supported; the error shows
the nested call instead:

``` r

add_scatter(fig, x = mtcars$wt, y = mtcars$mpg, marker_size = 12)
#> Error: Invalid property specified for go_scatter(): 'marker_size'
#>
#> Nested properties are set with their objects: marker = go_scatter_marker(size = ...)
```

## Shiny

``` r

library(shiny)
ui <- fluidPage(plotlyOutput("plot"), verbatimTextOutput("click"))
server <- function(input, output, session) {
  output$plot <- renderPlotly(
    iris |> go_figure() |> add_scatter(x = ~Sepal.Width, y = ~Sepal.Length, mode = "markers")
  )
  output$click <- renderPrint(event_data("plotly_click"))
}
shinyApp(ui, server)
```

[`plotlyProxy()`](https://msummersgill.github.io/plotly.R.core/reference/plotlyProxy.md)
and
[`plotlyProxyInvoke()`](https://msummersgill.github.io/plotly.R.core/reference/plotlyProxy.md)
update a rendered plot (e.g. `"extendTraces"`, `"relayout"`) without
redrawing it.

## Static images

``` r

# uses headless Chrome via chromote; offers to download Chrome Headless Shell
# if no browser is installed
save_image(fig, "figure.png", width = 800, height = 500, scale = 2)
save_image(fig, "figure.pdf")
save_image(fig, "figure.eps") # needs the rsvg package
```

In R Markdown and Quarto, figures in PDF or Word output are included as
static images automatically when Chrome is available.

## Existing plotly R code

The [plotly](https://github.com/plotly/plotly.R) package’s `plot_ly()`,
`add_*()`, [`layout()`](https://rdrr.io/r/graphics/layout.html),
`subplot()`,
[`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)
and `ggplotly()` are built on plotly.core: plotly converts its plots to
plotly.core figures and renders them with plotly.core’s widget. The
extension points it uses are S3 generics here
([`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md),
the `add_<trace type>()` functions,
[`as_widget()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_widget.md)
and
[`config()`](https://msummersgill.github.io/plotly.R.core/reference/config.md)),
plus
[`get_validator()`](https://msummersgill.github.io/plotly.R.core/reference/get_validator.md)
and
[`set_last_plot()`](https://msummersgill.github.io/plotly.R.core/reference/last_plot.md).

## Development

Code in this repository was generated by an LLM (Claude) directed to
follow the directory structure of plotly.py and test support and
backwards compatibility with the R plotly package. C code leverages
optimizations pioneered in
[`data.table::fwrite`](https://rdrr.io/pkg/data.table/man/fwrite.html)/[`data.table::fread`](https://rdrr.io/pkg/data.table/man/fread.html).
Authors of the “inspiration” code are included as contributors to this
package as such.

Code generation follows plotly.py’s `commands.py` and `codegen/`:

``` sh
Rscript commands.R updateplotlyjs        # bundle the latest plotly.js from npm
Rscript commands.R codegen               # regenerate validators, go_*() constructors and figure functions
Rscript -e 'roxygen2::roxygenise()'      # rebuild documentation
R CMD build . && R CMD check --as-cran plotly.core_*.tar.gz
```

Generated files (`R/zz-gen-*.R`, `R/sysdata.rda`) are committed and must
not be edited by hand. Tests are plain R scripts in `tests/`.
