# ML Regression

This page shows how to use plotly.core charts for displaying various
types of regression models, starting from simple models like Linear
Regression and progressively move towards models like k-Nearest
Neighbors and Support Vector Machines. We highlight various capabilities
of plotly, such as comparative analysis of the same model with different
parameters, and [surface
plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-surface-plots.md)
for 3D data.

We will fit the models with base R’s
[`lm()`](https://rdrr.io/r/stats/lm.html), a short k-Nearest Neighbors
function written in base R, and the
[`e1071`](https://cran.r-project.org/package=e1071) package’s
[`svm()`](https://rdrr.io/pkg/e1071/man/svm.html). The same figures work
with models fitted by any other R modelling framework, such as
[tidymodels](https://www.tidymodels.org/): all they need are the model’s
predictions.

## Basic linear regression plots

In this section, we show you how to apply a simple regression model for
predicting tips a server will receive based on various client attributes
(such as sex, time of the week, and whether they are a smoker).

We will be using Linear Regression, which is a simple model that fits an
intercept (the mean tip received by a server), and adds a slope for each
feature we use, such as the value of the total bill.

### Linear Regression with R

``` r

library(reshape2) # to load tips data
library(plotly.core)
data(tips)

X <- tips$total_bill

lm_model <- lm(tip ~ total_bill, data = tips)

xy <- data.frame(total_bill = seq(min(X), max(X), length.out = 100))
xy$tip <- predict(lm_model, xy)

go_figure() |>
  add_scatter(
    data = tips,
    x = ~total_bill,
    y = ~tip,
    mode = "markers",
    marker = go_scatter_marker(opacity = 0.65),
    name = "Tips"
  ) |>
  add_scatter(
    data = xy,
    x = ~total_bill,
    y = ~tip,
    mode = "lines",
    name = "Regression Fit"
  )
```

## Model generalization on unseen data

With one
[`add_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md)
trace per data split, you can easily color your plot based on a
predefined data split. By coloring the training and the testing data
points with different colors, you can easily see if the model
generalizes well to the test data or not.

``` r

library(reshape2)
library(plotly.core)
data(tips)

X <- tips$total_bill

set.seed(123)
train_rows <- sample(nrow(tips), round(0.75 * nrow(tips)))
tips_training <- tips[train_rows, ]
tips_test <- tips[-train_rows, ]

lm_model <- lm(tip ~ total_bill, data = tips_training)

xy <- data.frame(total_bill = seq(min(X), max(X), length.out = 100))
xy$tip <- predict(lm_model, xy)

go_figure() |>
  add_scatter(
    data = tips_training,
    x = ~total_bill,
    y = ~tip,
    mode = "markers",
    marker = go_scatter_marker(opacity = 0.65),
    name = "train"
  ) |>
  add_scatter(
    data = tips_test,
    x = ~total_bill,
    y = ~tip,
    mode = "markers",
    marker = go_scatter_marker(opacity = 0.65),
    name = "test"
  ) |>
  add_scatter(
    data = xy,
    x = ~total_bill,
    y = ~tip,
    mode = "lines",
    name = "prediction"
  )
```

## Comparing different kNN models parameters

In addition to linear regression, it’s possible to fit the same data
using k-Nearest Neighbors. When you perform a prediction on a new
sample, this model either takes the weighted or un-weighted average of
the neighbors. In order to see the difference between those two
averaging options, we train a kNN model with both of those parameters,
and we plot them in the same way as the previous graph.

Notice how we can combine scatter points with lines using Plotly. You
can learn more about [multiple chart
types](https://msummersgill.github.io/plotly.R.core/articles/r-docs/graphing-multiple-chart-types.md).

``` r

library(reshape2)
library(plotly.core)
data(tips)

X <- tips$total_bill

# k-nearest-neighbors regression on one feature: the (optionally
# inverse-distance weighted) mean of the k nearest training responses
knn_predict <- function(x_train, y_train, x_new, k = 10, weighted = FALSE) {
  vapply(x_new, function(x0) {
    d <- abs(x_train - x0)
    idx <- order(d)[seq_len(k)]
    w <- if (weighted) 1 / pmax(d[idx], 1e-8) else rep(1, k)
    sum(w * y_train[idx]) / sum(w)
  }, numeric(1))
}

xy <- data.frame(total_bill = seq(min(X), max(X), length.out = 100))
# Model #1
xy$dist <- knn_predict(tips$total_bill, tips$tip, xy$total_bill, weighted = TRUE)
# Model #2
xy$uni <- knn_predict(tips$total_bill, tips$tip, xy$total_bill, weighted = FALSE)

sex_colors <- c(Female = "#FF7F50", Male = "#6495ED")

tips |>
  go_figure() |>
  add_scatter(
    x = ~total_bill,
    y = ~tip,
    mode = "markers",
    marker = go_scatter_marker(
      color = ~sex_colors[as.character(sex)],
      opacity = 0.65
    ),
    split = ~sex
  ) |>
  add_scatter(
    data = xy,
    x = ~total_bill,
    y = ~dist,
    name = "Weights: Distance",
    mode = "lines"
  ) |>
  add_scatter(
    data = xy,
    x = ~total_bill,
    y = ~uni,
    name = "Weights: Uniform",
    mode = "lines"
  )
```

## 3D regression surface with `add_surface()`

Visualize the decision plane of your model whenever you have more than
one variable in your input data. Here, we will use a support vector
machine with a radial basis function kernel
([`e1071::svm()`](https://cran.r-project.org/package=e1071)) in
regression mode. For generating the 2D mesh on the surface, we use the
[`pracma`](https://cran.r-project.org/web/packages/pracma/index.html)
package.

``` r

library(plotly.core)
library(e1071)
library(pracma) # For meshgrid()
data(iris)

mesh_size <- .02
margin <- 0
X <- iris[, c("Sepal.Width", "Sepal.Length")]

model <- svm(
  Petal.Width ~ Sepal.Width + Sepal.Length,
  data = iris,
  type = "eps-regression",
  kernel = "radial",
  cost = 1.0
)

x_min <- min(X$Sepal.Width) - margin
x_max <- max(X$Sepal.Width) - margin
y_min <- min(X$Sepal.Length) - margin
y_max <- max(X$Sepal.Length) - margin
xrange <- seq(x_min, x_max, mesh_size)
yrange <- seq(y_min, y_max, mesh_size)
xy <- meshgrid(x = xrange, y = yrange)
xx <- xy$X
yy <- xy$Y
dim_val <- dim(xx)
final <- data.frame(Sepal.Width = c(xx), Sepal.Length = c(yy))
pred <- predict(model, final)
pred <- matrix(pred, dim_val[1], dim_val[2])

iris |>
  go_figure() |>
  add_scatter3d(
    x = ~Sepal.Width,
    y = ~Sepal.Length,
    z = ~Petal.Width,
    mode = "markers",
    marker = go_scatter3d_marker(size = 5)
  ) |>
  add_surface(
    x = xrange,
    y = yrange,
    z = pred,
    opacity = 0.65,
    name = "pred_surface"
  )
```
