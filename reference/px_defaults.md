# Plotly Express defaults

`px_defaults` is an environment of default values used by the `px_*()`
functions when the corresponding argument is `NULL`, like plotly.py's
`px.defaults`: `template`, `width`, `height`, `color_discrete_sequence`,
`color_discrete_map`, `color_continuous_scale`, `symbol_sequence`,
`symbol_map`, `line_dash_sequence`, `line_dash_map`,
`pattern_shape_sequence`, `pattern_shape_map`, `size_max`,
`category_orders` and `labels`. `reset_px_defaults()` restores the
initial values.

## Usage

``` r
px_defaults

reset_px_defaults()
```

## Format

An environment.

## Value

`reset_px_defaults()` returns `px_defaults` invisibly.

## Examples

``` r
px_defaults$template <- "plotly_white"
px_defaults$color_continuous_scale <- px_colors$sequential$Blackbody
reset_px_defaults()
```
