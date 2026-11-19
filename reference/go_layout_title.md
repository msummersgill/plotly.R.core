# Layout title objects

The object for the figure layout's `title`. `go_layout_title()` creates
one, with exactly its properties; a named list with the same properties
works too.

## Usage

``` r
go_layout_title(
  arg = NULL,
  ...,
  automargin = NULL,
  font = NULL,
  pad = NULL,
  subtitle = NULL,
  text = NULL,
  x = NULL,
  xanchor = NULL,
  xref = NULL,
  y = NULL,
  yanchor = NULL,
  yref = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- automargin:

  Determines whether the title can automatically push the figure
  margins. If \`yref='paper'\` then the margin will expand to ensure
  that the title doesn't overlap with the edges of the container. If
  \`yref='container'\` then the margins will ensure that the title
  doesn't overlap with the plot area, tick labels, and axis titles. If
  \`automargin=true\` and the margins need to be expanded, then y will
  be set to a default 1 and yanchor will be set to an appropriate
  default to ensure that minimal margin space is needed. Note that when
  \`yref='paper'\`, only 1 or 0 are allowed y values. Invalid values
  will be reset to the default 1. Logical.

- font:

  Sets the title font. A
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)
  object or named list, with properties `color`, `family`,
  `lineposition`, `shadow`, `size`, `style`, `textcase`, `variant` and
  `weight` (see
  [`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)).

- pad:

  Sets the padding of the title. Each padding value only applies when
  the corresponding \`xanchor\`/\`yanchor\` value is set accordingly.
  E.g. for left padding to take effect, \`xanchor\` must be set to
  "left". The same rule applies if \`xanchor\`/\`yanchor\` is determined
  automatically. Padding is muted if the respective anchor value is
  "middle"/"center". A
  [`go_title_pad()`](https://msummersgill.github.io/plotly.R.core/reference/go_title_pad.md)
  object or named list, with properties `b`, `l`, `r` and `t` (see
  [`go_title_pad()`](https://msummersgill.github.io/plotly.R.core/reference/go_title_pad.md)).

- subtitle:

  A
  [`go_title_subtitle()`](https://msummersgill.github.io/plotly.R.core/reference/go_title_subtitle.md)
  object or named list, with properties `font` and `text` (see
  [`go_title_subtitle()`](https://msummersgill.github.io/plotly.R.core/reference/go_title_subtitle.md)).

- text:

  Sets the plot's title. String.

- x:

  Sets the x position with respect to \`xref\` in normalized coordinates
  from 0 (left) to 1 (right). Number in the interval \[0, 1\].

- xanchor:

  Sets the title's horizontal alignment with respect to its x position.
  "left" means that the title starts at x, "right" means that the title
  ends at x and "center" means that the title's center is at x. "auto"
  divides \`xref\` by three and calculates the \`xanchor\` value
  automatically based on the value of \`x\`. One of `"auto"`, `"left"`,
  `"center"`, `"right"`.

- xref:

  Sets the container \`x\` refers to. "container" spans the entire
  \`width\` of the plot. "paper" refers to the width of the plotting
  area only. One of `"container"`, `"paper"`.

- y:

  Sets the y position with respect to \`yref\` in normalized coordinates
  from 0 (bottom) to 1 (top). "auto" places the baseline of the title
  onto the vertical center of the top margin. Number in the interval
  \[0, 1\].

- yanchor:

  Sets the title's vertical alignment with respect to its y position.
  "top" means that the title's cap line is at y, "bottom" means that the
  title's baseline is at y and "middle" means that the title's midline
  is at y. "auto" divides \`yref\` by three and calculates the
  \`yanchor\` value automatically based on the value of \`y\`. One of
  `"auto"`, `"top"`, `"middle"`, `"bottom"`.

- yref:

  Sets the container \`y\` refers to. "container" spans the entire
  \`height\` of the plot. "paper" refers to the height of the plotting
  area only. One of `"container"`, `"paper"`.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_title` object (a named list).

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
  update_layout(title = go_layout_title(text = "title"))
```
