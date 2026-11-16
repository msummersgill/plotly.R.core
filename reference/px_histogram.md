# Histogram

In a histogram, rows of `data_frame` are grouped together into a
rectangular mark to visualize the 1D distribution of an aggregate
function `histfunc` (e.g. the count or sum) of the value `y` (or `x` if
`orientation` is `"h"`).

## Usage

``` r
px_histogram(
  data_frame = NULL,
  x = NULL,
  y = NULL,
  color = NULL,
  pattern_shape = NULL,
  facet_row = NULL,
  facet_col = NULL,
  facet_col_wrap = 0,
  facet_row_spacing = NULL,
  facet_col_spacing = NULL,
  hover_name = NULL,
  hover_data = NULL,
  animation_frame = NULL,
  animation_group = NULL,
  category_orders = NULL,
  labels = NULL,
  color_discrete_sequence = NULL,
  color_discrete_map = NULL,
  pattern_shape_sequence = NULL,
  pattern_shape_map = NULL,
  marginal = NULL,
  opacity = NULL,
  orientation = NULL,
  barmode = "relative",
  barnorm = NULL,
  histnorm = NULL,
  log_x = FALSE,
  log_y = FALSE,
  range_x = NULL,
  range_y = NULL,
  histfunc = NULL,
  cumulative = NULL,
  nbins = NULL,
  text_auto = FALSE,
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

- color:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to assign color to marks.

- pattern_shape:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to assign pattern shapes to
  marks.

- facet_row:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to assign marks to facetted
  subplots in the vertical direction.

- facet_col:

  A column name in `data_frame`, a vector of values, a one-sided formula
  evaluated in `data_frame` (e.g. `~ log(pop)`),
  [`px_constant()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  or
  [`px_range()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md).
  Values from this column or vector are used to assign marks to facetted
  subplots in the horizontal direction.

- facet_col_wrap:

  Maximum number of facet columns. Wraps the column variable at this
  width, so that the column facets span multiple rows. Ignored if 0, and
  forced to 0 if `facet_row` or a `marginal` is set.

- facet_row_spacing:

  Spacing between facet rows, in paper units. Default is 0.03 or 0.07
  when facet_col_wrap is used.

- facet_col_spacing:

  Spacing between facet columns, in paper units Default is 0.02.

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

- pattern_shape_sequence:

  Strings should define valid plotly.js patterns-shapes. When
  `pattern_shape` is set, values in that column are assigned
  patterns-shapes by cycling through `pattern_shape_sequence` in the
  order described in `category_orders`, unless the value of
  `pattern_shape` is a key in `pattern_shape_map`.

- pattern_shape_map:

  Named character vector or list mapping values of `pattern_shape` to
  pattern shapes, overriding `pattern_shape_sequence`.
  [`px_identity()`](https://msummersgill.github.io/plotly.R.core/reference/px_constant.md)
  uses the values directly.

- marginal:

  One of `"rug"`, `"box"`, `"violin"`, or `"histogram"`. If set, a
  subplot is drawn alongside the main plot, visualizing the
  distribution.

- opacity:

  Value between 0 and 1. Sets the opacity for markers.

- orientation:

  (default `"v"` if `x` and `y` are provided and both continuous or both
  categorical, otherwise `"v"`(`"h"`) if `x`(`y`) is categorical and
  `y`(`x`) is continuous, otherwise `"v"`(`"h"`) if only `x`(`y`) is
  provided)

- barmode:

  One of `"group"`, `"overlay"` or `"relative"` In `"relative"` mode,
  bars are stacked above zero for positive values and below zero for
  negative values. In `"overlay"` mode, bars are drawn on top of one
  another. In `"group"` mode, bars are placed beside each other.

- barnorm:

  One of `"fraction"` or `"percent"`. If `"fraction"`, the value of each
  bar is divided by the sum of all values at that location coordinate.
  `"percent"` is the same but multiplied by 100 to show percentages.
  `NULL` will stack up all values at each location coordinate.

- histnorm:

  One of `"percent"`, `"probability"`, `"density"`, or
  `"probability density"` If `NULL`, the output of `histfunc` is used as
  is. If `"probability"`, the output of `histfunc` for a given bin is
  divided by the sum of the output of `histfunc` for all bins. If
  `"percent"`, the output of `histfunc` for a given bin is divided by
  the sum of the output of `histfunc` for all bins and multiplied
  by 100. If `"density"`, the output of `histfunc` for a given bin is
  divided by the size of the bin. If `"probability density"`, the output
  of `histfunc` for a given bin is normalized such that it corresponds
  to the probability that a random event whose distribution is described
  by the output of `histfunc` will fall into that bin.

- log_x:

  If `TRUE`, the x-axis is log-scaled in cartesian coordinates.

- log_y:

  If `TRUE`, the y-axis is log-scaled in cartesian coordinates.

- range_x:

  If provided, overrides auto-scaling on the x-axis in cartesian
  coordinates.

- range_y:

  If provided, overrides auto-scaling on the y-axis in cartesian
  coordinates.

- histfunc:

  One of `"count"`, `"sum"`, `"avg"`, `"min"`, or `"max"`. Function used
  to aggregate values for summarization (note: can be normalized with
  `histnorm`).

- cumulative:

  If `TRUE`, histogram values are cumulative.

- nbins:

  Positive integer. Sets the number of bins.

- text_auto:

  If `TRUE` or a string, the x or y or z values will be displayed as
  text, depending on the orientation A string like `".2f"` will be
  interpreted as a `texttemplate` numeric formatting directive.

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
[`px_sunburst()`](https://msummersgill.github.io/plotly.R.core/reference/px_sunburst.md),
[`px_timeline()`](https://msummersgill.github.io/plotly.R.core/reference/px_timeline.md),
[`px_treemap()`](https://msummersgill.github.io/plotly.R.core/reference/px_treemap.md),
[`px_violin()`](https://msummersgill.github.io/plotly.R.core/reference/px_violin.md)

## Examples

``` r
px_data_tips() |> px_histogram(x = ~total_bill, color = ~sex, marginal = "rug", nbins = 20)
```
