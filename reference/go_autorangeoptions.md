# Autorangeoptions objects

Used for `autorangeoptions` in 6 places in the schema.
`go_autorangeoptions()` creates one; a named list with the same
properties works too.

## Usage

``` r
go_autorangeoptions(
  ...,
  clipmax = NULL,
  clipmin = NULL,
  include = NULL,
  maxallowed = NULL,
  minallowed = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- clipmax:

  Clip autorange maximum if it goes beyond this value. Has no effect
  when \`autorangeoptions.maxallowed\` is provided. Any value.

- clipmin:

  Clip autorange minimum if it goes beyond this value. Has no effect
  when \`autorangeoptions.minallowed\` is provided. Any value.

- include:

  Extends the autorange to include this value or array of values, even
  when they fall outside the data range. Has no effect on endpoints set
  by \`autorangeoptions.minallowed\` or \`autorangeoptions.maxallowed\`.
  Subject to \`autorangeoptions.clipmin\` and
  \`autorangeoptions.clipmax\`. Any value.

- maxallowed:

  Use this value exactly as autorange maximum. Any value.

- minallowed:

  Use this value exactly as autorange minimum. Any value.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_autorangeoptions` object (a named list).

## Details

These objects appear in 6 places in the plotly.js schema (properties
named `autorangeoptions`), all with the same properties and rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatterpolar(r = ~mpg, theta = ~hp) |>
  update_layout(
    polar = go_polar(
      radialaxis = go_polar_radialaxis(
        autorangeoptions = go_autorangeoptions()
      )
    )
  )
```
