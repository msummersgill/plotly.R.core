# Print or knit a figure

Printing a figure renders it with
[`plotly_widget()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_widget.md)
in the RStudio viewer or a browser. In R Markdown and Quarto documents,
figures are rendered inline: as interactive widgets in HTML output,
sized by the chunk options `fig.width`/`fig.height`
(`fig-width`/`fig-height` in Quarto) unless the layout sets a size; and,
for other formats (PDF, Word, ...), as static images made with Kaleido
(see
[`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md))
when it is available.

## Usage

``` r
# S3 method for class 'go_figure'
print(x, ...)

# S3 method for class 'go_figure'
knit_print(x, ..., options = NULL)
```

## Arguments

- x:

  A `go_figure` object.

- ...:

  Passed on to the htmlwidget print or knit_print method.

- options:

  Chunk options (from knitr).

## Value

`x`, invisibly, for [`print()`](https://rdrr.io/r/base/print.html).

## Details

Set the chunk option `plotly.static = TRUE` to use static images in HTML
output too, or `plotly.static = FALSE` to always use a widget.
