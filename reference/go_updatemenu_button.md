# Layout updatemenu button objects

The object for an element of the `buttons` list of the layout's
`updatemenu`
([`go_updatemenu()`](https://msummersgill.github.io/plotly.R.core/reference/go_updatemenu.md)).
`go_updatemenu_button()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_updatemenu_button(
  ...,
  args = NULL,
  args2 = NULL,
  execute = NULL,
  label = NULL,
  method = NULL,
  name = NULL,
  templateitemname = NULL,
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
  \`method\` on click. Vector or list of up to 3 element(s).

- args2:

  Sets a 2nd set of \`args\`, these arguments values are passed to the
  Plotly method set in \`method\` when clicking this button while in the
  active state. Use this to create toggle buttons. Vector or list of up
  to 3 element(s).

- execute:

  When true, the API method is executed. When false, all other behaviors
  are the same and command execution is skipped. This may be useful when
  hooking into, for example, the \`plotly_buttonclicked\` method and
  executing the API command manually without losing the benefit of the
  updatemenu automatically binding to the state of the plot through the
  specification of \`method\` and \`args\`. Logical.

- label:

  Sets the text label to appear on the button. String.

- method:

  Sets the Plotly method to be called on click. If the \`skip\` method
  is used, the API updatemenu will function as normal but will perform
  no API calls and will not bind automatically to state updates. This
  may be used to create a component interface and attach to updatemenu
  events manually via JavaScript. One of `"restyle"`, `"relayout"`,
  `"animate"`, `"update"`, `"skip"`.

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

- visible:

  Determines whether or not this button is visible. Logical.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_updatemenu_button` object (a named list).

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
    updatemenus = list(
      go_updatemenu(
        buttons = list(go_updatemenu_button(visible = TRUE))
      )
    )
  )
```
