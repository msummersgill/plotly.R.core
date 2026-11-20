# 3D Hover Options

#### Customize Hover for Spikelines

By default, Plotly’s 3D plots display lines called “spikelines” while
hovering over a point. These lines project from the hover point to each
of the three axes’ normal planes and then extend from those projection
data points to the planes’ wall boundaries.

``` r

library(plotly.core)

mtcars$am[which(mtcars$am == 0)] <- "Automatic"
mtcars$am[which(mtcars$am == 1)] <- "Manual"
mtcars$am <- as.factor(mtcars$am)

am_colors <- c(Automatic = "#BF382A", Manual = "#0C4B8E")

fig <- go_figure()
for (g in levels(mtcars$am)) {
  fig <- fig |>
    add_scatter3d(
      data = mtcars[mtcars$am == g, ],
      x = ~wt,
      y = ~hp,
      z = ~qsec,
      mode = "markers",
      opacity = 0.8,
      marker = go_scatter3d_marker(color = am_colors[[g]]),
      name = g
    )
}
fig <- fig |>
  update_layout(
    scene = go_scene(
      xaxis = go_scene_axis(
        spikecolor = "#a009b5",
        spikesides = FALSE,
        spikethickness = 6
      ),
      yaxis = go_scene_axis(
        spikecolor = "#a009b5",
        spikesides = FALSE,
        spikethickness = 6
      ),
      zaxis = go_scene_axis(
        spikecolor = "#a009b5",
        spikethickness = 6
      )
    )
  )

fig
```

#### Customize Hover for Surface Contours

In addition to spikelines, Plotly 3D Surface plots also display surface
contours on hover by default. These are customized by styling the
`contours` attribute in the surface trace (see
[`go_surface_contours()`](https://msummersgill.github.io/plotly.R.core/reference/go_surface_contours.md)).

``` r

library(plotly.core)

fig <- go_figure() |>
  add_surface(
    z = volcano,
    contours = go_surface_contours(
      x = go_surface_contours_axis(highlight = TRUE, highlightcolor = "#41a7b3"),
      y = go_surface_contours_axis(highlight = FALSE),
      z = go_surface_contours_axis(highlight = FALSE)
    )
  ) |>
  update_layout(
    scene = go_scene(
      xaxis = go_scene_axis(showspikes = FALSE),
      yaxis = go_scene_axis(showspikes = FALSE),
      zaxis = go_scene_axis(showspikes = FALSE)
    )
  )

fig
```

## Reference

See
[`go_scene_axis()`](https://msummersgill.github.io/plotly.R.core/reference/go_scene_axis.md)
and
[`go_surface_contours()`](https://msummersgill.github.io/plotly.R.core/reference/go_surface_contours.md)
for more information and options!
