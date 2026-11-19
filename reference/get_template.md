# Figure templates

Templates (themes) set default layout and trace properties for figures.
The built-in templates are those of plotly.py: `"plotly"` (the default),
`"plotly_white"`, `"plotly_dark"`, `"ggplot2"`, `"seaborn"`,
`"simple_white"`, `"presentation"`, `"xgridoff"`, `"ygridoff"`,
`"gridon"` and `"none"`. Templates can be combined with `"+"`, e.g.
`"plotly_white+presentation"`; later templates take precedence.

## Usage

``` r
get_template(name)

template_names()

register_template(name, template)

default_template(name)
```

## Arguments

- name:

  Template name, or several joined with `"+"`.

- template:

  A named list with `layout` and/or `data` elements, e.g.
  `list(layout = list(font = list(family = "Georgia")))`.

## Value

`get_template()` returns the template as a named list.
`template_names()` returns the available names. `default_template()`
returns the default template name; with an argument it sets the default
and returns the previous one invisibly. `register_template()` returns
`name` invisibly.

## Details

Figures without a `layout$template` use the default template when they
are rendered. Plotly Express functions add their template to the figure.

## Examples

``` r
template_names()
#>  [1] "ggplot2"      "gridon"       "plotly"       "plotly_dark"  "plotly_white"
#>  [6] "presentation" "seaborn"      "simple_white" "xgridoff"     "ygridoff"    
#> [11] "none"        
tpl <- get_template("plotly_white+presentation")
tpl$layout$font
#> $color
#> [1] "#2a3f5f"
#> 
#> $size
#> [1] 18
#> 

register_template("big_font", list(layout = go_layout(font = go_font(size = 20))))
old <- default_template("plotly+big_font")
default_template(old)
```
