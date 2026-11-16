# Select, update or modify selections

`select_selections()` returns the figure's selections matching
`selector` (and grid cell); `update_selections()` updates their
properties like
[`update_layout()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md)
does; `for_each_selection()` replaces each one with the result of `fn`.

## Usage

``` r
select_selections(
  fig,
  selector = NULL,
  row = NULL,
  col = NULL,
  secondary_y = NULL
)

update_selections(
  fig,
  patch = NULL,
  ...,
  selector = NULL,
  row = NULL,
  col = NULL,
  secondary_y = NULL,
  overwrite = FALSE
)

for_each_selection(
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

  Only objects on this subplot grid row and/or column's axes.

- secondary_y:

  Only objects on secondary (`TRUE`) or primary (`FALSE`) y axes.

- patch:

  A named list of property updates (see
  [`go_layout_selection()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_selection.md)).

- ...:

  Further named updates (names may use magic underscores).

- overwrite:

  If `TRUE`, replace nested objects instead of merging.

- fn:

  A function that takes an object and returns the modified object. If it
  returns anything other than a list, the object is left unchanged.

## Value

`select_selections()` returns a list of
[`go_layout_selection()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_selection.md)
objects; the others return the modified figure.

## See also

[`add_selection()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_selection.md)
