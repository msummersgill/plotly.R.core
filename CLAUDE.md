# Objective

- Create a new R package, plotly.R.core, wrapping the plotly.js library with similar design principles as the plotly.py package. (See plotly.py/Contributing.md)
- Code Generation should be used to generate R objects, methods, and documentation based on the plotly schema, ensuring long term maintainability
- Codebase should be as minimal as possible, with as few R package and system dependencies as possible
- R functions should ideally be compatible with existing plotly R package to allow (partial) backwards compatibility for most plotting code
- Prioritize performance, using R libraries like data.table to handle tabular data. Use compiled C and C++ functions where performance is improved 
- Plots should be created as HTMLWidgets
- Static image export

# Local Resources

- plotly.js clone: ~/Documents/plotly.js
- plotly.py clone: ~/Documents/plotly.py
- Original R implementation clone: ~/Documents/plotly.R (package `plotly`)
- Original R Documentation clone: ~/Documents/plotly.r-docs

# Scope

## In scope

- Follow the spirit of https://github.com/plotly/plotly.py/blob/main/CONTRIBUTING.md
- Structure directories following conventions in plotly.py where it makes sense and doesn't conflict with the required structure of an R package
- Create utilities to update and bundle the latest plotly.js version
- Create a comparable set of utilities as in plotly.py/.codegen to generate R objects corresponding to plotly.js "Graph Objects" and in-line, comprehensive documentation using roxygen2
  - https://plotly.com/python/figure-structure/
  - https://plotly.com/python/creating-and-updating-figures/
  - https://plotly.com/python/renderers/
- Create an R equivalents to plotly.express
  - https://plotly.com/python/plotly-express/
- Shiny integration and plotly proxy objects with functionality matching existing R package
- Quarto integration with functionality matching existing R package
- Static image export with the Kaleido package
 
## Out of scope

- Translation from ggplot2 to plotly figures
- Anything described as deprecated in the plotly.R, plotly.js, or plotly.py repos (i.e. deprecated figure_factory)
- Dash Support
- matplotlylib module
- Plotly Studio
- ipywidgets

# Dependencies

## R libraries that are acceptable imports

- tools
- data.table
- curl
- jsonlite
- htmltools
- htmlwidgets
- roxygen2
- RColorBrewer
- viridisLite
- base64enc
- promises
- grDevices (base R)
- utils (base R)

## R libraries that are acceptable suggests

- sf
- shiny
- rmarkdown
- MASS
- Cairo
- listviewer
- png
- knitr
- reticulate (only for Kaleido static image export)

## R libraries that are not acceptable dependencies in any form

- dplyr (use data.table instead)
- tibble (use data.table instead)
- tidyr (use data.table and Base R instead)
- vctrs (use Base R instead)
- purrr (use Base R instead)
- scales 
- httr (use curl instead)
- magrittr (use Base R pipe |> instead)
- lazyeval
- cpp11
- forcats

# Conventions

- Tests are plain base R scripts in `tests/*.R` (use `stopifnot()`), run by `R CMD check`. Do not use testthat or tinytest.
- Generated graph objects follow plotly.py: one constructor per compound schema node, named after its path (e.g. `go_scatter()`, `go_scatter_marker()`, `go_layout_xaxis()`), each with generated roxygen docs. Validator parameters are generated as data (like plotly.py's `_validators.json`) and interpreted by hand-written base validators.
- Generated R files are prefixed `zz-gen-` and committed. Do not edit them by hand.
- `Rscript commands.R updateplotlyjs [version]` updates the bundled plotly.js from npm. `updateplotlyjsdev [path]` uses a local clone.
- Generated docs are one help page per trace type (go_<trace>(), its nested go_<trace>_*() constructors and add_<trace>()) plus go_layout() and one page per top-level layout object, to keep installed help under CRAN's ~5MB documentation guideline.
- Generated constructors and add_*() functions put `...` before the property arguments, so property names must be given in full (R would otherwise partially match e.g. `scen` to `scene`).
- `CODEGEN_SCOPE` in codegen/generate.R is `NULL` (full schema). Set it to a list to limit generation while developing.
- tests/fixtures/ holds reference output from plotly.py, regenerated with the scripts in codegen/fixtures/. Behaviour ported from plotly.py should be tested against such fixtures.
- Once `src/` exists, NAMESPACE must contain `useDynLib(plotly.R.core, .registration = TRUE)` before running roxygen. The C init function is `R_init_plotly_R_core`.

