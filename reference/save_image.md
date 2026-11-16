# Save a figure as a static image

Exports a figure to PNG, JPEG, WebP, SVG, PDF or EPS with plotly.js's
own image export, using the plotly.js bundled with this package in
headless Chrome (driven by the chromote package). No Python is needed.

## Usage

``` r
chrome_exporter(...)

save_image(p, file, ..., width = NULL, height = NULL, scale = NULL)
```

## Arguments

- ...:

  Unused.

- p:

  A
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
  a figure from a `px_*()` function or a plotly htmlwidget (anything
  [`as_widget()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_widget.md)
  accepts).

- file:

  Output file; the format is taken from the extension (`.png`, `.jpeg`,
  `.jpg`, `.webp`, `.svg`, `.pdf` or `.eps`).

- width, height:

  Image size in pixels. Default: the figure's layout width and height,
  or 700 x 500.

- scale:

  Multiplier for the image resolution (e.g. 2 for high-DPI PNGs).

## Value

`save_image()` returns `file` invisibly. `chrome_exporter()` returns an
exporter with [`transform()`](https://rdrr.io/r/base/transform.html) and
`shutdown()` functions.

## Details

It uses an installed Chrome or Chromium, the one set by the
`CHROMOTE_CHROME` environment variable, or a Chrome Headless Shell
downloaded by chromote. Without any of these, an interactive session
asks whether to download Chrome Headless Shell (about 100 MB, kept for
later sessions); elsewhere, download it once with
`chromote::chrome_versions_add("latest-stable", "chrome-headless-shell")`.

The browser is started on the first export and reused for later ones.
LaTeX (see
[`TeX()`](https://msummersgill.github.io/plotly.R.core/reference/TeX.md))
is typeset with MathJax, loaded from a CDN. PDF is made by printing the
SVG image to a page of the figure's size; EPS is converted from the SVG
image with the rsvg package.

`chrome_exporter()` returns an exporter of its own, whose
`transform(p, file, ...)` function writes images; call its `shutdown()`
function when done.

## Examples

``` r
if (FALSE) { # \dontrun{
fig <- px_data_iris() |> px_scatter(x = ~sepal_width, y = ~sepal_length, color = ~species)
save_image(fig, tempfile(fileext = ".png"), width = 800, height = 500, scale = 2)
save_image(fig, tempfile(fileext = ".svg"))
} # }
```
