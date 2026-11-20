# ROC and PR Curves

## ROC and PR Curves in R

Interpret the results of your classification using Receiver Operating
Characteristics (ROC) and Precision-Recall (PR) Curves in R with Plotly.

## Preliminary plots

Before diving into the receiver operating characteristic (ROC) curve, we
will look at two plots that will give some context to the thresholds
mechanism behind the ROC and PR curves.

In the histogram, we observe that the score spread such that most of the
positive labels are binned near 1, and a lot of the negative labels are
close to 0. When we set a threshold on the score, all of the bins to its
left will be classified as 0’s, and everything to the right will be 1’s.
There are obviously a few outliers, such as **negative** samples that
our model gave a high score, and *positive* samples with a low score. If
we set a threshold right in the middle, those outliers will respectively
become **false positives** and *false negatives*.

As we adjust thresholds, the number of false positives will increase or
decrease, and at the same time the number of true positives will also
change; this is shown in the second plot. As you can see, the model
seems to perform fairly well, because the true positive rate and the
false positive rate decreases sharply as we increase the threshold.
Those two lines each represent a dimension of the ROC curve.

``` r

library(plotly.core)
set.seed(0)
X <- matrix(rnorm(10000), nrow = 500)
y <- sample(0:1, 500, replace = TRUE)
data <- data.frame(X, y)
data$y <- as.factor(data$y)
X <- subset(data, select = -c(y))

# Fit a logistic regression model
logistic_glm <- glm(y ~ ., data = data, family = binomial)

y_score <- predict(logistic_glm, X, type = "response")

# ROC and PR curves computed with base R
roc_df <- function(truth, score) {
  thr <- c(Inf, sort(unique(score), decreasing = TRUE), -Inf)
  data.frame(
    threshold = thr,
    tpr = sapply(thr, function(t) mean(score[truth == 1] >= t)),
    fpr = sapply(thr, function(t) mean(score[truth == 0] >= t))
  )
}
auc <- function(roc) {
  sum(diff(roc$fpr) * (head(roc$tpr, -1) + tail(roc$tpr, -1)) / 2)
}

z <- roc_df(data$y, y_score)

colors <- c("0" = "blue", "1" = "red")
fig1 <- go_figure()
for (lvl in levels(data$y)) {
  fig1 <- fig1 |>
    add_histogram(
      x = y_score[data$y == lvl],
      name = lvl,
      opacity = 0.5,
      nbinsx = 50,
      marker = go_histogram_marker(color = colors[[lvl]])
    )
}
fig1 <- fig1 |>
  update_layout(barmode = "overlay")
fig1
```

``` r

fig2 <- z |>
  go_figure() |>
  add_scatter(x = ~threshold, y = ~fpr, mode = "lines", name = "False Positive Rate") |>
  add_scatter(x = ~threshold, y = ~tpr, mode = "lines", name = "True Positive Rate") |>
  update_layout(
    title = "TPR and FPR at every threshold",
    legend = go_legend(title = go_legend_title(text = "<b> Rate </b>"))
  )
fig2
```

## Multiclass ROC Curve

