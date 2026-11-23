# Set the source id of a plot's events

Sets the source id that
[`event_data()`](https://msummersgill.github.io/plotly.R.core/reference/event_data.md)
uses to tell plots apart (default `"A"`); the plotly package sets it
with the `source` argument of `plot_ly()`.

## Usage

``` r
event_source(p, source)
```

## Arguments

- p:

  A
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
  or plotly htmlwidget.

- source:

  A string identifying the plot.

## Value

The modified figure.

## See also

[`event_register()`](https://msummersgill.github.io/plotly.R.core/reference/event_register.md),
[`event_unregister()`](https://msummersgill.github.io/plotly.R.core/reference/event_unregister.md)

## Examples

``` r
fig <- go_figure(go_scatter(y = 1:3)) |>
  event_source("scatter") |>
  event_register("plotly_legendclick")
```
