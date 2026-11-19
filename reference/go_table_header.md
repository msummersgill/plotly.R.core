# Table header objects

The object for the `header` of a table trace
([`go_table()`](https://msummersgill.github.io/plotly.R.core/reference/go_table.md)).
`go_table_header()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_table_header(
  arg = NULL,
  ...,
  align = NULL,
  fill = NULL,
  font = NULL,
  format = NULL,
  height = NULL,
  line = NULL,
  prefix = NULL,
  suffix = NULL,
  values = NULL,
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

  Sets the horizontal alignment of the \`text\` within the box. Has an
  effect only if \`text\` spans two or more lines (i.e. \`text\`
  contains one or more \<br\> HTML tags) or if an explicit width is set
  to override the text width. One of `"left"`, `"center"`, `"right"`, or
  a vector of these.

- fill:

  A
  [`go_table_header_fill()`](https://msummersgill.github.io/plotly.R.core/reference/go_table_header_fill.md)
  object or named list, with properties `color` (see
  [`go_table_header_fill()`](https://msummersgill.github.io/plotly.R.core/reference/go_table_header_fill.md)).

- font:

  A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- format:

  Sets the cell value formatting rule using d3 formatting mini-languages
  which are very similar to those in Python. For numbers, see:
  https://github.com/d3/d3-format/tree/v1.4.5#d3-format. Data array: a
  vector, factor, Date/POSIXct vector, matrix or list.

- height:

  The height of cells. Number.

- line:

  A
  [`go_table_header_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_table_header_line.md)
  object or named list, with properties `color` and `width` (see
  [`go_table_header_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_table_header_line.md)).

- prefix:

  Prefix for cell values. String, or a vector of these.

- suffix:

  Suffix for cell values. String, or a vector of these.

- values:

  Header cell values. \`values\[m\]\[n\]\` represents the value of the
  \`n\`th point in column \`m\`, therefore the \`values\[m\]\` vector
  length for all columns must be the same (longer vectors will be
  truncated). Each value must be a finite number or a string. Data
  array: a vector, factor, Date/POSIXct vector, matrix or list.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_table_header` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
go_table(
  header = go_table_header()
)
#> <go_table>
#> {
#>   "type": "table",
#>   "header": {
#> 
#>   }
#> }
#> 
```
