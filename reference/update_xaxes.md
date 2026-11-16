# Select, update or modify xaxis objects

Work with all of a figure's layout xaxis objects (`xaxis`, `xaxis2`,
`xaxis3`, ...). `select_xaxes()` returns them as a named list,
`update_xaxes()` updates their properties like
[`update_layout()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md)
does, and `for_each_xaxis()` replaces each one with the result of `fn`.
The base object (e.g. `xaxis`) is always included, even if it has not
been set yet.

## Usage

``` r
select_xaxes(fig, selector = NULL, row = NULL, col = NULL)

update_xaxes(
  fig,
  patch = NULL,
  ...,
  selector = NULL,
  row = NULL,
  col = NULL,
  overwrite = FALSE
)

for_each_xaxis(fig, fn, selector = NULL, row = NULL, col = NULL)
```

## Arguments

- fig:

  A `go_figure` object.

- selector:

  Which objects to use: `NULL` (all), indices into the matching objects,
  a named list of property values that must all match, or a function
  that takes an object and returns `TRUE` or `FALSE`.

- row, col:

  Only objects in this subplot grid row and/or column (figures created
  with
  [`make_subplots()`](https://msummersgill.github.io/plotly.R.core/reference/make_subplots.md)
  only).

- patch:

  A named list or
  [`go_layout_xaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_xaxis.md)
  object of property updates.

- ...:

  Further named updates (names may use magic underscores).

- overwrite:

  If `TRUE`, replace nested objects instead of merging.

- fn:

  A function that takes an object and returns the modified object. If it
  returns anything other than a list, the object is left unchanged.

## Value

`select_xaxes()` returns a named list of
[`go_layout_xaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_xaxis.md)
objects; the others return the modified figure.
