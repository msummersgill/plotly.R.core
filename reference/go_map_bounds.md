# Layout map bounds objects

The object for the layout's `map.bounds`
([`go_map()`](https://msummersgill.github.io/plotly.R.core/reference/go_map.md)).
`go_map_bounds()` creates one, with exactly its properties; a named list
with the same properties works too.

## Usage

``` r
go_map_bounds(
  arg = NULL,
  ...,
  east = NULL,
  north = NULL,
  south = NULL,
  west = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- east:

  Sets the maximum longitude of the map (in degrees East) if \`west\`,
  \`south\` and \`north\` are declared. Number.

- north:

  Sets the maximum latitude of the map (in degrees North) if \`east\`,
  \`west\` and \`south\` are declared. Number.

- south:

  Sets the minimum latitude of the map (in degrees North) if \`east\`,
  \`west\` and \`north\` are declared. Number.

- west:

  Sets the minimum longitude of the map (in degrees East) if \`east\`,
  \`south\` and \`north\` are declared. Number.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_layout_map_bounds` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
quakes |>
  go_figure() |>
  add_scattermap(lat = ~lat, lon = ~long) |>
  update_layout(map = go_map(bounds = go_map_bounds()))
```
