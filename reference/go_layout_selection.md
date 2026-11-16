# Layout selection objects

Properties of `layout.selection`.

## Usage

``` r
add_selection(
  fig,
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
  row = NULL,
  col = NULL,
  secondary_y = NULL,
  exclude_empty_subplots = FALSE,
  skip_invalid = FALSE
)

go_layout_selection(
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

go_layout_selection_line(
  arg = NULL,
  ...,
  color = NULL,
  dash = NULL,
  width = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- fig:

  A `go_figure` object.

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from (constructors). Named arguments take precedence.

- ...:

  Further properties, including nested properties in "magic underscore"
  form, e.g. `marker_size = 10` for `marker = list(size = 10)`. Property
  values may be one-sided formulas, evaluated in `data` for `add_*()`
  functions.

- line:

  Named list or `go_layout_selection_line()` object.

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

- row:

  Subplot grid row (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

- col:

  Subplot grid column (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to address several cells.

- secondary_y:

  If `TRUE`, use the secondary y axis of the subplot.

- exclude_empty_subplots:

  If `TRUE`, skip subplots that have no traces or layout objects.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- color:

  Sets the line color. Color: a CSS color string or R color name.

- dash:

  Sets the dash style of lines. Set to a dash type string ("solid",
  "dot", "dash", "longdash", "dashdot", or "longdashdot") or a dash
  length list in px (eg "5px,10px,2px,2px"). One of `"solid"`, `"dot"`,
  `"dash"`, `"longdash"`, `"dashdot"`, `"longdashdot"`, or a string
  matching
  `"^\\d+(\\.\\d+)?(px|%)?((,|\\s)\\s*\\d+(\\.\\d+)?(px|%)?)*$"`.

- width:

  Sets the line width (in px). Number in the interval \[1, Inf\].

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_selection()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).
`add_selection()` creates an object and adds it to a figure.

Nested objects documented here:

- `go_layout_selection_line()`:

  `layout.selection.line`

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
