# Scattergl line objects

The object for the `line` of a scattergl trace
([`go_scattergl()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattergl.md)).
`go_scattergl_line()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_scattergl_line(
  arg = NULL,
  ...,
  color = NULL,
  dash = NULL,
  shape = NULL,
  width = NULL,
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

  Sets the line color. Color: a CSS color string or R color name.

- dash:

  Sets the style of the lines. One of `"dash"`, `"dashdot"`, `"dot"`,
  `"longdash"`, `"longdashdot"`, `"solid"`.

- shape:

  Determines the line shape. The values correspond to step-wise line
  shapes. One of `"linear"`, `"hv"`, `"vh"`, `"hvh"`, `"vhv"`.

- width:

  Sets the line width (in px). Number in the interval \[0, Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_scattergl_line` object (a named list).

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
  add_scattergl(
    x = ~wt,
    y = ~mpg,
    mode = "markers",
    line = go_scattergl_line(color = "red")
  )
```
