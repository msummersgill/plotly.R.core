# Layout scene camera projection objects

The object for the layout's `scene.camera.projection`
([`go_scene_camera()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_camera.md)).
`go_scene_camera_projection()` creates one, with exactly its properties;
a named list with the same properties works too.

## Usage

``` r
go_scene_camera_projection(arg = NULL, ..., type = NULL, skip_invalid = FALSE)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- type:

  Sets the projection type. The projection type could be either
  "perspective" or "orthographic". The default is "perspective". One of
  `"perspective"`, `"orthographic"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_scene_camera_projection` object (a named list).

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
  update_layout(
    scene = go_scene(
      camera = go_scene_camera(projection = go_scene_camera_projection())
    )
  )
```
