# plotly.R.core

Interactive web graphics for R, built on [plotly.js](https://github.com/plotly/plotly.js)
and following the design of the [plotly Python package](https://github.com/plotly/plotly.py).

- **Graph objects generated from the plotly.js schema.** Every trace and layout
  object has a `go_*()` constructor (`go_scatter()`, `go_scatter_marker()`,
  `go_layout_xaxis()`, ...) with documentation generated from the schema.
- **Validation.** Every property is checked when objects are created or
  modified, with plotly.py-style error messages and "Did you mean" suggestions.
- **Figures as values.** `go_figure()`, `add_scatter()`, `update_layout()`,
  `update_traces()`, `update_xaxes()` and friends return new figures, so they
  chain with the base R pipe `|>`.
- **Minimal dependencies.** data.table, htmlwidgets and jsonlite.

> **Status:** early development. The initial pass generates the scatter trace
> and core layout objects (axes, title, legend, margins, fonts, hover labels).

## Installation

```r
# From a local clone
install.packages("path/to/plotly.R.core", repos = NULL, type = "source")
```

## Example: a 2D scatter plot

```r
library(plotly.R.core)

fig <- go_figure() |>
  add_scatter(
    x = mtcars$wt,
    y = mtcars$mpg,
    mode = "markers",
    text = rownames(mtcars),
    marker = list(
      size = 12,
      color = mtcars$cyl,
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

Printing a figure renders it in the RStudio viewer or a browser, and inline in
R Markdown and Quarto documents.

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

## Development

Code generation follows plotly.py's `commands.py` and `codegen/`:

```sh
Rscript commands.R updateplotlyjs        # bundle the latest plotly.js from npm
Rscript commands.R codegen               # regenerate validators, go_*() constructors and figure functions
Rscript -e 'roxygen2::roxygenise()'      # rebuild documentation
R CMD build . && R CMD check --as-cran plotly.R.core_*.tar.gz
```

Generated files (`R/zz-gen-*.R`, `R/sysdata.rda`) are committed and must not be
edited by hand. Tests are plain R scripts in `tests/`.
