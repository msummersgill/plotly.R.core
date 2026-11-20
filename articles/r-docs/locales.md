# Locales

### Setting Locale

To change the localization, you can use the `locale` argument in the
[`config()`](https://msummersgill.github.io/plotly.R.core/reference/config.md)
function.

``` r

library(plotly.core)

x <- seq.Date(Sys.Date(), Sys.Date() + 360, by = "day")

fig <- go_figure() |>
  add_scatter(x = x, y = rnorm(length(x)), mode = "lines") |>
  config(locale = "zh-CN")
```

### Reference

See
[`config()`](https://msummersgill.github.io/plotly.R.core/reference/config.md)
for more information about config options or [click
here](https://msummersgill.github.io/plotly.R.core/articles/r-docs/configuration-options.md).
For more information regarding localization, [click
here](https://github.com/plotly/plotly.js/tree/master/dist#to-include-localization).
