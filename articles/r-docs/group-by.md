# Group By

#### Basic Example

The `groupby` transform was removed from plotly.js. Use `split` instead
to add one trace per group, and the figure’s `colorway` to color the
groups.

``` r

library(plotly.core)

cars <- cbind(make = rownames(mtcars), mtcars)

cars |>
  go_figure() |>
  update_layout(colorway = c("blue", "red", "black")) |>
  add_scatter(
    x = ~hp,
    y = ~qsec,
    text = ~ paste("Make: ", make,
                   "<br>hp: ", hp,
                   "<br>qsec: ", qsec,
                   "<br>Cyl: ", cyl),
    hoverinfo = "text",
    mode = "markers",
    split = ~cyl
  )
```

#### Reference

See
[`go_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md)
for more information and options!
