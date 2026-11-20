# Bar Charts

### Basic Bar Chart

``` r

library(plotly.core)

go_figure() |>
  add_bar(
    x = c("giraffes", "orangutans", "monkeys"),
    y = c(20, 14, 23),
    name = "SF Zoo"
  )
```

### Grouped Bar Chart

``` r

library(plotly.core)

Animals <- c("giraffes", "orangutans", "monkeys")
SF_Zoo <- c(20, 14, 23)
LA_Zoo <- c(12, 18, 29)
data <- data.frame(Animals, SF_Zoo, LA_Zoo)

data |>
  go_figure() |>
  add_bar(x = ~Animals, y = ~SF_Zoo, name = "SF Zoo") |>
  add_bar(x = ~Animals, y = ~LA_Zoo, name = "LA Zoo") |>
  update_layout(yaxis = go_yaxis(title = "Count"), barmode = "group")
```

### Stacked Bar Chart

``` r

library(plotly.core)

Animals <- c("giraffes", "orangutans", "monkeys")
SF_Zoo <- c(20, 14, 23)
LA_Zoo <- c(12, 18, 29)
data <- data.frame(Animals, SF_Zoo, LA_Zoo)

data |>
  go_figure() |>
  add_bar(x = ~Animals, y = ~SF_Zoo, name = "SF Zoo") |>
  add_bar(x = ~Animals, y = ~LA_Zoo, name = "LA Zoo") |>
  update_layout(yaxis = go_yaxis(title = "Count"), barmode = "stack")
```

### Bar Chart with Hover Text

``` r

library(plotly.core)

x <- c("Product A", "Product B", "Product C")
y <- c(20, 14, 23)
text <- c("27% market share", "24% market share", "19% market share")
data <- data.frame(x, y, text)

data |>
  go_figure() |>
  add_bar(
    x = ~x,
    y = ~y,
    text = ~text,
    marker = go_bar_marker(
      color = "rgb(158,202,225)",
      line = go_bar_marker_line(color = "rgb(8,48,107)", width = 1.5)
    )
  ) |>
  update_layout(
    title = "January 2013 Sales Report",
    xaxis = go_xaxis(title = ""),
    yaxis = go_yaxis(title = "")
  )
```

### Bar Chart with Direct Labels

``` r

library(plotly.core)

x <- c("Product A", "Product B", "Product C")
y <- c(20, 14, 23)
data <- data.frame(x, y)

data |>
  go_figure() |>
  add_bar(
    x = ~x,
    y = ~y,
    text = ~y,
    textposition = "auto",
    marker = go_bar_marker(
      color = "rgb(158,202,225)",
      line = go_bar_marker_line(color = "rgb(8,48,107)", width = 1.5)
    )
  ) |>
  update_layout(
    title = "January 2013 Sales Report",
    xaxis = go_xaxis(title = ""),
    yaxis = go_yaxis(title = "")
  )
```

### Grouped Bar Chart with Direct Labels

``` r

library(plotly.core)

x <- c("Product A", "Product B", "Product C")
y <- c(20, 14, 23)
y2 <- c(16, 12, 27)
data <- data.frame(x, y, y2)

data |>
  go_figure() |>
  add_bar(
    x = ~x,
    y = ~y,
    text = ~y,
    textposition = "auto",
    marker = go_bar_marker(
      color = "rgb(158,202,225)",
      line = go_bar_marker_line(color = "rgb(8,48,107)", width = 1.5)
    )
  ) |>
  add_bar(
    x = ~x,
    y = ~y2,
    text = ~y2,
    textposition = "auto",
    marker = go_bar_marker(
      color = "rgb(58,200,225)",
      line = go_bar_marker_line(color = "rgb(8,48,107)", width = 1.5)
    )
  ) |>
  update_layout(
    title = "January 2013 Sales Report",
    barmode = "group",
    xaxis = go_xaxis(title = ""),
    yaxis = go_yaxis(title = "")
  )
```

