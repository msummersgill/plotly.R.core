# Layout xaxis rangeselector button objects

Sets the specifications for each buttons. By default, a range selector
comes with no buttons. The object for an element of the `buttons` list
of the layout's `xaxis.rangeselector`
([`go_xaxis_rangeselector()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis_rangeselector.md)).
`go_xaxis_rangeselector_button()` creates one, with exactly its
properties; a named list with the same properties works too.

## Usage

``` r
go_xaxis_rangeselector_button(
  arg = NULL,
  ...,
  count = NULL,
  label = NULL,
  name = NULL,
  step = NULL,
  stepmode = NULL,
  templateitemname = NULL,
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

- count:

  Sets the number of steps to take to update the range. Use with
  \`step\` to specify the update interval. Number in the interval \[0,
  Inf\].

- label:

  Sets the text label to appear on the button. String.

- name:

  When used in a template, named items are created in the output figure
  in addition to any items the figure already has in this array. You can
  modify these items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- step:

  The unit of measurement that the \`count\` value will set the range
  by. One of `"month"`, `"year"`, `"day"`, `"hour"`, `"minute"`,
  `"second"`, `"all"`.

- stepmode:

  Sets the range update mode. If "backward", the range update shifts the
  start of range back "count" times "step" milliseconds. If "todate",
  the range update shifts the start of range back to the first timestamp
  from "count" times "step" milliseconds back. For example, with
  \`step\` set to "year" and \`count\` set to 1 the range update shifts
  the start of the range back to January 01 of the current year. Month
  and year "todate" are currently available only for the built-in
  (Gregorian) calendar. One of `"backward"`, `"todate"`.

- templateitemname:

  Used to refer to a named item in this array in the template. Named
  items from the template will be created even without a matching item
  in the input figure, but you can modify one by making an item with
  \`templateitemname\` matching its \`name\`, alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). If there is no template or no matching item, this item will
  be hidden unless you explicitly show it with \`visible: true\`.
  String.

- visible:

  Determines whether or not this button is visible. Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_xaxis_rangeselector_button` object (a named list).

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
    xaxis = go_xaxis(
      rangeselector = go_xaxis_rangeselector(
        buttons = list(go_xaxis_rangeselector_button(visible = TRUE))
      )
    )
  )
```
