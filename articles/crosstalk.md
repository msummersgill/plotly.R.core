# Linked views with crosstalk

[crosstalk](https://rstudio.github.io/crosstalk/) links htmlwidgets in
the browser, with no Shiny server: selecting points in one figure
selects the same rows in every other view of the data. This page shows
how to do it with
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md)
and `add_<trace>()`.

``` r

library(plotly.core)
library(crosstalk)
library(data.table)
#> 
#> Attaching package: 'data.table'
#> The following object is masked from 'package:base':
#> 
#>     %notin%

# one row per country and year (1952-2007), from the gapminder package
gap <- as.data.table(gapminder::gapminder)
gap[, `:=`(country = as.character(country), continent = as.character(continent))]
```

The examples use the gapminder data, with a row for each country every
five years. Rows are keyed by country, so selecting any point of a
country selects all of its years, in every view. Views of the same
`SharedData` share one selection, so each example makes its own:
selections in one example don’t reach the others.

## Linking traces

Wrap the data in a `SharedData` and pipe it into
[`go_figure()`](https://msummersgill.github.io/plotly.R.core/reference/go_figure.md).
Formula properties (`x = ~gdpPercap`) are evaluated in its data, as with
a data frame, and each trace built from its rows is linked: every point
carries its row’s key.

``` r

SharedData$new(gap, key = ~country) |>
  go_figure() |>
  add_scatter(x = ~gdpPercap, y = ~lifeExp, text = ~country, mode = "markers") |>
  update_layout(xaxis = go_xaxis(type = "log")) |>
  highlight(color = "red")
```

Click a point to select its country: its points from all twelve years
are highlighted, showing its path. Double-click to clear; hold shift to
add more countries.

- `key` says which rows belong together; the default is the data’s row
  names (one key per row).
- Views sharing a `group` (by default, one per `SharedData`; set it with
  `SharedData$new(group = )`) are linked.
- Without
  [`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md),
  a linked figure selects on click and clears on double-click.

## Several views of the same rows

Each figure made from the same `SharedData`, or from `SharedData`s with
the same `group` and keys, is a view of the same selection. Here 2007’s
rows and all years’ rows are linked through the group “countries”:
selecting countries with a box or lasso in the first plot shows their
histories in the second, where
[`attrs_selected()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)
draws the selected points as lines.

``` r

in_2007 <- SharedData$new(gap[year == 2007], key = ~country, group = "countries")
all_years <- SharedData$new(gap, key = ~country, group = "countries")

latest <- in_2007 |>
  go_figure() |>
  add_scatter(x = ~gdpPercap, y = ~lifeExp, text = ~country, mode = "markers") |>
  update_layout(height = 350, xaxis = go_xaxis(type = "log"), title = "Wealth and life expectancy, 2007") |>
  highlight(on = "plotly_selected", color = "red")

history <- all_years |>
  go_figure() |>
  add_scatter(x = ~year, y = ~lifeExp, text = ~country, mode = "markers") |>
  update_layout(height = 350, title = "Life expectancy over time") |>
  highlight(color = "red", selected = attrs_selected(mode = "lines+markers"))

htmltools::tagList(as_widget(latest), as_widget(history))
```

Clicking a point of the history plot selects that country in both.

## Which traces are linked

An `add_<trace>()` call links its trace when one of the trace’s data
arrays (`x`, `y`, `z`, `values`, `ids`, …) has one value per row of the
`SharedData`. Other traces, such as summaries and reference lines, stay
unlinked and unchanged by selections:

``` r

world <- gap[, .(lifeExp = weighted.mean(lifeExp, pop)), by = year]
#> Warning in gsum(w, na.rm = FALSE): The sum of an integer column for a group was
#> more than type 'integer' can hold so the result has been coerced to 'numeric'
#> automatically for convenience.

SharedData$new(gap, key = ~country) |>
  go_figure() |>
  add_scatter(x = ~year, y = ~lifeExp, text = ~country, mode = "markers", name = "countries") |>
  add_scatter(x = world$year, y = world$lifeExp, mode = "lines", name = "world") |>
  highlight(color = "red", selected = attrs_selected(mode = "lines+markers"))
```

A `SharedData` can also be given to a single trace with `data`:

``` r

go_figure() |>
  add_scatter(x = ~year, y = ~lifeExp, data = all_years, mode = "markers") |>  # linked
  add_scatter(x = ~year, y = ~pop, data = gap, mode = "markers")                # not linked
```

## Linking traces built from other data

[`set_crosstalk_keys()`](https://msummersgill.github.io/plotly.R.core/reference/set_crosstalk_keys.md)
links traces whose values don’t come from the `SharedData`’s rows, such
as summaries: give it the keys of the trace’s points and the group to
join. Here the points are keyed by continent, and a bar chart of
countries per continent is linked to them, so clicking a bar selects
every country of that continent (and clicking a point selects its
continent):

``` r

by_continent <- SharedData$new(gap, key = ~continent)
countries <- gap[year == 2007, .N, by = continent]

continent_bars <- go_figure() |>
  add_bar(x = countries$continent, y = countries$N) |>
  set_crosstalk_keys(countries$continent, group = by_continent$groupName()) |>
  update_layout(height = 300, yaxis = go_yaxis(title = "countries")) |>
  highlight(color = "red")

continent_points <- by_continent |>
  go_figure() |>
  add_scatter(x = ~gdpPercap, y = ~lifeExp, text = ~country, mode = "markers") |>
  update_layout(height = 350, xaxis = go_xaxis(type = "log")) |>
  highlight(color = "red")

htmltools::tagList(as_widget(continent_bars), as_widget(continent_points))
```

With `simple = TRUE`, a trace stands for all its keys as a whole, for
marks that can’t be split into points, such as a line summarising a
group. Here each continent’s average life expectancy is a line standing
for its countries: clicking a line selects them all in the plot below
it. A line is highlighted when all of its countries are selected.

``` r

by_country2 <- SharedData$new(gap, key = ~country)

averages <- go_figure()
for (cont in sort(unique(gap$continent))) {
  d <- gap[continent == cont, .(lifeExp = mean(lifeExp)), by = year]
  averages <- averages |>
    add_scatter(x = d$year, y = d$lifeExp, mode = "lines+markers", name = cont) |>
    set_crosstalk_keys(unique(gap[continent == cont, country]),
                       group = by_country2$groupName(),
                       traces = length(averages$data) + 1L, simple = TRUE)
}
# plotly.js reports clicks on a line's points: let a click near the line count
averages <- averages |>
  update_layout(height = 350, hoverdistance = 50, title = "Average by continent") |>
  highlight(color = "red")

country_points <- by_country2 |>
  go_figure() |>
  add_scatter(x = ~year, y = ~lifeExp, text = ~country, mode = "markers") |>
  update_layout(height = 300, title = "Countries") |>
  highlight(color = "red")

htmltools::tagList(as_widget(averages), as_widget(country_points))
```

## Highlighting options

[`highlight()`](https://msummersgill.github.io/plotly.R.core/reference/highlight.md)
sets how a figure makes and shows selections:

| Argument | Effect |
|----|----|
| `on` | Event that selects: `"plotly_click"` (default), `"plotly_hover"`, `"plotly_selected"` (box/lasso; sets the drag mode to select), `"plotly_selecting"` (while dragging) |
| `off` | Event that clears: matches `on` by default (`"plotly_deselect"` for selections, else `"plotly_doubleclick"`) |
| `color` | Selection colour (R colour, hex or CSS such as `"rgba(255,0,0,0.5)"`); `NULL` keeps the points’ colours |
| `dynamic` | Adds a colour picker, for selections in several colours |
| `persistent` | New selections add to the current one (as holding shift does) |
| `selectize` | Adds a searchable dropdown of the keys; or a list of selectize.js options |
| `defaultValues` | Keys selected when the page opens |
| `opacityDim` | Opacity multiplier of unselected points (default 0.2) |
| `selected` | Attributes of selected points, e.g. `attrs_selected(mode = "lines+markers")` |
| `debounce` | Milliseconds to wait, for frequent events such as hover |

Compare countries: pick them in the dropdown (or click their points),
change the colour between picks, and they are kept
(`persistent = TRUE`):

``` r

SharedData$new(gap, key = ~country) |>
  go_figure() |>
  add_scatter(x = ~year, y = ~lifeExp, text = ~country, mode = "markers") |>
  highlight(
    dynamic = TRUE,
    persistent = TRUE,
    selectize = TRUE,
    defaultValues = c("China", "India"),
    selected = attrs_selected(mode = "lines+markers")
  )
```

## Filters

crosstalk’s filter inputs subset every view of a `SharedData`’s group:
traces show only the rows that pass all filters. Filters work on keys (a
key passes when any of its rows does), so filter by year with a key per
row, the default:

``` r

filtered <- SharedData$new(gap)
htmltools::tagList(
  filter_checkbox("continent", "Continent", filtered, ~continent, inline = TRUE),
  filter_slider("year", "Year", filtered, ~year, width = "100%", sep = ""),
  filtered |>
    go_figure() |>
    add_scatter(x = ~gdpPercap, y = ~lifeExp, text = ~country, mode = "markers") |>
    update_layout(height = 350, xaxis = go_xaxis(type = "log")) |>
    as_widget()
)
```

Continent

Africa

Americas

Asia

Europe

Oceania

Year

## Notes

- **Subplots**: traces added to several cells
  (`add_scatter(..., row = 1, col = "all")`) are each linked.
  [`set_crosstalk_keys()`](https://msummersgill.github.io/plotly.R.core/reference/set_crosstalk_keys.md)
  uses trace indices, so call it after adding the traces it links.
- **Animation**: each animation frame’s traces carry their own keys, set
  with
  [`set_crosstalk_keys()`](https://msummersgill.github.io/plotly.R.core/reference/set_crosstalk_keys.md).
- **Other widgets**: any crosstalk-compatible widget, such as DT tables
  and leaflet maps, can share the group.
- **Trace types**: selection events need traces with points (scatter,
  bar, histogram, box, maps, …); plotly.js reports clicks and hovers on
  a line’s points, not between them. Heatmaps, pies and other
  aggregating traces can’t be selected point by point.
- **Shiny**: crosstalk works without a server; in Shiny,
  [`event_data()`](https://msummersgill.github.io/plotly.R.core/reference/event_data.md)
  also reports selections, and `SharedData` selections can be read with
  `<SharedData>$selection()`.
- **Size**: keys are sent as strings, one per point; with many thousands
  of points, short keys keep pages small.
