# Network Graph

### Read Graph File

We are using the well-known social network of `Zachary's karate club`,
which ships with igraph as a named graph (`make_graph("Zachary")`). A
GML format file can also be collected from
[here](https://gist.github.com/pravj/9168fe52823c1702a07b).

``` r

library(plotly.core)
library(igraph)

G <- make_graph("Zachary")
V(G)$label <- paste("Member", seq_len(vcount(G)))
L <- layout_in_circle(G)
```

### Create Vertices and Edges

``` r

vs <- V(G)
es <- as.data.frame(as_edgelist(G))

Nv <- length(vs)
Ne <- length(es[1]$V1)
```

### Create Nodes

``` r

library(plotly.core)

Xn <- L[, 1]
Yn <- L[, 2]

network <- go_figure() |>
  add_scatter(
    x = Xn,
    y = Yn,
    mode = "markers",
    text = vs$label,
    hoverinfo = "text"
  )
```

### Creates Edges

``` r

edge_shapes <- list()
for (i in 1:Ne) {
  v0 <- es[i, ]$V1
  v1 <- es[i, ]$V2

  edge_shape <- go_shape(
    type = "line",
    line = go_shape_line(color = "#030303", width = 0.3),
    x0 = Xn[v0],
    y0 = Yn[v0],
    x1 = Xn[v1],
    y1 = Yn[v1]
  )

  edge_shapes[[i]] <- edge_shape
}
```

### Create Network

``` r

fig <- network |>
  update_layout(
    title = "Karate Network",
    shapes = edge_shapes,
    xaxis = go_xaxis(
      title = "",
      showgrid = FALSE,
      showticklabels = FALSE,
      zeroline = FALSE
    ),
    yaxis = go_yaxis(
      title = "",
      showgrid = FALSE,
      showticklabels = FALSE,
      zeroline = FALSE
    )
  )

fig
```

### Reference

See
[`go_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/go_scatter.md)
and
[`go_shape()`](https://msummersgill.github.io/plotly.R.core/reference/go_shape.md)
for more information and chart attribute options!
