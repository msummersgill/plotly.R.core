# Render a figure as an htmlwidget

`plotly_widget()` and `as_widget()` turn a figure into an htmlwidget,
which is what printing a figure does. Use them to embed figures with
htmltools or
[`htmlwidgets::saveWidget()`](https://rdrr.io/pkg/htmlwidgets/man/saveWidget.html).

## Usage

``` r
plotly_widget(
  fig,
  width = NULL,
  height = NULL,
  elementId = NULL,
  config = NULL,
  bundle = NULL
)

as_widget(x, ...)
```

## Arguments

- fig:

  A
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
  or a list with `data` (list of traces), `layout`, `frames` and
  `config` elements.

- width, height:

  Widget size in CSS units, or `NULL` for the layout's `width`/`height`
  or to fill the container.

- elementId:

  Optional element id for the widget.

- config:

  Plotly.js configuration options (e.g. `list(displayModeBar = FALSE)`),
  merged over those set with
  [`config()`](https://msummersgill.github.io/plotly.R.core/reference/config.md).

- bundle:

  The plotly.js bundle to load: `"full"`, `"auto"` (the smallest bundle
  with all the figure's trace types) or the name of a partial bundle
  (see
  [`partial_bundle()`](https://msummersgill.github.io/plotly.R.core/reference/partial_bundle.md)).
  By default, the one set with
  [`partial_bundle()`](https://msummersgill.github.io/plotly.R.core/reference/partial_bundle.md),
  or the `plotly.core.bundle` option (`"full"` if unset).

- x:

  A figure or htmlwidget. `as_widget()` is an S3 generic: the plotly
  package adds a method for its `plot_ly()` objects.

- ...:

  Passed to `plotly_widget()`.

## Value

An object of class `htmlwidget`.

## Details

If the figure's layout has no `template`, the default template (see
[`default_template()`](https://msummersgill.github.io/plotly.R.core/reference/get_template.md))
is applied. With the `"none"` default, figures get plotly 4.x's margins
(`l = 60, r = 10, t = 25, b = 40` pixels) unless their layout sets them
(e.g. `update_layout(margin = go_margin(t = 50))`).

Numeric arrays in traces are sent to the browser as base64-encoded typed
arrays (`{dtype, bdata}` objects, as plotly.py does), which are smaller
and faster to load than JSON numbers. JavaScript that reads `x.data` in
[`htmlwidgets::onRender()`](https://rdrr.io/pkg/htmlwidgets/man/onRender.html)
sees these objects rather than arrays; read the plotted values from
`el._fullData` instead.
[`plotly_json()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_json.md)
shows plain JSON. Vectors of whole numbers are sent as integers; see
[`as_float32()`](https://msummersgill.github.io/plotly.R.core/reference/as_float32.md)
to send other numbers in single precision. Dates and date-times are sent
as numbers and turned back into "YYYY-MM-DD HH:MM:SS" strings (in the
vector's time zone) in the browser before plotting.

plotly.js is copied next to the HTML (or embedded in self-contained
files). Set `options(plotly.core.plotlyjs = "cdn")` to load it from
cdn.jsdelivr.net instead, e.g. for a website with many pages of figures.

## Examples

``` r
plotly_widget(list(data = list(list(type = "bar", x = 1:3, y = c(2, 5, 3)))))

{"x":{"data":[{"type":"bar","x":{"dtype":"i1","bdata":"AQID"},"y":{"dtype":"i1","bdata":"AgUD"}}],"layout":{"template":{"layout":{"margin":{"b":40,"l":60,"t":25,"r":10}}}},"frames":[],"config":{},"source":"A","shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"]},"evals":[],"jsHooks":[]}
```
