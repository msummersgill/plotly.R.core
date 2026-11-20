# kNN Classification

## kNN Classification in R

Visualize k-Nearest Neighbors (kNN) classification in R with Plotly.

## Basic binary classification with kNN

This section gets us started with displaying basic binary classification
using 2D data. We first show how to display training versus testing data
using [various marker
styles](https://msummersgill.github.io/plotly.R.core/articles/r-docs/marker-style.md),
then demonstrate how to evaluate our classifier’s performance on the
**test split** using a continuous color gradient to indicate the model’s
predicted score.

We will use the [`knn()`](https://rdrr.io/pkg/class/man/knn.html)
function of the [class](https://cran.r-project.org/package=class)
package, which ships with R, to classify our data.

We will train a k-Nearest Neighbors (kNN) classifier. First, the model
records the label of each training sample. Then, whenever we give it a
new sample, it will look at the `k` closest samples from the training
set to find the most common label, and assign it to our new sample. With
`prob = TRUE`, [`knn()`](https://rdrr.io/pkg/class/man/knn.html) also
returns the proportion of the `k` neighbours that voted for that label,
which we use as the model’s score.

### Display training and test splits

We first load synthetic data that form the shape of a moon. We then
split it into a training and testing set. Finally, we display the ground
truth labels using [a scatter
plot](https://msummersgill.github.io/plotly.R.core/articles/r-docs/line-and-scatter.md).

In the graph, we display all the negative labels as squares, and
positive labels as circles. We differentiate the training and test set
by adding a dot to the center of test data.

``` r

library(plotly.core)

make_moons <- read.csv(file = "data/make_moons.csv")
make_moons$y <- as.character(make_moons$y)
set.seed(123)
train_index <- sample(nrow(make_moons), 3/4 * nrow(make_moons))
make_moons$split <- "Test Split Label"
make_moons$split[train_index] <- "Train Split Label"
make_moons$label <- paste(make_moons$split, make_moons$y)

symbols <- c(
  "Train Split Label 0" = "square",
  "Train Split Label 1" = "circle",
  "Test Split Label 0" = "square-dot",
  "Test Split Label 1" = "circle-dot"
)

fig <- go_figure()
for (lab in names(symbols)) {
  fig <- fig |>
    add_scatter(
      data = make_moons[make_moons$label == lab, ],
      x = ~X1,
      y = ~X2,
      mode = "markers",
      name = lab,
      opacity = 0.5,
      marker = go_scatter_marker(
        symbol = symbols[[lab]],
        size = 12,
        color = "lightyellow",
        line = go_scatter_marker_line(color = "black", width = 1)
      )
    )
}

fig
```

### Visualize predictions on test split

Now, we train the kNN model on the same training data displayed in the
previous graph. Then, we predict the confidence score of the model for
each of the data points in the test set. We will use shapes to denote
the true labels, and the color will indicate the confidence of the model
for assign that score.

Each label gets its own trace (and symbol), and both traces share the
continuous color scale based on the `yscore` output by our kNN model.

``` r

library(plotly.core)
library(class)

make_moons <- read.csv(file = "data/make_moons.csv")
make_moons$y <- as.character(make_moons$y)
set.seed(123)
train_index <- sample(nrow(make_moons), 3/4 * nrow(make_moons))
make_moons$split <- "Test Split Label"
make_moons$split[train_index] <- "Train Split Label"

# kNN score: the fraction of the k nearest training samples labelled "1"
knn_score <- function(train, test, labels, k = 15) {
  pred <- knn(train, test, labels, k = k, prob = TRUE)
  ifelse(pred == "1", attr(pred, "prob"), 1 - attr(pred, "prob"))
}

train_data <- make_moons[make_moons$split == "Train Split Label", ]
pdb <- make_moons[make_moons$split == "Test Split Label", ]
pdb$yscore <- knn_score(
  train_data[, c("X1", "X2")],
  pdb[, c("X1", "X2")],
  train_data$y,
  k = 15
)

label_symbols <- c("0" = "square-dot", "1" = "circle-dot")

fig <- go_figure()
for (lab in names(label_symbols)) {
  fig <- fig |>
    add_scatter(
      data = pdb[pdb$y == lab, ],
      x = ~X1,
      y = ~X2,
      mode = "markers",
      name = lab,
      marker = go_scatter_marker(
        symbol = label_symbols[[lab]],
        size = 12,
        color = ~yscore,
        colorscale = "RdBu",
        cmin = 0,
        cmax = 1,
        showscale = lab == "1",
        colorbar = go_colorbar(title = "yscore"),
        line = go_scatter_marker_line(color = "black", width = 1)
      )
    )
}

fig
```

## Probability Estimates with `Contour`

Just like the previous example, we will first train our kNN model on the
training set.

Instead of predicting the confidence for the test set, we can predict
the confidence map for the entire area that wraps around the dimensions
of our dataset. To do this, we use
[`meshgrid`](https://www.rdocumentation.org/packages/pracma/versions/1.9.9/topics/meshgrid)
to create a grid, where the distance between each point is denoted by
the `mesh_size` variable.

Then, for each of those points, we will use our model to give a
confidence score, and plot it with a [contour
plot](https://msummersgill.github.io/plotly.R.core/articles/r-docs/contour-plots.md).

``` r

library(plotly.core)
library(pracma)
library(class)

make_moons <- read.csv(file = "data/make_moons.csv")
make_moons$y <- as.character(make_moons$y)
set.seed(123)
train_index <- sample(nrow(make_moons), 3/4 * nrow(make_moons))
make_moons$split <- "Test Split Label"
make_moons$split[train_index] <- "Train Split Label"

# kNN score: the fraction of the k nearest training samples labelled "1"
knn_score <- function(train, test, labels, k = 15) {
  pred <- knn(train, test, labels, k = k, prob = TRUE)
  ifelse(pred == "1", attr(pred, "prob"), 1 - attr(pred, "prob"))
}

mesh_size <- .02
margin <- 0.25
x_min <- min(make_moons$X1) - margin
x_max <- max(make_moons$X1) + margin
y_min <- min(make_moons$X2) - margin
y_max <- max(make_moons$X2) + margin
xrange <- seq(x_min, x_max, mesh_size)
yrange <- seq(y_min, y_max, mesh_size)
xy <- meshgrid(x = xrange, y = yrange)
xx <- xy$X
yy <- xy$Y

# score every point of the grid, using all the data points
final <- data.frame(X1 = as.vector(xx), X2 = as.vector(yy))
predicted <- knn_score(make_moons[, c("X1", "X2")], final, make_moons$y, k = 15)
Z <- matrix(predicted, nrow(xx), ncol(xx))

fig <- go_figure() |>
  add_contour(x = xrange, y = yrange, z = Z, colorscale = "RdBu")

fig
```

Now, let’s try to combine our `Contour` plot with the first scatter plot
of our data points, so that we can visually compare the confidence of
our model with the true labels.

``` r

library(plotly.core)
library(pracma)
library(class)

make_moons <- read.csv(file = "data/make_moons.csv")
make_moons$y <- as.character(make_moons$y)
set.seed(123)
train_index <- sample(nrow(make_moons), 3/4 * nrow(make_moons))
make_moons$split <- "Test Split Label"
make_moons$split[train_index] <- "Train Split Label"
make_moons$label <- paste(make_moons$split, make_moons$y)

# kNN score: the fraction of the k nearest training samples labelled "1"
knn_score <- function(train, test, labels, k = 15) {
  pred <- knn(train, test, labels, k = k, prob = TRUE)
  ifelse(pred == "1", attr(pred, "prob"), 1 - attr(pred, "prob"))
}

mesh_size <- .02
margin <- 0.25
x_min <- min(make_moons$X1) - margin
x_max <- max(make_moons$X1) + margin
y_min <- min(make_moons$X2) - margin
y_max <- max(make_moons$X2) + margin
xrange <- seq(x_min, x_max, mesh_size)
yrange <- seq(y_min, y_max, mesh_size)
xy <- meshgrid(x = xrange, y = yrange)
xx <- xy$X
yy <- xy$Y

# score every point of the grid, using all the data points
final <- data.frame(X1 = as.vector(xx), X2 = as.vector(yy))
predicted <- knn_score(make_moons[, c("X1", "X2")], final, make_moons$y, k = 15)
Z <- matrix(predicted, nrow(xx), ncol(xx))

symbols <- c(
  "Train Split Label 0" = "square",
  "Train Split Label 1" = "circle",
  "Test Split Label 0" = "square-dot",
  "Test Split Label 1" = "circle-dot"
)

fig <- go_figure() |>
  add_contour(x = xrange, y = yrange, z = Z, colorscale = "RdBu", opacity = 0.5)
for (lab in names(symbols)) {
  fig <- fig |>
    add_scatter(
      data = make_moons[make_moons$label == lab, ],
      x = ~X1,
      y = ~X2,
      mode = "markers",
      name = lab,
      marker = go_scatter_marker(
        symbol = symbols[[lab]],
        size = 12,
        color = "lightyellow",
        line = go_scatter_marker_line(color = "black", width = 1)
      )
    )
}

fig
```

## Multi-class prediction confidence with `Heatmap`

It is also possible to visualize the prediction confidence of the model
using
[heatmaps](https://msummersgill.github.io/plotly.R.core/articles/r-docs/heatmaps.md).
In this example, you can see how to compute how confident the model is
about its prediction at every point in the 2D grid. Here, we define the
confidence as the difference between the highest score and the sum of
the score of the other classes, at a certain point. Since the scores add
up to 1, that is `2 * max_score - 1`, where `max_score` is the
proportion of neighbours that voted for the predicted class.

``` r

library(pracma)
library(plotly.core)
library(class)

data(iris) # We will use the iris data, which is included in R by default

mesh_size <- .02
margin <- 1

set.seed(123)
train_index <- sample(nrow(iris), 3/4 * nrow(iris))
train_data <- iris[train_index, ]
test_data <- iris[-train_index, ]

# Create a mesh grid on which we will run our model
l_min <- min(iris$Sepal.Length) - margin
l_max <- max(iris$Sepal.Length) + margin
w_min <- min(iris$Sepal.Width) - margin
w_max <- max(iris$Sepal.Width) + margin
lrange <- seq(l_min, l_max, mesh_size)
wrange <- seq(w_min, w_max, mesh_size)

mg <- meshgrid(lrange, wrange)
ll <- mg$X
ww <- mg$Y

# Run the classifier on the grid
final <- data.frame(Sepal.Length = as.vector(ll), Sepal.Width = as.vector(ww))
pred <- knn(
  train_data[, c("Sepal.Length", "Sepal.Width")],
  final,
  train_data$Species,
  k = 15,
  prob = TRUE
)

# Compute the classifier confidence
max_score <- matrix(attr(pred, "prob"), nrow(ll), ncol(ll))
diff <- 2 * max_score - 1

# Overlay the heatmap of the confidence on the scatter plot of the examples
species_symbols <- c(setosa = "square-dot", versicolor = "circle-dot", virginica = "diamond")

fig <- go_figure()
for (sp in names(species_symbols)) {
  fig <- fig |>
    add_scatter(
      data = test_data[test_data$Species == sp, ],
      x = ~Sepal.Length,
      y = ~Sepal.Width,
      mode = "markers",
      name = sp,
      marker = go_scatter_marker(
        symbol = species_symbols[[sp]],
        size = 12,
        color = "lightyellow",
        line = go_scatter_marker_line(width = 1.5)
      )
    )
}
fig <- fig |>
  add_heatmap(x = lrange, y = wrange, z = diff) |>
  update_layout(title = "Prediction Confidence on Test Split")

fig
```

## Reference

Learn more about `Contour plots`, and `Heatmap` here:

- [Heatmaps](https://msummersgill.github.io/plotly.R.core/articles/r-docs/heatmaps.md)

- [Contour
  plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/contour-plots.md)
