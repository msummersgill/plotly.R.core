# Layout xaxis title objects

The object for the layout's `xaxis.title`
([`go_xaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis.md)).
`go_xaxis_title()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_xaxis_title(
  arg = NULL,
  ...,
  font = NULL,
  standoff = NULL,
  text = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- font:

  Sets this axis' title font. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- standoff:

  Sets the standoff distance (in px) between the axis labels and the
  title text The default value is a function of the axis tick labels,
  the title \`font.size\` and the axis \`linewidth\`. Note that the axis
  title position is always constrained within the margins, so the actual
  standoff distance is always less than the set or default value. By
  setting \`standoff\` and turning on \`automargin\`, plotly.js will
  push the margins to fit the axis title at given standoff distance.
  Number in the interval \[0, Inf\].

- text:

  Sets the title of this axis. String.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_xaxis_title` object (a named list).

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
    xaxis = go_xaxis(title = go_xaxis_title(text = "title"))
  )
```
