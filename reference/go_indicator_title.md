# Indicator title objects

The object for the `title` of an indicator trace
([`go_indicator()`](https://msummersgill.github.io/plotly.R.core/reference/go_indicator.md)).
`go_indicator_title()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_indicator_title(
  arg = NULL,
  ...,
  align = NULL,
  font = NULL,
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

- align:

  Sets the horizontal alignment of the title. It defaults to \`center\`
  except for bullet charts for which it defaults to right. One of
  `"left"`, `"center"`, `"right"`.

- font:

  Set the font used to display the title A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- text:

  Sets the title of this indicator. String.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_indicator_title` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
go_indicator(
  title = go_indicator_title(text = "title")
)
#> <go_indicator>
#> {
#>   "type": "indicator",
#>   "title": {
#>     "text": "title"
#>   }
#> }
#> 
```
