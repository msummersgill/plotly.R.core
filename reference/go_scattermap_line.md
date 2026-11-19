# Scattermap line objects

The object for the `line` of a scattermap trace
([`go_scattermap()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattermap.md)).
`go_scattermap_line()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_scattermap_line(
  arg = NULL,
  ...,
  color = NULL,
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

- width:

  Sets the line width (in px). Number in the interval \[0, Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_scattermap_line` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
quakes |>
  go_figure() |>
  add_scattermap(
    lat = ~lat,
    lon = ~long,
    line = go_scattermap_line(color = "red")
  )
```
