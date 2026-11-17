# Highlight linked selections

Sets how a figure responds to, and shows, selections of points linked
with crosstalk. A figure is linked when its data come from a
[crosstalk::SharedData](https://rdrr.io/pkg/crosstalk/man/SharedData.html)
(give one as the `data_frame` of a `px_*()` function, or link traces
with
[`set_crosstalk_keys()`](https://msummersgill.github.io/plotly.R.core/reference/set_crosstalk_keys.md)):
selecting points then selects the rows with the same keys in every view
of the same crosstalk group, such as other plots,
[`crosstalk::filter_select()`](https://rdrr.io/pkg/crosstalk/man/filter_select.html)
inputs, DT tables or leaflet maps. Linked figures highlight on click by
default; `highlight()` changes that.

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

attrs_selected(opacity = 1, ...)
```

## Arguments

- p:

  A
  [`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
  (e.g. from a `px_*()` function) or a plotly htmlwidget.

- on:

  The event that selects points: `"plotly_click"`, `"plotly_hover"`,
  `"plotly_selected"` (box or lasso selection) or `"plotly_selecting"`
  (selection while dragging). `NULL` turns selecting from this plot off.

- off:

  The event that clears the selection: `"plotly_doubleclick"`,
  `"plotly_deselect"` or `"plotly_relayout"`. The default matches `on`:
  `"plotly_deselect"` for selections, otherwise `"plotly_doubleclick"`.
  `NULL` turns clearing off.

- persistent:

  Whether new selections add to the current one rather than replace it.
  Holding the shift key while selecting does this too.

- dynamic:

  Whether to show a colour picker for the selection colour.

- color:

  The selection colour (several, for `dynamic = TRUE`): R colour names,
  hex colours or CSS colours such as `"rgba(255,0,0,0.5)"`. `NULL` keeps
  the points' own colours and dims the rest.

- selectize:

  Whether to show a searchable dropdown of the keys, which selects them;
  or a list of selectize.js options for it.

- defaultValues:

  Keys selected when the figure is first shown.

- opacityDim:

  Opacity multiplier (0 to 1) of points not selected.

- selected:

  Trace attributes of the selected points, made with `attrs_selected()`.

- debounce:

  Milliseconds to wait before selecting, for frequent events such as
  `"plotly_hover"` and `"plotly_selecting"`.

- ...:

  Unused.

- opacity:

  Opacity of the selected points.

## Value

`p` with the highlighting options. `attrs_selected()` returns a list of
trace attributes.

## Details

The options match the plotly package's `highlight()`, and `highlight()`
also works on plotly htmlwidgets.

## See also

[`set_crosstalk_keys()`](https://msummersgill.github.io/plotly.R.core/reference/set_crosstalk_keys.md)

## Examples

``` r
sd <- crosstalk::SharedData$new(px_data_iris())
px_scatter(sd, x = ~sepal_width, y = ~sepal_length, color = ~species) |>
  highlight(on = "plotly_selected", color = "red")
```
