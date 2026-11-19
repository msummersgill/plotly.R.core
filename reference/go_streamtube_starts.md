# Streamtube starts objects

The object for the `starts` of a streamtube trace
([`go_streamtube()`](https://msummersgill.github.io/plotly.R.core/reference/go_streamtube.md)).
`go_streamtube_starts()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_streamtube_starts(..., x = NULL, y = NULL, z = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- x:

  Sets the x components of the starting position of the streamtubes Data
  array: a vector, factor, Date/POSIXct vector, matrix or list.

- y:

  Sets the y components of the starting position of the streamtubes Data
  array: a vector, factor, Date/POSIXct vector, matrix or list.

- z:

  Sets the z components of the starting position of the streamtubes Data
  array: a vector, factor, Date/POSIXct vector, matrix or list.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_streamtube_starts` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
d <- expand.grid(x = 1:3, y = 1:3, z = 1:3)
d |>
  go_figure() |>
  add_streamtube(
    x = ~x,
    y = ~y,
    z = ~z,
    u = ~y,
    v = ~-x,
    w = ~z,
    starts = go_streamtube_starts()
  )
```
