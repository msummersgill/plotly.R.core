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

remove_chrome(browser = FALSE)
```

## Arguments

- browser:

  For `remove_chrome()`, also remove the Chrome Headless Shell builds
  downloaded with chromote.

## Value

`install_chrome()`: the path to Chrome, invisibly. `remove_chrome()`:
`NULL`, invisibly.

## Details

Downloaded libraries are kept in a folder for the OS release, and those
for other releases (e.g. after an upgrade) are removed when libraries
are next downloaded. `remove_chrome()` removes everything plotly.core
has downloaded and, with `browser = TRUE`, the Chrome Headless Shell
builds chromote downloaded.

The downloaded software is not part of plotly.core and keeps its own
licence: Chrome Headless Shell is built from Chromium by Google (see the
licence files in its download), and the libraries are your
distribution's packages (each package's copyright file is kept with it,
under `usr/share/doc`).

## Examples

``` r
if (FALSE) { # \dontrun{
install_chrome()

# remove the downloaded libraries (and Chrome Headless Shell)
remove_chrome(browser = TRUE)
} # }
```
