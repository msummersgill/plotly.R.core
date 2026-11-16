# Look up property validators

For packages building on plotly.core (such as plotly): `get_validator()`
returns the validator of a property, by its dotted path in the plotly.js
schema (e.g. `"scatter.marker.symbol"`, `"layout.xaxis"`), or `NULL` if
there is none. Compound validators list their properties in `children`;
trace validators have a `trace_type`. `available_trace_types()` lists
the trace types.

## Usage

``` r
get_validator(key)

available_trace_types()
```

## Arguments

- key:

  A dotted property path.

## Value

A validator (a list), or `NULL`; or a character vector.