### Rotated Bar Chart Labels

``` r

library(plotly.core)

x <- c("January", "February", "March", "April", "May", "June", "July",
       "August", "September", "October", "November", "December")
y1 <- c(20, 14, 25, 16, 18, 22, 19, 15, 12, 16, 14, 17)
y2 <- c(19, 14, 22, 14, 16, 19, 15, 14, 10, 12, 12, 16)
data <- data.frame(x, y1, y2)

data |>
  go_figure() |>
  add_bar(
    x = ~x,
    y = ~y1,
    name = "Primary Product",
    marker = go_bar_marker(color = "rgb(49,130,189)")
  ) |>
  add_bar(
    x = ~x,
    y = ~y2,
    name = "Secondary Product",
    marker = go_bar_marker(color = "rgb(204,204,204)")
  ) |>
  update_layout(
    xaxis = go_xaxis(title = "", tickangle = -45),
    yaxis = go_yaxis(title = ""),
    margin = go_margin(b = 100),
    barmode = "group"
  )
```

Categories are drawn in the order they first appear in the data, so the
months keep their calendar order.

### Customizing Bar Color

``` r

library(plotly.core)

x <- c("Feature A", "Feature B", "Feature C", "Feature D", "Feature E")
y <- c(20, 14, 23, 25, 22)
data <- data.frame(x, y)

data |>
  go_figure() |>
  add_bar(x = ~x, y = ~y, marker = go_bar_marker(color = "black")) |>
  update_layout(
    title = "Features",
    xaxis = go_xaxis(title = ""),
    yaxis = go_yaxis(title = "")
  )
```

### Customizing Individual Bar Colors

``` r

library(plotly.core)

x <- c("Feature A", "Feature B", "Feature C", "Feature D", "Feature E")
y <- c(20, 14, 23, 25, 22)
data <- data.frame(x, y)

data |>
  go_figure() |>
  add_bar(
    x = ~x,
    y = ~y,
    marker = go_bar_marker(
      color = c("rgba(204,204,204,1)", "rgba(222,45,38,0.8)",
                "rgba(204,204,204,1)", "rgba(204,204,204,1)",
                "rgba(204,204,204,1)")
    )
  ) |>
  update_layout(
    title = "Least Used Features",
    xaxis = go_xaxis(title = ""),
    yaxis = go_yaxis(title = "")
  )
```

### Customizing Individual Bar Widths

``` r

library(plotly.core)

x <- c(1, 2, 3, 5.5, 10)
y <- c(10, 8, 6, 4, 2)
width <- c(0.8, 0.8, 0.8, 3.5, 4)
data <- data.frame(x, y, width)

data |>
  go_figure() |>
  add_bar(x = ~x, y = ~y, width = ~width)
```

### Customizing Individual Bar Base

``` r

library(plotly.core)

go_figure() |>
  add_bar(
    x = c("2016", "2017", "2018"),
    y = c(500, 600, 700),
    base = c(-500, -600, -700),
    marker = go_bar_marker(color = "red"),
    name = "expenses"
  ) |>
  add_bar(
    x = c("2016", "2017", "2018"),
    y = c(300, 400, 700),
    base = 0,
    marker = go_bar_marker(color = "blue"),
    name = "revenue"
  )
```

### Mapping a Color Variable

`split = ~clarity` adds one trace per level, so each group gets its own
color and legend entry.

``` r

library(plotly.core)
library(dplyr)

count(ggplot2::diamonds, cut, clarity) |>
  go_figure() |>
  add_bar(x = ~cut, y = ~n, split = ~clarity)
```

### Colored and Styled Bar Chart

