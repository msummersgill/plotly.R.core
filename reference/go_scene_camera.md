# Layout scene camera objects

The object for the layout's `scene.camera`
([`go_scene()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene.md)).
`go_scene_camera()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_scene_camera(
  ...,
  center = NULL,
  eye = NULL,
  projection = NULL,
  up = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- center:

  Sets the (x,y,z) components of the 'center' camera vector This vector
  determines the translation (x,y,z) space about the center of this
  scene. By default, there is no such translation. A
  [`go_scene_camera_center()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_camera_center.md)
  object or named list, with properties `x`, `y` and `z` (see
  [`go_scene_camera_center()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_camera_center.md)).

- eye:

  Sets the (x,y,z) components of the 'eye' camera vector. This vector
  determines the view point about the origin of this scene. A
  [`go_scene_camera_eye()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_camera_eye.md)
  object or named list, with properties `x`, `y` and `z` (see
  [`go_scene_camera_eye()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_camera_eye.md)).

- projection:

  A
  [`go_scene_camera_projection()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_camera_projection.md)
  object or named list, with properties `type` (see
  [`go_scene_camera_projection()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_camera_projection.md)).

- up:

  Sets the (x,y,z) components of the 'up' camera vector. This vector
  determines the up direction of this scene with respect to the page.
  The default is "{x: 0, y: 0, z: 1}" which means that the z axis points
  up. A
  [`go_scene_camera_up()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_camera_up.md)
  object or named list, with properties `x`, `y` and `z` (see
  [`go_scene_camera_up()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_camera_up.md)).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_scene_camera` object (a named list).

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
  update_layout(scene = go_scene(camera = go_scene_camera()))
```
