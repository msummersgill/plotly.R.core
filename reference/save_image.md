# Save a figure as a static image

Exports a figure to PNG, JPEG, WebP, SVG or PDF with the Python
[Kaleido](https://github.com/plotly/Kaleido) package, using the
plotly.js bundled with this package. Requires the reticulate package and
a Python installation with `kaleido` (Kaleido 1.x also needs `plotly`
and a Chrome browser): `reticulate::py_install(c("kaleido", "plotly"))`.

## Usage

``` r
save_image(p, file, ..., width = NULL, height = NULL, scale = NULL)

kaleido(...)
```

## Arguments

- p:

  A
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md),
  a figure from a `px_*()` function or a plotly htmlwidget (anything
  [`as_widget()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_widget.md)
  accepts).

- file:

  Output file; the format is taken from the extension (`.png`, `.jpeg`,
  `.jpg`, `.webp`, `.svg` or `.pdf`).

- ...:

  Unused.

- width, height:

  Image size in pixels. Default: the figure's layout width and height,
  or 700 x 500.

- scale:

  Multiplier for the image resolution (e.g. 2 for high-DPI PNGs).

## Value

`save_image()` returns `file` invisibly. `kaleido()` returns a list with
[`transform()`](https://rdrr.io/r/base/transform.html) and `shutdown()`
functions.

## Details

`kaleido()` returns an exporter whose `transform(p, file, ...)` function
writes images; reuse it to export many figures without restarting
Kaleido.

## Examples

``` r
if (FALSE) { # \dontrun{
fig <- px_data_iris() |> px_scatter(x = ~sepal_width, y = ~sepal_length, color = ~species)
save_image(fig, tempfile(fileext = ".png"), width = 800, height = 500, scale = 2)
save_image(fig, tempfile(fileext = ".svg"))
} # }
```
