# Layout title pad objects

Sets the padding of the title. Each padding value only applies when the
corresponding \`xanchor\`/\`yanchor\` value is set accordingly. E.g. for
left padding to take effect, \`xanchor\` must be set to "left". The same
rule applies if \`xanchor\`/\`yanchor\` is determined automatically.
Padding is muted if the respective anchor value is "middle"/"center".
The object for the layout's `title.pad`
([`go_layout_title()`](https://msummersgill.github.io/plotly.R.core/reference/go_layout_title.md)).
`go_title_pad()` creates one, with exactly its properties; a named list
with the same properties works too.

## Usage

``` r
go_title_pad(
  arg = NULL,
  ...,
  b = NULL,
  l = NULL,
  r = NULL,
  t = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

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

A `go_layout_title_pad` object (a named list).

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
  update_layout(title = go_layout_title(pad = go_title_pad()))
```
