# Fonts installed on this computer

Lists the font families installed on this computer, using the
systemfonts package. These are the fonts a figure can use when it is
drawn here: in static images
([`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md),
knitted documents) and in figures viewed in a browser on this computer.

## Usage

``` r
available_fonts()
```

## Value

A sorted character vector of font family names.

## Details

A figure's fonts are set with `family` properties (e.g.
`update_layout(font = go_font(family = "Georgia"))`), which take a CSS
font list such as `"Inter, Arial, sans-serif"`: the browser drawing the
figure uses the first family in the list that it has, or a generic
family (`serif`, `sans-serif`, `monospace`) at the end.

Interactive figures are drawn in each viewer's browser, so they use the
fonts installed on the *viewer's* computer, which R can't see (and
browsers don't let pages list them): a font installed here may be
missing for someone opening the HTML file or Shiny app elsewhere. Lists
that end with widely available fonts and a generic family
(`"Inter, Arial, sans-serif"`) look reasonable everywhere.

[`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md)
warns when the first family of a figure's font list is not installed
here.

## See also

[`go_font()`](https://msummersgill.github.io/plotly.R.core/reference/go_font.md)

## Examples

``` r
head(available_fonts())
#> [1] "C059"                 "D050000L"             "DejaVu Math TeX Gyre"
#> [4] "DejaVu Sans"          "DejaVu Sans Mono"     "DejaVu Serif"        
"Arial" %in% available_fonts()
#> [1] FALSE
```
