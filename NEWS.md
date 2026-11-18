# plotly.core 0.1.0

* Initial CRAN submission.
* Graph objects generated from the plotly.js (4.3.0) schema: a `go_*()`
  constructor for every trace type and the layout, `add_<trace>()`,
  `update_layout()`, `update_traces()` and friends, with plotly.py-style
  validation and generated documentation. Nested objects are named lists
  (`marker = list(size = 10)`), documented on their parent's help page; the
  objects shared across the schema have constructors of their own
  (`go_font()`, `go_colorbar()`, `go_hoverlabel()`, `go_legendgrouptitle()`,
  `go_tickformatstop()`, `go_domain()`, `go_pattern()`, `go_error_bar()`,
  the shared types of plotly.js's TypeScript definitions, and `go_bins()`,
  `go_minor()`, `go_rangebreak()`, ... for the other objects that are the same
  everywhere they appear). plotly.py's "magic underscore" property
  names (`marker_size = 10`) are not supported (#5).
* Plotly Express: all of plotly.py's `px.*` functions as `px_scatter()`,
  `px_line()`, `px_bar()`, ... plus `px_imshow()`, with faceting, marginals,
  trendlines, animation, the `px.data` datasets and templates.
* `make_subplots()`, templates (`default_template()`, `register_template()`).
* htmlwidget rendering: numeric arrays are sent as base64 typed arrays, arrays
  repeated in a figure are sent once, `as_float32()` sends data in single
  precision, and `partial_bundle()` loads a smaller plotly.js bundle.
* Numbers and date-times are sent without loss of precision: typed arrays
  carry doubles exactly, numbers in JSON are written in the fewest digits that
  read back as the same double, and date-times keep microseconds.
* `write_html()` saves figures as HTML pages faster than
  `htmlwidgets::saveWidget()`.
* Shiny (`plotlyOutput()`, `renderPlotly()`, `event_data()`, `plotlyProxy()`),
  knitr/Quarto output, and static image export (`save_image()`) to PNG, JPEG,
  WebP, SVG, PDF and EPS with headless Chrome via chromote, with LaTeX
  typeset by MathJax; no Python or Kaleido needed.
* MathJax 3.2.2 (`tex-svg.js`) is bundled: `config(mathjax = "local")` (or
  `TRUE`) renders LaTeX (`TeX()`) offline and in self-contained HTML, and
  `save_image()` typesets it without network access. `config(mathjax =
  "cdn")` still loads it from cdn.jsdelivr.net.
* `save_image()` sends figures to Chrome as the widget does: numeric arrays
  and date-times as base64 typed arrays, and arrays shared by traces once
  (decoded by the widget's own code, `lib/plotlycore/codec.js`), so exports
  of large figures are several times faster than with Kaleido. Exports wait
  up to `getOption("plotly.core.export_timeout", 300)` seconds.
* `save_image()` finds Chrome or another Chromium-based browser (Microsoft
  Edge, Chromium, Brave, including per-user installs), or offers to download Chrome Headless Shell in
  interactive sessions. On Linux it checks the shared libraries Chrome needs
  and can download missing ones into the user cache without administrator
  rights (Debian/Ubuntu and RHEL-family systems); `install_chrome()` does the
  same set-up non-interactively, and `remove_chrome()` removes the downloads.
  Startup failures show Chrome's own output.
* Renders the plotly R package's `plot_ly()` and `ggplotly()` figures,
  including its crosstalk linking (`highlight()`).
* Linked views with crosstalk: `px_*()` functions accept a
  `crosstalk::SharedData` as `data_frame`, `go_figure()` and `add_<trace>()`
  accept one as the data for formulas (`add_scatter(x = ~col)`) and link
  the traces of its rows, `set_crosstalk_keys()` links the traces of any
  figure, and `highlight()` sets how selections are made and
  shown (the same options as the plotly package's `highlight()`).
