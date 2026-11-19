# Color sequences and scales

The named color sequences and scales of plotly.py's `plotly.colors`
module: `plotly_colors$qualitative` (discrete color sequences, e.g.
`Plotly`, `D3`, `Set1`), `plotly_colors$sequential` (e.g. `Viridis`,
`Plasma`, `Blues`), `plotly_colors$diverging` (e.g. `RdBu`) and
`plotly_colors$cyclical` (e.g. `Twilight`). Each is a character vector
of colors; use [`rev()`](https://rdrr.io/r/base/rev.html) to reverse
one.

## Usage

``` r
plotly_colors
```

## Format

A list of four named lists of character vectors.

## Details

Sequential, diverging and cyclical scales can also be given by name
(case-insensitive, with `"_r"` appended to reverse) to any colorscale
property, e.g. `marker = list(colorscale = "viridis_r")`.

## Examples

``` r
names(plotly_colors$qualitative)
#>  [1] "Alphabet" "Antique"  "Bold"     "D3"       "Dark2"    "Dark24"  
#>  [7] "G10"      "Light24"  "Pastel"   "Pastel1"  "Pastel2"  "Plotly"  
#> [13] "Prism"    "Safe"     "Set1"     "Set2"     "Set3"     "T10"     
#> [19] "Vivid"   
plotly_colors$qualitative$Plotly
#>  [1] "#636EFA" "#EF553B" "#00CC96" "#AB63FA" "#FFA15A" "#19D3F3" "#FF6692"
#>  [8] "#B6E880" "#FF97FF" "#FECB52"
rev(plotly_colors$sequential$Viridis)
#>  [1] "#fde725" "#b5de2b" "#6ece58" "#35b779" "#1f9e89" "#26828e" "#31688e"
#>  [8] "#3e4989" "#482878" "#440154"
```
