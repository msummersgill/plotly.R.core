# 3D Surface Lighting

### Ambient

``` r

library(plotly.core)

make_subplots(
  rows = 1,
  cols = 2,
  specs = list(list(list(type = "scene"), list(type = "scene")))
) |>
  add_surface(
    z = ~volcano,
    lighting = go_surface_lighting(ambient = 0.2),
    showscale = FALSE,
    row = 1,
    col = 1
  ) |>
  add_surface(
    z = ~volcano,
    lighting = go_surface_lighting(ambient = 0.9),
    showscale = FALSE,
    row = 1,
    col = 2
  ) |>
  update_scenes(aspectmode = "cube") |>
  update_layout(title = "Ambient Lighting")
```

### Roughness

``` r

library(plotly.core)

make_subplots(
  rows = 1,
  cols = 2,
  specs = list(list(list(type = "scene"), list(type = "scene")))
) |>
  add_surface(
    z = ~volcano,
    lighting = go_surface_lighting(roughness = 0.1),
    showscale = FALSE,
    row = 1,
    col = 1
  ) |>
  add_surface(
    z = ~volcano,
    lighting = go_surface_lighting(roughness = 0.9),
    showscale = FALSE,
    row = 1,
    col = 2
  ) |>
  update_scenes(aspectmode = "cube") |>
  update_layout(title = "Roughness")
```

### Diffuse

``` r

library(plotly.core)

make_subplots(
  rows = 1,
  cols = 2,
  specs = list(list(list(type = "scene"), list(type = "scene")))
) |>
  add_surface(
    z = ~volcano,
    lighting = go_surface_lighting(diffuse = 0.1),
    showscale = FALSE,
    row = 1,
    col = 1
  ) |>
  add_surface(
    z = ~volcano,
    lighting = go_surface_lighting(diffuse = 0.9),
    showscale = FALSE,
    row = 1,
    col = 2
  ) |>
  update_scenes(aspectmode = "cube") |>
  update_layout(title = "Diffuse Reflection")
```

### Specular

``` r

library(plotly.core)

make_subplots(
  rows = 1,
  cols = 2,
  specs = list(list(list(type = "scene"), list(type = "scene")))
) |>
  add_surface(
    z = ~volcano,
    lighting = go_surface_lighting(specular = 0.1),
    showscale = FALSE,
    row = 1,
    col = 1
  ) |>
  add_surface(
    z = ~volcano,
    lighting = go_surface_lighting(specular = 1.9),
    showscale = FALSE,
    row = 1,
    col = 2
  ) |>
  update_scenes(aspectmode = "cube") |>
  update_layout(title = "Specular Reflection")
```

### Fresnel

``` r

library(plotly.core)

make_subplots(
  rows = 1,
  cols = 2,
  specs = list(list(list(type = "scene"), list(type = "scene")))
) |>
  add_surface(
    z = ~volcano,
    lighting = go_surface_lighting(fresnel = 0.1),
    showscale = FALSE,
    row = 1,
    col = 1
  ) |>
  add_surface(
    z = ~volcano,
    lighting = go_surface_lighting(fresnel = 4.5),
    showscale = FALSE,
    row = 1,
    col = 2
  ) |>
  update_scenes(aspectmode = "cube") |>
  update_layout(title = "Fresnel")
```

\#Reference

See
[`go_surface_lighting()`](https://msummersgill.github.io/plotly.R.core/reference/go_surface_lighting.md)
for more information and options!
