# Layout scene aspectratio objects

Sets this scene's axis aspectratio. The object for the layout's
`scene.aspectratio`
([`go_scene()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene.md)).
`go_scene_aspectratio()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_scene_aspectratio(
  arg = NULL,
  ...,
  x = NULL,
  y = NULL,
  z = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- x:

  Number in the interval \[0, Inf\].

- y:

  Number in the interval \[0, Inf\].

- z:

  Number in the interval \[0, Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_scene_aspectratio` object (a named list).

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
  update_layout(scene = go_scene(aspectratio = go_scene_aspectratio()))
```
