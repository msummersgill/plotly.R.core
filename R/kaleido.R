# Static image export with Kaleido (via reticulate), like the legacy plotly
# package's save_image()/kaleido(). Supports Kaleido >= 1.0 (write_fig_sync)
# and the older 0.2 API (PlotlyScope).

#' Save a figure as a static image
#'
#' Exports a figure to PNG, JPEG, WebP, SVG or PDF with the Python
#' [Kaleido](https://github.com/plotly/Kaleido) package, using the plotly.js
#' bundled with this package. Requires the reticulate package and a Python
#' installation with `kaleido` (Kaleido 1.x also needs `plotly` and a Chrome
#' browser): `reticulate::py_install(c("kaleido", "plotly"))`.
#'
#' `kaleido()` returns an exporter whose `transform(p, file, ...)` function
#' writes images; reuse it to export many figures without restarting
#' Kaleido.
#'
#' @param p A [go_figure()], a figure from a `px_*()` function or a
#'   [plot_ly()] object.
#' @param file Output file; the format is taken from the extension (`.png`,
#'   `.jpeg`, `.jpg`, `.webp`, `.svg` or `.pdf`).
#' @param ... Unused.
#' @param width,height Image size in pixels. Default: the figure's layout
#'   width and height, or 700 x 500.
#' @param scale Multiplier for the image resolution (e.g. 2 for high-DPI
#'   PNGs).
#' @return `save_image()` returns `file` invisibly. `kaleido()` returns a
#'   list with `transform()` and `shutdown()` functions.
#' @export
#' @examples
#' \dontrun{
#' fig <- px_data_iris() |> px_scatter(x = ~sepal_width, y = ~sepal_length, color = ~species)
#' save_image(fig, tempfile(fileext = ".png"), width = 800, height = 500, scale = 2)
#' save_image(fig, tempfile(fileext = ".svg"))
#' }
save_image <- function(p, file, ..., width = NULL, height = NULL, scale = NULL) {
  kaleido()$transform(p, file, width = width, height = height, scale = scale)
  invisible(file)
}

#' @rdname save_image
#' @export
kaleido <- function(...) {
  if (!requireNamespace("reticulate", quietly = TRUE)) {
    stop("Static image export needs the reticulate package: install.packages(\"reticulate\")", call. = FALSE)
  }
  if (!reticulate::py_available(TRUE)) {
    stop("reticulate wasn't able to find a Python environment. Use reticulate::use_python() to point it ",
         "to an existing installation, or reticulate::install_python().", call. = FALSE)
  }
  k <- tryCatch(reticulate::import("kaleido"), error = function(e) {
    stop("The `kaleido` Python package is required for static image export. ",
         "Install it with reticulate::py_install(c(\"kaleido\", \"plotly\")).", call. = FALSE)
  })
  if (!reticulate::py_module_available("plotly")) {
    stop("Kaleido needs the `plotly` Python package. Install it with reticulate::py_install(\"plotly\").", call. = FALSE)
  }
  res <- if (reticulate::py_has_attr(k, "write_fig_sync")) kaleido_v1(k) else kaleido_legacy(k)
  class(res) <- "kaleidoScope"
  res
}

#' @export
print.kaleidoScope <- function(x, ...) {
  cat("<kaleido exporter>\n$transform: function(p, file, width = NULL, height = NULL, scale = NULL)\n$shutdown: function()\n")
  invisible(x)
}

# Figure JSON as the widget would render it (data, layout with template, config).
figure_json <- function(p) {
  x <- as_widget(p)$x
  as.character(to_JSON(x[c("data", "layout", "config")]))
}

image_format <- function(file) {
  fmt <- tolower(tools::file_ext(file))
  if (fmt == "jpg") fmt <- "jpeg"
  if (!fmt %in% c("png", "jpeg", "webp", "svg", "pdf", "eps")) {
    stop(sprintf("Unsupported image format '%s'; use .png, .jpeg, .webp, .svg or .pdf", fmt), call. = FALSE)
  }
  fmt
}

plotlyjs_bundle_path <- function() {
  system.file("htmlwidgets", "lib", "plotlyjs", "plotly.min.js", package = "plotly.R.core")
}

kaleido_v1 <- function(k) {
  force(k)
  list(
    transform = function(p, file, ..., width = NULL, height = NULL, scale = NULL) {
      fig <- reticulate::import("json")$loads(figure_json(p))
      opts <- compact(list(format = image_format(file), width = width, height = height, scale = scale))
      k$write_fig_sync(fig, path = normalizePath(file, mustWork = FALSE), opts = opts,
                       kopts = list(plotlyjs = plotlyjs_bundle_path()))
      invisible(file)
    },
    shutdown = function() invisible(NULL)
  )
}

kaleido_legacy <- function(k) {
  # convert = FALSE keeps transform()'s result as Python bytes for writing
  scope <- reticulate::import("kaleido.scopes.plotly", convert = FALSE)$PlotlyScope(plotlyjs = plotlyjs_bundle_path())
  json <- reticulate::import("json")
  res <- list2env(list(
    scope = scope,
    transform = function(p, file, ..., width = NULL, height = NULL, scale = NULL) {
      bytes <- scope$transform(json$loads(figure_json(p)), format = image_format(file),
                               width = width, height = height, scale = scale)
      con <- reticulate::import_builtins(convert = FALSE)$open(normalizePath(file, mustWork = FALSE), "wb")
      con$write(bytes)
      con$close()
      invisible(file)
    },
    shutdown = function() try(scope$`__del__`(), silent = TRUE)
  ))
  reg.finalizer(res, function(x) x$shutdown(), onexit = TRUE)
  res
}
