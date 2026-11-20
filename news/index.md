# Changelog

## plotly.core 0.1.0

- Initial CRAN submission.
- Graph objects generated from the plotly.js (4.3.0) schema, with
  plotly.py-style validation and generated documentation:
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
  `add_<trace>()`,
  [`update_layout()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md),
  [`update_traces()`](https://msummersgill.github.io/plotly.R.core/reference/select_traces.md)
  and friends, and a `go_*()` constructor for every object in the
  schema, each with exactly that object’s properties
  ([\#5](https://github.com/msummersgill/plotly.R.core/issues/5)):
  - traces and the layout:
    [`go_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md),
    [`go_bar()`](https://msummersgill.github.io/plotly.R.core/reference/go_bar.md),
    …,
    [`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md);
  - objects shared across the schema, one constructor for all of their
    places:
    [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md),
    [`go_colorbar()`](https://msummersgill.github.io/plotly.R.core/reference/go_colorbar.md),
    [`go_hoverlabel()`](https://msummersgill.github.io/plotly.R.core/reference/go_hoverlabel.md),
    [`go_legendgrouptitle()`](https://msummersgill.github.io/plotly.R.core/reference/go_legendgrouptitle.md),
    [`go_tickformatstop()`](https://msummersgill.github.io/plotly.R.core/reference/go_tickformatstop.md),
    [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md),
    [`go_pattern()`](https://msummersgill.github.io/plotly.R.core/reference/go_pattern.md)
    and
    [`go_error_bar()`](https://msummersgill.github.io/plotly.R.core/reference/go_error_bar.md)
    (plotly.js’s shared TypeScript types),
    [`go_bins()`](https://msummersgill.github.io/plotly.R.core/reference/go_bins.md),
    [`go_minor()`](https://msummersgill.github.io/plotly.R.core/reference/go_minor.md),
    [`go_rangebreak()`](https://msummersgill.github.io/plotly.R.core/reference/go_rangebreak.md),
    … (objects that are the same everywhere they appear), x/y/z axes
    that are the same
    ([`go_scene_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_axis.md),
    [`go_ternary_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_ternary_axis.md),
    [`go_caps_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_caps_axis.md),
    …), the selected/unselected point styles of all traces
    ([`go_selected()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected.md),
    [`go_unselected()`](https://msummersgill.github.io/plotly.R.core/reference/go_unselected.md))
    and the objects in them
    ([`go_colorbar_title()`](https://msummersgill.github.io/plotly.R.core/reference/go_colorbar_title.md),
    [`go_selected_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_selected_marker.md),
    …);
  - every other object, named after its path without `layout.`:
    [`go_scatter_marker()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter_marker.md),
    [`go_scatter_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter_marker_line.md),
    [`go_sankey_link()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey_link.md),
    [`go_xaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis.md),
    [`go_scene()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene.md),
    [`go_scene_camera_eye()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_camera_eye.md),
    [`go_annotation()`](https://msummersgill.github.io/plotly.R.core/reference/go_annotation.md),
    [`go_slider_step()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider_step.md),
    …, with
    [`go_layout_title()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_title.md),
    [`go_layout_image()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_image.md),
    [`go_layout_colorscale()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_colorscale.md)
    and
    [`go_layout_transition()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_transition.md)
    where the path name would be ambiguous or is a trace’s.

  Constructors take properties by name only (no positional `arg`; start
  from a list with [`do.call()`](https://rdrr.io/r/base/do.call.html)),
  so names are never partially matched and unknown ones get an error
  that suggests the right name. Named lists work wherever an object
  does. One-sided formulas (`go_scatter_marker(color = ~cyl)`) are kept
  by constructors and evaluated in the data, then checked, when the
  trace is added with `add_<trace>()` or
  [`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).
  plotly.py’s “magic underscore” property names (`marker_size = 10`) are
  not supported.
- Plotly Express (`px_scatter()`, `px_bar()`, …) is in the separate
  plotly.express package, which builds on plotly.core; plotly.core
  exports the functions it uses (see
  [`?"plotly.core-extending"`](https://msummersgill.github.io/plotly.R.core/reference/plotly.core-extending.md)).
  plotly.py’s colour sequences and scales are `plotly_colors`.
  plotly.core no longer imports data.table
  ([\#4](https://github.com/msummersgill/plotly.R.core/issues/4)).
- [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md),
  templates
  ([`default_template()`](https://msummersgill.github.io/plotly.R.core/reference/get_template.md),
  [`register_template()`](https://msummersgill.github.io/plotly.R.core/reference/get_template.md));
  figures use no template (`"none"`, plotly.js’s own defaults) unless
  one is set, as plotly 4.x does.
- Figures rendered with the `"none"` default template have plotly 4.x’s
  margins (`l = 60, r = 10, t = 25, b = 40` pixels) unless the layout
  sets them.
- `add_<trace>()` takes data-driven defaults as plotly 4.x does:
  - `split = ~col` adds one trace per level, named after it;
  - colour properties given a discrete column
    (`marker = go_scatter_marker(color = ~group)`) split the same way,
    with viridis colours for ordered factors and the colorway otherwise;
  - axis titles, trace names and colorbar titles come from the formulas,
    and factor `x`/`y` values keep their level order, unless set.
- [`add_annotation()`](https://msummersgill.github.io/plotly.R.core/reference/add_annotation.md),
  [`add_shape()`](https://msummersgill.github.io/plotly.R.core/reference/add_shape.md)
  and the other layout element functions take vectors for single-value
  properties, adding one object per element.
- [`update_layout()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md)
  has every layout property as an argument, documented in
  [`?update_layout`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md).
- Colorscale names plotly.js knows (`"Blues"`, `"Viridis"`, …) use
  plotly.js’s definitions, as in plotly.js and plotly 4.x; others are
  plotly.py’s. With the `"none"` default template, colour scales default
  to viridis, as in plotly 4.x.
- `options(plotly.core.plotlyjs = "cdn")` loads plotly.js from
  cdn.jsdelivr.net instead of copying it next to the HTML, e.g. for
  websites with many pages.
- [`update_xaxes()`](https://msummersgill.github.io/plotly.R.core/reference/update_xaxes.md),
  [`update_traces()`](https://msummersgill.github.io/plotly.R.core/reference/select_traces.md)
  and the other `update_*()` / `select_*()` functions accept vectors and
  `"all"` for `row` and `col`, as documented.
- The pkgdown site has an Examples gallery: the Plotly R documentation
  examples rewritten with plotly.core graph objects.
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
- [`available_fonts()`](https://msummersgill.github.io/plotly.R.core/reference/available_fonts.md)
  lists the font families installed on this computer (with the
  systemfonts package), and
  [`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md)
  warns when a figure asks for a font that is not installed; see
  [`?available_fonts`](https://msummersgill.github.io/plotly.R.core/reference/available_fonts.md)
  for local versus viewer fonts.
- Shiny
  ([`plotlyOutput()`](https://msummersgill.github.io/plotly.R.core/reference/plotlyOutput.md),
  [`renderPlotly()`](https://msummersgill.github.io/plotly.R.core/reference/plotlyOutput.md),
  [`event_data()`](https://msummersgill.github.io/plotly.R.core/reference/event_data.md),
  [`plotlyProxy()`](https://msummersgill.github.io/plotly.R.core/reference/plotlyProxy.md)),
  knitr/Quarto output, and static image export
  ([`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md))
  to PNG, JPEG, WebP, SVG, PDF and EPS with headless Chrome via
  chromote, with LaTeX typeset by MathJax; no Python or Kaleido needed.
- MathJax 3.2.2 (`tex-svg.js`) is bundled: `config(mathjax = "local")`
  (or `TRUE`) renders LaTeX
  ([`TeX()`](https://msummersgill.github.io/plotly.R.core/reference/TeX.md))
  offline and in self-contained HTML, and
  [`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md)
  typesets it without network access. `config(mathjax = "cdn")` still
  loads it from cdn.jsdelivr.net.
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
  ([`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)).
- Linked views with crosstalk:
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
  and `add_<trace>()` accept a
  [`crosstalk::SharedData`](https://rdrr.io/pkg/crosstalk/man/SharedData.html)
  as the data for formulas (`add_scatter(x = ~col)`) and link the traces
  of its rows,
  [`set_crosstalk_keys()`](https://msummersgill.github.io/plotly.R.core/reference/set_crosstalk_keys.md)
  links the traces of any figure, and
  [`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)
  sets how selections are made and shown (the same options as the plotly
  package’s
  [`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)).
