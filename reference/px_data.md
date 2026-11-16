# Built-in datasets

Datasets used in the plotly.express examples, returned as data.tables.

## Usage

``` r
px_data_gapminder(
  datetimes = FALSE,
  centroids = FALSE,
  year = NULL,
  pretty_names = FALSE
)

px_data_tips(pretty_names = FALSE)

px_data_iris()

px_data_wind()

px_data_election()

px_data_election_geojson()

px_data_carshare()

px_data_stocks(datetimes = FALSE)

px_data_experiment()

px_data_medals_wide()

px_data_medals_long()
```

## Arguments

- datetimes:

  Convert the date column to `Date`.

- centroids:

  Keep country centroid columns.

- year:

  Keep only this year.

- pretty_names:

  Use readable column names.

## Value

A data.table (a GeoJSON list for `px_data_election_geojson()`).

## Details

- `px_data_gapminder()`: life expectancy, population and GDP per capita
  by country and year (1704 rows). `datetimes = TRUE` makes `year` a
  Date; `centroids = TRUE` keeps the `centroid_lat` and `centroid_lon`
  columns; `year` filters to one year; `pretty_names = TRUE` uses
  readable column names.

- `px_data_tips()`: restaurant bills and tips (244 rows).

- `px_data_iris()`: Fisher's iris measurements, with a numeric
  `species_id` (150 rows).

- `px_data_wind()`: wind direction and strength frequencies (128 rows).

- `px_data_election()`: results of the 2013 Montreal mayoral election by
  district (58 rows); `px_data_election_geojson()` returns the district
  boundaries as a GeoJSON list.

- `px_data_carshare()`: car-sharing availability in Montreal (249 rows).

- `px_data_stocks()`: weekly closing prices of six technology stocks,
  normalised to 1 on 2018-01-01 (105 rows). `datetimes = TRUE` makes
  `date` a Date.

- `px_data_experiment()`: results of a fictional experiment (100 rows).

- `px_data_medals_wide()`, `px_data_medals_long()`: medal counts by
  nation in wide and long form.

## Examples

``` r
head(px_data_gapminder(year = 2007))
#>        country continent  year lifeExp      pop  gdpPercap iso_alpha iso_num
#>         <char>    <char> <int>   <num>    <int>      <num>    <char>   <int>
#> 1: Afghanistan      Asia  2007  43.828 31889923   974.5803       AFG       4
#> 2:     Albania    Europe  2007  76.423  3600523  5937.0295       ALB       8
#> 3:     Algeria    Africa  2007  72.301 33333216  6223.3675       DZA      12
#> 4:      Angola    Africa  2007  42.731 12420476  4797.2313       AGO      24
#> 5:   Argentina  Americas  2007  75.320 40301927 12779.3796       ARG      32
#> 6:   Australia   Oceania  2007  81.235 20434176 34435.3674       AUS      36
head(px_data_tips())
#>    total_bill   tip    sex smoker    day   time  size
#>         <num> <num> <char> <char> <char> <char> <int>
#> 1:      16.99  1.01 Female     No    Sun Dinner     2
#> 2:      10.34  1.66   Male     No    Sun Dinner     3
#> 3:      21.01  3.50   Male     No    Sun Dinner     3
#> 4:      23.68  3.31   Male     No    Sun Dinner     2
#> 5:      24.59  3.61 Female     No    Sun Dinner     4
#> 6:      25.29  4.71   Male     No    Sun Dinner     4
```
