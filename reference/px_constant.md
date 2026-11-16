# Constant and range inputs for Plotly Express

Pass `px_constant()` to an argument that expects a column, to use the
same value for every row (with an optional legend/axis `label`).
`px_range()` uses the integers 0, 1, 2, ... `px_identity()` can be
passed to `color_discrete_map`, `symbol_map`, `line_dash_map` or
`pattern_shape_map` to use the data values themselves (e.g. colors).

## Usage

``` r
px_constant(value, label = NULL)

px_range(label = NULL)

px_identity()
```

## Arguments

- value:

  The constant value.

- label:

  Name used for the column in labels and hover text.

## Value

An object recognised by the `px_*()` functions.

## Examples

``` r
px_data_iris() |>
  px_scatter(x = ~sepal_width, y = ~sepal_length, color = px_constant("all flowers"))
px_data_iris() |> px_scatter(x = px_range("index"), y = ~sepal_length)
```
