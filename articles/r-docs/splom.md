# Splom

#### Splom trace

A scaterplot matrix is a matrix associated to n numerical arrays (data
variables), $`X^1,X^2,.,X_n`$ , of the same length. The cell (i,j) of
such a matrix displays the scatter plot of the variable Xi versus Xj ,

The Plotly splom trace implementation for the scaterplot matrix does not
require to set $`x=Xi`$ , and $`y=Xj`$, for each scatter plot. All
arrays, $`X^1,X^2,.,X_n`$ , are passed once, through a list of
[`go_splom_dimension()`](https://msummersgill.github.io/plotly.R.core/reference/go_splom_dimension.md)
objects called dimensions, i.e. each array/variable represents a
dimension.

A trace of type splom is defined as follows:

``` r
fig <- go_figure() |>
  add_splom(
    dimensions = list(
      go_splom_dimension(label = "string-1", values = X1),
      go_splom_dimension(label = "string-2", values = X2),
      .
      .
      .
      go_splom_dimension(label = "string-n", values = Xn)
    ),
    text = text,
    marker = go_splom_marker(...)
  )
```

The label in each dimension is assigned to the axes titles of the
corresponding matrix cell.

text is either a unique string assigned to all points displayed by splom
or a list of strings of the same length as the dimensions, $`X_i`$. The
`text[k]` is the tooltip for the $`k^{th}`$ point in each cell.

marker sets the markers attributes in all scatter plots.

#### Splom of the Iris data set

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/iris-data.csv")
```

The Iris dataset contains four data variables, sepal length, sepal
width, petal length petal width, for 150 iris flowers. The flowers are
labeled as `Iris-setosa`, `Iris-versicolor`, `Iris-virginica`.

Define a discrete colorscale with three colors corresponding to the
three flower classes:

``` r

pl_colorscale <- list(
  c(0.0, "#19d3f3"),
  c(0.333, "#19d3f3"),
  c(0.333, "#e763fa"),
  c(0.666, "#e763fa"),
  c(0.666, "#636efa"),
  c(1, "#636efa")
)
```

Then create the splom:

``` r

xaxis_style <- go_xaxis(
  showline = FALSE,
  zeroline = FALSE,
  gridcolor = "#ffff",
  ticklen = 4
)
yaxis_style <- go_yaxis(
  showline = FALSE,
  zeroline = FALSE,
  gridcolor = "#ffff",
  ticklen = 4
)

dims <- list(
  go_splom_dimension(label = "sepal length", values = ~sepal.length),
  go_splom_dimension(label = "sepal width", values = ~sepal.width),
  go_splom_dimension(label = "petal length", values = ~petal.length),
  go_splom_dimension(label = "petal width", values = ~petal.width)
)

fig <- df |>
  go_figure() |>
  add_splom(
    dimensions = dims,
    text = ~class,
    marker = go_splom_marker(
      color = as.integer(factor(df$class)),
      colorscale = pl_colorscale,
      size = 7,
      line = go_splom_marker_line(
        width = 1,
        color = "rgb(230,230,230)"
      )
    )
  ) |>
  update_layout(
    title = "Iris Data set",
    hovermode = "closest",
    dragmode = "select",
    plot_bgcolor = "rgba(240,240,240, 0.95)",
    xaxis = xaxis_style,
    yaxis = yaxis_style,
    xaxis2 = xaxis_style,
    xaxis3 = xaxis_style,
    xaxis4 = xaxis_style,
    yaxis2 = yaxis_style,
    yaxis3 = yaxis_style,
    yaxis4 = yaxis_style
  )

fig
```

The scatter plots on the principal diagonal can be removed by setting
`diagonal = go_splom_diagonal(visible = FALSE)`:

``` r

library(plotly.core)

fig2 <- fig |>
  update_traces(diagonal = go_splom_diagonal(visible = FALSE))

fig2
```

To plot only the lower/upper half of the splom we switch the default
`showlowerhalf = TRUE` / `showupperhalf = FALSE`:

``` r

library(plotly.core)

fig2 <- fig |>
  update_traces(showupperhalf = FALSE)

fig2
```

Each dimension has a property, `visible`, set by default to `TRUE`. We
can choose to remove a variable from splom, by setting `visible = FALSE`
in its corresponding dimension. In this case the default grid associated
to the scatterplot matrix keeps its number of cells, but the cells in
the row and column corresponding to the visible false dimension are
empty:

``` r

library(plotly.core)

dims[[3]] <- go_splom_dimension(
  label = "petal length",
  values = ~petal.length,
  visible = FALSE
)
fig2 <- fig |>
  update_traces(dimensions = dims)

fig2
```

#### Splom for the diabetes dataset

Diabetes dataset is downloaded from
[kaggle](https://www.kaggle.com/uciml/pima-indians-diabetes-database/data).
It is used to predict the onset of diabetes based on 8 diagnostic
measures. The diabetes file contains the diagnostic measures for 768
patients, that are labeled as non-diabetic (Outcome=0), respectively
diabetic (Outcome=1). The splom associated to the 8 variables can
illustrate the strength of the relationship between pairs of measures
for diabetic/nondiabetic patients.

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/diabetes.csv")
```

We define a discrete colorscale with two colors: blue for non-diabetics
and red for diabetics:

``` r

pl_colorscale <- list(
  c(0.0, "#119dff"),
  c(0.5, "#119dff"),
  c(0.5, "#ef553b"),
  c(1, "#ef553b")
)
```

Then create the splom:

``` r

xaxis_style <- go_xaxis(
  showline = FALSE,
  zeroline = FALSE,
  gridcolor = "#ffff",
  ticklen = 4,
  title = go_xaxis_title(font = go_font(size = 13))
)
yaxis_style <- go_yaxis(
  showline = FALSE,
  zeroline = FALSE,
  gridcolor = "#ffff",
  ticklen = 4,
  title = go_yaxis_title(font = go_font(size = 13))
)

df |>
  go_figure() |>
  add_splom(
    dimensions = list(
      go_splom_dimension(label = "Pregnancies", values = ~Pregnancies),
      go_splom_dimension(label = "Glucose", values = ~Glucose),
      go_splom_dimension(label = "BloodPressure", values = ~BloodPressure),
      go_splom_dimension(label = "SkinThickness", values = ~SkinThickness),
      go_splom_dimension(label = "Insulin", values = ~Insulin),
      go_splom_dimension(label = "BMI", values = ~BMI),
      go_splom_dimension(label = "DiabPedigreeFun", values = ~DiabetesPedigreeFunction),
      go_splom_dimension(label = "Age", values = ~Age)
    ),
    text = ~ factor(Outcome, labels = c("non-diabetic", "diabetic")),
    diagonal = go_splom_diagonal(visible = FALSE),
    marker = go_splom_marker(
      color = ~Outcome,
      colorscale = pl_colorscale,
      size = 5,
      line = go_splom_marker_line(
        width = 1,
        color = "rgb(230,230,230)"
      )
    )
  ) |>
  update_layout(
    title = "Scatterplot Matrix (SPLOM) for Diabetes Dataset<br>Data source: <a href='https://www.kaggle.com/uciml/pima-indians-diabetes-database/data'>[1]</a>",
    hovermode = "closest",
    dragmode = "select",
    plot_bgcolor = "rgba(240,240,240, 0.95)",
    xaxis = xaxis_style,
    yaxis = yaxis_style,
    xaxis2 = xaxis_style,
    xaxis3 = xaxis_style,
    xaxis4 = xaxis_style,
    xaxis5 = xaxis_style,
    xaxis6 = xaxis_style,
    xaxis7 = xaxis_style,
    xaxis8 = xaxis_style,
    yaxis2 = yaxis_style,
    yaxis3 = yaxis_style,
    yaxis4 = yaxis_style,
    yaxis5 = yaxis_style,
    yaxis6 = yaxis_style,
    yaxis7 = yaxis_style,
    yaxis8 = yaxis_style
  )
```

### Reference

See
[`go_splom()`](https://msummersgill.github.io/plotly.R.core/reference/go_splom.md)
for more information and chart attribute options!
