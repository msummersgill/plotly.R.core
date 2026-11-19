# Label objects

Used for `label` in 2 places in the schema. `go_label()` creates one; a
named list with the same properties works too.

## Usage

``` r
go_label(
  ...,
  font = NULL,
  padding = NULL,
  text = NULL,
  textangle = NULL,
  textposition = NULL,
  texttemplate = NULL,
  texttemplatefallback = NULL,
  xanchor = NULL,
  yanchor = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- font:

  Sets the new shape label text font. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- padding:

  Sets padding (in px) between edge of label and edge of new shape.
  Number in the interval \[0, Inf\].

- text:

  Sets the text to display with the new shape. It is also used for
  legend item if \`name\` is not provided. String.

- textangle:

  Sets the angle at which the label text is drawn with respect to the
  horizontal. For lines, angle "auto" is the same angle as the line. For
  all other shapes, angle "auto" is horizontal. Angle in degrees.

- textposition:

  Sets the position of the label text relative to the new shape.
  Supported values for rectangles, circles and paths are "top left",
  "top center", "top right", "middle left", "middle center", "middle
  right", "bottom left", "bottom center", and "bottom right". Supported
  values for lines are "start", "middle", and "end". Default: "middle
  center" for rectangles, circles, and paths; "middle" for lines. One of
  `"top left"`, `"top center"`, `"top right"`, `"middle left"`,
  `"middle center"`, `"middle right"`, `"bottom left"`,
  `"bottom center"`, `"bottom right"`, `"start"`, `"middle"`, `"end"`.

- texttemplate:

  Template string used for rendering the new shape's label. Note that
  this will override \`text\`. Variables are inserted using %{variable},
  for example "x0: %{x0}". Numbers are formatted using d3-format's
  syntax %{variable:d3-format}, for example "Price: %{x0:\$.2f}". See
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format for details on
  the formatting syntax. Dates are formatted using d3-time-format's
  syntax %{variable\|d3-time-format}, for example "Day: %{x0\|%m %b
  %Y}". See
  https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format for
  details on the date formatting syntax. A single multiplication or
  division operation may be applied to numeric variables, and combined
  with d3 number formatting, for example "Length in cm: %{x0"2.54}",
  "%{slope"60:.1f} meters per second." For log axes, variable values are
  given in log units. For date axes, x/y coordinate variables and center
  variables use datetimes, while all other variable values use values in
  ms. Finally, the template string has access to variables \`x0\`,
  \`x1\`, \`y0\`, \`y1\`, \`slope\`, \`dx\`, \`dy\`, \`width\`,
  \`height\`, \`length\`, \`xcenter\`, \`ycenter\`, \`simpleXVariables\`
  and \`simpleYVariables\`. Variables that can't be found will be
  replaced with the specifier. For example, a template of "data: %{x},
  %{y}" will result in a value of "data: 1, %{y}" if x is 1 and y is
  missing. Variables with an undefined value will be replaced with the
  fallback value. String.

- texttemplatefallback:

  Fallback string that's displayed when a variable referenced in a
  template is missing. If the boolean value 'false' is passed in, the
  specifier with the missing variable will be displayed. Any value.

- xanchor:

  Sets the label's horizontal position anchor This anchor binds the
  specified \`textposition\` to the "left", "center" or "right" of the
  label text. For example, if \`textposition\` is set to "top right" and
  \`xanchor\` to "right" then the right-most portion of the label text
  lines up with the right-most edge of the new shape. One of `"auto"`,
  `"left"`, `"center"`, `"right"`.

- yanchor:

  Sets the label's vertical position anchor This anchor binds the
  specified \`textposition\` to the "top", "middle" or "bottom" of the
  label text. For example, if \`textposition\` is set to "top right" and
  \`yanchor\` to "top" then the top-most portion of the label text lines
  up with the top-most edge of the new shape. One of `"top"`,
  `"middle"`, `"bottom"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_label` object (a named list).

## Details

These objects appear in 2 places in the plotly.js schema (properties
named `label`), all with the same properties and rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter(x = ~wt, y = ~mpg, mode = "markers") |>
  update_layout(
    newshape = go_newshape(label = go_label(text = "title"))
  )
```
