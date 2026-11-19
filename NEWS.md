# plotly.core 0.1.0

* Initial CRAN submission.
* Graph objects generated from the plotly.js (4.3.0) schema, with
  plotly.py-style validation and generated documentation: `go_figure()`,
  `add_<trace>()`, `update_layout()`, `update_traces()` and friends, and a
  `go_*()` constructor for every object in the schema, each with exactly that
  object's properties (#5):
  * traces and the layout: `go_scatter()`, `go_bar()`, ..., `go_layout()`;
  * objects shared across the schema, one constructor for all of their
    places: `go_font()`, `go_colorbar()`, `go_hoverlabel()`,
    `go_legendgrouptitle()`, `go_tickformatstop()`, `go_domain()`,
    `go_pattern()` and `go_error_bar()` (plotly.js's shared TypeScript types),
    `go_bins()`, `go_minor()`, `go_rangebreak()`, ... (objects that are the
    same everywhere they appear), x/y/z axes that are the same
    (`go_scene_axis()`, `go_ternary_axis()`, `go_caps_axis()`, ...), the
    selected/unselected point styles of all traces (`go_selected()`,
    `go_unselected()`) and the objects in them (`go_colorbar_title()`,
    `go_selected_marker()`, ...);
  * every other object, named after its path without `layout.`:
    `go_scatter_marker()`, `go_scatter_marker_line()`,
    `go_sankey_link()`, `go_xaxis()`,
    `go_scene()`, `go_scene_camera_eye()`, `go_annotation()`,
    `go_slider_step()`, ..., with `go_layout_title()`, `go_layout_image()`,
    `go_layout_colorscale()` and `go_layout_transition()` where the path name
    would be ambiguous or is a trace's.

  Constructors take properties by name only (no positional `arg`; start
  from a list with `do.call()`), so names are never partially matched and
  unknown ones get an error that suggests the right name.
  Named lists work wherever an object does. One-sided formulas
  (`go_scatter_marker(color = ~cyl)`) are kept by constructors and evaluated
  in the data, then checked, when the trace is added with `add_<trace>()` or
  `add_trace()`. plotly.py's "magic underscore"
  property names (`marker_size = 10`) are not supported.
* Plotly Express (`px_scatter()`, `px_bar()`, ...) is in the separate
  plotly.express package, which builds on plotly.core; plotly.core exports the
  functions it uses (see `?"plotly.core-extending"`). plotly.py's colour
  sequences and scales are `plotly_colors`. plotly.core no longer imports
  data.table (#4).
* `make_subplots()`, templates (`default_template()`, `register_template()`);
  figures use no template (`"none"`, plotly.js's own defaults) unless one is
  set, as plotly 4.x does.
* htmlwidget rendering: numeric arrays are sent as base64 typed arrays, arrays
  repeated in a figure are sent once, `as_float32()` sends data in single
  precision, and `partial_bundle()` loads a smaller plotly.js bundle.
* Numbers and date-times are sent without loss of precision: typed arrays
  carry doubles exactly, numbers in JSON are written in the fewest digits that
  read back as the same double, and date-times keep microseconds.
* `write_html()` saves figures as HTML pages faster than
  `htmlwidgets::saveWidget()`.
* `available_fonts()` lists the font families installed on this computer
  (with the systemfonts package), and `save_image()` warns when a figure asks
  for a font that is not installed; see `?available_fonts` for local versus
  viewer fonts.
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
* Linked views with crosstalk: `go_figure()` and `add_<trace>()`
  accept a `crosstalk::SharedData` as the data for formulas (`add_scatter(x = ~col)`) and link
  the traces of its rows, `set_crosstalk_keys()` links the traces of any
  figure, and `highlight()` sets how selections are made and
  shown (the same options as the plotly package's `highlight()`).
