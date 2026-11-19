# Sankey link concentrationscales objects

The object for an element of the `colorscales` list of a sankey trace's
`link`
([`go_sankey_link()`](https://msummersgill.github.io/plotly.R.core/reference/go_sankey_link.md)).
`go_sankey_link_concentrationscales()` creates one, with exactly its
properties; a named list with the same properties works too.

## Usage

``` r
go_sankey_link_concentrationscales(
  arg = NULL,
  ...,
  cmax = NULL,
  cmin = NULL,
  colorscale = NULL,
  label = NULL,
  name = NULL,
  templateitemname = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- cmax:

  Sets the upper bound of the color domain. Number.

- cmin:

  Sets the lower bound of the color domain. Number.

- colorscale:

  Sets the colorscale. The colorscale must be an array containing arrays
  mapping a normalized value to an rgb, rgba, hex, hsl, hsla, hwb, or
  named color string. At minimum, a mapping for the lowest (0) and
  highest (1) values are required. For example, \`\[\[0,
  'rgb(0,0,255)'\], \[1, 'rgb(255,0,0)'\]\]\`. To control the bounds of
  the colorscale in color space, use \`cmin\` and \`cmax\`.
  Alternatively, \`colorscale\` may be a palette name string of the
  following list:
  Blackbody,Bluered,Blues,Cividis,Earth,Electric,Greens,Greys,Hot,Jet,Picnic,Portland,Rainbow,RdBu,Reds,Viridis,YlGnBu,YlOrRd.
  Colorscale: a vector of colors, a two-column data.frame of (value,
  color), or the name of a sequential, diverging or cyclical scale in
  [`plotly_colors()`](https://msummersgill.github.io/plotly.R.core/reference/plotly_colors.md)
  (append `"_r"` to reverse).

- label:

  The label of the links to color based on their concentration within a
  flow. String.

- name:

  When used in a template, named items are created in the output figure
  in addition to any items the figure already has in this array. You can
  modify these items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- templateitemname:

  Used to refer to a named item in this array in the template. Named
  items from the template will be created even without a matching item
  in the input figure, but you can modify one by making an item with
  \`templateitemname\` matching its \`name\`, alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). If there is no template or no matching item, this item will
  be hidden unless you explicitly show it with \`visible: true\`.
  String.

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_sankey_link_concentrationscales` object (a named list).

## Details

Nested objects are named lists, or objects of the constructors their
arguments name. Every property is checked against the plotly.js schema
when the object is created or modified. A property may be a one-sided
formula (`color = ~col`): it is kept, and evaluated in the data (then
checked) when its trace is added to a figure with `add_<trace>()` or
[`add_trace()`](https://msummersgill.github.io/plotly.R.core/reference/add_traces.md).

## Examples

``` r
go_sankey(
  link = go_sankey_link(
    colorscales = list(go_sankey_link_concentrationscales())
  )
)
#> <go_sankey>
#> {
#>   "type": "sankey",
#>   "link": {
#>     "colorscales": [
#>       {
#> 
#>       }
#>     ]
#>   }
#> }
#> 
```
