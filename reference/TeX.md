# Wrap text for LaTeX rendering

Wraps a string in `$...$` so plotly.js renders it with MathJax (requires
`config(p, mathjax = "local")`, or `"cdn"`;
[`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md)
needs nothing).

## Usage

``` r
TeX(x)
```

## Arguments

- x:

  A character string of LaTeX.

## Value

The wrapped string.

## Examples

``` r
go_figure() |>
  update_layout(title = TeX("\\alpha + \\beta x")) |>
  config(mathjax = "local")
```
