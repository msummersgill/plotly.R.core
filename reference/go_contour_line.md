# Contour line objects

The object for the `line` of a contour trace
([`go_contour()`](https://msummersgill.github.io/plotly.R.core/reference/go_contour.md)).
`go_contour_line()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_contour_line(
  ...,
  color = NULL,
  dash = NULL,
  smoothing = NULL,
  width = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- color:

  Sets the color of the contour level. Has no effect if
  \`contours.coloring\` is set to "lines". Color: a CSS color string or
  R color name.

- dash:

  Sets the dash style of lines. Set to a dash type string ("solid",
  "dot", "dash", "longdash", "dashdot", or "longdashdot") or a dash
  length list in px (eg "5px,10px,2px,2px"). One of `"solid"`, `"dot"`,
  `"dash"`, `"longdash"`, `"dashdot"`, `"longdashdot"`, or a string
  matching
  `"^\\d+(\\.\\d+)?(px|%)?((,|\\s)\\s*\\d+(\\.\\d+)?(px|%)?)*$"`.

- smoothing:

  Sets the amount of smoothing for the contour lines, where 0
  corresponds to no smoothing. Number in the interval \[0, 1.3\].

- width:

  Sets the contour line width (in px) Defaults to 0.5 when
  \`contours.type\` is "levels". Defaults to 2 when \`contours.type\` is
  "constraint". Number in the interval \[0, Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_contour_line` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
airquality |>
  go_figure() |>
  add_contour(
    x = ~Day,
    y = ~Month,
    z = ~Temp,
    line = go_contour_line(color = "red")
  )
```
