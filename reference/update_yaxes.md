# Select, update or modify yaxis objects

Work with all of a figure's layout yaxis objects (`yaxis`, `yaxis2`,
`yaxis3`, ...). `select_yaxes()` returns them as a named list,
`update_yaxes()` updates their properties like
[`update_layout()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md)
does, and `for_each_yaxis()` replaces each one with the result of `fn`.
The base object (e.g. `yaxis`) is always included, even if it has not
been set yet.

## Usage

``` r
select_yaxes(fig, selector = NULL, row = NULL, col = NULL, secondary_y = NULL)

update_yaxes(
  fig,
  patch = NULL,
  ...,
  selector = NULL,
  row = NULL,
  col = NULL,
  secondary_y = NULL,
  overwrite = FALSE
)

for_each_yaxis(
  fig,
  fn,
  selector = NULL,
  row = NULL,
  col = NULL,
  secondary_y = NULL
)
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

- secondary_y:

  Only secondary (`TRUE`) or primary (`FALSE`) y axes.

- patch:

  A named list or
  [`go_layout_yaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_yaxis.md)
  object of property updates.

- ...:

  Further named updates (names may use magic underscores).

- overwrite:

  If `TRUE`, replace nested objects instead of merging.

- fn:

  A function that takes an object and returns the modified object. If it
  returns anything other than a list, the object is left unchanged.

## Value

`select_yaxes()` returns a named list of
[`go_layout_yaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_yaxis.md)
objects; the others return the modified figure.
