# Layout slider step objects

The object for an element of the `steps` list of the layout's `slider`
([`go_slider()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider.md)).
`go_slider_step()` creates one, with exactly its properties; a named
list with the same properties works too.

## Usage

``` r
go_slider_step(
  ...,
  args = NULL,
  execute = NULL,
  label = NULL,
  method = NULL,
  name = NULL,
  templateitemname = NULL,
  value = NULL,
  visible = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- args:

  Sets the arguments values to be passed to the Plotly method set in
  \`method\` on slide. Vector or list of up to 3 element(s).

- execute:

  When true, the API method is executed. When false, all other behaviors
  are the same and command execution is skipped. This may be useful when
  hooking into, for example, the \`plotly_sliderchange\` method and
  executing the API command manually without losing the benefit of the
  slider automatically binding to the state of the plot through the
  specification of \`method\` and \`args\`. Logical.

- label:

  Sets the text label to appear on the slider String.

- method:

  Sets the Plotly method to be called when the slider value is changed.
  If the \`skip\` method is used, the API slider will function as normal
  but will perform no API calls and will not bind automatically to state
  updates. This may be used to create a component interface and attach
  to slider events manually via JavaScript. One of `"restyle"`,
  `"relayout"`, `"animate"`, `"update"`, `"skip"`.

- name:

  When used in a template, named items are created in the output figure
  in addition to any items the figure already has in this array. You can
  modify these items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- templateitemname:

  Used to refer to a named item in this array in the template. Named
  items from the template will be created even without a matching item
  in the input figure, but you can modify one by making an item with
  \`templateitemname\` matching its \`name\`, alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). If there is no template or no matching item, this item will
  be hidden unless you explicitly show it with \`visible: true\`.
  String.

- value:

  Sets the value of the slider step, used to refer to the step
  programatically. Defaults to the slider label if not provided. String.

- visible:

  Determines whether or not this step is included in the slider.
  Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_slider_step` object (a named list).

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
      go_slider(steps = list(go_slider_step(visible = TRUE)))
    )
  )
```
