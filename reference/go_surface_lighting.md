# Surface lighting objects

The object for the `lighting` of a surface trace
([`go_surface()`](https://msummersgill.github.io/plotly.R.core/reference/go_surface.md)).
`go_surface_lighting()` creates one, with exactly its properties; a
named list with the same properties works too.

## Usage

``` r
go_surface_lighting(
  ...,
  ambient = NULL,
  diffuse = NULL,
  fresnel = NULL,
  roughness = NULL,
  specular = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- ambient:

  Ambient light increases overall color visibility but can wash out the
  image. Number in the interval \[0, 1\].

- diffuse:

  Represents the extent that incident rays are reflected in a range of
  angles. Number in the interval \[0, 1\].

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

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_surface_lighting` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
go_figure() |>
  add_surface(z = volcano, lighting = go_surface_lighting())
```