``` r

library(plotly.core)

x <- c(1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005,
       2006, 2007, 2008, 2009, 2010, 2011, 2012)
roW <- c(219, 146, 112, 127, 124, 180, 236, 207, 236, 263, 350, 430, 474,
         526, 488, 537, 500, 439)
China <- c(16, 13, 10, 11, 28, 37, 43, 55, 56, 88, 105, 156, 270, 299, 340,
           403, 549, 499)
data <- data.frame(x, roW, China)

grey <- "rgb(107, 107, 107)"

data |>
  go_figure() |>
  add_bar(
    x = ~x,
    y = ~roW,
    name = "Rest of the World",
    marker = go_bar_marker(color = "rgb(55, 83, 109)")
  ) |>
  add_bar(
    x = ~x,
    y = ~China,
    name = "China",
    marker = go_bar_marker(color = "rgb(26, 118, 255)")
  ) |>
  update_layout(
    title = "US Export of Plastic Scrap",
    xaxis = go_xaxis(title = "", tickfont = go_font(size = 14, color = grey)),
    yaxis = go_yaxis(
      title = go_yaxis_title(
        text = "USD (millions)",
        font = go_font(size = 16, color = grey)
      ),
      tickfont = go_font(size = 14, color = grey)
    ),
    legend = go_legend(
      x = 0,
      y = 1,
      bgcolor = "rgba(255, 255, 255, 0)",
      bordercolor = "rgba(255, 255, 255, 0)"
    ),
    barmode = "group",
    bargap = 0.15,
    bargroupgap = 0.1
  )
```

### Waterfall Bar Chart

``` r

library(plotly.core)

x <- c("Product<br>Revenue", "Services<br>Revenue", "Total<br>Revenue",
       "Fixed<br>Costs", "Variable<br>Costs", "Total<br>Costs", "Total")
y <- c(400, 660, 660, 590, 400, 400, 340)
base <- c(0, 430, 0, 570, 370, 370, 0)
revenue <- c(430, 260, 690, 0, 0, 0, 0)
costs <- c(0, 0, 0, 120, 200, 320, 0)
profit <- c(0, 0, 0, 0, 0, 0, 370)
text <- c("$430K", "$260K", "$690K", "$-120K", "$-200K", "$-320K", "$370K")
data <- data.frame(x, base, revenue, costs, profit, text)

bar_marker <- function(color, line) {
  go_bar_marker(color = color, line = go_bar_marker_line(color = line, width = 2))
}

fig <- data |>
  go_figure() |>
  add_bar(x = ~x, y = ~base, marker = go_bar_marker(color = "rgba(1,1,1, 0.0)")) |>
  add_bar(
    x = ~x,
    y = ~revenue,
    marker = bar_marker("rgba(55, 128, 191, 0.7)", "rgba(55, 128, 191, 0.7)")
  ) |>
  add_bar(
    x = ~x,
    y = ~costs,
    marker = bar_marker("rgba(219, 64, 82, 0.7)", "rgba(219, 64, 82, 1.0)")
  ) |>
  add_bar(
    x = ~x,
    y = ~profit,
    marker = bar_marker("rgba(50, 171, 96, 0.7)", "rgba(50, 171, 96, 1.0)")
  ) |>
  update_layout(
    title = "Annual Profit - 2015",
    xaxis = go_xaxis(title = ""),
    yaxis = go_yaxis(title = ""),
    barmode = "stack",
    paper_bgcolor = "rgba(245, 246, 249, 1)",
    plot_bgcolor = "rgba(245, 246, 249, 1)",
    showlegend = FALSE
  )

# one annotation per bar
fig |>
  add_annotation(
    text = text,
    x = x,
    y = y,
    xref = "x",
    yref = "y",
    font = go_font(family = "Arial", size = 14, color = "rgba(245, 246, 249, 1)"),
    showarrow = FALSE
  )
```

### Horizontal Bar Chart

See examples of horizontal bar charts
[here](https://msummersgill.github.io/plotly.R.core/articles/r-docs/horizontal-bar-charts.md).

### Reference

See
[`go_bar()`](https://msummersgill.github.io/plotly.R.core/reference/go_bar.md)
for more information and chart attribute options.
