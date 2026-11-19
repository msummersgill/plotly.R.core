# Layout selection objects

The object for an element of the figure layout's `selections` list (or
use
[`add_selection()`](https://msummersgill.github.io/plotly.R.core/reference/add_selection.md)).
`go_selection()` creates one, with exactly its properties; a named list
with the same properties works too.

## Usage

``` r
go_selection(
  arg = NULL,
  ...,
  line = NULL,
  name = NULL,
  opacity = NULL,
  path = NULL,
  templateitemname = NULL,
  type = NULL,
  x0 = NULL,
  x1 = NULL,
  xref = NULL,
  y0 = NULL,
  y1 = NULL,
  yref = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- line:

  A
  [`go_selection_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_selection_line.md)
  object or named list, with properties `color`, `dash` and `width` (see
  [`go_selection_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_selection_line.md)).

- name:

  When used in a template, named items are created in the output figure
  in addition to any items the figure already has in this array. You can
  modify these items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- opacity:

  Sets the opacity of the selection. Number in the interval \[0, 1\].

- path:

  For \`type\` "path" - a valid SVG path similar to \`shapes.path\` in
  data coordinates. Allowed segments are: M, L and Z. String.

- templateitemname:

  Used to refer to a named item in this array in the template. Named
  items from the template will be created even without a matching item
  in the input figure, but you can modify one by making an item with
  \`templateitemname\` matching its \`name\`, alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). If there is no template or no matching item, this item will
  be hidden unless you explicitly show it with \`visible: true\`.
  String.

- type:

  Specifies the selection type to be drawn. If "rect", a rectangle is
  drawn linking (\`x0\`,\`y0\`), (\`x1\`,\`y0\`), (\`x1\`,\`y1\`) and
  (\`x0\`,\`y1\`). If "path", draw a custom SVG path using \`path\`. One
  of `"rect"`, `"path"`.

- x0:

  Sets the selection's starting x position. Any value.

- x1:

  Sets the selection's end x position. Any value.

- xref:

  Sets the selection's x coordinate axis. If set to a x axis id (e.g.
  "x" or "x2"), the \`x\` position refers to a x coordinate. If set to
  "paper", the \`x\` position refers to the distance from the left of
  the plotting area in normalized coordinates where 0 (1) corresponds to
  the left (right). If set to a x axis ID followed by "domain"
  (separated by a space), the position behaves like for "paper", but
  refers to the distance in fractions of the domain length from the left
  of the domain of that axis: e.g., "x2 domain" refers to the domain of
  the second x axis and a x position of 0.5 refers to the point between
  the left and the right of the domain of the second x axis. One of
  `"paper"`, or a string matching `"^x([2-9]|[1-9][0-9]+)?( domain)?$"`.

- y0:

  Sets the selection's starting y position. Any value.

- y1:

  Sets the selection's end y position. Any value.

- yref:

  Sets the selection's x coordinate axis. If set to a y axis id (e.g.
  "y" or "y2"), the \`y\` position refers to a y coordinate. If set to
  "paper", the \`y\` position refers to the distance from the bottom of
  the plotting area in normalized coordinates where 0 (1) corresponds to
  the bottom (top). If set to a y axis ID followed by "domain"
  (separated by a space), the position behaves like for "paper", but
  refers to the distance in fractions of the domain length from the
  bottom of the domain of that axis: e.g., "y2 domain" refers to the
  domain of the second y axis and a y position of 0.5 refers to the
  point between the bottom and the top of the domain of the second y
  axis. One of `"paper"`, or a string matching
  `"^y([2-9]|[1-9][0-9]+)?( domain)?$"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_selection` object (a named list).

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
  update_layout(selections = list(go_selection(opacity = 0.5)))
```
