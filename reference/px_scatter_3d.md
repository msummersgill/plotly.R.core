# 3D scatter plot

In a 3D scatter plot, each row of `data_frame` is represented by a
symbol mark in 3D space.

## Usage

``` r
px_scatter_3d(
  data_frame = NULL,
  x = NULL,
  y = NULL,
  z = NULL,
  color = NULL,
  symbol = NULL,
  size = NULL,
  text = NULL,
  hover_name = NULL,
  hover_data = NULL,
  custom_data = NULL,
  error_x = NULL,
  error_x_minus = NULL,
  error_y = NULL,
  error_y_minus = NULL,
  error_z = NULL,
  error_z_minus = NULL,
  animation_frame = NULL,
  animation_group = NULL,
  category_orders = NULL,
  labels = NULL,
  size_max = NULL,
  color_discrete_sequence = NULL,
  color_discrete_map = NULL,
  color_continuous_scale = NULL,
  range_color = NULL,
  color_continuous_midpoint = NULL,
  symbol_sequence = NULL,
  symbol_map = NULL,
  opacity = NULL,
  log_x = FALSE,
  log_y = FALSE,
  log_z = FALSE,
  range_x = NULL,
  range_y = NULL,
  range_z = NULL,
  title = NULL,
  subtitle = NULL,
  template = NULL,
  width = NULL,
  height = NULL
)
```

## Arguments

- data_frame:

  A data.frame, data.table, list or matrix. Needed for column names to
  be used in the other arguments; if `NULL`, a data frame is built from
  the vectors given in the other arguments.

- x:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to position marks along the
  x axis in cartesian coordinates.

- y:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to position marks along the
  y axis in cartesian coordinates.

- z:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to position marks along the
  z axis in cartesian coordinates.

- color:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to assign color to marks.

- symbol:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to assign symbols to marks.

- size:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to assign mark sizes.

- text:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector appear in the figure as text labels.

- hover_name:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector appear in bold in the hover tooltip.

- hover_data:

  Extra data to show in the hover tooltip: column names (a character
  vector or a formula such as `~c(a, b)`), or a named list with column
  names as names and values `TRUE` (default formatting), `FALSE` (hide
  the column, e.g. one shown by default), a d3-format string such as
  `":.3f"`, a vector of data, or a list of a format string or `TRUE` and
  a vector of data.

- custom_data:

  Column names (a character vector or a formula such as `~c(a, b)`), or
  a list of column names, formulas and vectors. Values from these
  columns are added to the traces' `customdata` (e.g. for use in Shiny
  events) without appearing in the hover tooltip.

- error_x:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to size x-axis error bars.
  If `error_x_minus` is `NULL`, error bars will be symmetrical,
  otherwise `error_x` is used for the positive direction only.

- error_x_minus:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to size x-axis error bars
  in the negative direction. Ignored if `error_x` is `NULL`.

- error_y:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to size y-axis error bars.
  If `error_y_minus` is `NULL`, error bars will be symmetrical,
  otherwise `error_y` is used for the positive direction only.

- error_y_minus:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to size y-axis error bars
  in the negative direction. Ignored if `error_y` is `NULL`.

- error_z:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to size z-axis error bars.
  If `error_z_minus` is `NULL`, error bars will be symmetrical,
  otherwise `error_z` is used for the positive direction only.

- error_z_minus:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to size z-axis error bars
  in the negative direction. Ignored if `error_z` is `NULL`.

- animation_frame:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to assign marks to
  animation frames.

- animation_group:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to provide object-constancy
  across animation frames: rows with matching `animation_group`s will be
  treated as if they describe the same object in each frame.

- category_orders:

  Named list mapping column names to the order of their values in axes,
  legends and facets, e.g. `list(day = c("Thur", "Fri", "Sat", "Sun"))`.
  By default values appear in the order first encountered, or in level
  order for factors.

- labels:

  Named character vector or list mapping column names to the labels to
  use for axis titles, legend entries and hover text, e.g.
  `c(gdpPercap = "GDP per capita")`.

- size_max:

  Set the maximum mark size when using `size`.

- color_discrete_sequence:

  Character vector of colors, e.g. `px_colors$qualitative$Set1`. Values
  of `color` are assigned colors in order (cycling), unless set in
  `color_discrete_map`. Defaults to the template's `colorway`.

