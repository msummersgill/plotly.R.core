# Intro to Animations

### Frames

Now, along with `data` and `layout`, `frames` is added to the keys that
`figure` allows. Your `frames` key points to a list of figures, each of
which will be cycled through upon instantiation of the plot. With
plotly.core, build the frames yourself (each frame holds the trace
values to show at that step) and add a play button with
[`go_updatemenu()`](https://msummersgill.github.io/plotly.R.core/reference/go_updatemenu.md)
and a slider with
[`go_slider()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider.md).

### Basic Example

``` r

library(plotly.core)

df <- data.frame(
  x = c(1,2,1), 
  y = c(1,2,1), 
  f = c(1,2,3)
)

fig <- df[df$f == 1, ] |>
  go_figure() |>
  add_scatter(x = ~x, y = ~y, mode = "markers", showlegend = FALSE)

fig$frames <- lapply(df$f, function(f) {
  list(
    name = as.character(f),
    data = list(go_scatter(x = df$x[df$f == f], y = df$y[df$f == f]))
  )
})

fig <- fig |>
  update_layout(
    xaxis = go_xaxis(range = c(0.9, 2.1)),
    yaxis = go_yaxis(range = c(0.9, 2.1)),
    updatemenus = list(
      go_updatemenu(
        type = "buttons",
        showactive = FALSE,
        x = 0,
        y = 0,
        yanchor = "top",
        pad = go_updatemenu_pad(t = 60, r = 10),
        xanchor = "right",
        buttons = list(
          go_updatemenu_button(
            label = "Play",
            method = "animate",
            args = list(NULL, list(fromcurrent = TRUE, mode = "immediate"))
          )
        )
      )
    ),
    sliders = list(
      go_slider(
        pad = go_slider_pad(t = 50),
        steps = lapply(df$f, function(f) {
          go_slider_step(
            label = as.character(f),
            method = "animate",
            args = list(list(as.character(f)), list(mode = "immediate"))
          )
        })
      )
    )
  )

fig
```

### Mulitple Trace Animations

One trace per continent, and one frame per year holding the values of
every trace for that year. `play_button()` and `year_slider()` build the
animation controls; the following sections change their options.

``` r

library(plotly.core)
library(gapminder)

df <- as.data.frame(gapminder)
years <- sort(unique(df$year))
continents <- levels(df$continent)
# marker area proportional to population
sizeref <- 2 * max(df$pop) / 60^2

continent_trace <- function(d) {
  go_scatter(
    x = d$gdpPercap,
    y = d$lifeExp,
    text = d$country,
    marker = go_scatter_marker(size = d$pop, sizemode = "area", sizeref = sizeref)
  )
}

fig <- go_figure()
for (cont in continents) {
  d <- df[df$continent == cont & df$year == years[1], ]
  fig <- fig |>
    add_scatter(
      x = d$gdpPercap,
      y = d$lifeExp,
      text = d$country,
      hoverinfo = "text",
      mode = "markers",
      name = cont,
      marker = go_scatter_marker(size = d$pop, sizemode = "area", sizeref = sizeref)
    )
}

fig$frames <- lapply(years, function(yr) {
  list(
    name = as.character(yr),
    data = lapply(continents, function(cont) {
      continent_trace(df[df$continent == cont & df$year == yr, ])
    })
  )
})

animation_args <- function(frames, duration, easing) {
  list(
    frames,
    list(
      frame = list(duration = duration, redraw = FALSE),
      transition = list(duration = duration, easing = easing),
      fromcurrent = TRUE,
      mode = "immediate"
    )
  )
}

play_button <- function(duration = 500, easing = "linear", ...) {
  go_updatemenu(
    type = "buttons",
    showactive = FALSE,
    ...,
    buttons = list(
      go_updatemenu_button(
        label = "Play",
        method = "animate",
        args = animation_args(NULL, duration, easing)
      )
    )
  )
}

year_slider <- function(duration = 500, easing = "linear", ...) {
  go_slider(
    pad = go_slider_pad(t = 50),
    ...,
    steps = lapply(years, function(yr) {
      go_slider_step(
        label = as.character(yr),
        method = "animate",
        args = animation_args(list(as.character(yr)), duration, easing)
      )
    })
  )
}

fig <- fig |>
  update_layout(
    xaxis = go_xaxis(type = "log", range = log10(range(df$gdpPercap)) + c(-0.1, 0.1)),
    yaxis = go_yaxis(range = range(df$lifeExp) + c(-5, 5)),
    updatemenus = list(
      play_button(x = 0, xanchor = "right", y = 0, yanchor = "top", pad = go_updatemenu_pad(t = 60, r = 10))
    ),
    sliders = list(year_slider())
  )

fig
```

### Add Animation Options

``` r

library(plotly.core)

fig <- fig |>
  update_layout(
    updatemenus = list(
      play_button(1000, "elastic", x = 0, xanchor = "right", y = 0, yanchor = "top", pad = go_updatemenu_pad(t = 60, r = 10))
    ),
    sliders = list(year_slider(1000, "elastic"))
  )

fig
```

### Add Button Options

``` r

library(plotly.core)

fig <- fig |>
  update_layout(
    updatemenus = list(
      play_button(1000, "elastic", x = 1, xanchor = "right", y = 0, yanchor = "bottom")
    )
  )

fig
```

### Add Slider Options

``` r

library(plotly.core)

fig <- fig |>
  update_layout(
    sliders = list(
      year_slider(
        1000,
        "elastic",
        currentvalue = go_slider_currentvalue(prefix = "YEAR ", font = go_font(color = "red"))
      )
    )
  )

fig
```

### Advanced Example

``` r

library(plotly.core)

fig <- go_figure()
for (cont in continents) {
  d <- df[df$continent == cont & df$year == years[1], ]
  fig <- fig |>
    add_scatter(
      x = d$gdpPercap,
      y = d$lifeExp,
      text = d$country,
      hoverinfo = "text",
      mode = "markers",
      name = cont,
      marker = go_scatter_marker(size = d$pop, sizemode = "area", sizeref = sizeref)
    )
}

fig$frames <- lapply(years, function(yr) {
  list(
    name = as.character(yr),
    data = lapply(continents, function(cont) {
      continent_trace(df[df$continent == cont & df$year == yr, ])
    })
  )
})

fig <- fig |>
  update_layout(
    xaxis = go_xaxis(type = "log", range = log10(range(df$gdpPercap)) + c(-0.1, 0.1)),
    yaxis = go_yaxis(range = range(df$lifeExp) + c(-5, 5)),
    updatemenus = list(
      play_button(1000, "elastic", x = 1, xanchor = "right", y = 0, yanchor = "bottom")
    ),
    sliders = list(
      year_slider(
        1000,
        "elastic",
        currentvalue = go_slider_currentvalue(prefix = "YEAR ", font = go_font(color = "red"))
      )
    )
  )

fig
```

### Reference

To read more on animations see [The Plotly
Book](https://cpsievert.github.io/plotly_book/key-frame-animations.html),
and
[`go_updatemenu()`](https://msummersgill.github.io/plotly.R.core/reference/go_updatemenu.md)
and
[`go_slider()`](https://msummersgill.github.io/plotly.R.core/reference/go_slider.md)
for the animation controls.
