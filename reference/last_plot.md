# The last plot

`last_plot()` returns the plot most recently printed (or, for the plotly
package's `plot_ly()` objects, built). `set_last_plot()` records one; it
is for packages that build plots of their own classes.

## Usage

``` r
last_plot()

set_last_plot(p)
```

## Arguments

- p:

  A plot.

## Value

`last_plot()`: the plot. `set_last_plot()`: `p`, invisibly.
