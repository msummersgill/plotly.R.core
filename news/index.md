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
- Renders the plotly R package’s
  [`plot_ly()`](https://rdrr.io/pkg/plotly/man/plot_ly.html) and
  [`ggplotly()`](https://rdrr.io/pkg/plotly/man/ggplotly.html) figures,
  including its crosstalk linking
  ([`highlight()`](https://rdrr.io/pkg/plotly/man/highlight.html)).
