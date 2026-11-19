# Violin meanline objects

The object for the `meanline` of a violin trace
([`go_violin()`](https://msummersgill.github.io/plotly.R.core/reference/go_violin.md)).
`go_violin_meanline()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_violin_meanline(
  arg = NULL,
  ...,
  color = NULL,
  visible = NULL,
  width = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- color:

  Sets the mean line color. Color: a CSS color string or R color name.

- visible:

  Determines if a line corresponding to the sample's mean is shown
  inside the violins. If \`box.visible\` is turned on, the mean line is
  drawn inside the inner box. Otherwise, the mean line is drawn from one
  side of the violin to other. Logical.

- width:

  Sets the mean line width. Number in the interval \[0, Inf\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_violin_meanline` object (a named list).

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
  add_violin(
    x = ~factor(cyl),
    y = ~mpg,
    meanline = go_violin_meanline(color = "red")
  )
```
