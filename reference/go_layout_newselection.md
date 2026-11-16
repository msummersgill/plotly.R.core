# Layout newselection objects

Properties of `layout.newselection`.

## Usage

``` r
go_layout_newselection(
  arg = NULL,
  ...,
  line = NULL,
  mode = NULL,
  skip_invalid = FALSE
)

go_layout_newselection_line(
  arg = NULL,
  ...,
  color = NULL,
  dash = NULL,
  width = NULL,
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

- line:

  Named list or `go_layout_newselection_line()` object.

- mode:

  Describes how a new selection is created. If \`immediate\`, a new
  selection is created after first mouse up. If \`gradual\`, a new
  selection is not created after first mouse. By adding to and
  subtracting from the initial selection, this option allows declaring
  extra outlines of the selection. One of `"immediate"`, `"gradual"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

- color:

  Sets the line color. By default uses either dark grey or white to
  increase contrast with background color. Color: a CSS color string or
  R color name.

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

`go_layout_newselection()` and the nested object constructors below
create validated graph objects (named lists). Every property is checked
against the plotly.js schema when an object is created or modified (see
[`plotly_obj-modify()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_obj-modify.md)).

Nested objects documented here:

- `go_layout_newselection_line()`:

  `layout.newselection.line`

## See also

[`go_layout()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout.md)
