# Streamtube lighting objects

The object for the `lighting` of a streamtube trace
([`go_streamtube()`](https://msummersgill.github.io/plotly.R.core/reference/go_streamtube.md)).
`go_streamtube_lighting()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_streamtube_lighting(
  arg = NULL,
  ...,
  ambient = NULL,
  diffuse = NULL,
  facenormalsepsilon = NULL,
  fresnel = NULL,
  roughness = NULL,
  specular = NULL,
  vertexnormalsepsilon = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- ambient:

  Ambient light increases overall color visibility but can wash out the
  image. Number in the interval \[0, 1\].

- diffuse:

  Represents the extent that incident rays are reflected in a range of
  angles. Number in the interval \[0, 1\].

- facenormalsepsilon:

  Epsilon for face normals calculation avoids math issues arising from
  degenerate geometry. Number in the interval \[0, 1\].

- fresnel:

  Represents the reflectance as a dependency of the viewing angle; e.g.
  paper is reflective when viewing it from the edge of the paper (almost
  90 degrees), causing shine. Number in the interval \[0, 5\].

- roughness:

  Alters specular reflection; the rougher the surface, the wider and
  less contrasty the shine. Number in the interval \[0, 1\].

- specular:

  Represents the level that incident rays are reflected in a single
  direction, causing shine. Number in the interval \[0, 2\].

- vertexnormalsepsilon:

  Epsilon for vertex normals calculation avoids math issues arising from
  degenerate geometry. Number in the interval \[0, 1\].

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_streamtube_lighting` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
d <- expand.grid(x = 1:3, y = 1:3, z = 1:3)
d |>
  go_figure() |>
  add_streamtube(
    x = ~x,
    y = ~y,
    z = ~z,
    u = ~y,
    v = ~-x,
    w = ~z,
    lighting = go_streamtube_lighting()
  )
```
