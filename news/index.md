# Changelog

## plotly.core 0.1.0

- Initial CRAN submission.
- Graph objects generated from the plotly.js (4.3.0) schema: a `go_*()`
  constructor for every trace type and layout object, `add_<trace>()`,
  [`update_layout()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md),
  [`update_traces()`](https://msummersgill.github.io/plotly.R.core/reference/select_traces.md)
  and friends, with plotly.py-style validation and generated
  documentation.
- Plotly Express: all of plotly.py’s `px.*` functions as
  [`px_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/px_scatter.md),
  [`px_line()`](https://msummersgill.github.io/plotly.R.core/reference/px_line.md),
  [`px_bar()`](https://msummersgill.github.io/plotly.R.core/reference/px_bar.md),
  … plus
  [`px_imshow()`](https://msummersgill.github.io/plotly.R.core/reference/px_imshow.md),
  with faceting, marginals, trendlines, animation, the `px.data`
  datasets and templates.
- [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md),
  templates
  ([`default_template()`](https://msummersgill.github.io/plotly.R.core/reference/get_template.md),
  [`register_template()`](https://msummersgill.github.io/plotly.R.core/reference/get_template.md)).
- htmlwidget rendering: numeric arrays are sent as base64 typed arrays,
  arrays repeated in a figure are sent once,
  [`as_float32()`](https://msummersgill.github.io/plotly.R.core/reference/as_float32.md)
  sends data in single precision, and
  [`partial_bundle()`](https://msummersgill.github.io/plotly.R.core/reference/partial_bundle.md)
  loads a smaller plotly.js bundle.
- Numbers and date-times are sent without loss of precision: typed
  arrays carry doubles exactly, numbers in JSON are written in the
  fewest digits that read back as the same double, and date-times keep
  microseconds.
- [`write_html()`](https://msummersgill.github.io/plotly.R.core/reference/write_html.md)
  saves figures as HTML pages faster than
  [`htmlwidgets::saveWidget()`](https://rdrr.io/pkg/htmlwidgets/man/saveWidget.html).
- Shiny
  ([`plotlyOutput()`](https://msummersgill.github.io/plotly.R.core/reference/plotlyOutput.md),
  [`renderPlotly()`](https://msummersgill.github.io/plotly.R.core/reference/plotlyOutput.md),
  [`event_data()`](https://msummersgill.github.io/plotly.R.core/reference/event_data.md),
  [`plotlyProxy()`](https://msummersgill.github.io/plotly.R.core/reference/plotlyProxy.md)),
  knitr/Quarto output, and static image export
  ([`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md))
  to PNG, JPEG, WebP, SVG, PDF and EPS with headless Chrome via
  chromote, with LaTeX typeset by MathJax; no Python or Kaleido needed.
- [`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md)
  sends figures to Chrome as the widget does: numeric arrays and
  date-times as base64 typed arrays, and arrays shared by traces once
  (decoded by the widget’s own code, `lib/plotlycore/codec.js`), so
  exports of large figures are several times faster than with Kaleido.
  Exports wait up to `getOption("plotly.core.export_timeout", 300)`
  seconds.
- [`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md)
  finds Chrome or another Chromium-based browser (Microsoft Edge,
  Chromium, Brave, including per-user installs), or offers to download
  Chrome Headless Shell in interactive sessions. On Linux it checks the
  shared libraries Chrome needs and can download missing ones into the
  user cache without administrator rights (Debian/Ubuntu and RHEL-family
  systems);
  [`install_chrome()`](https://msummersgill.github.io/plotly.R.core/reference/install_chrome.md)
  does the same set-up non-interactively, and
  [`remove_chrome()`](https://msummersgill.github.io/plotly.R.core/reference/install_chrome.md)
  removes the downloads. Startup failures show Chrome’s own output.
- Renders the plotly R package’s
  [`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) and
  [`ggplotly()`](https://rdrr.io/pkg/plotly/man/ggplotly.html) figures,
  including its crosstalk linking
  ([`highlight()`](https://rdrr.io/pkg/plotly/man/highlight.html)).
