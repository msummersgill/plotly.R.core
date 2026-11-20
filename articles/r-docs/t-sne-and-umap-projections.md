# t-SNE and UMAP projections

## t-SNE and UMAP projections in R

This page presents various ways to visualize two popular dimensionality
reduction techniques, namely the [t-distributed stochastic neighbor
embedding](https://lvdmaaten.github.io/tsne/) (t-SNE) and [Uniform
Manifold Approximation and
Projection](https://umap-learn.readthedocs.io/en/latest/index.html)
(UMAP). They are needed whenever you want to visualize data with more
than two or three features (i.e. dimensions).

We first show how to visualize data with more than three features using
the [scatter plot
matrix](https://msummersgill.github.io/plotly.R.core/articles/r-docs/splom.md),
then we apply dimensionality reduction techniques to get 2D/3D
representation of our data, and visualize the results with [scatter
plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/line-and-scatter.md)
and [3D scatter
plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-scatter-plots.md).

## Basic t-SNE projections

t-SNE is a popular dimensionality reduction algorithm that arises from
probability theory. Simply put, it projects the high-dimensional data
points (sometimes with hundreds of features) into 2D/3D by inducing the
projected data to have a similar distribution as the original data
points by minimizing something called the [KL
divergence](https://towardsdatascience.com/light-on-math-machine-learning-intuitive-guide-to-understanding-kl-divergence-2b382ca2b2a8).

Compared to a method like Principal Component Analysis (PCA), it takes
significantly more time to converge, but present significantly better
insights when visualized. For example, by projecting features of
flowers, it will be able to distinctly group

### Visualizing high-dimensional data with `splom`

First, let’s try to visualize every feature of the [Iris
dataset](https://archive.ics.uci.edu/ml/datasets/iris), and color
everything by the species. We will use the Scatter Plot Matrix
([splom](https://msummersgill.github.io/plotly.R.core/articles/r-docs/splom.md)),
which lets us plot each feature against everything else, which is
convenient when your dataset has more than 3 dimensions.

``` r

library(plotly.core)
data(iris)

species_colors <- c(setosa = "#636EFA", versicolor = "#EF553B", virginica = "#00CC96")

fig <- go_figure()
for (sp in levels(iris$Species)) {
  fig <- fig |>
    add_splom(
      data = iris[iris$Species == sp, ],
      name = sp,
      dimensions = list(
        go_splom_dimension(label = "sepal_width", values = ~Sepal.Width),
        go_splom_dimension(label = "sepal_length", values = ~Sepal.Length),
        go_splom_dimension(label = "petal_width", values = ~Petal.Width),
        go_splom_dimension(label = "petal_length", values = ~Petal.Length)
      ),
      marker = go_splom_marker(color = species_colors[[sp]])
    )
}

xaxis <- go_xaxis(showline = FALSE, zeroline = FALSE, gridcolor = "#ffff", ticklen = 4)
yaxis <- go_yaxis(showline = FALSE, zeroline = FALSE, gridcolor = "#ffff", ticklen = 4)

fig <- fig |>
  update_layout(
    legend = go_legend(title = go_legend_title(text = "species")),
    hovermode = "closest",
    dragmode = "select",
    plot_bgcolor = "rgba(240,240,240,0.95)",
    xaxis = xaxis,
    xaxis2 = xaxis,
    xaxis3 = xaxis,
    xaxis4 = xaxis,
    yaxis = yaxis,
    yaxis2 = yaxis,
    yaxis3 = yaxis,
    yaxis4 = yaxis
  )

fig
```

The t-SNE and UMAP projection examples of the original page need the
`tsne` and `umap` packages and are not available for plotly.core yet.
Once you have computed a 2D or 3D embedding, plot it with
[`add_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md)
or
[`add_scatter3d()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter3d.md),
one trace per class, as shown in the [scatter
plot](https://msummersgill.github.io/plotly.R.core/articles/r-docs/line-and-scatter.md)
and [3D scatter
plot](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-scatter-plots.md)
pages.

## Reference

Plotly figures: \* [Line and scatter
plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/line-and-scatter.md)

- [3D scatter
  plots](https://msummersgill.github.io/plotly.R.core/articles/r-docs/3d-scatter-plots.md)

- [Scatter plot
  matrix](https://msummersgill.github.io/plotly.R.core/articles/r-docs/splom.md)

Details about algorithms: \* UMAP library:
<https://umap-learn.readthedocs.io/en/latest/>

- t-SNE User guide:
  <https://cran.r-project.org/web/packages/tsne/tsne.pdf>

- t-SNE paper:
  <https://www.jmlr.org/papers/volume9/vandermaaten08a/vandermaaten08a.pdf>

- MNIST: <http://yann.lecun.com/exdb/mnist/>
