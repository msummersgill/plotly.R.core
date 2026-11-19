# Funnelarea marker objects

The object for the `marker` of a funnelarea trace
([`go_funnelarea()`](https://msummersgill.github.io/plotly.R.core/reference/go_funnelarea.md)).
`go_funnelarea_marker()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_funnelarea_marker(
  arg = NULL,
  ...,
  colors = NULL,
  line = NULL,
  pattern = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- colors:

  Sets the color of each sector. If not specified, the default trace
  color set is used to pick the sector colors. Data array: a vector,
  factor, Date/POSIXct vector, matrix or list.

- line:

  A
  [`go_funnelarea_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_funnelarea_marker_line.md)
  object or named list, with properties `color` and `width` (see
  [`go_funnelarea_marker_line()`](https://msummersgill.github.io/plotly.R.core/reference/go_funnelarea_marker_line.md)).

- pattern:

  Sets the pattern within the marker. A
  [`go_pattern()`](https://msummersgill.github.io/plotly.R.core/reference/go_pattern.md)
  object or named list, with properties `bgcolor`, `fgcolor`,
  `fgopacity`, `fillmode`, `path`, `shape`, `size` and `solidity` (see
  [`go_pattern()`](https://msummersgill.github.io/plotly.R.core/reference/go_pattern.md)).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_funnelarea_marker` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
d <- as.data.frame(table(cylinders = mtcars$cyl))
d |>
  go_figure() |>
  add_funnelarea(
    labels = ~cylinders,
    values = ~Freq,
    marker = go_funnelarea_marker(colors = c("red", "blue"))
  )
```
