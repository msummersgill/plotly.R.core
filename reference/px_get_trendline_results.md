# Trendline fit results

Returns the fitted models behind the OLS trendlines of a figure created
by a `px_*()` function with `trendline = "ols"`, one row per trendline,
like plotly.py's `px.get_trendline_results()`.

## Usage

``` r
px_get_trendline_results(fig)
```

## Arguments

- fig:

  A figure returned by
  [`px_scatter()`](https://msummersgill.github.io/plotly.R.core/reference/px_scatter.md)
  or a similar function.

## Value

A data.table with a column per grouping variable and a list column
`px_fit_results` of [`stats::lm()`](https://rdrr.io/r/stats/lm.html)
fits (`NULL` for other trendline types).

## Examples

``` r
fig <- px_data_tips() |>
  px_scatter(x = ~total_bill, y = ~tip, color = ~smoker, trendline = "ols")
res <- px_get_trendline_results(fig)
summary(res$px_fit_results[[1]])
#> 
#> Call:
#> stats::lm(formula = y ~ x, na.action = stats::na.omit)
#> 
#> Residuals:
#>      Min       1Q   Median       3Q      Max 
#> -2.48236 -0.36267 -0.05518  0.44820  2.10081 
#> 
#> Coefficients:
#>             Estimate Std. Error t value Pr(>|t|)    
#> (Intercept) 0.360069   0.162415   2.217   0.0281 *  
#> x           0.137156   0.007779  17.631   <2e-16 ***
#> ---
#> Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#> 
#> Residual standard error: 0.7866 on 149 degrees of freedom
#> Multiple R-squared:  0.676,  Adjusted R-squared:  0.6738 
#> F-statistic: 310.9 on 1 and 149 DF,  p-value: < 2.2e-16
#> 
```
