# Pattern objects

Sets the pattern within the marker. Used for `pattern`, `fillpattern` in
9 places in the schema. `go_pattern()` creates one; a named list with
the same properties works too.

## Usage

``` r
go_pattern(
  ...,
  bgcolor = NULL,
  fgcolor = NULL,
  fgopacity = NULL,
  fillmode = NULL,
  path = NULL,
  shape = NULL,
  size = NULL,
  solidity = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- ...:

  Not for properties, which must be named in full: an abbreviated or
  unknown name is an error that suggests the right one.

- bgcolor:

  When there is no colorscale sets the color of background pattern fill.
  Defaults to a \`marker.color\` background when \`fillmode\` is
  "overlay". Otherwise, defaults to a transparent background. Color: a
  CSS color string or R color name, or a vector of these.

- fgcolor:

  When there is no colorscale sets the color of foreground pattern fill.
  Defaults to a \`marker.color\` background when \`fillmode\` is
  "replace". Otherwise, defaults to dark grey or white to increase
  contrast with the \`bgcolor\`. Color: a CSS color string or R color
  name, or a vector of these.

- fgopacity:

  Sets the opacity of the foreground pattern fill. Defaults to a 0.5
  when \`fillmode\` is "overlay". Otherwise, defaults to 1. Number in
  the interval \[0, 1\].

- fillmode:

  Determines whether \`marker.color\` should be used as a default to
  \`bgcolor\` or a \`fgcolor\`. One of `"replace"`, `"overlay"`.

- path:

  Sets a custom path for pattern fill. Use with no \`shape\` or
  \`solidity\`, provide an SVG path string for the regions of the square
  from (0,0) to (\`size\`,\`size\`) to color. String, or a vector of
  these.

- shape:

  Sets the shape of the pattern fill. By default, no pattern is used for
  filling the area. One of `""`, `"/"`, `"\\"`, `"x"`, `"-"`, `"|"`,
  `"+"`, `"."`, or a vector of these.

- size:

  Sets the size of unit squares of the pattern fill in pixels, which
  corresponds to the interval of repetition of the pattern. Number in
  the interval \[0, Inf\], or a vector of these.

- solidity:

  Sets the solidity of the pattern fill. Solidity is roughly the
  fraction of the area filled by the pattern. Solidity of 0 shows only
  the background color without pattern and solidty of 1 shows only the
  foreground color without pattern. Number in the interval \[0, 1\], or
  a vector of these.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_pattern` object (a named list).

## Details

These objects appear in 9 places in the plotly.js schema (properties
named `pattern`, `fillpattern`), all with the same properties and rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter(
    x = ~wt,
    y = ~mpg,
    mode = "markers",
    fillpattern = go_pattern(size = 10)
  )
```
