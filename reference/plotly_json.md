# JSON of a plot

Returns the JSON plotly.js receives for a plot.

## Usage

``` r
plotly_json(p = last_plot(), jsonedit = interactive(), pretty = TRUE, ...)
```

## Arguments

- p:

  A
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
  or anything
  [`as_widget()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_widget.md)
  accepts (default: the last plot printed).

- jsonedit:

  Show it in an interactive viewer (needs the listviewer package)?

- pretty:

  Pretty-print the JSON?

- ...:

  Passed to
  [`listviewer::jsonedit()`](https://rdrr.io/pkg/listviewer/man/jsonedit.html).

## Value

The JSON string (or a listviewer widget).

## Examples

``` r
cat(plotly_json(go_figure(go_bar(y = 1:3)), jsonedit = FALSE))
#> {
#>   "data": [
#>     {
#>       "type": "bar",
#>       "y": [1, 2, 3]
#>     }
#>   ],
#>   "layout": {
#>     "template": {
#>       "layout": {
#>         "margin": {
#>           "b": 40,
#>           "l": 60,
#>           "t": 25,
#>           "r": 10
#>         }
#>       }
#>     }
#>   },
#>   "frames": [],
#>   "config": {}
#> }
```
