# plotly.core

Interactive web graphics for R, built on [plotly.js](https://github.com/plotly/plotly.js)
and following the design of the [plotly Python package](https://github.com/plotly/plotly.py).


## Objectives

- **Performance** Take advantage of ongoing development progress of plotly.js 
  to improve browser rendering performance, and implement optimizations to on
  the R backend to cut down plot generation time and size in memory
- **Graph objects and documentation generated from the plotly.js schema.** All 47 trace types and
  every layout object have a machine-generated `go_*()` constructor (`go_scatter()`,
  `go_bar_marker()`, `go_layout_xaxis()`, ... 979 in total) with documentation
  generated from the schema.
- **Validation.** Every property is checked when objects are created or
  modified, with plotly.py-style error messages and "Did you mean" suggestions.
- **Compatible with existing plotly R code.** `plot_ly()`, `add_*()`,
  `layout()`, `subplot()` and friends build the same figures as the plotly R
  package (tested against it), on top of the validated graph objects.
- **Minimal Dependencies**
- **Plotly Express Support.** All 35 `px.*` functions plus `imshow` as `px_scatter()`,
  `px_line()`, `px_bar()`, `px_histogram()`, ... with faceting, marginals,
  trendlines, animation, the `px.data` datasets, `px.colors` palettes and
  templates. Output is tested against plotly.py on 72 cases.
- **Shiny, R Markdown and Quarto.** `plotlyOutput()`/`renderPlotly()`,
  `event_data()` and `plotlyProxy()` work as in the plotly R package; figures
  render inline in documents, as static images in PDF/Word output.
- **Static images.** `save_image()` exports PNG, JPEG, WebP, SVG and PDF with
  Kaleido.


> **Status:** early development; the API may change.

## Installation

Install the development version from GitHub with
[remotes](https://remotes.r-lib.org):

```r
# install.packages("remotes")
remotes::install_github("msummersgill/plotly.R.core")
```

## Example: Plotly Express

```r
library(plotly.core)

px_data_gapminder(year = 2007) |>
  px_scatter(
    x = ~gdpPercap, y = ~lifeExp, size = ~pop, color = ~continent,
    hover_name = ~country, log_x = TRUE, size_max = 60, title = "Gapminder 2007"
  )
```

![Bubble chart of GDP per capita against life expectancy in 2007, sized by population and coloured by continent](man/figures/README-px-gapminder.png)

Column arguments take one-sided formulas evaluated in the data (`x = ~gdpPercap`,
`x = ~log10(gdpPercap)`, `path = ~c(continent, country)` for several columns),
column names as strings (as in plotly.py), or vectors.

## Example: a 2D scatter plot with graph objects

```r
library(plotly.core)

fig <- mtcars |>
  go_figure() |>
  add_scatter(
    x = ~wt,
    y = ~mpg,
    mode = "markers",
    text = rownames(mtcars),
    marker = list(
      size = 12,
      color = ~cyl,
      colorscale = "Viridis",
      showscale = TRUE,
      colorbar = list(title = "Cylinders")
    ),
    hovertemplate = "%{text}<br>Weight: %{x} (1000 lbs)<br>MPG: %{y}<extra></extra>"
  ) |>
  update_layout(title = "Fuel economy vs. weight (mtcars)") |>
  update_xaxes(title_text = "Weight (1000 lbs)") |>
  update_yaxes(title_text = "Miles per gallon")

fig
```

![Scatter plot of mtcars weight vs. miles per gallon, coloured by cylinders](man/figures/README-mtcars-scatter.png)

A data frame piped into `go_figure()` (or given as `data` to an `add_*()`
function) lets properties refer to its columns with formulas. Only the values
used are added to the traces; each `add_*()` call adds exactly one trace (use
`px_*()` to split data into one trace per group).

Printing a figure renders it in the RStudio viewer or a browser, and inline in
R Markdown and Quarto documents.

## Example: subplots

```r
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
  update_yaxes(title_text = "hp", row = 1, col = 1, secondary_y = TRUE) |>
  update_layout(showlegend = FALSE)
```

![A 2x2 subplot grid with a scatter plot and secondary y axis, a pie chart, and a bar chart spanning the bottom row](man/figures/README-subplots.png)

## Graph objects and validation

Nested properties can also be written with "magic underscores", as in plotly.py:
`marker_size = 12` is the same as `marker = list(size = 12)`. Invalid values are
caught immediately:

```r
add_scatter(fig, x = mtcars$wt, y = mtcars$mpg, mode = "dots")
#> Error: Invalid value of type 'character' received for the 'mode' property of scatter
#>     Received value: "dots"
#>
#>     The 'mode' property is a flaglist and may be specified as a string containing:
#>       - Any combination of "lines", "markers", "text" joined with '+' characters (e.g. 'lines+markers')
#>         OR exactly one of "none"
```

## Shiny

```r
library(shiny)
ui <- fluidPage(plotlyOutput("plot"), verbatimTextOutput("click"))
server <- function(input, output, session) {
  output$plot <- renderPlotly(px_data_iris() |> px_scatter(x = ~sepal_width, y = ~sepal_length))
  output$click <- renderPrint(event_data("plotly_click"))
}
shinyApp(ui, server)
```

`plotlyProxy()` and `plotlyProxyInvoke()` update a rendered plot (e.g.
`"extendTraces"`, `"relayout"`) without redrawing it.

## Linked highlighting (crosstalk)

Plots made from the same `highlight_key()` data are linked in the browser,
without Shiny: selecting points in one highlights them in the others (needs
the crosstalk package).

```r
d <- mtcars |> highlight_key(~cyl, group = "Cylinders")
subplot(
  d |> plot_ly(x = ~wt, y = ~mpg) |> add_markers(),
  d |> plot_ly(x = ~factor(cyl)) |> add_histogram()
) |> highlight(on = "plotly_selected", color = "red", selectize = TRUE)
```

They also link with other crosstalk-compatible widgets (e.g. arranged with
`crosstalk::bscols()`).

## Static images

```r
# needs Python with kaleido (and plotly): reticulate::py_install(c("kaleido", "plotly"))
save_image(fig, "figure.png", width = 800, height = 500, scale = 2)
save_image(fig, "figure.pdf")
```

In R Markdown and Quarto, figures in PDF or Word output are included as static
images automatically when Kaleido is available.

## Existing plotly R code

Code written for the plotly R package keeps working:

```r
mtcars |> plot_ly(x = ~wt, y = ~mpg, color = ~factor(cyl), size = ~hp) |>
  add_lines(data = data.frame(wt = c(2, 5), mpg = c(30, 12)), inherit = FALSE,
            x = ~wt, y = ~mpg, color = I("black")) |>
  layout(title = "Motor Trend cars")
```

`legacy_figure()` converts such a plot to a `go_figure` for further editing.
Simple features data (the sf package) are drawn with `add_sf()`, or by
`plot_ly()`, `plot_geo()` and `plot_mapbox()` directly.
Not supported: `ggplotly()`, Chart Studio (`api_*()`), `orca()`/`export()` (use
`save_image()`), and the dplyr verbs re-exported by plotly (use dplyr or
data.table directly). Use the base pipe `|>` instead of `%>%`.

## Development

Code generation follows plotly.py's `commands.py` and `codegen/`:

```sh
Rscript commands.R updateplotlyjs        # bundle the latest plotly.js from npm
Rscript commands.R codegen               # regenerate validators, go_*() constructors and figure functions
Rscript -e 'roxygen2::roxygenise()'      # rebuild documentation
R CMD build . && R CMD check --as-cran plotly.core_*.tar.gz
```

Generated files (`R/zz-gen-*.R`, `R/sysdata.rda`) are committed and must not be
edited by hand. Tests are plain R scripts in `tests/`.
