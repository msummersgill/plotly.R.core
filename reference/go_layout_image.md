# Layout image objects

The object for an element of the figure layout's `images` list (or use
[`add_layout_image()`](https://msummersgill.github.io/plotly.R.core/reference/add_layout_image.md)).
`go_layout_image()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_layout_image(
  ...,
  layer = NULL,
  name = NULL,
  opacity = NULL,
  sizex = NULL,
  sizey = NULL,
  sizing = NULL,
  source = NULL,
  templateitemname = NULL,
  visible = NULL,
  x = NULL,
  xanchor = NULL,
  xref = NULL,
  y = NULL,
  yanchor = NULL,
  yref = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- layer:

  Specifies whether images are drawn below or above traces. When
  \`xref\` and \`yref\` are both set to \`paper\`, image is drawn below
  the entire plot area. One of `"below"`, `"above"`.

- name:

  When used in a template, named items are created in the output figure
  in addition to any items the figure already has in this array. You can
  modify these items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- opacity:

  Sets the opacity of the image. Number in the interval \[0, 1\].

- sizex:

  Sets the image container size horizontally. The image will be sized
  based on the \`position\` value. When \`xref\` is set to \`paper\`,
  units are sized relative to the plot width. When \`xref\` ends with \`
  domain\`, units are sized relative to the axis width. Number.

- sizey:

  Sets the image container size vertically. The image will be sized
  based on the \`position\` value. When \`yref\` is set to \`paper\`,
  units are sized relative to the plot height. When \`yref\` ends with
  \` domain\`, units are sized relative to the axis height. Number.

- sizing:

  Specifies which dimension of the image to constrain. One of `"fill"`,
  `"contain"`, `"stretch"`.

- source:

  Specifies the URL of the image to be used. The URL must be accessible
  from the domain where the plot code is run, and can be either relative
  or absolute. String.

- templateitemname:

  Used to refer to a named item in this array in the template. Named
  items from the template will be created even without a matching item
  in the input figure, but you can modify one by making an item with
  \`templateitemname\` matching its \`name\`, alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). If there is no template or no matching item, this item will
  be hidden unless you explicitly show it with \`visible: true\`.
  String.

- visible:

  Determines whether or not this image is visible. Logical.

- x:

  Sets the image's x position. When \`xref\` is set to \`paper\`, units
  are sized relative to the plot height. See \`xref\` for more info Any
  value.

- xanchor:

  Sets the anchor for the x position One of `"left"`, `"center"`,
  `"right"`.

- xref:

  Sets the images's x coordinate axis. If set to a x axis id (e.g. "x"
  or "x2"), the \`x\` position refers to a x coordinate. If set to
  "paper", the \`x\` position refers to the distance from the left of
  the plotting area in normalized coordinates where 0 (1) corresponds to
  the left (right). If set to a x axis ID followed by "domain"
  (separated by a space), the position behaves like for "paper", but
  refers to the distance in fractions of the domain length from the left
  of the domain of that axis: e.g., "x2 domain" refers to the domain of
  the second x axis and a x position of 0.5 refers to the point between
  the left and the right of the domain of the second x axis. One of
  `"paper"`, or a string matching `"^x([2-9]|[1-9][0-9]+)?( domain)?$"`.

- y:

  Sets the image's y position. When \`yref\` is set to \`paper\`, units
  are sized relative to the plot height. See \`yref\` for more info Any
  value.

- yanchor:

  Sets the anchor for the y position. One of `"top"`, `"middle"`,
  `"bottom"`.

- yref:

  Sets the images's y coordinate axis. If set to a y axis id (e.g. "y"
  or "y2"), the \`y\` position refers to a y coordinate. If set to
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

A `go_layout_image` object (a named list).

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
  update_layout(images = list(go_layout_image(opacity = 0.5)))
```
