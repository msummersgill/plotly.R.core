# Histogram2dcontour contours objects

The object for the `contours` of a histogram2dcontour trace
([`go_histogram2dcontour()`](https://msummersgill.github.io/plotly.R.core/reference/go_histogram2dcontour.md)).
`go_histogram2dcontour_contours()` creates one, with exactly its
properties; a named list with the same properties works too.

## Usage

``` r
go_histogram2dcontour_contours(
  ...,
  coloring = NULL,
  end = NULL,
  labelfont = NULL,
  labelformat = NULL,
  operation = NULL,
  showlabels = NULL,
  showlines = NULL,
  size = NULL,
  start = NULL,
  type = NULL,
  value = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- coloring:

  Determines the coloring method showing the contour values. If "fill",
  coloring is done evenly between each contour level If "heatmap", a
  heatmap gradient coloring is applied between each contour level. If
  "lines", coloring is done on the contour lines. If "none", no coloring
  is applied on this trace. One of `"fill"`, `"heatmap"`, `"lines"`,
  `"none"`.

- end:

  Sets the end contour level value. Must be more than \`contours.start\`
  Number.

- labelfont:

  Sets the font used for labeling the contour levels. The default color
  comes from the lines, if shown. The default family and size come from
  \`layout.font\`. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- labelformat:

  Sets the contour label formatting rule using d3 formatting
  mini-languages which are very similar to those in Python. For numbers,
  see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format. String.

- operation:

  Sets the constraint operation. "=" keeps regions equal to \`value\`
  "\<" and "\<=" keep regions less than \`value\` "\>" and "\>=" keep
  regions greater than \`value\` "\[\]", "()", "\[)", and "(\]" keep
  regions inside \`value\[0\]\` to \`value\[1\]\` "\]\[", ")(", "\](",
  ")\[" keep regions outside \`value\[0\]\` to \`value\[1\]\` Open vs.
  closed intervals make no difference to constraint display, but all
  versions are allowed. One of `"="`, `"<"`, `">="`, `">"`, `"<="`,
  `"[]"`, `"()"`, `"[)"`, `"(]"`, `"]["`, `")("`, `"]("`, `")["`.

- showlabels:

  Determines whether to label the contour lines with their values.
  Logical.

- showlines:

  Determines whether or not the contour lines are drawn. Has an effect
  only if \`contours.coloring\` is set to "fill". Logical.

- size:

  Sets the step between each contour level. Must be positive. Number in
  the interval \[0, Inf\].

- start:

  Sets the starting contour level value. Must be less than
  \`contours.end\` Number.

- type:

  If \`levels\`, the data is represented as a contour plot with multiple
  levels displayed. If \`constraint\`, the data is represented as
  constraints with the invalid region shaded as specified by the
  \`operation\` and \`value\` parameters. One of `"levels"`,
  `"constraint"`.

- value:

  Sets the value or values of the constraint boundary. When
  \`operation\` is set to one of the comparison values
  (\`=,\<,\>=,\>,\<=\`) "value" is expected to be a number. When
  \`operation\` is set to one of the interval values
  (\`\[\],(),\[),(\],\]\[,)(,\](,)\[\`) "value" is expected to be an
  array of two numbers where the first is the lower bound and the second
  is the upper bound. Any value.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_histogram2dcontour_contours` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
faithful |>
  go_figure() |>
  add_histogram2dcontour(
    x = ~eruptions,
    y = ~waiting,
    contours = go_histogram2dcontour_contours(size = 10)
  )
```
