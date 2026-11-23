# Render TeX in a plotly graph using MathJax

This function makes it slightly easier to render TeX in a plotly graph –
it ensures the provided string is surrounded with `$` (this is what
plotly.js uses to declare a string as TeX). MathJax must be included
with `config(p, mathjax = "local")` (or `"cdn"`);
[`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md)
needs nothing.

## Usage

``` r
TeX(x)
```

## Arguments

- x:

  a character vector

## Value

`x`, surrounded with `$`.

## See also

[config](https://msummersgill.github.io/plotly.R.core/reference/config.md)

## Author

Carson Sievert

## Examples

``` r
go_figure() |>
  update_layout(title = TeX("\\text{Some mathjax: }\\alpha+\\beta x")) |>
  config(mathjax = "cdn")
```
