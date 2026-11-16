# Modify graph objects

Setting a property of a graph object (created by a `go_*()` constructor)
validates the new value, just like the constructor does. Setting a
property to `NULL` removes it.

## Usage

``` r
# S3 method for class 'plotly_obj'
x$name <- value

# S3 method for class 'plotly_obj'
x[[i]] <- value
```

## Arguments

- x:

  A graph object.

- name, i:

  Property name.

- value:

  New value.

## Value

The modified graph object.

## Examples

``` r
m <- go_scatter_marker(size = 10)
m$color <- "red"
m[["symbol"]] <- "diamond"
try(m$size <- -1)
#> Error : Invalid value of type 'numeric' received for the 'size' property of scatter.marker
#>     Received value: -1
#> 
#>     The 'size' property is a number and may be specified as:
#>       - A number in the interval [0, Inf]
#>       - A vector of the above
```
