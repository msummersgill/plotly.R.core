# Display an image or a matrix

Displays a matrix as a heatmap, or an RGB/RGBA array as an image, like
plotly.py's `px.imshow()`. Higher-dimensional arrays can be split into
facets and animation frames with `facet_col`, `facet_row` and
`animation_frame`.

## Usage

``` r
px_imshow(
  img,
  zmin = NULL,
  zmax = NULL,
  origin = NULL,
  labels = list(),
  x = NULL,
  y = NULL,
  animation_frame = NULL,
  facet_col = NULL,
  facet_row = NULL,
  facet_col_wrap = NULL,
  facet_col_spacing = NULL,
  facet_row_spacing = NULL,
  color_continuous_scale = NULL,
  color_continuous_midpoint = NULL,
  range_color = NULL,
  title = NULL,
  template = NULL,
  width = NULL,
  height = NULL,
  aspect = NULL,
  contrast_rescaling = NULL,
  binary_string = NULL,
  binary_backend = "auto",
  binary_compression_level = 4,
  binary_format = "png",
  text_auto = FALSE
)
```

## Arguments

- img:

  The image: a numeric or logical matrix (shown as a heatmap with a
  continuous color scale), a data.frame (its column and row names give
  `x` and `y`), or an array of dimension `c(height, width, 3)` (RGB) or
  `c(height, width, 4)` (RGBA) shown as an image. Raw vectors and
  integer arrays with values 0-255 are treated as 8-bit images; numeric
  images are scaled according to their range (e.g. 0-1 for
  [`png::readPNG()`](https://rdrr.io/pkg/png/man/readPNG.html) output).
  With `facet_col`, `facet_row` or `animation_frame`, one more dimension
  per argument.

- zmin, zmax:

  Minimum and maximum of the color range (per channel for RGB(A) images:
  a single value, or 1, 3 or 4 values).

- origin:

  `"upper"` (default, row 1 at the top) or `"lower"`.

- labels:

  Named list overriding the labels of `x`, `y`, `color`, `facet_col`,
  `facet_row` and `animation_frame`.

- x, y:

  Coordinates of the columns and rows (numeric for RGB images).

- animation_frame, facet_col, facet_row:

  Dimension of `img` (a number, or a name in `names(dimnames(img))`) to
  split into animation frames, facet columns or facet rows.

- facet_col_wrap:

  Maximum number of facet columns.

- facet_col_spacing, facet_row_spacing:

  Spacing between facets, as a fraction of the figure.

- color_continuous_scale, color_continuous_midpoint, range_color:

  Color scale settings for single-channel images (see
  [px_args](https://msummersgill.github.io/plotly.R.core/reference/px_args.md)).

- title, template, width, height:

  See
  [px_args](https://msummersgill.github.io/plotly.R.core/reference/px_args.md).

- aspect:

  `"equal"` (default for arrays; square pixels) or `"auto"` (fill the
  figure).

- contrast_rescaling:

  `"minmax"` (scale to the data range; default for single-channel
  images) or `"infer"` (scale to the range implied by the data type).

- binary_string:

  If `TRUE`, RGB(A) images are sent as a compressed PNG (needs the png
  package) instead of an array of values; the default when png is
  installed.

- binary_backend, binary_compression_level:

  Unused; accepted for compatibility with plotly.py.

- binary_format:

  Only `"png"` is supported.

- text_auto:

  If `TRUE` or a d3-format string, show the values as text on heatmaps.

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
px_imshow(matrix(c(1, 20, 30, 20, 1, 60, 30, 60, 1), 3), text_auto = TRUE)

img <- array(c(255, 0, 0, 0, 255, 0, 0, 0, 255, 255, 255, 0), dim = c(2, 2, 3))
px_imshow(img, binary_string = FALSE)

volume <- array(stats::runif(5 * 20 * 20), dim = c(5, 20, 20))
px_imshow(volume, animation_frame = 1)
```
