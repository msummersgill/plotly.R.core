# Static image export: save_image() and helpers. The exporter itself, which
# drives headless Chrome with chromote, is in chromote.R.

#' Save a figure as a static image
#'
#' Exports a figure to PNG, JPEG, WebP, SVG, PDF or EPS with plotly.js's own
#' image export, using the plotly.js bundled with this package in headless
#' Chrome (driven by the chromote package). No Python is needed.
#'
#' It uses an installed Chrome or Chromium, the one set by the
#' `CHROMOTE_CHROME` environment variable, or a Chrome Headless Shell
#' downloaded by chromote. Without any of these, an interactive session asks
#' whether to download Chrome Headless Shell (about 100 MB, kept for later
#' sessions); elsewhere, download it once with
#' `chromote::chrome_versions_add("latest-stable", "chrome-headless-shell")`.
#'
#' The browser is started on the first export and reused for later ones.
#' LaTeX (see [TeX()]) is typeset with MathJax, loaded from a CDN. PDF is made
#' by printing the SVG image to a page of the figure's size; EPS is converted
#' from the SVG image with the rsvg package.
#'
#' `chrome_exporter()` returns an exporter of its own, whose
#' `transform(p, file, ...)` function writes images; call its `shutdown()`
#' function when done.
#'
#' @param p A [go_figure()], a figure from a `px_*()` function or a
#'   plotly htmlwidget (anything [as_widget()] accepts).
#' @param file Output file; the format is taken from the extension (`.png`,
#'   `.jpeg`, `.jpg`, `.webp`, `.svg`, `.pdf` or `.eps`).
#' @param ... Unused.
#' @param width,height Image size in pixels. Default: the figure's layout
#'   width and height, or 700 x 500.
#' @param scale Multiplier for the image resolution (e.g. 2 for high-DPI
#'   PNGs).
#' @return `save_image()` returns `file` invisibly. `chrome_exporter()`
#'   returns an exporter with `transform()` and `shutdown()` functions.
#' @export
#' @examples
#' \dontrun{
#' fig <- px_data_iris() |> px_scatter(x = ~sepal_width, y = ~sepal_length, color = ~species)
#' save_image(fig, tempfile(fileext = ".png"), width = 800, height = 500, scale = 2)
#' save_image(fig, tempfile(fileext = ".svg"))
#' }
save_image <- function(
  p,
  file,
  ...,
  width = NULL,
  height = NULL,
  scale = NULL
) {
  shared_chrome_exporter()$transform(
    p,
    file,
    width = width,
    height = height,
    scale = scale
  )
  invisible(file)
}

# One Chrome for the session, started on first use (starting Chrome takes
# about a second; each export after that is quick).
export_env <- new.env(parent = emptyenv())

shared_chrome_exporter <- function() {
  ex <- export_env$chrome
  if (is.null(ex) || !chrome_alive(ex)) {
    ex <- chrome_exporter()
    export_env$chrome <- ex
  }
  ex
}

chrome_alive <- function(ex) {
  isTRUE(tryCatch(ex$alive(), error = function(e) FALSE))
}

# Whether a browser is there for export, without offering a download.
chrome_available <- function() {
  isTRUE(tryCatch(check_chromote(), error = function(e) FALSE)) &&
    !is.null(chrome_found())
}

# Figure JSON as the widget would render it (data, layout with template, config).
figure_json <- function(p) {
  x <- as_widget(p)$x
  as.character(to_JSON(x[c("data", "layout", "config")]))
}

image_format <- function(file) {
  fmt <- tolower(tools::file_ext(file))
  if (fmt == "jpg") {
    fmt <- "jpeg"
  }
  if (!fmt %in% c("png", "jpeg", "webp", "svg", "pdf", "eps")) {
    stop(
      sprintf(
        "Unsupported image format '%s'; use .png, .jpeg, .webp, .svg, .pdf or .eps",
        fmt
      ),
      call. = FALSE
    )
  }
  fmt
}

plotlyjs_bundle_path <- function() {
  system.file(
    "htmlwidgets",
    "lib",
    "plotlyjs",
    "plotly.min.js",
    package = "plotly.core"
  )
}
