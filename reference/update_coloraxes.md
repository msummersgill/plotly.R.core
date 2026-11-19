# Select, update or modify coloraxis objects

Work with all of a figure's layout coloraxis objects (`coloraxis`,
`coloraxis2`, `coloraxis3`, ...). `select_coloraxes()` returns them as a
named list, `update_coloraxes()` updates their properties like
[`update_layout()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md)
does, and `for_each_coloraxis()` replaces each one with the result of
`fn`. The base object (e.g. `coloraxis`) is always included, even if it
has not been set yet.

## Usage

``` r
select_coloraxes(fig, selector = NULL, row = NULL, col = NULL)

update_coloraxes(
  fig,
  patch = NULL,
  ...,
  selector = NULL,
  row = NULL,
  col = NULL,
  overwrite = FALSE
)

for_each_coloraxis(fig, fn, selector = NULL, row = NULL, col = NULL)
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
  [`go_coloraxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_coloraxis.md)
  object of property updates.

- ...:

  Further named updates, by their full names.

- overwrite:

  If `TRUE`, replace nested objects instead of merging.

- fn:

  A function that takes an object and returns the modified object. If it
  returns anything other than a list, the object is left unchanged.

## Value

`select_coloraxes()` returns a named list of coloraxis objects; the
others return the modified figure.

## See also

[`go_coloraxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_coloraxis.md)
for the properties of coloraxis objects.
