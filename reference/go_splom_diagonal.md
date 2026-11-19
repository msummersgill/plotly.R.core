# Splom diagonal objects

The object for the `diagonal` of a splom trace
([`go_splom()`](https://msummersgill.github.io/plotly.R.core/reference/go_splom.md)).
`go_splom_diagonal()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_splom_diagonal(..., visible = NULL, skip_invalid = FALSE)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- visible:

  Determines whether or not subplots on the diagonal are displayed.
  Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_splom_diagonal` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
iris |>
  go_figure() |>
  add_splom(
    dimensions = list(
      go_splom_dimension(label = "Sepal.Length", values = ~Sepal.Length),
      go_splom_dimension(label = "Sepal.Width", values = ~Sepal.Width),
      go_splom_dimension(label = "Petal.Length", values = ~Petal.Length)
    ),
    diagonal = go_splom_diagonal(visible = TRUE)
  )
```
