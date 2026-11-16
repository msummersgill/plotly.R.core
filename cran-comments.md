## R CMD check results

0 errors | 0 warnings | 2 notes

* This is a new submission.

* installed size is 22.9Mb; sub-directories of 1Mb or more: htmlwidgets 16.2Mb,
  help 3.1Mb, doc 1.4Mb, R 1.1Mb.

  The htmlwidgets directory holds the plotly.js JavaScript library the
  package renders with: the full bundle and plotly.js's partial bundles,
  which make pages using only some trace types much smaller. The help
  directory holds documentation generated from the plotly.js schema (one
  page per trace type, documenting every property).

## Test environments

* local macOS (aarch64), R 4.4.2

## Downloads and files written during use

`save_image()` exports figures with a headless Chrome driven by chromote.
Nothing is downloaded or written outside the session's temporary directory
in examples, tests or vignettes on CRAN, nor by any function unless the user
asks for it:

* In interactive sessions that need set-up, `save_image()` asks the user
  (`utils::askYesNo()`) before running `install_chrome()`; non-interactive
  sessions get an error saying how to set up.
* `install_chrome()`, called by the user, downloads Chrome Headless Shell
  with chromote (into chromote's cache) and, on Linux, the shared libraries
  Chrome lacks: the packages providing them are fetched from the system's own
  configured repositories with `apt-get download` or `dnf download` (which
  need no administrator rights) and unpacked into
  `tools::R_user_dir("plotly.core", "cache")`. Nothing is installed
  system-wide and no administrator rights are used.
* The cache is managed: libraries are kept per OS release, those for other
  releases are removed when libraries are next downloaded, and
  `remove_chrome()` removes everything downloaded.
* Downloaded components keep their own licences, listed in inst/COPYRIGHTS.
* Examples are in `\dontrun{}`; tests that start a browser run only with
  NOT_CRAN=true and close it; the static-export vignette runs its examples
  only with NOT_CRAN=true or on pkgdown, and closes the browser.
