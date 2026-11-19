# Volume surface objects

The object for the `surface` of a volume trace
([`go_volume()`](https://msummersgill.github.io/plotly.R.core/reference/go_volume.md)).
`go_volume_surface()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_volume_surface(
  arg = NULL,
  ...,
  count = NULL,
  fill = NULL,
  pattern = NULL,
  show = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- count:

  Sets the number of iso-surfaces between minimum and maximum
  iso-values. By default this value is 2 meaning that only minimum and
  maximum surfaces would be drawn. Integer in the interval \[1, Inf\].

- fill:

  Sets the fill ratio of the iso-surface. The default fill value of the
  surface is 1 meaning that they are entirely shaded. On the other hand
  Applying a \`fill\` ratio less than one would allow the creation of
  openings parallel to the edges. Number in the interval \[0, 1\].

- pattern:

  Sets the surface pattern of the iso-surface 3-D sections. The default
  pattern of the surface is \`all\` meaning that the rest of surface
  elements would be shaded. The check options (either 1 or 2) could be
  used to draw half of the squares on the surface. Using various
  combinations of capital \`A\`, \`B\`, \`C\`, \`D\` and \`E\` may also
  be used to reduce the number of triangles on the iso-surfaces and
  creating other patterns of interest. Any combination of `"A"`, `"B"`,
  `"C"`, `"D"`, `"E"` joined with `"+"`, or one of `"all"`, `"odd"`,
  `"even"`.

- show:

  Hides/displays surfaces between minimum and maximum iso-values.
  Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_volume_surface` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
d <- expand.grid(x = 1:5, y = 1:5, z = 1:5)
d |>
  go_figure() |>
  add_volume(
    x = ~x,
    y = ~y,
    z = ~z,
    value = ~x * y * z,
    isomin = 10,
    isomax = 50,
    surface = go_volume_surface(show = TRUE)
  )
```
