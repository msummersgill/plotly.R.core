# Functions for packages that build on plotly.core

Exported for packages that extend plotly.core, such as plotly.express:
building figures from data (`trace_data()`, `validate_trace()`,
`set_trace_grid_reference()`, `subplot_type_for_trace_type()`),
templates (`check_template()`, `template_layout_value()`,
`deep_merge()`), colour scales (`named_colorscale()`), widget settings
(`set_widget_setting()`, `pad_list()`) and JSON values
(`empty_object()`, `format_datetime()`). They are not meant for use in
figures, and may change between versions.

## Usage

``` r
trace_data(fig, data = NULL)

named_colorscale(name)

empty_object()

validate_trace(trace, skip_invalid = FALSE)

set_widget_setting(p, name, value)

pad_list(x, n)

subplot_type_for_trace_type(trace_type)

set_trace_grid_reference(trace, grid_ref, row, col, secondary_y = FALSE)

check_template(template)

deep_merge(a, b)

template_layout_value(template, path)

format_datetime(x)
```

## Arguments

- fig, p:

  A figure.

- data:

  A data frame, or `NULL` for the figure's data.

- name:

  A colour scale name, or a widget setting name.

- trace:

  A trace (a named list or graph object).

- skip_invalid:

  Whether to drop invalid properties instead of raising an error.

- value:

  A widget setting value.

- x:

  A vector of date-times, or a list.

- n:

  A length.

- trace_type:

  A trace type, e.g. `"scatter"`.

- grid_ref, row, col, secondary_y:

  A subplot grid reference and cell.

- template:

  A template.

- a, b:

  Lists to merge: `b`'s values replace `a`'s.

- path:

  A layout property path, e.g. `c("font", "family")`.
