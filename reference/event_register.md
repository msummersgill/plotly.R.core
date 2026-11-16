# Register plotly events for Shiny

Plots send these events to Shiny by default: `plotly_hover`,
`plotly_click`, `plotly_selected`, `plotly_relayout`, `plotly_brushed`,
`plotly_brushing`, `plotly_clickannotation`, `plotly_doubleclick`,
`plotly_deselect`, `plotly_afterplot` and `plotly_sunburstclick`.
`event_register()` adds others (e.g. `plotly_legendclick`);
`event_unregister()` removes events. `event_source()` sets the source id
that
[`event_data()`](https://msummersgill.github.io/plotly.R.core/reference/event_data.md)
uses to tell plots apart (default `"A"`).

## Usage

``` r
event_register(p, event = NULL)

event_unregister(p, event = NULL)

event_source(p, source)
```

## Arguments

- p:

  A
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
  or plotly htmlwidget.

- event:

  An event name (see
  [`event_data()`](https://msummersgill.github.io/plotly.R.core/reference/event_data.md)).

- source:

  A string identifying the plot.

## Value

The modified figure.

## Examples

``` r
fig <- go_figure(go_scatter(y = 1:3)) |>
  event_source("scatter") |>
  event_register("plotly_legendclick")
```
