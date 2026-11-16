# Layout hoverlabel objects

Properties of `layout.hoverlabel`.

## Usage

``` r
go_layout_hoverlabel(
  arg = NULL,
  ...,
  align = NULL,
  bgcolor = NULL,
  bordercolor = NULL,
  font = NULL,
  grouptitlefont = NULL,
  namelength = NULL,
  showarrow = NULL,
  skip_invalid = FALSE
)

go_layout_hoverlabel_font(
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

go_layout_hoverlabel_grouptitlefont(
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

- align:

  Sets the horizontal alignment of the text content within hover label
  box. Has an effect only if the hover label text spans two or more
  lines One of `"left"`, `"right"`, `"auto"`.

- bgcolor:

  Sets the background color of all hover labels on graph Color: a CSS
  color string or R color name.

- bordercolor:

  Sets the border color of all hover labels on graph. Color: a CSS color
  string or R color name.

- font:

  Sets the default hover label font used by all traces on the graph.
  Named list or `go_layout_hoverlabel_font()` object.

- grouptitlefont:

  Sets the font for group titles in hover (unified modes). Defaults to
  \`hoverlabel.font\`. Named list or
  `go_layout_hoverlabel_grouptitlefont()` object.

- namelength:

  Sets the default length (in number of characters) of the trace name in
  the hover labels for all traces. -1 shows the whole name regardless of
  length. 0-3 shows the first 0-3 characters, and an integer \>3 will
  show the whole name if it is less than that many characters, but if it
  is longer, will truncate to \`namelength - 3\` characters and add an
  ellipsis. Integer in the interval \[-1, Inf\].

- showarrow:

  Sets whether or not to show the hover label arrow/triangle pointing to
  the data point. Logical.

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

## Value

Each `go_*()` function returns a graph object of the same class as its
name; `add_*()` functions return the modified figure.

## Details

`go_layout_hoverlabel()` and the nested object constructors below create
validated graph objects (named lists). Every property is checked against
the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

Nested objects documented here:

- `go_layout_hoverlabel_font()`:

  `layout.hoverlabel.font`: Sets the default hover label font used by
  all traces on the graph.

- `go_layout_hoverlabel_grouptitlefont()`:

  `layout.hoverlabel.grouptitlefont`: Sets the font for group titles in
  hover (unified modes). Defaults to \`hoverlabel.font\`.

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
