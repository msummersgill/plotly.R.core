# Pathbar objects

Used for `pathbar` in 2 places in the schema. `go_pathbar()` creates
one; a named list with the same properties works too.

## Usage

``` r
go_pathbar(
  arg = NULL,
  ...,
  edgeshape = NULL,
  side = NULL,
  textfont = NULL,
  thickness = NULL,
  visible = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- edgeshape:

  Determines which shape is used for edges between \`barpath\` labels.
  One of `">"`, `"<"`, `"|"`, `"/"`, `"\\"`.

- side:

  Determines on which side of the treemap the \`pathbar\` should be
  presented. One of `"top"`, `"bottom"`.

- textfont:

  Sets the font used inside \`pathbar\`. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- thickness:

  Sets the thickness of \`pathbar\` (in px). If not specified the
  \`pathbar.textfont.size\` is used with 3 pixles extra padding on each
  side. Number in the interval \[12, Inf\].

- visible:

  Determines if the path bar is drawn i.e. outside the trace \`domain\`
  and with one pixel gap. Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_pathbar` object (a named list).

## Details

These objects appear in 2 places in the plotly.js schema (properties
named `pathbar`), all with the same properties and rules.

## Examples

``` r
cyl <- table(paste(mtcars$cyl, "cylinders"))
d <- data.frame(
  labels = c("all cars", names(cyl)),
  parents = c("", rep("all cars", length(cyl))),
  values = c(0, as.vector(cyl))
)
d |>
  go_figure() |>
  add_icicle(
    labels = ~labels,
    parents = ~parents,
    values = ~values,
    pathbar = go_pathbar(visible = TRUE)
  )
```
