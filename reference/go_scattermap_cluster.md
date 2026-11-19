# Scattermap cluster objects

The object for the `cluster` of a scattermap trace
([`go_scattermap()`](https://msummersgill.github.io/plotly.R.core/reference/go_scattermap.md)).
`go_scattermap_cluster()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_scattermap_cluster(
  ...,
  color = NULL,
  enabled = NULL,
  maxzoom = NULL,
  opacity = NULL,
  size = NULL,
  step = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- color:

  Sets the color for each cluster step. Color: a CSS color string or R
  color name, or a vector of these.

- enabled:

  Determines whether clustering is enabled or disabled. Logical.

- maxzoom:

  Sets the maximum zoom level. At zoom levels equal to or greater than
  this, points will never be clustered. Number in the interval \[0,
  24\].

- opacity:

  Sets the marker opacity. Number in the interval \[0, 1\], or a vector
  of these.

- size:

  Sets the size for each cluster step. Number in the interval \[0,
  Inf\], or a vector of these.

- step:

  Sets how many points it takes to create a cluster or advance to the
  next cluster step. Use this in conjunction with arrays for \`size\`
  and / or \`color\`. If an integer, steps start at multiples of this
  number. If an array, each step extends from the given value until one
  less than the next value. Number in the interval \[-1, Inf\], or a
  vector of these.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_scattermap_cluster` object (a named list).

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
    cluster = go_scattermap_cluster(color = "red")
  )
```
