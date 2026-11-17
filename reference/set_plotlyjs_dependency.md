# The plotly.js dependency of a widget

For packages that create widgets with plotly.core's widget (as the
plotly package does): `plotlyjs_dependency()` is the
[`htmltools::htmlDependency()`](https://rstudio.github.io/htmltools/reference/htmlDependency.html)
of a plotly.js bundle, and `set_plotlyjs_dependency()` replaces a
widget's. `locale_dependency()`, `mathjax_dependency()` and
`crosstalk_deps()` are the other dependencies
[`plotly_widget()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_widget.md)
attaches (for a locale, MathJax and linked highlighting). The dependency
must be attached when the widget is created: htmlwidgets collects
dependencies before a widget's `preRenderHook` runs.

## Usage

``` r
crosstalk_deps(highlight = list())

set_plotlyjs_dependency(w, bundle = "full")

plotlyjs_dependency(bundle = "full")

locale_dependency(locale)

mathjax_dependency()
```

## Arguments

- highlight:

  Linked-highlighting options (as set by the plotly package's
  [`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)):
  `selectize` and `dynamic` add their libraries.

- w:

  An htmlwidget.

- bundle:

  `"full"` or the name of a partial bundle (see
  [`partial_bundle()`](https://msummersgill.github.io/plotly.R.core/reference/partial_bundle.md)).

- locale:

  A plotly.js locale, e.g. `"de"`.

## Value

An `html_dependency` (a list of them for `crosstalk_deps()`), or the
widget.
