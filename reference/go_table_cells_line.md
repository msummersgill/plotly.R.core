# Table cells line objects

The object for the `cells.line` of a table trace
([`go_table_cells()`](https://msummersgill.github.io/plotly.R.core/reference/go_table_cells.md)).
`go_table_cells_line()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_table_cells_line(..., color = NULL, width = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- color:

  Color: a CSS color string or R color name, or a vector of these.

- width:

  Number, or a vector of these.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_table_cells_line` object (a named list).

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
  cells = go_table_cells(
    line = go_table_cells_line(color = "red")
  )
)
#> <go_table>
#> {
#>   "type": "table",
#>   "cells": {
#>     "line": {
#>       "color": "red"
#>     }
#>   }
#> }
#> 
```
