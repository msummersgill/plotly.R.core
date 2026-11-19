# Layout map layer symbol objects

The object for the layout's `map.layer.symbol`
([`go_map_layer()`](https://msummersgill.github.io/plotly.R.core/reference/go_map_layer.md)).
`go_map_layer_symbol()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_map_layer_symbol(
  ...,
  icon = NULL,
  iconsize = NULL,
  placement = NULL,
  text = NULL,
  textfont = NULL,
  textposition = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- icon:

  Sets the symbol icon image (map.layer.layout.icon-image). Full list:
  https://www.mapbox.com/maki-icons/ String.

- iconsize:

  Sets the symbol icon size (map.layer.layout.icon-size). Has an effect
  only when \`type\` is set to "symbol". Number.

- placement:

  Sets the symbol and/or text placement
  (map.layer.layout.symbol-placement). If \`placement\` is "point", the
  label is placed where the geometry is located If \`placement\` is
  "line", the label is placed along the line of the geometry If
  \`placement\` is "line-center", the label is placed on the center of
  the geometry One of `"point"`, `"line"`, `"line-center"`.

- text:

  Sets the symbol text (map.layer.layout.text-field). String.

- textfont:

  Sets the icon text font (color=map.layer.paint.text-color,
  size=map.layer.layout.text-size). Has an effect only when \`type\` is
  set to "symbol". A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`, `size`,
  `style` and `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- textposition:

  Sets the positions of the \`text\` elements with respects to the (x,y)
  coordinates. One of `"top left"`, `"top center"`, `"top right"`,
  `"middle left"`, `"middle center"`, `"middle right"`, `"bottom left"`,
  `"bottom center"`, `"bottom right"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_map_layer_symbol` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
quakes |>
  go_figure() |>
  add_scattermap(lat = ~lat, lon = ~long) |>
  update_layout(
    map = go_map(
      layers = list(
        go_map_layer(symbol = go_map_layer_symbol(text = "title"))
      )
    )
  )
```
