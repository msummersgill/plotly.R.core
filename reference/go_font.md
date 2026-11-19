# Font objects

Used for `font`, `insidetextfont`, `tickfont`, `outsidetextfont`,
`textfont`, `labelfont`, `grouptitlefont`, `rangefont` in 296 places in
the schema. `go_font()` creates one; a named list with the same
properties works too.

## Usage

``` r
go_font(
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
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- color:

  Color: a CSS color string or R color name. In some contexts: Color: a
  CSS color string or R color name, or a vector of these.

- family:

  HTML font family - the typeface that will be applied by the web
  browser. The web browser can only apply a font if it is available on
  the system where it runs. Provide multiple font families, separated by
  commas, to indicate the order in which to apply fonts if they aren't
  available. String. In some contexts: String, or a vector of these. Not
  available in every context.

- lineposition:

  Sets the kind of decoration line(s) with text, such as an "under",
  "over" or "through" as well as combinations e.g. "under+over", etc.
  Any combination of `"under"`, `"over"`, `"through"` joined with `"+"`,
  or one of `"none"`. In some contexts: Any combination of `"under"`,
  `"over"`, `"through"` joined with `"+"`, or one of `"none"`, or a
  vector of these. Not available in every context.

- shadow:

  Sets the shape and color of the shadow behind text. "auto" places
  minimal shadow and applies contrast text font color. See
  https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow for
  additional options. String. In some contexts: String, or a vector of
  these. Not available in every context.

- size:

  Number in the interval \[1, Inf\]. In some contexts: Number in the
  interval \[1, Inf\], or a vector of these. Not available in every
  context.

- style:

  Sets whether a font should be styled with a normal or italic face from
  its family. One of `"normal"`, `"italic"`. In some contexts: One of
  `"normal"`, `"italic"`, or a vector of these. Not available in every
  context.

- textcase:

  Sets capitalization of text. It can be used to make text appear in
  all-uppercase or all-lowercase, or with each word capitalized. One of
  `"normal"`, `"word caps"`, `"upper"`, `"lower"`. In some contexts: One
  of `"normal"`, `"word caps"`, `"upper"`, `"lower"`, or a vector of
  these. Not available in every context.

- variant:

  Sets the variant of the font. One of `"normal"`, `"small-caps"`,
  `"all-small-caps"`, `"all-petite-caps"`, `"petite-caps"`, `"unicase"`.
  In some contexts: One of `"normal"`, `"small-caps"`,
  `"all-small-caps"`, `"all-petite-caps"`, `"petite-caps"`, `"unicase"`,
  or a vector of these; or One of `"normal"`, `"small-caps"`, or a
  vector of these. Not available in every context.

- weight:

  Sets the weight (or boldness) of the font. Integer in the interval
  \[1, 1000\]. In some contexts: Integer in the interval \[1, 1000\], or
  a vector of these; or One of `"normal"`, `"bold"`, or a vector of
  these. Not available in every context.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_font` object (a named list).

## Details

These objects appear in 296 places in the plotly.js schema (properties
named `font`, `insidetextfont`, `tickfont`, `outsidetextfont`,
`textfont`, `labelfont`, `grouptitlefont`, `rangefont`), with small
differences between them: for example, not every context has every
property below. `go_font()` checks the values against the contexts it
can be used in; when the object is placed in a figure it is checked
again against that context's rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter(x = ~wt, y = ~mpg, mode = "markers") |>
  update_layout(font = go_font(color = "red"))
```
