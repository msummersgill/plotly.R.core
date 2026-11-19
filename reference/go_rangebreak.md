# Rangebreak objects

Used for `rangebreak` in 2 places in the schema. `go_rangebreak()`
creates one; a named list with the same properties works too.

## Usage

``` r
go_rangebreak(
  arg = NULL,
  ...,
  bounds = NULL,
  dvalue = NULL,
  enabled = NULL,
  name = NULL,
  pattern = NULL,
  templateitemname = NULL,
  values = NULL,
  skip_invalid = FALSE
)
```

## Arguments

- arg:

  Optional named list, or graph object of the same type, to initialise
  properties from. Named arguments take precedence.

- ...:

  Not used: properties must be named in full.

- bounds:

  Sets the lower and upper bounds of this axis rangebreak. Can be used
  with \`pattern\`. Vector or list of 2 element(s).

- dvalue:

  Sets the size of each \`values\` item. The default is one day in
  milliseconds. Number in the interval \[0, Inf\].

- enabled:

  Determines whether this axis rangebreak is enabled or disabled. Please
  note that \`rangebreaks\` only work for "date" axis type. Logical.

- name:

  When used in a template, named items are created in the output figure
  in addition to any items the figure already has in this array. You can
  modify these items in the output figure by making your own item with
  \`templateitemname\` matching this \`name\` alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). Has no effect outside of a template. String.

- pattern:

  Determines a pattern on the time line that generates breaks. If "day
  of week" - days of the week in English e.g. 'Sunday' or \`sun\`
  (matching is case-insensitive and considers only the first three
  characters), as well as Sunday-based integers between 0 and 6. If
  "hour" - hour (24-hour clock) as decimal numbers between 0 and 24. for
  more info. Examples: - { pattern: 'day of week', bounds: \[6, 1\] } or
  simply { bounds: \['sat', 'mon'\] } breaks from Saturday to Monday
  (i.e. skips the weekends). - { pattern: 'hour', bounds: \[17, 8\] }
  breaks from 5pm to 8am (i.e. skips non-work hours). One of
  `"day of week"`, `"hour"`, `""`.

- templateitemname:

  Used to refer to a named item in this array in the template. Named
  items from the template will be created even without a matching item
  in the input figure, but you can modify one by making an item with
  \`templateitemname\` matching its \`name\`, alongside your
  modifications (including \`visible: false\` or \`enabled: false\` to
  hide it). If there is no template or no matching item, this item will
  be hidden unless you explicitly show it with \`visible: true\`.
  String.

- values:

  Sets the coordinate values corresponding to the rangebreaks. An
  alternative to \`bounds\`. Use \`dvalue\` to set the size of the
  values along the axis. Vector or list of up to 1 element(s).

- skip_invalid:

  If `TRUE`, silently drop invalid properties instead of raising an
  error.

## Value

A `go_rangebreak` object (a named list).

## Details

These objects appear in 2 places in the plotly.js schema (properties
named `rangebreak`), all with the same properties and rules.

## Examples

``` r
mtcars |>
  go_figure() |>
  add_scatter(x = ~wt, y = ~mpg, mode = "markers") |>
  update_layout(xaxis = go_xaxis(rangebreaks = list(go_rangebreak())))
```
