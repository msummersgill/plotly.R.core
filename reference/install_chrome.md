# Set up Chrome for static image export

Makes sure
[`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md)
can start Chrome, without asking: finds a Chrome or Chromium (see
[`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md))
or else downloads Chrome Headless Shell with chromote, and on Linux
downloads the shared libraries it needs that are missing. The libraries
come from the system's own package repositories (with `apt-get download`
or `dnf download`, which need no administrator rights) and are unpacked
into plotly.core's user cache
(`tools::R_user_dir("plotly.core", "cache")`), where
[`save_image()`](https://msummersgill.github.io/plotly.R.core/reference/save_image.md)
finds them. Run it once on a new machine, e.g. before scripts that
export images; interactive sessions are offered the same downloads when
needed.

## Usage

``` r
install_chrome()
```

## Value

The path to Chrome, invisibly.

## Examples

``` r
if (FALSE) { # \dontrun{
install_chrome()
} # }
```
