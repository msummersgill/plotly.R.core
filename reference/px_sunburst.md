# Sunburst chart

A sunburst plot represents hierarchial data as sectors laid out over
several levels of concentric rings.

## Usage

``` r
px_sunburst(
  data_frame = NULL,
  names = NULL,
  values = NULL,
  parents = NULL,
  path = NULL,
  ids = NULL,
  color = NULL,
  color_continuous_scale = NULL,
  range_color = NULL,
  color_continuous_midpoint = NULL,
  color_discrete_sequence = NULL,
  color_discrete_map = NULL,
  hover_name = NULL,
  hover_data = NULL,
  custom_data = NULL,
  labels = NULL,
  title = NULL,
  subtitle = NULL,
  template = NULL,
  width = NULL,
  height = NULL,
  branchvalues = NULL,
  maxdepth = NULL
)
```

## Arguments

- data_frame:

  A data.frame, data.table, list or matrix. Needed for column names to
  be used in the other arguments; if `NULL`, a data frame is built from
  the vectors given in the other arguments.

- names:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used as labels for sectors.

- values:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to set values associated to
  sectors.

- parents:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used as parents in sunburst and
  treemap charts.

- path:

  Column names in `data_frame` (a character vector or a formula such as
  `~c(a, b)`), or a list of column names, formulas and vectors. The
  columns define the hierarchy of sectors, from root to leaves. Cannot
  be combined with `ids` or `parents`.

- ids:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to set ids of sectors

- color:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to assign color to marks.

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

- labels:

  Named character vector or list mapping column names to the labels to
  use for axis titles, legend entries and hover text, e.g.
  `c(gdpPercap = "GDP per capita")`.

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

- branchvalues:

  "total" or "remainder" Determines how the items in `values` are
  summed. Whenset to "total", items in `values` are taken to be valueof
  all its descendants. When set to "remainder", itemsin `values`
  corresponding to the root and the branches:sectors are taken to be the
  extra part not part of thesum of the values at their leaves.

- maxdepth:

  Positive integer Sets the number of rendered sectors from any given
  `level`. Set `maxdepth` to -1 to render all thelevels in the
  hierarchy.

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
[`px_scatter_3d()`](https://msummersgill.github.io/plotly.R.core/reference/px_scatter_3d.md),
[`px_scatter_geo()`](https://msummersgill.github.io/plotly.R.core/reference/px_scatter_geo.md),
[`px_scatter_map()`](https://msummersgill.github.io/plotly.R.core/reference/px_scatter_map.md),
[`px_scatter_matrix()`](https://msummersgill.github.io/plotly.R.core/reference/px_scatter_matrix.md),
[`px_scatter_polar()`](https://msummersgill.github.io/plotly.R.core/reference/px_scatter_polar.md),
[`px_scatter_ternary()`](https://msummersgill.github.io/plotly.R.core/reference/px_scatter_ternary.md),
[`px_strip()`](https://msummersgill.github.io/plotly.R.core/reference/px_strip.md),
[`px_timeline()`](https://msummersgill.github.io/plotly.R.core/reference/px_timeline.md),
[`px_treemap()`](https://msummersgill.github.io/plotly.R.core/reference/px_treemap.md),
[`px_violin()`](https://msummersgill.github.io/plotly.R.core/reference/px_violin.md)

## Examples

``` r
px_data_tips() |> px_sunburst(path = ~c(day, time, sex), values = ~total_bill)
```
