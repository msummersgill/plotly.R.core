# Set plotly.js configuration options

Sets options of the plotly.js `config` object (e.g. `displayModeBar`,
`scrollZoom`, `toImageButtonOptions`), which control interaction rather
than appearance. Options are merged with any set previously. `config()`
is an S3 generic, so packages can handle options of their own plot
classes before the default method validates them.

## Usage

``` r
config(p, ...)

# Default S3 method
config(
  p,
  ...,
  locale = NULL,
  mathjax = NULL,
  cloud = FALSE,
  showSendToCloud = cloud
)
```

## Arguments

- p:

  A
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
  or plotly htmlwidget.

- ...:

  Named configuration options; see
  <https://plotly.com/javascript/configuration-options/>.

- locale:

  A locale such as `"de"` or `"fr-ch"`, for translated modebar text and
  number/date formatting.

- mathjax:

  `"cdn"` to load MathJax from a CDN so LaTeX in `$...$` text (see
  [`TeX()`](https://msummersgill.github.io/plotly.R.core/reference/TeX.md))
  is rendered.

- cloud, showSendToCloud:

  Show the modebar button that sends the chart to Plotly Cloud
  (`plotlyServerURL`)? Off by default, because clicking it uploads the
  chart data to an external server. `cloud` is the legacy plotly
  package's name for it.

## Value

The modified figure.

## Examples

``` r
go_figure(go_scatter(y = 1:3)) |>
  config(displayModeBar = FALSE, scrollZoom = TRUE, locale = "de")
```
