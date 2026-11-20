# Choropleth Maps

A [Choropleth Map](https://en.wikipedia.org/wiki/Choropleth_map) is a
map composed of colored polygons. It is used to represent spatial
variations of a quantity. This page documents how to build **outline**
choropleth maps, but you can also build [choropleth **tile maps** using
`add_choroplethmap()`](https://msummersgill.github.io/plotly.R.core/articles/r-docs/mapbox-county-choropleth.md).

### Base Map Configuration

plotly.core figures have a `layout.geo` object (built with
[`go_geo()`](https://msummersgill.github.io/plotly.R.core/reference/go_geo.md)
and set with `update_layout(geo = ...)` or
[`update_geos()`](https://msummersgill.github.io/plotly.R.core/reference/update_geos.md))
which can be used to control the appearance of the base map onto which
data is plotted.

### Introduction: main parameters for choropleth outline maps

Making choropleth maps requires two main types of input:

1.  Geometry information:
    1.  This can either be a supplied GeoJSON file where each feature
        has either an `id` field or some identifying value in
        `properties`; or
    2.  one of the built-in geometries within plotly.js: US states and
        world countries (see below)
2.  A list of values indexed by feature identifier.

The GeoJSON data is passed to the `geojson` argument, and the data is
passed into the `z` argument of choropleth traces.

**Note** the `geojson` attribute can also be the URL to a GeoJSON file,
which can speed up map rendering in certain cases.

### GeoJSON with `feature.id`

Here we load a GeoJSON file containing the geometry information for US
counties, where `feature.id` is a [FIPS
code](https://en.wikipedia.org/wiki/FIPS_county_code).

``` r

library(plotly.core)
library(jsonlite)

data <- fromJSON(
  "https://raw.githubusercontent.com/plotly/datasets/master/geojson-counties-fips.json",
  simplifyVector = FALSE
)
data$features[[1]]
```

    ## $type
    ## [1] "Feature"
    ## 
    ## $properties
    ## $properties$GEO_ID
    ## [1] "0500000US01001"
    ## 
    ## $properties$STATE
    ## [1] "01"
    ## 
    ## $properties$COUNTY
    ## [1] "001"
    ## 
    ## $properties$NAME
    ## [1] "Autauga"
    ## 
    ## $properties$LSAD
    ## [1] "County"
    ## 
    ## $properties$CENSUSAREA
    ## [1] 594.436
    ## 
    ## 
    ## $geometry
    ## $geometry$type
    ## [1] "Polygon"
    ## 
    ## $geometry$coordinates
    ## $geometry$coordinates[[1]]
    ## $geometry$coordinates[[1]][[1]]
    ## $geometry$coordinates[[1]][[1]][[1]]
    ## [1] -86.49677
    ## 
    ## $geometry$coordinates[[1]][[1]][[2]]
    ## [1] 32.34444
    ## 
    ## 
    ## $geometry$coordinates[[1]][[2]]
    ## $geometry$coordinates[[1]][[2]][[1]]
    ## [1] -86.7179
    ## 
    ## $geometry$coordinates[[1]][[2]][[2]]
    ## [1] 32.40281
    ## 
    ## 
    ## $geometry$coordinates[[1]][[3]]
    ## $geometry$coordinates[[1]][[3]][[1]]
    ## [1] -86.81491
    ## 
    ## $geometry$coordinates[[1]][[3]][[2]]
    ## [1] 32.3408
    ## 
    ## 
    ## $geometry$coordinates[[1]][[4]]
    ## $geometry$coordinates[[1]][[4]][[1]]
    ## [1] -86.89058
    ## 
    ## $geometry$coordinates[[1]][[4]][[2]]
    ## [1] 32.50297
    ## 
    ## 
    ## $geometry$coordinates[[1]][[5]]
    ## $geometry$coordinates[[1]][[5]][[1]]
    ## [1] -86.9176
    ## 
    ## $geometry$coordinates[[1]][[5]][[2]]
    ## [1] 32.66417
    ## 
    ## 
    ## $geometry$coordinates[[1]][[6]]
    ## $geometry$coordinates[[1]][[6]][[1]]
    ## [1] -86.71339
    ## 
    ## $geometry$coordinates[[1]][[6]][[2]]
    ## [1] 32.66173
    ## 
    ## 
    ## $geometry$coordinates[[1]][[7]]
    ## $geometry$coordinates[[1]][[7]][[1]]
    ## [1] -86.71422
    ## 
    ## $geometry$coordinates[[1]][[7]][[2]]
    ## [1] 32.70569
    ## 
    ## 
    ## $geometry$coordinates[[1]][[8]]
    ## $geometry$coordinates[[1]][[8]][[1]]
    ## [1] -86.41312
    ## 
    ## $geometry$coordinates[[1]][[8]][[2]]
    ## [1] 32.70739
    ## 
    ## 
    ## $geometry$coordinates[[1]][[9]]
    ## $geometry$coordinates[[1]][[9]][[1]]
    ## [1] -86.41117
    ## 
    ## $geometry$coordinates[[1]][[9]][[2]]
    ## [1] 32.40994
    ## 
    ## 
    ## $geometry$coordinates[[1]][[10]]
    ## $geometry$coordinates[[1]][[10]][[1]]
    ## [1] -86.49677
    ## 
    ## $geometry$coordinates[[1]][[10]][[2]]
    ## [1] 32.34444
    ## 
    ## 
    ## 
    ## 
    ## 
    ## $id
    ## [1] "01001"

#### Data indexed by `id`

Here we load unemployment data by county, also indexed by [FIPS
code](https://en.wikipedia.org/wiki/FIPS_county_code).

``` r

df <- read.csv(
  "https://raw.githubusercontent.com/plotly/datasets/master/fips-unemp-16.csv",
  header = TRUE,
  colClasses = c("fips" = "character")
)
head(df)
```

    ##    fips unemp
    ## 1 01001   5.3
    ## 2 01003   5.4
    ## 3 01005   8.6
    ## 4 01007   6.6
    ## 5 01009   5.5
    ## 6 01011   7.2

### Choropleth Map Using GeoJSON

``` r

library(plotly.core)
library(jsonlite)

url <- "https://raw.githubusercontent.com/plotly/datasets/master/geojson-counties-fips.json"
counties <- fromJSON(url, simplifyVector = FALSE)
url2 <- "https://raw.githubusercontent.com/plotly/datasets/master/fips-unemp-16.csv"
df <- read.csv(url2, colClasses = c(fips = "character"))
g <- go_geo(
  scope = "usa",
  projection = go_geo_projection(type = "albers usa"),
  showlakes = TRUE,
  lakecolor = "white"
)

go_figure() |>
  add_choropleth(
    geojson = counties,
    locations = df$fips,
    z = df$unemp,
    colorscale = "Viridis",
    zmin = 0,
    zmax = 12,
    marker = go_choropleth_marker(line = go_choropleth_marker_line(width = 0)),
    colorbar = go_colorbar(title = "Unemployment Rate (%)")
  ) |>
  update_layout(title = "2016 US Unemployment by County", geo = g)
```

**Note** In this example we set `layout.geo.scope` to usa to
automatically configure the map to display USA-centric data in an
appropriate projection.

### Indexing by GeoJSON Properties

If the GeoJSON you are using either does not have an `id` field or you
wish you use one of the keys in the `properties` field, you may use the
`featureidkey` parameter to specify where to match the values of
locations.

In the following GeoJSON object/data-file pairing, the values of
`properties.district` match the values of the `district` column:

``` r

library(plotly.core)
library(jsonlite)

url <- "https://raw.githubusercontent.com/plotly/datasets/master/election.geojson"
geojson <- fromJSON(url, simplifyVector = FALSE)
url2 <- "https://raw.githubusercontent.com/plotly/datasets/master/election.csv"
df <- read.csv(url2)

go_figure() |>
  add_choropleth(
    geojson = geojson,
    locations = df$district,
    z = df$Bergeron,
    colorscale = "Viridis",
    featureidkey = "properties.district",
    colorbar = go_colorbar(title = "Bergeron Votes")
  ) |>
  update_layout(
    geo = go_geo(fitbounds = "locations", visible = FALSE),
    title = "2013 Montreal Election"
  )
```

### Using Built-in Country and State Geometries

Plotly comes with two built-in geometries which do not require an
external GeoJSON file:

1.  USA States
2.  Countries as defined in the Natural Earth dataset.

**Note and disclaimer:** cultural (as opposed to physical) features are
by definition subject to change, debate and dispute. Plotly includes
data from Natural Earth “as-is” and defers to the [Natural Earth policy
regarding disputed
borders](https://www.naturalearthdata.com/downloads/50m-cultural-vectors/50m-admin-0-countries-2/)
which read:

> Natural Earth Vector draws boundaries of countries according to
> defacto status. We show who actually controls the situation on the
> ground.

To use the built-in countries geometry, provide `locations` as
[three-letter ISO country
codes](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3).

``` r

library(plotly.core)
df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv")
df
```

    ##                               COUNTRY GDP..BILLIONS. CODE
    ## 1                         Afghanistan          21.71  AFG
    ## 2                             Albania          13.40  ALB
    ## 3                             Algeria         227.80  DZA
    ## 4                      American Samoa           0.75  ASM
    ## 5                             Andorra           4.80  AND
    ## 6                              Angola         131.40  AGO
    ## 7                            Anguilla           0.18  AIA
    ## 8                 Antigua and Barbuda           1.24  ATG
    ## 9                           Argentina         536.20  ARG
    ## 10                            Armenia          10.88  ARM
    ## 11                              Aruba           2.52  ABW
    ## 12                          Australia        1483.00  AUS
    ## 13                            Austria         436.10  AUT
    ## 14                         Azerbaijan          77.91  AZE
    ## 15                       Bahamas, The           8.65  BHM
    ## 16                            Bahrain          34.05  BHR
    ## 17                         Bangladesh         186.60  BGD
    ## 18                           Barbados           4.28  BRB
    ## 19                            Belarus          75.25  BLR
    ## 20                            Belgium         527.80  BEL
    ## 21                             Belize           1.67  BLZ
    ## 22                              Benin           9.24  BEN
    ## 23                            Bermuda           5.20  BMU
    ## 24                             Bhutan           2.09  BTN
    ## 25                            Bolivia          34.08  BOL
    ## 26             Bosnia and Herzegovina          19.55  BIH
    ## 27                           Botswana          16.30  BWA
    ## 28                             Brazil        2244.00  BRA
    ## 29             British Virgin Islands           1.10  VGB
    ## 30                             Brunei          17.43  BRN
    ## 31                           Bulgaria          55.08  BGR
    ## 32                       Burkina Faso          13.38  BFA
    ## 33                              Burma          65.29  MMR
    ## 34                            Burundi           3.04  BDI
    ## 35                         Cabo Verde           1.98  CPV
    ## 36                           Cambodia          16.90  KHM
    ## 37                           Cameroon          32.16  CMR
    ## 38                             Canada        1794.00  CAN
    ## 39                     Cayman Islands           2.25  CYM
    ## 40           Central African Republic           1.73  CAF
    ## 41                               Chad          15.84  TCD
    ## 42                              Chile         264.10  CHL
    ## 43                              China       10360.00  CHN
    ## 44                           Colombia         400.10  COL
    ## 45                            Comoros           0.72  COM
    ## 46  Congo, Democratic Republic of the          32.67  COD
    ## 47             Congo, Republic of the          14.11  COG
    ## 48                       Cook Islands           0.18  COK
    ## 49                         Costa Rica          50.46  CRI
    ## 50                      Cote d'Ivoire          33.96  CIV
    ## 51                            Croatia          57.18  HRV
    ## 52                               Cuba          77.15  CUB
    ## 53                            Curacao           5.60  CUW
    ## 54                             Cyprus          21.34  CYP
    ## 55                     Czech Republic         205.60  CZE
    ## 56                            Denmark         347.20  DNK
    ## 57                           Djibouti           1.58  DJI
    ## 58                           Dominica           0.51  DMA
    ## 59                 Dominican Republic          64.05  DOM
    ## 60                            Ecuador         100.50  ECU
    ## 61                              Egypt         284.90  EGY
    ## 62                        El Salvador          25.14  SLV
    ## 63                  Equatorial Guinea          15.40  GNQ
    ## 64                            Eritrea           3.87  ERI
    ## 65                            Estonia          26.36  EST
    ## 66                           Ethiopia          49.86  ETH
    ## 67  Falkland Islands (Islas Malvinas)           0.16  FLK
    ## 68                      Faroe Islands           2.32  FRO
    ## 69                               Fiji           4.17  FJI
    ## 70                            Finland         276.30  FIN
    ## 71                             France        2902.00  FRA
    ## 72                   French Polynesia           7.15  PYF
    ## 73                              Gabon          20.68  GAB
    ## 74                        Gambia, The           0.92  GMB
    ## 75                            Georgia          16.13  GEO
    ## 76                            Germany        3820.00  DEU
    ## 77                              Ghana          35.48  GHA
    ## 78                          Gibraltar           1.85  GIB
    ## 79                             Greece         246.40  GRC
    ## 80                          Greenland           2.16  GRL
    ## 81                            Grenada           0.84  GRD
    ## 82                               Guam           4.60  GUM
    ## 83                          Guatemala          58.30  GTM
    ## 84                           Guernsey           2.74  GGY
    ## 85                      Guinea-Bissau           1.04  GNB
    ## 86                             Guinea           6.77  GIN
    ## 87                             Guyana           3.14  GUY
    ## 88                              Haiti           8.92  HTI
    ## 89                           Honduras          19.37  HND
    ## 90                          Hong Kong         292.70  HKG
    ## 91                            Hungary         129.70  HUN
    ## 92                            Iceland          16.20  ISL
    ## 93                              India        2048.00  IND
    ## 94                          Indonesia         856.10  IDN
    ## 95                               Iran         402.70  IRN
    ## 96                               Iraq         232.20  IRQ
    ## 97                            Ireland         245.80  IRL
    ## 98                        Isle of Man           4.08  IMN
    ## 99                             Israel         305.00  ISR
    ## 100                             Italy        2129.00  ITA
    ## 101                           Jamaica          13.92  JAM
    ## 102                             Japan        4770.00  JPN
    ## 103                            Jersey           5.77  JEY
    ## 104                            Jordan          36.55  JOR
    ## 105                        Kazakhstan         225.60  KAZ
    ## 106                             Kenya          62.72  KEN
    ## 107                          Kiribati           0.16  KIR
    ## 108                      Korea, North          28.00  PRK
    ## 109                      Korea, South        1410.00  KOR
    ## 110                            Kosovo           5.99  KSV
    ## 111                            Kuwait         179.30  KWT
    ## 112                        Kyrgyzstan           7.65  KGZ
    ## 113                              Laos          11.71  LAO
    ## 114                            Latvia          32.82  LVA
    ## 115                           Lebanon          47.50  LBN
    ## 116                           Lesotho           2.46  LSO
    ## 117                           Liberia           2.07  LBR
    ## 118                             Libya          49.34  LBY
    ## 119                     Liechtenstein           5.11  LIE
    ## 120                         Lithuania          48.72  LTU
    ## 121                        Luxembourg          63.93  LUX
    ## 122                             Macau          51.68  MAC
    ## 123                         Macedonia          10.92  MKD
    ## 124                        Madagascar          11.19  MDG
    ## 125                            Malawi           4.41  MWI
    ## 126                          Malaysia         336.90  MYS
    ## 127                          Maldives           2.41  MDV
    ## 128                              Mali          12.04  MLI
    ## 129                             Malta          10.57  MLT
    ## 130                  Marshall Islands           0.18  MHL
    ## 131                        Mauritania           4.29  MRT
    ## 132                         Mauritius          12.72  MUS
    ## 133                            Mexico        1296.00  MEX
    ## 134   Micronesia, Federated States of           0.34  FSM
    ## 135                           Moldova           7.74  MDA
    ## 136                            Monaco           6.06  MCO
    ## 137                          Mongolia          11.73  MNG
    ## 138                        Montenegro           4.66  MNE
    ## 139                           Morocco         112.60  MAR
    ## 140                        Mozambique          16.59  MOZ
    ## 141                           Namibia          13.11  NAM
    ## 142                             Nepal          19.64  NPL
    ## 143                       Netherlands         880.40  NLD
    ## 144                     New Caledonia          11.10  NCL
    ## 145                       New Zealand         201.00  NZL
    ## 146                         Nicaragua          11.85  NIC
    ## 147                           Nigeria         594.30  NGA
    ## 148                             Niger           8.29  NER
    ## 149                              Niue           0.01  NIU
    ## 150          Northern Mariana Islands           1.23  MNP
    ## 151                            Norway         511.60  NOR
    ## 152                              Oman          80.54  OMN
    ## 153                          Pakistan         237.50  PAK
    ## 154                             Palau           0.65  PLW
    ## 155                            Panama          44.69  PAN
    ## 156                  Papua New Guinea          16.10  PNG
    ## 157                          Paraguay          31.30  PRY
    ## 158                              Peru         208.20  PER
    ## 159                       Philippines         284.60  PHL
    ## 160                            Poland         552.20  POL
    ## 161                          Portugal         228.20  PRT
    ## 162                       Puerto Rico          93.52  PRI
    ## 163                             Qatar         212.00  QAT
    ## 164                           Romania         199.00  ROU
    ## 165                            Russia        2057.00  RUS
    ## 166                            Rwanda           8.00  RWA
    ## 167             Saint Kitts and Nevis           0.81  KNA
    ## 168                       Saint Lucia           1.35  LCA
    ## 169                      Saint Martin           0.56  MAF
    ## 170         Saint Pierre and Miquelon           0.22  SPM
    ## 171  Saint Vincent and the Grenadines           0.75  VCT
    ## 172                             Samoa           0.83  WSM
    ## 173                        San Marino           1.86  SMR
    ## 174             Sao Tome and Principe           0.36  STP
    ## 175                      Saudi Arabia         777.90  SAU
    ## 176                           Senegal          15.88  SEN
    ## 177                            Serbia          42.65  SRB
    ## 178                        Seychelles           1.47  SYC
    ## 179                      Sierra Leone           5.41  SLE
    ## 180                         Singapore         307.90  SGP
    ## 181                      Sint Maarten         304.10  SXM
    ## 182                          Slovakia          99.75  SVK
    ## 183                          Slovenia          49.93  SVN
    ## 184                   Solomon Islands           1.16  SLB
    ## 185                           Somalia           2.37  SOM
    ## 186                      South Africa         341.20  ZAF
    ## 187                       South Sudan          11.89  SSD
    ## 188                             Spain        1400.00  ESP
    ## 189                         Sri Lanka          71.57  LKA
    ## 190                             Sudan          70.03  SDN
    ## 191                          Suriname           5.27  SUR
    ## 192                         Swaziland           3.84  SWZ
    ## 193                            Sweden         559.10  SWE
    ## 194                       Switzerland         679.00  CHE
    ## 195                             Syria          64.70  SYR
    ## 196                            Taiwan         529.50  TWN
    ## 197                        Tajikistan           9.16  TJK
    ## 198                          Tanzania          36.62  TZA
    ## 199                          Thailand         373.80  THA
    ## 200                       Timor-Leste           4.51  TLS
    ## 201                              Togo           4.84  TGO
    ## 202                             Tonga           0.49  TON
    ## 203               Trinidad and Tobago          29.63  TTO
    ## 204                           Tunisia          49.12  TUN
    ## 205                            Turkey         813.30  TUR
    ## 206                      Turkmenistan          43.50  TKM
    ## 207                            Tuvalu           0.04  TUV
    ## 208                            Uganda          26.09  UGA
    ## 209                           Ukraine         134.90  UKR
    ## 210              United Arab Emirates         416.40  ARE
    ## 211                    United Kingdom        2848.00  GBR
    ## 212                     United States       17420.00  USA
    ## 213                           Uruguay          55.60  URY
    ## 214                        Uzbekistan          63.08  UZB
    ## 215                           Vanuatu           0.82  VUT
    ## 216                         Venezuela         209.20  VEN
    ## 217                           Vietnam         187.80  VNM
    ## 218                    Virgin Islands           5.08  VGB
    ## 219                         West Bank           6.64  WBG
    ## 220                             Yemen          45.45  YEM
    ## 221                            Zambia          25.61  ZMB
    ## 222                          Zimbabwe          13.74  ZWE

``` r

df |>
  go_figure() |>
  add_choropleth(
    locations = ~CODE,
    z = ~GDP..BILLIONS.,
    text = ~COUNTRY,
    colorscale = "Blues"
  )
```

To use the USA States geometry, set `locationmode = "USA-states"` and
provide `locations` as two-letter state abbreviations:

``` r

library(plotly.core)
df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2011_us_ag_exports.csv")
df$hover <- with(df, paste(state, "<br>", "Beef", beef, "Dairy", dairy, "<br>",
                           "Fruits", total.fruits, "Veggies", total.veggies,
                           "<br>", "Wheat", wheat, "Corn", corn))

df |>
  go_figure() |>
  add_choropleth(
    locationmode = "USA-states",
    z = ~total.exports,
    text = ~hover,
    locations = ~code,
    colorscale = "Purples",
    colorbar = go_colorbar(title = "Millions USD")
  ) |>
  update_layout(
    title = "2011 US Agriculture Exports by State<br>(Hover for breakdown)"
  )
```

### Customize choropleth chart

``` r

library(plotly.core)
df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2011_us_ag_exports.csv")
df$hover <- with(df, paste(state, "<br>", "Beef", beef, "Dairy", dairy, "<br>",
                           "Fruits", total.fruits, "Veggies", total.veggies,
                           "<br>", "Wheat", wheat, "Corn", corn))
# give state boundaries a white border
l <- go_choropleth_marker_line(color = "white", width = 2)
# specify some map projection/options
g <- go_geo(
  scope = "usa",
  projection = go_geo_projection(type = "albers usa"),
  showlakes = TRUE,
  lakecolor = "white"
)

df |>
  go_figure() |>
  add_choropleth(
    locationmode = "USA-states",
    z = ~total.exports,
    text = ~hover,
    locations = ~code,
    colorscale = "Purples",
    marker = go_choropleth_marker(line = l),
    colorbar = go_colorbar(title = "Millions USD")
  ) |>
  update_layout(
    title = "2011 US Agriculture Exports by State<br>(Hover for breakdown)",
    geo = g
  )
```

**Note** In this example we set `layout.geo.scope` to `usa` to
automatically configure the map to display USA-centric data in an
appropriate projection.

### World Choropleth Map

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv")

# light grey boundaries
l <- go_choropleth_marker_line(color = "grey", width = 0.5)

# specify map projection/options
g <- go_geo(
  showframe = FALSE,
  showcoastlines = FALSE,
  projection = go_geo_projection(type = "mercator")
)

df |>
  go_figure() |>
  add_choropleth(
    z = ~GDP..BILLIONS.,
    colorscale = "Blues",
    text = ~COUNTRY,
    locations = ~CODE,
    marker = go_choropleth_marker(line = l),
    colorbar = go_colorbar(title = "GDP Billions US$", tickprefix = "$")
  ) |>
  update_layout(
    title = '2014 Global GDP<br>Source:<a href="https://www.cia.gov/library/publications/the-world-factbook/fields/2195.html">CIA World Factbook</a>',
    geo = g
  )
```

### Choropleth Inset Map

``` r

library(plotly.core)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2014_ebola.csv")
# restrict from June to September
df <- subset(df, Month %in% 6:9)
# ordered factor variable with month abbreviations
df$abbrev <- ordered(month.abb[df$Month], levels = month.abb[6:9])
# September totals
df9 <- subset(df, Month == 9)

# main map
g1 <- go_geo(
  scope = "africa",
  showframe = FALSE,
  showland = TRUE,
  landcolor = "rgb(229,229,229)",
  resolution = 50,
  showcoastlines = TRUE,
  countrycolor = "white",
  coastlinecolor = "white",
  projection = go_geo_projection(type = "mercator"),
  lonaxis = go_geo_lonaxis(range = c(-15, -5)),
  lataxis = go_geo_lataxis(range = c(0, 12)),
  domain = go_domain(x = c(0, 1), y = c(0, 1))
)

# inset map
g2 <- go_geo(
  scope = "africa",
  showframe = FALSE,
  showland = TRUE,
  landcolor = "rgb(229,229,229)",
  showcountries = FALSE,
  bgcolor = "rgba(255,255,255,0)",
  # the whole continent
  lonaxis = go_geo_lonaxis(range = c(-20, 55)),
  lataxis = go_geo_lataxis(range = c(-36, 38)),
  domain = go_domain(x = c(0, 0.6), y = c(0, 0.6))
)

# marker area proportional to the number of cases
sizeref <- 2 * max(df$Value) / 40^2

# one trace per month, coloured by the ordered factor (viridis)
fig <- df |>
  go_figure() |>
  add_scattergeo(
    lat = ~Lat,
    lon = ~Lon,
    text = ~paste(Value, "cases"),
    mode = "markers",
    marker = go_scattergeo_marker(
      color = ~abbrev,
      size = ~Value,
      sizemode = "area",
      sizeref = sizeref
    )
  )
# draw the largest (September) circles first, so the earlier months show on top
fig$data <- rev(fig$data)

fig |>
  add_scattergeo(
    lon = 21.0936,
    lat = 7.1881,
    text = "Africa",
    mode = "text",
    showlegend = FALSE,
    geo = "geo2"
  ) |>
  add_choropleth(
    data = df9,
    z = ~Month,
    locations = ~Country,
    locationmode = "country names",
    colorscale = list(c(0, "#F28E5C"), c(1, "#F28E5C")),
    marker = go_choropleth_marker(line = go_choropleth_marker_line(color = "black")),
    showscale = FALSE,
    geo = "geo2"
  ) |>
  update_layout(
    title = 'Ebola cases reported by month in West Africa 2014<br> Source: <a href="https://data.hdx.rwlabs.org/dataset/rowca-ebola-cases">HDX</a>',
    geo = g1,
    geo2 = g2
  )
```
