# Hoverlabel objects

Used for `hoverlabel` in 47 places in the schema. `go_hoverlabel()`
creates one; a named list with the same properties works too.

## Usage

``` r
go_hoverlabel(
  arg = NULL,
  ...,
  align = NULL,
  bgcolor = NULL,
  bordercolor = NULL,
  font = NULL,
  grouptitlefont = NULL,
  namelength = NULL,
  showarrow = NULL,
  split = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- align:

  Sets the horizontal alignment of the text content within hover label
  box. Has an effect only if the hover label text spans two or more
  lines One of `"left"`, `"right"`, `"auto"`, or a vector of these.
  Vectors are accepted only in some contexts (e.g. trace text fonts).
  Not available in every context.

- bgcolor:

  Sets the background color of the hover labels for this trace Color: a
  CSS color string or R color name, or a vector of these. Vectors are
  accepted only in some contexts (e.g. trace text fonts).

- bordercolor:

  Sets the border color of the hover labels for this trace. Color: a CSS
  color string or R color name, or a vector of these. Vectors are
  accepted only in some contexts (e.g. trace text fonts).

- font:

  Sets the font used in hover labels. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- grouptitlefont:

  Sets the font for group titles in hover (unified modes). Defaults to
  \`hoverlabel.font\`. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).
  Not available in every context.

- namelength:

  Sets the default length (in number of characters) of the trace name in
  the hover labels for all traces. -1 shows the whole name regardless of
  length. 0-3 shows the first 0-3 characters, and an integer \>3 will
  show the whole name if it is less than that many characters, but if it
  is longer, will truncate to \`namelength - 3\` characters and add an
  ellipsis. Integer in the interval \[-1, Inf\], or a vector of these.
  Vectors are accepted only in some contexts (e.g. trace text fonts).
  Not available in every context.

- showarrow:

  Sets whether or not to show the hover label arrow/triangle pointing to
  the data point. Logical. Not available in every context.

- split:

  Show hover information (open, close, high, low) in separate labels,
  rather than a single unified label. Default: FALSE. When set to TRUE,
  \`hovertemplate\` is ignored. Logical. Not available in every context.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_hoverlabel` object (a named list).

## Details

These objects appear in 47 places in the plotly.js schema (properties
named `hoverlabel`), with small differences between them: for example,
not every context has every property below. `go_hoverlabel()` checks the
values against the contexts it can be used in; when the object is placed
in a figure it is checked again against that context's rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter(x = ~wt, y = ~mpg, mode = "markers") |>
  update_layout(hoverlabel = go_hoverlabel(bgcolor = "lightyellow"))
```
