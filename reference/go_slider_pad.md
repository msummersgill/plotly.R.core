# Layout slider pad objects

Set the padding of the slider component along each side. The object for
the layout's `slider.pad`
([`go_slider()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider.md)).
`go_slider_pad()` creates one, with exactly its properties; a named list
with the same properties works too.

## Usage

``` r
go_slider_pad(
  ...,
  b = NULL,
  l = NULL,
  r = NULL,
  t = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- b:

  The amount of padding (in px) along the bottom of the component.
  Number.

- l:

  The amount of padding (in px) on the left side of the component.
  Number.

- r:

  The amount of padding (in px) on the right side of the component.
  Number.

- t:

  The amount of padding (in px) along the top of the component. Number.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_slider_pad` object (a named list).

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
  update_layout(sliders = list(go_slider(pad = go_slider_pad())))
```
