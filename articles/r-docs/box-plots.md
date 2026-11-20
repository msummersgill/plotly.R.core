# Box Plots

### Basic Boxplot

``` r

library(plotly.core)

go_figure() |>
  add_box(y = rnorm(50)) |>
  add_box(y = rnorm(50, 1))
```

### Choosing The Algorithm For Computing Quartiles

By default, quartiles for box plots are computed using the **linear**
method (for more about linear interpolation, see \#10 listed on
[http://www.amstat.org/publications/jse/v14n3/langford.html](http://www.amstat.org/publications/jse/v14n3/langford.md)
and <https://en.wikipedia.org/wiki/Quartile> for more details).

However, you can also choose to use an exclusive or an inclusive
algorithm to compute quartiles.

The **exclusive** algorithm uses the median to divide the ordered
dataset into two halves. If the sample is odd, it does not include the
median in either half. Q1 is then the median of the lower half and Q3 is
the median of the upper half.

The **inclusive** algorithm also uses the median to divide the ordered
dataset into two halves, but if the sample is odd, it includes the
median in both halves. Q1 is then the median of the lower half and Q3
the median of the upper half.

``` r

library(plotly.core)

# or "inclusive", or "linear" by default
go_figure() |>
  add_box(y = c(1, 2, 3, 4, 5), quartilemethod = "exclusive")
```

### Modifying The Algorithm For Computing Quartiles

For an explanation of how each algorithm works, see [Choosing The
Algorithm For Computing
Quartiles](#choosing-the-algorithm-for-computing-quartiles)

``` r

library(plotly.core)

go_figure() |>
  add_box(
    y = c(1, 2, 3, 4, 5),
    quartilemethod = "linear",
    name = "Linear Quartile Mode"
  ) |>
  add_box(
    y = c(1, 2, 3, 4, 5),
    quartilemethod = "inclusive",
    name = "Inclusive Quartile Mode"
  ) |>
  add_box(
    y = c(1, 2, 3, 4, 5),
    quartilemethod = "exclusive",
    name = "Exclusive Quartile Mode"
  ) |>
  update_layout(title = "Modifying The Algorithm For Computing Quartiles")
```

### Box Plot With Precomputed Quartiles

You can specify precomputed quartile attributes rather than using a
built-in quartile computation algorithm.

This could be useful if you have already pre-computed those values or if
you need to use a different algorithm than the ones provided.

``` r

library(plotly.core)

go_figure() |>
  add_box(
    y = c(1, 2, 3, 4, 5, 6, 7, 8, 9),
    q1 = c(1, 2, 3),
    median = c(4, 5, 6),
    q3 = c(7, 8, 9),
    lowerfence = c(-1, 0, 1),
    upperfence = c(5, 6, 7),
    mean = c(2.2, 2.8, 3.2),
    sd = c(0.2, 0.4, 0.6),
    notchspan = c(0.2, 0.4, 0.6)
  )
```

### Horizontal Boxplot

``` r

library(plotly.core)

go_figure() |>
  add_box(x = rnorm(50)) |>
  add_box(x = rnorm(50, 1))
```

### Adding Jittered Points

``` r

go_figure() |>
  add_box(y = rnorm(50), boxpoints = "all", jitter = 0.3, pointpos = -1.8)
```

### Several Box Plots

``` r

diamonds <- ggplot2::diamonds

diamonds |>
  go_figure() |>
  add_box(y = ~price, split = ~cut)
```

### Grouped Box Plots

``` r

diamonds <- ggplot2::diamonds

diamonds |>
  go_figure() |>
  add_box(x = ~cut, y = ~price, split = ~clarity) |>
  update_layout(boxmode = "group")
```

### Styling Outliers

``` r

library(plotly.core)

y1 <- c(0.75, 5.25, 5.5, 6, 6.2, 6.6, 6.80, 7.0, 7.2, 7.5, 7.5, 7.75, 8.15,
       8.15, 8.65, 8.93, 9.2, 9.5, 10, 10.25, 11.5, 12, 16, 20.90, 22.3, 23.25)
y2 <- c(0.75, 5.25, 5.5, 6, 6.2, 6.6, 6.80, 7.0, 7.2, 7.5, 7.5, 7.75, 8.15,
        8.15, 8.65, 8.93, 9.2, 9.5, 10, 10.25, 11.5, 12, 16, 20.90, 22.3, 23.25)
y3 <- c(0.75, 5.25, 5.5, 6, 6.2, 6.6, 6.80, 7.0, 7.2, 7.5, 7.5, 7.75, 8.15,
        8.15, 8.65, 8.93, 9.2, 9.5, 10, 10.25, 11.5, 12, 16, 20.90, 22.3, 23.25)
y4 <- c(0.75, 5.25, 5.5, 6, 6.2, 6.6, 6.80, 7.0, 7.2, 7.5, 7.5, 7.75, 8.15,
        8.15, 8.65, 8.93, 9.2, 9.5, 10, 10.25, 11.5, 12, 16, 20.90, 22.3, 23.25)

go_figure() |>
  add_box(
    y = y1,
    jitter = 0.3,
    pointpos = -1.8,
    boxpoints = "all",
    marker = go_box_marker(color = "rgb(7,40,89)"),
    line = go_box_line(color = "rgb(7,40,89)"),
    name = "All Points"
  ) |>
  add_box(
    y = y2,
    name = "Only Whiskers",
    boxpoints = FALSE,
    marker = go_box_marker(color = "rgb(9,56,125)"),
    line = go_box_line(color = "rgb(9,56,125)")
  ) |>
  add_box(
    y = y3,
    name = "Suspected Outlier",
    boxpoints = "suspectedoutliers",
    marker = go_box_marker(
      color = "rgb(8,81,156)",
      outliercolor = "rgba(219, 64, 82, 0.6)",
      line = go_box_marker_line(
        outliercolor = "rgba(219, 64, 82, 1.0)",
        outlierwidth = 2
      )
    ),
    line = go_box_line(color = "rgb(8,81,156)")
  ) |>
  add_box(
    y = y4,
    name = "Whiskers and Outliers",
    boxpoints = "outliers",
    marker = go_box_marker(color = "rgb(107,174,214)"),
    line = go_box_line(color = "rgb(107,174,214)")
  ) |>
  update_layout(title = "Box Plot Styling Outliers")
```

### Reference

See
[`go_box()`](https://msummersgill.github.io/plotly.R.core/reference/go_box.md)
for more information and chart attribute options!
