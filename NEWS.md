# plotly.core 0.1.0

* Initial CRAN submission.
* Graph objects generated from the plotly.js (4.3.0) schema: a `go_*()`
  constructor for every trace type and layout object, `add_<trace>()`,
  `update_layout()`, `update_traces()` and friends, with plotly.py-style
  validation and generated documentation.
* Plotly Express: all of plotly.py's `px.*` functions as `px_scatter()`,
  `px_line()`, `px_bar()`, ... plus `px_imshow()`, with faceting, marginals,
  trendlines, animation, the `px.data` datasets and templates.
* `make_subplots()`, templates (`default_template()`, `register_template()`).
* htmlwidget rendering: numeric arrays are sent as base64 typed arrays, arrays
  repeated in a figure are sent once, `as_float32()` sends data in single
  precision, and `partial_bundle()` loads a smaller plotly.js bundle.
* `write_html()` saves figures as HTML pages faster than
  `htmlwidgets::saveWidget()`.
* Shiny (`plotlyOutput()`, `renderPlotly()`, `event_data()`, `plotlyProxy()`),
  knitr/Quarto output, and static image export (`save_image()`) to PNG, JPEG,
  WebP, SVG, PDF and EPS with headless Chrome via chromote, with LaTeX
  typeset by MathJax; no Python or Kaleido needed.
* Renders the plotly R package's `plot_ly()` and `ggplotly()` figures,
  including its crosstalk linking (`highlight()`).
