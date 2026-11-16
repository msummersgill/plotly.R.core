# Wrap text for LaTeX rendering

Wraps a string in `$...$` so plotly.js renders it with MathJax (requires
`config(p, mathjax = "cdn")`).

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
  config(mathjax = "cdn")
```