- color_discrete_map:

  Named character vector or list mapping values of `color` to colors,
  overriding `color_discrete_sequence`. If the values of `color` are
  colors,
  [`px_identity()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  (or `"identity"`) uses them directly.

- color_continuous_scale:

  Character vector of colors, e.g. `px_colors$sequential$Viridis`, or
  the name of a scale in
  [px_colors](https://msummersgill.github.io/plotly.R.core/reference/px_colors.md).
  Used when `color` is numeric. Defaults to the template's sequential
  colorscale.

- range_color:

  If provided, overrides auto-scaling on the continuous color scale.

- color_continuous_midpoint:

  If set, computes the bounds of the continuous color scale to have the
  desired midpoint. Setting this value is recommended when using
  `plotly.express.colors.diverging` color scales as the inputs to
  `color_continuous_scale`.

- symbol_sequence:

  Strings should define valid plotly.js symbols. When `symbol` is set,
  values in that column are assigned symbols by cycling through
  `symbol_sequence` in the order described in `category_orders`, unless
  the value of `symbol` is a key in `symbol_map`.

- symbol_map:

  Named character vector or list mapping values of `symbol` to marker
  symbols, overriding `symbol_sequence`.
  [`px_identity()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  uses the values of `symbol` directly.

- opacity:

  Value between 0 and 1. Sets the opacity for markers.

- log_x:

  If `TRUE`, the x-axis is log-scaled in cartesian coordinates.

- log_y:

  If `TRUE`, the y-axis is log-scaled in cartesian coordinates.

- log_z:

  If `TRUE`, the z-axis is log-scaled in cartesian coordinates.

- range_x:

  If provided, overrides auto-scaling on the x-axis in cartesian
  coordinates.

- range_y:

  If provided, overrides auto-scaling on the y-axis in cartesian
  coordinates.

- range_z:

  If provided, overrides auto-scaling on the z-axis in cartesian
  coordinates.

- title:

  The figure title.

- subtitle:

  The figure subtitle.

- template:

  A template name (see
  [`template_names()`](https://msummersgill.github.io/plotly.R.core/reference/get_template.md))
  or a template list. Defaults to
  [`default_template()`](https://msummersgill.github.io/plotly.R.core/reference/get_template.md).

- width:

  The figure width in pixels.

- height:

  The figure height in pixels.

## Value

A
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md).

## See also

Other plotly express:
[`px_area()`](https://msummersgill.github.io/plotly.R.core/reference/px_area.md),
[`px_bar()`](https://msummersgill.github.io/plotly.R.core/reference/px_bar.md),
[`px_bar_polar()`](https://msummersgill.github.io/plotly.R.core/reference/px_bar_polar.md),
[`px_box()`](https://msummersgill.github.io/plotly.R.core/reference/px_box.md),
[`px_choropleth()`](https://msummersgill.github.io/plotly.R.core/reference/px_choropleth.md),
[`px_choropleth_map()`](https://msummersgill.github.io/plotly.R.core/reference/px_choropleth_map.md),
[`px_density_contour()`](https://msummersgill.github.io/plotly.R.core/reference/px_density_contour.md),
[`px_density_heatmap()`](https://msummersgill.github.io/plotly.R.core/reference/px_density_heatmap.md),
[`px_density_map()`](https://msummersgill.github.io/plotly.R.core/reference/px_density_map.md),
[`px_ecdf()`](https://msummersgill.github.io/plotly.R.core/reference/px_ecdf.md),
[`px_funnel()`](https://msummersgill.github.io/plotly.R.core/reference/px_funnel.md),
[`px_funnel_area()`](https://msummersgill.github.io/plotly.R.core/reference/px_funnel_area.md),
[`px_histogram()`](https://msummersgill.github.io/plotly.R.core/reference/px_histogram.md),
[`px_icicle()`](https://msummersgill.github.io/plotly.R.core/reference/px_icicle.md),
[`px_imshow()`](https://msummersgill.github.io/plotly.R.core/reference/px_imshow.md),
[`px_line()`](https://msummersgill.github.io/plotly.R.core/reference/px_line.md),
[`px_line_3d()`](https://msummersgill.github.io/plotly.R.core/reference/px_line_3d.md),
[`px_line_geo()`](https://msummersgill.github.io/plotly.R.core/reference/px_line_geo.md),
[`px_line_map()`](https://msummersgill.github.io/plotly.R.core/reference/px_line_map.md),
[`px_line_polar()`](https://msummersgill.github.io/plotly.R.core/reference/px_line_polar.md),
[`px_line_ternary()`](https://msummersgill.github.io/plotly.R.core/reference/px_line_ternary.md),
[`px_parallel_categories()`](https://msummersgill.github.io/plotly.R.core/reference/px_parallel_categories.md),
[`px_parallel_coordinates()`](https://msummersgill.github.io/plotly.R.core/reference/px_parallel_coordinates.md),
[`px_pie()`](https://msummersgill.github.io/plotly.R.core/reference/px_pie.md),
[`px_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/px_scatter.md),
[`px_scatter_geo()`](https://msummersgill.github.io/plotly.R.core/reference/px_scatter_geo.md),
[`px_scatter_map()`](https://msummersgill.github.io/plotly.R.core/reference/px_scatter_map.md),
[`px_scatter_matrix()`](https://msummersgill.github.io/plotly.R.core/reference/px_scatter_matrix.md),
[`px_scatter_polar()`](https://msummersgill.github.io/plotly.R.core/reference/px_scatter_polar.md),
[`px_scatter_ternary()`](https://msummersgill.github.io/plotly.R.core/reference/px_scatter_ternary.md),
[`px_strip()`](https://msummersgill.github.io/plotly.R.core/reference/px_strip.md),
[`px_sunburst()`](https://msummersgill.github.io/plotly.R.core/reference/px_sunburst.md),
[`px_timeline()`](https://msummersgill.github.io/plotly.R.core/reference/px_timeline.md),
[`px_treemap()`](https://msummersgill.github.io/plotly.R.core/reference/px_treemap.md),
[`px_violin()`](https://msummersgill.github.io/plotly.R.core/reference/px_violin.md)

## Examples

``` r
px_data_iris() |>
  px_scatter_3d(x = ~sepal_length, y = ~sepal_width, z = ~petal_width, color = ~species)
```
