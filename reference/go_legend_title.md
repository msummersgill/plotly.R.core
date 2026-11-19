# Layout legend title objects

The object for the layout's `legend.title`
([`go_legend()`](https://msummersgill.github.io/plotly.R.core/reference/go_legend.md)).
`go_legend_title()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_legend_title(
  ...,
  font = NULL,
  side = NULL,
  text = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- font:

  Sets this legend's title font. Defaults to \`legend.font\` with its
  size increased about 20%. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- side:

  Determines the location of legend's title with respect to the legend
  items. Defaulted to "top" with \`orientation\` is "h". Defaulted to
  "left" with \`orientation\` is "v". The "top left" options could be
  used to expand top center and top right are for horizontal alignment
  legend area in both x and y sides. One of `"top"`, `"left"`,
  `"top left"`, `"top center"`, `"top right"`.

- text:

  Sets the title of the legend. String.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_legend_title` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter(x = ~wt, y = ~mpg, mode = "markers") |>
  update_layout(
    legend = go_legend(title = go_legend_title(text = "title"))
  )
```
