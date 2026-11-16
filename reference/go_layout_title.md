# Layout title objects

Properties of `layout.title`.

## Usage

``` r
go_layout_title(
  arg = NULL,
  ...,
  automargin = NULL,
  font = NULL,
  pad = NULL,
  subtitle = NULL,
  text = NULL,
  x = NULL,
  xanchor = NULL,
  xref = NULL,
  y = NULL,
  yanchor = NULL,
  yref = NULL,
  skip_invalid = FALSE
)

go_layout_title_font(
  arg = NULL,
  ...,
  color = NULL,
  family = NULL,
  lineposition = NULL,
  shadow = NULL,
  size = NULL,
  style = NULL,
  textcase = NULL,
  variant = NULL,
  weight = NULL,
  skip_invalid = FALSE
)

go_layout_title_pad(
  arg = NULL,
  ...,
  b = NULL,
  l = NULL,
  r = NULL,
  t = NULL,
  skip_invalid = FALSE
)

go_layout_title_subtitle(
  arg = NULL,
  ...,
  font = NULL,
  text = NULL,
  skip_invalid = FALSE
)

go_layout_title_subtitle_font(
  arg = NULL,
  ...,
  color = NULL,
  family = NULL,
  lineposition = NULL,
  shadow = NULL,
  size = NULL,
  style = NULL,
  textcase = NULL,
  variant = NULL,
  weight = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from (constructors). Named arguments take precedence.

- ...:

  Further properties, including nested properties in "magic underscore"
  form, e.g. `marker_size = 10` for `marker = list(size = 10)`. Property
  values may be one-sided formulas, evaluated in `data` for `add_*()`
  functions.

- automargin:

  Determines whether the title can automatically push the figure
  margins. If \`yref='paper'\` then the margin will expand to ensure
  that the title doesn't overlap with the edges of the container. If
  \`yref='container'\` then the margins will ensure that the title
  doesn't overlap with the plot area, tick labels, and axis titles. If
  \`automargin=true\` and the margins need to be expanded, then y will
  be set to a default 1 and yanchor will be set to an appropriate
  default to ensure that minimal margin space is needed. Note that when
  \`yref='paper'\`, only 1 or 0 are allowed y values. Invalid values
  will be reset to the default 1. Logical.

- font:

  **`go_layout_title()`**: Sets the title font. Named list or
  `go_layout_title_font()` object.

  **`go_layout_title_subtitle()`**: Sets the subtitle font. Named list
  or `go_layout_title_subtitle_font()` object.

- pad:

  Sets the padding of the title. Each padding value only applies when
  the corresponding \`xanchor\`/\`yanchor\` value is set accordingly.
  E.g. for left padding to take effect, \`xanchor\` must be set to
  "left". The same rule applies if \`xanchor\`/\`yanchor\` is determined
  automatically. Padding is muted if the respective anchor value is
  "middle"/"center". Named list or `go_layout_title_pad()` object.

- subtitle:

  Named list or `go_layout_title_subtitle()` object.

- text:

  **`go_layout_title()`**: Sets the plot's title. String.

  **`go_layout_title_subtitle()`**: Sets the plot's subtitle. String.

- x:

  Sets the x position with respect to \`xref\` in normalized coordinates
  from 0 (left) to 1 (right). Number in the interval \[0, 1\].

- xanchor:

  Sets the title's horizontal alignment with respect to its x position.
  "left" means that the title starts at x, "right" means that the title
  ends at x and "center" means that the title's center is at x. "auto"
  divides \`xref\` by three and calculates the \`xanchor\` value
  automatically based on the value of \`x\`. One of `"auto"`, `"left"`,
  `"center"`, `"right"`.

- xref:

  Sets the container \`x\` refers to. "container" spans the entire
  \`width\` of the plot. "paper" refers to the width of the plotting
  area only. One of `"container"`, `"paper"`.

- y:

  Sets the y position with respect to \`yref\` in normalized coordinates
  from 0 (bottom) to 1 (top). "auto" places the baseline of the title
  onto the vertical center of the top margin. Number in the interval
  \[0, 1\].

- yanchor:

  Sets the title's vertical alignment with respect to its y position.
  "top" means that the title's cap line is at y, "bottom" means that the
  title's baseline is at y and "middle" means that the title's midline
  is at y. "auto" divides \`yref\` by three and calculates the
  \`yanchor\` value automatically based on the value of \`y\`. One of
  `"auto"`, `"top"`, `"middle"`, `"bottom"`.

- yref:

  Sets the container \`y\` refers to. "container" spans the entire
  \`height\` of the plot. "paper" refers to the height of the plotting
  area only. One of `"container"`, `"paper"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- color:

  Color: a CSS color string or R color name.

- family:

  HTML font family - the typeface that will be applied by the web
  browser. The web browser can only apply a font if it is available on
  the system where it runs. Provide multiple font families, separated by
  commas, to indicate the order in which to apply fonts if they aren't
  available. String.

- lineposition:

  Sets the kind of decoration line(s) with text, such as an "under",
  "over" or "through" as well as combinations e.g. "under+over", etc.
  Any combination of `"under"`, `"over"`, `"through"` joined with `"+"`,
  or one of `"none"`.

- shadow:

  Sets the shape and color of the shadow behind text. "auto" places
  minimal shadow and applies contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String.

- size:

  Number in the interval \[1, Inf\].

- style:

  Sets whether a font should be styled with a normal or italic face from
  its family. One of `"normal"`, `"italic"`.

- textcase:

  Sets capitalization of text. It can be used to make text appear in
  all-uppercase or all-lowercase, or with each word capitalized. One of
  `"normal"`, `"word caps"`, `"upper"`, `"lower"`.

- variant:

  Sets the variant of the font. One of `"normal"`, `"small-caps"`,
  `"all-small-caps"`, `"all-petite-caps"`, `"petite-caps"`, `"unicase"`.

- weight:

  Sets the weight (or boldness) of the font. Integer in the interval
  \[1, 1000\].

- b:

  The amount of padding (in px) along the bottom of the component.
  Number.

- l:

  The amount of padding (in px) on the left side of the component.
  Number.

- r:

  The amount of padding (in px) on the right side of the component.
  Number.

- t:

  The amount of padding (in px) along the top of the component. Number.

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_title()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

Nested objects documented here:

- `go_layout_title_font()`:

  `layout.title.font`: Sets the title font.

- `go_layout_title_pad()`:

  `layout.title.pad`: Sets the padding of the title. Each padding value
  only applies when the corresponding \`xanchor\`/\`yanchor\` value is
  set accordingly. E.g. for left padding to take effect, \`xanchor\`
  must be set to "left". The same rule applies if
  \`xanchor\`/\`yanchor\` is determined automatically. Padding is muted
  if the respective anchor value is "middle"/"center".

- `go_layout_title_subtitle()`:

  `layout.title.subtitle`

- `go_layout_title_subtitle_font()`:

  `layout.title.subtitle.font`: Sets the subtitle font.

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
