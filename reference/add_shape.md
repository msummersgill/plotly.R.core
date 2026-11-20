# Add a layout shape

`add_shape()` adds a shape to the figure's layout `shapes`. Nested
objects are named lists, e.g. `font = list(size = 14)`, or objects of
the constructors their arguments name.

## Usage

``` r
add_shape(
  fig,
  arg = NULL,
  ...,
  editable = NULL,
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
  path = NULL,
  showlegend = NULL,
  templateitemname = NULL,
  type = NULL,
  visible = NULL,
  x0 = NULL,
  x0shift = NULL,
  x1 = NULL,
  x1shift = NULL,
  xanchor = NULL,
  xref = NULL,
  xsizemode = NULL,
  y0 = NULL,
  y0shift = NULL,
  y1 = NULL,
  y1shift = NULL,
  yanchor = NULL,
  yref = NULL,
  ysizemode = NULL,
  row = NULL,
  col = NULL,
  secondary_y = NULL,
  exclude_empty_subplots = FALSE,
  skip_invalid = FALSE
)
```

## Arguments

- fig:

  A `go_figure` object.

- arg:

  Optional named list of properties to start from. Named arguments take
  precedence.

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- editable:

  Determines whether the shape could be activated for edit or not. Has
  no effect when the older editable shapes mode is enabled via
  \`config.editable\` or \`config.edits.shapePosition\`. Logical.

- fillcolor:

  Sets the color filling the shape's interior. Only applies to closed
  shapes. Color: a CSS color string or R color name.

- fillrule:

  Determines which regions of complex paths constitute the interior. For
  more info please visit
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

  Specifies whether shapes are drawn below gridlines ("below"), between
  gridlines and traces ("between") or above traces ("above"). One of
  `"below"`, `"above"`, `"between"`.

- legend:

  Sets the reference to a legend to show this shape in. References to
  these legends are "legend", "legend2", "legend3", etc. Settings for
  these legends are set in the layout, under \`layout.legend\`,
  \`layout.legend2\`, etc. Subplot id: `"legend"`, `"legend2"`,
  `"legend3"`, ....

- legendgroup:

  Sets the legend group for this shape. Traces and shapes part of the
  same legend group hide/show at the same time when toggling legend
  items. String.

- legendgrouptitle:

  A
  [`go_legendgrouptitle()`](https://msummersgill.github.io/plotly.R.core/reference/go_legendgrouptitle.md)
  object or named list, with properties `font` and `text` (see
  [`go_legendgrouptitle()`](https://msummersgill.github.io/plotly.R.core/reference/go_legendgrouptitle.md)).

- legendrank:

  Sets the legend rank for this shape. Items and groups with smaller
  ranks are presented on top/left side while with "reversed"
  \`legend.traceorder\` they are on bottom/right side. The default
  legendrank is 1000, so that you can use ranks less than 1000 to place
  certain items before all unranked items, and ranks greater than 1000
  to go after all unranked items. When having unranked or equal rank
  items shapes would be displayed after traces i.e. according to their
  order in data and layout. Number.

- legendwidth:

  Sets the width (in px or fraction) of the legend for this shape.
  Number in the interval \[0, Inf\].

- line:

  A
  [`go_shape_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_shape_line.md)
  object or named list, with properties `color`, `dash` and `width` (see
  [`go_shape_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_shape_line.md)).

- name:

  When used in a template, named items are created in the output figure
  in addition to any items the figure already has in this array. You can
  modify these items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- opacity:

  Sets the opacity of the shape. Number in the interval \[0, 1\].

- path:

  For \`type\` "path" - a valid SVG path with the pixel values replaced
  by data values in \`xsizemode\`/\`ysizemode\` being "scaled" and taken
  unmodified as pixels relative to \`xanchor\` and \`yanchor\` in case
  of "pixel" size mode. There are a few restrictions / quirks only
  absolute instructions, not relative. So the allowed segments are: M,
  L, H, V, Q, C, T, S, and Z arcs (A) are not allowed because radius rx
  and ry are relative. In the future we could consider supporting
  relative commands, but we would have to decide on how to handle date
  and log axes. Note that even as is, Q and C Bezier paths that are
  smooth on linear axes may not be smooth on log, and vice versa. no
  chained "polybezier" commands - specify the segment type for each one.
  On category axes, values are numbers scaled to the serial numbers of
  categories because using the categories themselves there would be no
  way to describe fractional positions On data axes: because space and T
  are both normal components of path strings, we can't use either to
  separate date from time parts. Therefore we'll use underscore for this
  purpose: 2015-02-21_13:45:56.789 String.

- showlegend:

  Determines whether or not this shape is shown in the legend. Logical.

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

  Specifies the shape type to be drawn. If "line", a line is drawn from
  (\`x0\`,\`y0\`) to (\`x1\`,\`y1\`) with respect to the axes' sizing
  mode. If "circle", a circle is drawn from ((\`x0\`+\`x1\`)/2,
  (\`y0\`+\`y1\`)/2)) with radius (\|(\`x0\`+\`x1\`)/2 - \`x0\`\|,
  \|(\`y0\`+\`y1\`)/2 -\`y0\`)\|) with respect to the axes' sizing mode.
  If "rect", a rectangle is drawn linking (\`x0\`,\`y0\`),
  (\`x1\`,\`y0\`), (\`x1\`,\`y1\`), (\`x0\`,\`y1\`), (\`x0\`,\`y0\`)
  with respect to the axes' sizing mode. If "path", draw a custom SVG
  path using \`path\`. with respect to the axes' sizing mode. One of
  `"circle"`, `"rect"`, `"path"`, `"line"`.

- visible:

  Determines whether or not this shape is visible. If "legendonly", the
  shape is not drawn, but can appear as a legend item (provided that the
  legend itself is visible). One of `"legendonly"`, `TRUE`, `FALSE`.

- x0:

  Sets the shape's starting x position. See \`type\` and \`xsizemode\`
  for more info. Any value.

- x0shift:

  Shifts \`x0\` away from the center of the category when \`xref\` is a
  "category" or "multicategory" axis. -0.5 corresponds to the start of
  the category and 0.5 corresponds to the end of the category. Number in
  the interval \[-1, 1\].

- x1:

  Sets the shape's end x position. See \`type\` and \`xsizemode\` for
  more info. Any value.

- x1shift:

  Shifts \`x1\` away from the center of the category when \`xref\` is a
  "category" or "multicategory" axis. -0.5 corresponds to the start of
  the category and 0.5 corresponds to the end of the category. Number in
  the interval \[-1, 1\].

- xanchor:

  Only relevant in conjunction with \`xsizemode\` set to "pixel".
  Specifies the anchor point on the x axis to which \`x0\`, \`x1\` and x
  coordinates within \`path\` are relative to. E.g. useful to attach a
  pixel sized shape to a certain data value. No effect when
  \`xsizemode\` not set to "pixel". Any value.

- xref:

  Sets the shape's x coordinate axis. If set to a x axis id (e.g. "x" or
  "x2"), the \`x\` position refers to a x coordinate. If set to "paper",
  the \`x\` position refers to the distance from the left of the
  plotting area in normalized coordinates where 0 (1) corresponds to the
  left (right). If set to a x axis ID followed by "domain" (separated by
  a space), the position behaves like for "paper", but refers to the
  distance in fractions of the domain length from the left of the domain
  of that axis: e.g., "x2 domain" refers to the domain of the second x
  axis and a x position of 0.5 refers to the point between the left and
  the right of the domain of the second x axis. If an array of axis IDs
  is provided, each \`x\` value will refer to the corresponding axis,
  e.g., \['x', 'x2'\] for a rectangle, line, or circle means \`x0\` uses
  the \`x\` axis and \`x1\` uses the \`x2\` axis. Path shapes using an
  array should have one entry for each x coordinate in the string. One
  of `"paper"`, or a string matching
  `"^x([2-9]|[1-9][0-9]+)?( domain)?$"`, or a vector of these.

- xsizemode:

  Sets the shapes's sizing mode along the x axis. If set to "scaled",
  \`x0\`, \`x1\` and x coordinates within \`path\` refer to data values
  on the x axis or a fraction of the plot area's width (\`xref\` set to
  "paper"). If set to "pixel", \`xanchor\` specifies the x position in
  terms of data or plot fraction but \`x0\`, \`x1\` and x coordinates
  within \`path\` are pixels relative to \`xanchor\`. This way, the
  shape can have a fixed width while maintaining a position relative to
  data or plot fraction. Note: \`xsizemode\` "pixel" is not supported
  when \`xref\` is an array. One of `"scaled"`, `"pixel"`.

- y0:

  Sets the shape's starting y position. See \`type\` and \`ysizemode\`
  for more info. Any value.

- y0shift:

  Shifts \`y0\` away from the center of the category when \`yref\` is a
  "category" or "multicategory" axis. -0.5 corresponds to the start of
  the category and 0.5 corresponds to the end of the category. Number in
  the interval \[-1, 1\].

- y1:

  Sets the shape's end y position. See \`type\` and \`ysizemode\` for
  more info. Any value.

- y1shift:

  Shifts \`y1\` away from the center of the category when \`yref\` is a
  "category" or "multicategory" axis. -0.5 corresponds to the start of
  the category and 0.5 corresponds to the end of the category. Number in
  the interval \[-1, 1\].

- yanchor:

  Only relevant in conjunction with \`ysizemode\` set to "pixel".
  Specifies the anchor point on the y axis to which \`y0\`, \`y1\` and y
  coordinates within \`path\` are relative to. E.g. useful to attach a
  pixel sized shape to a certain data value. No effect when
  \`ysizemode\` not set to "pixel". Any value.

- yref:

  Sets the shape's y coordinate axis. If set to a y axis id (e.g. "y" or
  "y2"), the \`y\` position refers to a y coordinate. If set to "paper",
  the \`y\` position refers to the distance from the bottom of the
  plotting area in normalized coordinates where 0 (1) corresponds to the
  bottom (top). If set to a y axis ID followed by "domain" (separated by
  a space), the position behaves like for "paper", but refers to the
  distance in fractions of the domain length from the bottom of the
  domain of that axis: e.g., "y2 domain" refers to the domain of the
  second y axis and a y position of 0.5 refers to the point between the
  bottom and the top of the domain of the second y axis. If an array of
  axis IDs is provided, each \`y\` value will refer to the corresponding
  axis, e.g., \['y', 'y2'\] for a rectangle, line, or circle means
  \`y0\` uses the \`y\` axis and \`y1\` uses the \`y2\` axis. Path
  shapes using an array should have one entry for each y coordinate in
  the string. One of `"paper"`, or a string matching
  `"^y([2-9]|[1-9][0-9]+)?( domain)?$"`, or a vector of these.

- ysizemode:

  Sets the shapes's sizing mode along the y axis. If set to "scaled",
  \`y0\`, \`y1\` and y coordinates within \`path\` refer to data values
  on the y axis or a fraction of the plot area's height (\`yref\` set to
  "paper"). If set to "pixel", \`yanchor\` specifies the y position in
  terms of data or plot fraction but \`y0\`, \`y1\` and y coordinates
  within \`path\` are pixels relative to \`yanchor\`. This way, the
  shape can have a fixed height while maintaining a position relative to
  data or plot fraction. Note: \`ysizemode\` "pixel" is not supported
  when \`yref\` is an array. One of `"scaled"`, `"pixel"`.

- row:

  Subplot grid row whose axes the object refers to (figures created with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only). May be `"all"` or a vector to add the object to several cells.

- col:

  Subplot grid column whose axes the object refers to (see `row`).

- secondary_y:

  If `TRUE`, refer to the secondary y axis of the subplot.

- exclude_empty_subplots:

  If `TRUE`, skip subplots that have no traces or layout objects.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

The modified figure.

## Details

Properties that take a single value may be given vectors to add several
shapes at once, one per element; the other properties are recycled.

## See also

[`update_shapes()`](https://msummersgill.github.io/plotly.R.core/reference/update_shapes.md),
[`go_shape()`](https://msummersgill.github.io/plotly.R.core/reference/go_shape.md)
