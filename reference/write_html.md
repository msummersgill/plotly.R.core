# Write a figure to an HTML file

Saves a figure as a standalone web page, like
[`htmlwidgets::saveWidget()`](https://rdrr.io/pkg/htmlwidgets/man/saveWidget.html)
(and plotly.py's `fig.write_html()`), but faster for figures with a lot
of data: the page is laid out by htmlwidgets as usual, while the
figure's data is written to the file directly, rather than passed
through htmltools as one long string, which is scanned and copied
several times. For a heatmap of 4 million values this takes a fraction
of the time `saveWidget()` does.

## Usage

``` r
write_html(
  fig,
  file,
  selfcontained = TRUE,
  libdir = NULL,
  background = "white",
  title = NULL
)
```

## Arguments

- fig:

  A figure (e.g. from
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md))
  or a plotly.core widget (e.g. from
  [`plotly_widget()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_widget.md),
  or a figure from plotly's `plot_ly()`).

- file:

  Path of the HTML file to write.

- selfcontained:

  Whether to embed the files the page needs in it, so that the file
  works on its own. Otherwise they are written to `libdir`.

- libdir:

  Directory for those files when `selfcontained = FALSE`, relative to
  the directory of `file` (default: `<name of file>_files`).

- background:

  Background color of the page.

- title:

  Title of the page (default: the widget's name).

## Value

`file`, invisibly.

## Details

The page is the same as `saveWidget()` writes, except that with
`selfcontained = TRUE` the files the page needs (plotly.js, htmlwidgets
and so on) are embedded as base64 data URIs by `write_html()` itself,
without needing pandoc.

## See also

[`htmlwidgets::saveWidget()`](https://rdrr.io/pkg/htmlwidgets/man/saveWidget.html),
[`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md)
for static images.

## Examples

``` r
fig <- go_figure() |> add_heatmap(z = as_float32(volcano))
f <- tempfile(fileext = ".html")
write_html(fig, f)
```
