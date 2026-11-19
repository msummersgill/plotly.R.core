# Layout scene objects

The object for the figure layout's `scene` (and `scene2`, `scene3`, ...:
see
[`update_scenes()`](https://msummersgill.github.io/plotly.R.core/reference/update_scenes.md)).
`go_scene()` creates one, with exactly its properties; a named list with
the same properties works too.

## Usage

``` r
go_scene(
  ...,
  annotations = NULL,
  aspectmode = NULL,
  aspectratio = NULL,
  bgcolor = NULL,
  camera = NULL,
  domain = NULL,
  dragmode = NULL,
  hovermode = NULL,
  uirevision = NULL,
  xaxis = NULL,
  yaxis = NULL,
  zaxis = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- annotations:

  List, each element a
  [`go_scene_annotation()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_annotation.md)
  object or named list, with properties `align`, `arrowcolor`,
  `arrowhead`, `arrowside`, `arrowsize`, `arrowwidth`, `ax`, `ay`,
  `bgcolor`, `bordercolor`, `borderpad`, `borderwidth` and 25 more (see
  [`go_scene_annotation()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_annotation.md)).

- aspectmode:

  If "cube", this scene's axes are drawn as a cube, regardless of the
  axes' ranges. If "data", this scene's axes are drawn in proportion
  with the axes' ranges. If "manual", this scene's axes are drawn in
  proportion with the input of "aspectratio" (the default behavior if
  "aspectratio" is provided). If "auto", this scene's axes are drawn
  using the results of "data" except when one axis is more than four
  times the size of the two others, where in that case the results of
  "cube" are used. One of `"auto"`, `"cube"`, `"data"`, `"manual"`.

- aspectratio:

  Sets this scene's axis aspectratio. A
  [`go_scene_aspectratio()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_aspectratio.md)
  object or named list, with properties `x`, `y` and `z` (see
  [`go_scene_aspectratio()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_aspectratio.md)).

- bgcolor:

  Color: a CSS color string or R color name.

- camera:

  A
  [`go_scene_camera()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_camera.md)
  object or named list, with properties `center`, `eye`, `projection`
  and `up` (see
  [`go_scene_camera()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_camera.md)).

- domain:

  A
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)
  object or named list, with properties `column`, `row`, `x` and `y`
  (see
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)).

- dragmode:

  Determines the mode of drag interactions for this scene. One of
  `"orbit"`, `"turntable"`, `"zoom"`, `"pan"`, `FALSE`.

- hovermode:

  Determines the mode of hover interactions for this scene. One of
  `"closest"`, `FALSE`.

- uirevision:

  Controls persistence of user-driven changes in camera attributes.
  Defaults to \`layout.uirevision\`. Any value.

- xaxis:

  A
  [`go_scene_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_axis.md)
  object or named list, with properties `autorange`, `autorangeoptions`,
  `autotypenumbers`, `backgroundcolor`, `calendar`, `categoryarray`,
  `categoryorder`, `color`, `dtick`, `exponentformat`, `gridcolor`,
  `gridwidth` and 44 more (see
  [`go_scene_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_axis.md)).

- yaxis:

  A
  [`go_scene_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_axis.md)
  object or named list, with properties `autorange`, `autorangeoptions`,
  `autotypenumbers`, `backgroundcolor`, `calendar`, `categoryarray`,
  `categoryorder`, `color`, `dtick`, `exponentformat`, `gridcolor`,
  `gridwidth` and 44 more (see
  [`go_scene_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_axis.md)).

- zaxis:

  A
  [`go_scene_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_axis.md)
  object or named list, with properties `autorange`, `autorangeoptions`,
  `autotypenumbers`, `backgroundcolor`, `calendar`, `categoryarray`,
  `categoryorder`, `color`, `dtick`, `exponentformat`, `gridcolor`,
  `gridwidth` and 44 more (see
  [`go_scene_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_axis.md)).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_scene` object (a named list).

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
  add_scatter3d(x = ~wt, y = ~hp, z = ~mpg) |>
  update_layout(scene = go_scene(bgcolor = "lightyellow"))
```
