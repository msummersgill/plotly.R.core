# Layout slider currentvalue objects

The object for the layout's `slider.currentvalue`
([`go_slider()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider.md)).
`go_slider_currentvalue()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_slider_currentvalue(
  arg = NULL,
  ...,
  font = NULL,
  offset = NULL,
  prefix = NULL,
  suffix = NULL,
  visible = NULL,
  xanchor = NULL,
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

  Sets the font of the current value label text. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- offset:

  The amount of space, in pixels, between the current value label and
  the slider. Number.

- prefix:

  When currentvalue.visible is true, this sets the prefix of the label.
  String.

- suffix:

  When currentvalue.visible is true, this sets the suffix of the label.
  String.

- visible:

  Shows the currently-selected value above the slider. Logical.

- xanchor:

  The alignment of the value readout relative to the length of the
  slider. One of `"left"`, `"center"`, `"right"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_slider_currentvalue` object (a named list).

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
    sliders = list(
      go_slider(
        currentvalue = go_slider_currentvalue(visible = TRUE)
      )
    )
  )
```
