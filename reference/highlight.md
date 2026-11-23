# Query graphical elements in multiple linked views

This function sets a variety of options for brushing (i.e.,
highlighting) multiple plots. These options are primarily designed for
linking multiple plotly graphs, and may not behave as expected when
linking plotly to another htmlwidget package via crosstalk. In some
cases, other htmlwidgets will respect these options, such as persistent
selection in leaflet.

## Usage

``` r
highlight(
  p,
  on = "plotly_click",
  off,
  persistent = getOption("persistent", FALSE),
  dynamic = FALSE,
  color = NULL,
  selectize = FALSE,
  defaultValues = NULL,
  opacityDim = getOption("opacityDim", 0.2),
  selected = attrs_selected(),
  debounce = 0,
  ...
)
```

## Arguments

- p:

  a
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
  or a plotly htmlwidget.

- on:

  turn on a selection on which event(s)? To disable on events
  altogether, use `NULL`. Currently the following are supported:

  - `'plotly_click'`

  - `'plotly_hover'`

  - `'plotly_selected'`: triggered through rectangular (layout.dragmode
    = 'select') or lasso (layout.dragmode = 'lasso') brush.

  - `'plotly_selecting'`: as `'plotly_selected'`, while dragging.

- off:

  turn off a selection on which event(s)? To disable off events
  altogether, use `NULL`. Currently the following are supported:

  - `'plotly_doubleclick'`: triggered on a double mouse click while
    (layout.dragmode = 'zoom') or (layout.dragmode = 'pan')

  - `'plotly_deselect'`: triggered on a double mouse click while
    (layout.dragmode = 'select') or (layout.dragmode = 'lasso')

  - `'plotly_relayout'`: triggered whenever axes are rescaled (i.e.,
    clicking the home button in the modebar) or whenever the
    height/width of the plot changes.

- persistent:

  should selections persist (i.e., accumulate)? We often refer to the
  default (`FALSE`) as a 'transient' selection mode; which is
  recommended, because one may switch from 'transient' to 'persistent'
  selection by holding the shift key.

- dynamic:

  should a widget for changing selection colors be included?

- color:

  character string of color(s) to use for highlighting selections: R
  colour names, hex colours or CSS colours such as
  `"rgba(255,0,0,0.5)"`. If `NULL` (the default), the color of selected
  marks are not altered.

- selectize:

  whether or not to render a selectize.js widget for selecting the keys.
  A list of additional selectize.js options may also be provided.

- defaultValues:

  a vector of values for setting a "default selection". These values
  should match the key attribute.

- opacityDim:

  a number between 0 and 1 used to reduce the opacity of non-selected
  traces (by multiplying with the existing opacity).

- selected:

  attributes of the selection, see
  [`attrs_selected()`](https://msummersgill.github.io/plotly.R.core/reference/attrs_selected.md).

- debounce:

  amount of time to wait before firing an event (in milliseconds). The
  default of 0 means do not debounce at all. Debouncing is mainly useful
  when `on = "plotly_hover"` to avoid firing too many events when users
  clickly move the mouse over relevant graphical marks.

- ...:

  currently not supported.

## Value

`p` with the highlighting options.

## Details

A figure is linked when its data come from a
[crosstalk::SharedData](https://rdrr.io/pkg/crosstalk/man/SharedData.html)
(pipe one into
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
and add traces with formulas such as `add_scatter(x = ~col)`, or link
traces with
[`set_crosstalk_keys()`](https://msummersgill.github.io/plotly.R.core/reference/set_crosstalk_keys.md)).
Linked figures highlight on click by default; `highlight()` changes
that. `highlight()` also works on plotly htmlwidgets.

## References

<https://plotly-r.com/client-side-linking.html>

## See also

[`attrs_selected()`](https://msummersgill.github.io/plotly.R.core/reference/attrs_selected.md),
[`set_crosstalk_keys()`](https://msummersgill.github.io/plotly.R.core/reference/set_crosstalk_keys.md)

## Author

Carson Sievert

## Examples

``` r
crosstalk::SharedData$new(iris) |>
  go_figure() |>
  add_scatter(x = ~Sepal.Width, y = ~Sepal.Length, mode = "markers") |>
  highlight(on = "plotly_selected", color = "red")
```