When you have more than 2 classes, you will need to plot the ROC curve
for each class separately. Make sure that you use a
[one-versus-rest](https://cran.r-project.org/web/packages/multiclassPairs/vignettes/Tutorial.html)
model, or make sure that your problem has a multi-label format;
otherwise, your ROC curve might not return the expected results.

``` r

library(plotly.core)

# Artificially add noise to make task harder
data(iris)
ind <- sample.int(150, 50)
samples <- sample(x = iris$Species, size = 50)
iris[ind, "Species"] <- samples

# Define the inputs and outputs
X <- subset(iris, select = -c(Species))
iris$Species <- as.factor(iris$Species)

# Fit a multinomial logistic regression model
logistic <- nnet::multinom(Species ~ ., data = iris, trace = FALSE)

y_scores <- predict(logistic, X, type = "probs")

# One hot encode the labels in order to plot them
y_onehot <- sapply(levels(iris$Species), function(l) as.integer(iris$Species == l))

# ROC and PR curves computed with base R
roc_df <- function(truth, score) {
  thr <- c(Inf, sort(unique(score), decreasing = TRUE), -Inf)
  data.frame(
    threshold = thr,
    tpr = sapply(thr, function(t) mean(score[truth == 1] >= t)),
    fpr = sapply(thr, function(t) mean(score[truth == 0] >= t))
  )
}
auc <- function(roc) {
  sum(diff(roc$fpr) * (head(roc$tpr, -1) + tail(roc$tpr, -1)) / 2)
}

# Create an empty figure, and iteratively add a line for each class
fig <- go_figure() |>
  add_shape(
    type = "line",
    x0 = 0,
    x1 = 1,
    y0 = 0,
    y1 = 1,
    line = go_shape_line(dash = "dash", color = "black")
  )
for (cl in colnames(y_onehot)) {
  roc <- roc_df(y_onehot[, cl], y_scores[, cl])
  name <- paste0(cl, " (AUC=", round(auc(roc), 2), ")")
  fig <- fig |>
    add_scatter(data = roc, x = ~fpr, y = ~tpr, mode = "lines", name = name)
}
fig <- fig |>
  update_layout(
    xaxis = go_xaxis(title = "False Positive Rate"),
    yaxis = go_yaxis(title = "True Positive Rate"),
    legend = go_legend(x = 100, y = 0.5)
  )
fig
```

In this example, we use the average precision metric, which is an
alternative scoring method to the area under the PR curve.

``` r

library(plotly.core)

# Artificially add noise to make task harder
data(iris)
ind <- sample.int(150, 50)
samples <- sample(x = iris$Species, size = 50)
iris[ind, "Species"] <- samples

# Define the inputs and outputs
X <- subset(iris, select = -c(Species))
iris$Species <- as.factor(iris$Species)

# Fit a multinomial logistic regression model
logistic <- nnet::multinom(Species ~ ., data = iris, trace = FALSE)

y_scores <- predict(logistic, X, type = "probs")

# One hot encode the labels in order to plot them
y_onehot <- sapply(levels(iris$Species), function(l) as.integer(iris$Species == l))

# precision-recall curve and average precision computed with base R
pr_df <- function(truth, score) {
  thr <- sort(unique(score), decreasing = TRUE)
  tp <- sapply(thr, function(t) sum(score >= t & truth == 1))
  fp <- sapply(thr, function(t) sum(score >= t & truth == 0))
  data.frame(
    threshold = c(Inf, thr),
    recall = c(0, tp / sum(truth == 1)),
    precision = c(1, tp / (tp + fp))
  )
}
avg_precision <- function(pr) {
  sum(diff(pr$recall) * pr$precision[-1])
}

# Create an empty figure, and add a new line for each class
fig <- go_figure() |>
  add_shape(
    type = "line",
    x0 = 0,
    x1 = 1,
    y0 = 1,
    y1 = 0,
    line = go_shape_line(dash = "dash", color = "black")
  )
for (cl in colnames(y_onehot)) {
  pr <- pr_df(y_onehot[, cl], y_scores[, cl])
  name <- paste0(cl, " (AP = ", round(avg_precision(pr), 2), ")")
  fig <- fig |>
    add_scatter(data = pr, x = ~recall, y = ~precision, mode = "lines", name = name)
}
fig <- fig |>
  update_layout(
    xaxis = go_xaxis(title = "Recall"),
    yaxis = go_yaxis(title = "Precision"),
    legend = go_legend(x = 100, y = 0.5)
  )
fig
```

## References

Learn more about histograms, filled area plots and line charts:

- [Histograms](https://msummersgill.github.io/plotly.R.core/articles/r-docs/histograms.md)

- [Filled Area
  Plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/filled-area-plots.md)

- [Line
  Charts](https://msummersgill.github.io/plotly.R.core/articles/r-docs/line-charts.md)
