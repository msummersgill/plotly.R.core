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
f <- go_font(size = 10)
f$color <- "red"
f[["family"]] <- "Georgia"
try(f$size <- -1)
#> Error : Invalid value of type 'numeric' received for the 'size' property of go_font()
#>     Received value: -1
#> 
#>     The 'size' property is a number and may be specified as:
#>       - A number in the interval [1, Inf]

tr <- go_scatter(x = 1:3, y = 3:1)
tr$mode <- "markers"
tr$marker <- list(size = 12, color = "red")
```
