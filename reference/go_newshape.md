# Layout newshape objects

The object for the figure layout's `newshape`. `go_newshape()` creates
one, with exactly its properties; a named list with the same properties
works too.

## Usage

``` r
go_newshape(
  arg = NULL,
  ...,
  drawdirection = NULL,
  fillcolor = NULL,
  fillrule = NULL,
  label = NULL,
  layer = NULL,
  legend = NULL,
  legendgroup = NULL,
  legendgrouptitle = NULL,
  legendrank = NULL,
  legendwidth = NULL,
  line = NULL,
  name = NULL,
  opacity = NULL,
  showlegend = NULL,
  visible = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- drawdirection:

  When \`dragmode\` is set to "drawrect", "drawline" or "drawcircle"
  this limits the drag to be horizontal, vertical or diagonal. Using
  "diagonal" there is no limit e.g. in drawing lines in any direction.
  "ortho" limits the draw to be either horizontal or vertical.
  "horizontal" allows horizontal extend. "vertical" allows vertical
  extend. One of `"ortho"`, `"horizontal"`, `"vertical"`, `"diagonal"`.

- fillcolor:

  Sets the color filling new shapes' interior. Please note that if using
  a fillcolor with alpha greater than half, drag inside the active shape
  starts moving the shape underneath, otherwise a new shape could be
  started over. Color: a CSS color string or R color name.

- fillrule:

  Determines the path's interior. For more info please visit
  https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill-rule
  One of `"evenodd"`, `"nonzero"`.

- label:

  A
  [`go_label()`](https://msummersgill.github.io/plotly.R.core/reference/go_label.md)
  object or named list, with properties `font`, `padding`, `text`,
  `textangle`, `textposition`, `texttemplate`, `texttemplatefallback`,
  `xanchor` and `yanchor` (see
  [`go_label()`](https://msummersgill.github.io/plotly.R.core/reference/go_label.md)).

- layer:

  Specifies whether new shapes are drawn below gridlines ("below"),
  between gridlines and traces ("between") or above traces ("above").
  One of `"below"`, `"above"`, `"between"`.

- legend:

  Sets the reference to a legend to show new shape in. References to
  these legends are "legend", "legend2", "legend3", etc. Settings for
  these legends are set in the layout, under \`layout.legend\`,
  \`layout.legend2\`, etc. Subplot id: `"legend"`, `"legend2"`,
  `"legend3"`, ....

- legendgroup:

  Sets the legend group for new shape. Traces and shapes part of the
  same legend group hide/show at the same time when toggling legend
  items. String.

- legendgrouptitle:

  A
  [`go_legendgrouptitle()`](https://msummersgill.github.io/plotly.R.core/reference/go_legendgrouptitle.md)
  object or named list, with properties `font` and `text` (see
  [`go_legendgrouptitle()`](https://msummersgill.github.io/plotly.R.core/reference/go_legendgrouptitle.md)).

- legendrank:

  Sets the legend rank for new shape. Items and groups with smaller
  ranks are presented on top/left side while with "reversed"
  \`legend.traceorder\` they are on bottom/right side. The default
  legendrank is 1000, so that you can use ranks less than 1000 to place
  certain items before all unranked items, and ranks greater than 1000
  to go after all unranked items. Number.

- legendwidth:

  Sets the width (in px or fraction) of the legend for new shape. Number
  in the interval \[0, Inf\].

- line:

  A
  [`go_newshape_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_newshape_line.md)
  object or named list, with properties `color`, `dash` and `width` (see
  [`go_newshape_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_newshape_line.md)).

- name:

  Sets new shape name. The name appears as the legend item. String.

- opacity:

  Sets the opacity of new shapes. Number in the interval \[0, 1\].

- showlegend:

  Determines whether or not new shape is shown in the legend. Logical.

- visible:

  Determines whether or not new shape is visible. If "legendonly", the
  shape is not drawn, but can appear as a legend item (provided that the
  legend itself is visible). One of `"legendonly"`, `TRUE`, `FALSE`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_newshape` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter(x = ~wt, y = ~mpg, mode = "markers") |>
  update_layout(newshape = go_newshape(opacity = 0.5))
```
