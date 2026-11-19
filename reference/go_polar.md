# Layout polar objects

The object for the figure layout's `polar` (and `polar2`, `polar3`, ...:
see
[`update_polars()`](https://msummersgill.github.io/plotly.R.core/reference/update_polars.md)).
`go_polar()` creates one, with exactly its properties; a named list with
the same properties works too.

## Usage

``` r
go_polar(
  ...,
  angularaxis = NULL,
  bargap = NULL,
  barmode = NULL,
  bgcolor = NULL,
  domain = NULL,
  gridshape = NULL,
  hole = NULL,
  radialaxis = NULL,
  sector = NULL,
  uirevision = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- angularaxis:

  A
  [`go_polar_angularaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_polar_angularaxis.md)
  object or named list, with properties `autotypenumbers`,
  `categoryarray`, `categoryorder`, `color`, `direction`, `dtick`,
  `exponentformat`, `gridcolor`, `griddash`, `gridwidth`, `hoverformat`,
  `labelalias` and 34 more (see
  [`go_polar_angularaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_polar_angularaxis.md)).

- bargap:

  Sets the gap between bars of adjacent location coordinates. Values are
  unitless, they represent fractions of the minimum difference in bar
  positions in the data. Number in the interval \[0, 1\].

- barmode:

  Determines how bars at the same location coordinate are displayed on
  the graph. With "stack", the bars are stacked on top of one another
  With "overlay", the bars are plotted over one another, you might need
  to reduce "opacity" to see multiple bars. One of `"stack"`,
  `"overlay"`.

- bgcolor:

  Set the background color of the subplot Color: a CSS color string or R
  color name.

- domain:

  A
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)
  object or named list, with properties `column`, `row`, `x` and `y`
  (see
  [`go_domain()`](https://msummersgill.github.io/plotly.R.core/reference/go_domain.md)).

- gridshape:

  Determines if the radial axis grid lines and angular axis line are
  drawn as "circular" sectors or as "linear" (polygon) sectors. Has an
  effect only when the angular axis has \`type\` "category". Note that
  \`radialaxis.angle\` is snapped to the angle of the closest vertex
  when \`gridshape\` is "circular" (so that radial axis scale is the
  same as the data scale). One of `"circular"`, `"linear"`.

- hole:

  Sets the fraction of the radius to cut out of the polar subplot.
  Number in the interval \[0, 1\].

- radialaxis:

  A
  [`go_polar_radialaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_polar_radialaxis.md)
  object or named list, with properties `angle`, `autorange`,
  `autorangeoptions`, `autotickangles`, `autotypenumbers`, `calendar`,
  `categoryarray`, `categoryorder`, `color`, `dtick`, `exponentformat`,
  `gridcolor` and 41 more (see
  [`go_polar_radialaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_polar_radialaxis.md)).

- sector:

  Sets angular span of this polar subplot with two angles (in degrees).
  Sector are assumed to be spanned in the counterclockwise direction
  with 0 corresponding to rightmost limit of the polar subplot. Vector
  or list of 2 element(s).

- uirevision:

  Controls persistence of user-driven changes in axis attributes, if not
  overridden in the individual axes. Defaults to \`layout.uirevision\`.
  Any value.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_polar` object (a named list).

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
  add_scatterpolar(r = ~mpg, theta = ~hp) |>
  update_layout(polar = go_polar(bgcolor = "lightyellow"))
```
