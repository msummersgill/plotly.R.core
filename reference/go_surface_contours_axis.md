# Surface contours axis objects

Used for `x`, `y`, `z` in 3 places in the schema.
`go_surface_contours_axis()` creates one; a named list with the same
properties works too.

## Usage

``` r
go_surface_contours_axis(
  arg = NULL,
  ...,
  color = NULL,
  end = NULL,
  highlight = NULL,
  highlightcolor = NULL,
  highlightwidth = NULL,
  project = NULL,
  show = NULL,
  size = NULL,
  start = NULL,
  usecolormap = NULL,
  width = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- color:

  Sets the color of the contour lines. Color: a CSS color string or R
  color name.

- end:

  Sets the end contour level value. Must be more than \`contours.start\`
  Number.

- highlight:

  Determines whether or not contour lines about the x dimension are
  highlighted on hover. Logical.

- highlightcolor:

  Sets the color of the highlighted contour lines. Color: a CSS color
  string or R color name.

- highlightwidth:

  Sets the width of the highlighted contour lines. Number in the
  interval \[1, 16\].

- project:

  A
  [`go_project()`](https://msummersgill.github.io/plotly.R.core/reference/go_project.md)
  object or named list, with properties `x`, `y` and `z` (see
  [`go_project()`](https://msummersgill.github.io/plotly.R.core/reference/go_project.md)).

- show:

  Determines whether or not contour lines about the x dimension are
  drawn. Logical.

- size:

  Sets the step between each contour level. Must be positive. Number in
  the interval \[0, Inf\].

- start:

  Sets the starting contour level value. Must be less than
  \`contours.end\` Number.

- usecolormap:

  An alternate to "color". Determines whether or not the contour lines
  are colored using the trace "colorscale". Logical.

- width:

  Sets the width of the contour lines. Number in the interval \[1, 16\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_surface_contours_axis` object (a named list).

## Details

These objects appear in 3 places in the plotly.js schema (properties
named `x`, `y`, `z`), all with the same properties and rules.

## Examples

``` r
go_figure() |>
  add_surface(
    z = volcano,
    contours = go_surface_contours(
      x = go_surface_contours_axis(color = "red")
    )
  )
```
