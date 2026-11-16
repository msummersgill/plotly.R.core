# The plotly.js plot schema

The schema of the bundled plotly.js: every trace type and layout object
with its attributes.

## Usage

``` r
schema(jsonedit = interactive(), ...)
```

## Arguments

- jsonedit:

  Show it in an interactive viewer (needs the listviewer package)?

- ...:

  Unused.

## Value

The schema as a list (invisibly): `traces`, `layout`, `frames`,
`animation`, `config` and `defs`.

## Examples

``` r
s <- schema(jsonedit = FALSE)
names(s$traces)
#>  [1] "bar"                "barpolar"           "box"               
#>  [4] "candlestick"        "carpet"             "choropleth"        
#>  [7] "choroplethmap"      "cone"               "contour"           
#> [10] "contourcarpet"      "densitymap"         "funnel"            
#> [13] "funnelarea"         "heatmap"            "histogram"         
#> [16] "histogram2d"        "histogram2dcontour" "icicle"            
#> [19] "image"              "indicator"          "isosurface"        
#> [22] "mesh3d"             "ohlc"               "parcats"           
#> [25] "parcoords"          "pie"                "quiver"            
#> [28] "sankey"             "scatter"            "scatter3d"         
#> [31] "scattercarpet"      "scattergeo"         "scattergl"         
#> [34] "scattermap"         "scatterpolar"       "scatterpolargl"    
#> [37] "scattersmith"       "scatterternary"     "splom"             
#> [40] "streamtube"         "sunburst"           "surface"           
#> [43] "table"              "treemap"            "violin"            
#> [46] "volume"             "waterfall"         
```
