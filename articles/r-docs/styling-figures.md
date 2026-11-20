# Styling Plotly Figures in R

### Styling Figures made with Plotly

Plotly’s R graphing library makes it easy to create interactive,
publication-quality graphs.

More specifically, here are the 2 ways you can style and customize
figures made with plotly.core:

1.  Control common parameters like titles, labeling and colors with the
    arguments of the `add_<trace>()` functions
2.  Updating the figure’s layout with
    [`update_layout()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md),
    [`update_xaxes()`](https://msummersgill.github.io/plotly.R.core/reference/update_xaxes.md),
    [`update_yaxes()`](https://msummersgill.github.io/plotly.R.core/reference/update_yaxes.md)
    and friends

### Built-in Plotly Styling Arguments

Many common styling options can be set directly when adding traces and
updating the layout:

- `title` (in
  [`update_layout()`](https://msummersgill.github.io/plotly.R.core/reference/update_layout.md))
  to set the figure title
- `name` to set the legend entry of each trace, and `title` in
  [`go_xaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis.md),
  [`go_yaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_yaxis.md)
  and
  [`go_legend()`](https://msummersgill.github.io/plotly.R.core/reference/go_legend.md)
  to set axis and legend titles. plotly.core doesn’t label axes
  automatically.
- `categoryorder` and `categoryarray` in
  [`go_xaxis()`](https://msummersgill.github.io/plotly.R.core/reference/go_xaxis.md)
  to override the default category ordering behaviour, which is to use
  the order in which the data appears in the input.
- `hovertemplate`, `hoverinfo` and the axes’ `hoverformat` to control
  which attributes appear in the hover label and how they are formatted.
- Various color-related attributes such as
  `marker = go_bar_marker(color = ...)`, `colorscale`, `colorbar` and
  the layout `colorway` set the colors used in the figure.

To illustrate each of these, here is a simple, default figure made with
Plotly, with one bar trace per payer gender. Note the default orderings
for the x-axis categories.

``` r

library(reshape2)
library(plotly.core)

data("tips")

fig1 <- go_figure()
for (g in levels(tips$sex)) {
  fig1 <- fig1 |>
    add_bar(data = tips[tips$sex == g, ], x = ~day, y = ~total_bill, name = g)
}
fig1 <- fig1 |>
  update_layout(barmode = "stack")

fig1
```

Here is the same figure, restyled by adding some extra parameters:

``` r

library(reshape2)
library(plotly.core)

data("tips")

sex_colors <- c(Female = "#3399FF", Male = "#FF6666")

xform <- go_xaxis(
  title = "Day of Week",
  categoryorder = "array",
  categoryarray = c("Thur", "Fri", "Sat", "Sun")
)

fig2 <- go_figure()
for (g in levels(tips$sex)) {
  fig2 <- fig2 |>
    add_bar(
      data = tips[tips$sex == g, ],
      x = ~day,
      y = ~total_bill,
      name = g,
      marker = go_bar_marker(color = sex_colors[[g]])
    )
}
fig2 <- fig2 |>
  update_layout(
    barmode = "stack",
    xaxis = xform,
    yaxis = go_yaxis(title = "Sum of Receipts"),
    title = "Receipts by Payer Gender and Day of Week",
    legend = go_legend(title = go_legend_title(text = "<b> Payer Gender </b>"))
  )

fig2
```

### Updating or Modifying Figures made with Plotly

Here is the same figure as above, with some additional customizations to
the axes and legend.

``` r

library(reshape2)
library(plotly.core)

data("tips")

sex_colors <- c(Female = "#3399FF", Male = "#FF6666")

xform <- go_xaxis(
  title = "Day of Week",
  categoryorder = "array",
  categoryarray = c("Thur", "Fri", "Sat", "Sun")
)

fig <- go_figure()
for (g in levels(tips$sex)) {
  fig <- fig |>
    add_bar(
      data = tips[tips$sex == g, ],
      x = ~day,
      y = ~total_bill,
      name = g,
      marker = go_bar_marker(color = sex_colors[[g]])
    )
}
# the y-axis prefix given as dollars
fig <- fig |>
  update_layout(
    barmode = "stack",
    xaxis = xform,
    yaxis = go_yaxis(title = "Sum of Receipts", tickprefix = "$"),
    title = "Receipts by Payer Gender and Day of Week"
  )
# customize legend orientation & position
fig <- fig |>
  update_layout(legend = go_legend(x = 0.2, y = 1, orientation = "h"))
# add a horizontal "target" line
fig <- fig |>
  add_shape(
    type = "line",
    xref = "paper",
    x0 = 0,
    x1 = 1,
    y0 = 950,
    y1 = 950,
    line = go_shape_line(dash = "dash", color = "black")
  )
# add a text callout with arrow
fig <- fig |>
  add_annotation(
    x = "Fri",
    y = 400,
    text = "Below Target !",
    showarrow = TRUE,
    arrowhead = 1,
    ax = 20,
    ay = -40
  )
# customize font
fig <- fig |>
  update_layout(font = go_font(family = "Rockwell"))

fig
```
