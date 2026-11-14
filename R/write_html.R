#' Write a figure to an HTML file
#'
#' Saves a figure as a standalone web page, like [htmlwidgets::saveWidget()]
#' (and plotly.py's `fig.write_html()`), but faster for figures with a lot of
#' data: the page is laid out by htmlwidgets as usual, while the figure's data
#' is written to the file directly, rather than passed through htmltools as
#' one long string, which is scanned and copied several times. For a heatmap
#' of 4 million values this takes a fraction of the time `saveWidget()` does.
#'
#' The page is the same as `saveWidget()` writes, except that with
#' `selfcontained = TRUE` the files the page needs (plotly.js, htmlwidgets
#' and so on) are embedded as base64 data URIs by `write_html()` itself,
#' without needing pandoc.
#'
#' @param fig A figure (e.g. from [go_figure()] or [px_scatter()]) or a
#'   plotly.core widget (e.g. from [plotly_widget()], or a figure from
#'   plotly's `plot_ly()`).
#' @param file Path of the HTML file to write.
#' @param selfcontained Whether to embed the files the page needs in it, so
#'   that the file works on its own. Otherwise they are written to `libdir`.
#' @param libdir Directory for those files when `selfcontained = FALSE`,
#'   relative to the directory of `file` (default: `<name of file>_files`).
#' @param background Background color of the page.
#' @param title Title of the page (default: the widget's name).
#' @return `file`, invisibly.
#' @seealso [htmlwidgets::saveWidget()], [save_image()] for static images.
#' @export
#' @examples
#' fig <- go_figure() |> add_heatmap(z = as_float32(volcano))
#' f <- tempfile(fileext = ".html")
#' write_html(fig, f)
write_html <- function(fig, file, selfcontained = TRUE, libdir = NULL,
                       background = "white", title = NULL) {
  w <- if (inherits(fig, "htmlwidget")) fig else as_widget(fig)
  # as htmlwidgets does when rendering, so its result is what's written
  if (is.function(w$preRenderHook)) {
    w <- w$preRenderHook(w)
    w$preRenderHook <- NULL
  }
  title <- title %||% class(w)[[1]]
  to_json <- attr(w$x, "TOJSON_FUNC", exact = TRUE)
  if (!is.function(to_json)) {
    # not a plotly.core widget: nothing to gain
    htmlwidgets::saveWidget(w, file, selfcontained = selfcontained, libdir = libdir,
                            background = background, title = title)
    return(invisible(file))
  }
  json_args <- attr(w$x, "TOJSON_ARGS", exact = TRUE) %||% getOption("htmlwidgets.TOJSON_ARGS")

  # htmlwidgets writes the page with a placeholder for the data, keeping
  # the payload it would have serialised
  token <- basename(tempfile("plotly-core-payload-"))
  payload <- NULL
  attr(w$x, "TOJSON_FUNC") <- function(x, ...) {
    payload <<- x
    token
  }
  if (selfcontained) {
    tmp <- tempfile("plotly-core-html-")
    dir.create(tmp)
    on.exit(unlink(tmp, recursive = TRUE), add = TRUE)
    page <- file.path(tmp, "index.html")
    htmlwidgets::saveWidget(w, page, selfcontained = FALSE, libdir = "lib",
                            background = background, title = title)
  } else {
    page <- file
    htmlwidgets::saveWidget(w, page, selfcontained = FALSE, libdir = libdir,
                            background = background, title = title)
  }
  html <- readChar(page, file.size(page), useBytes = TRUE)
  parts <- strsplit(html, token, fixed = TRUE)[[1]]
  if (length(parts) != 2 || is.null(payload)) {
    stop("Couldn't find where to write the figure's data in the page.", call. = FALSE)
  }
  if (selfcontained) parts <- vapply(parts, embed_files, "", dir = tmp, USE.NAMES = FALSE)

  attr(payload$x, "TOJSON_FUNC") <- to_json
  json <- if (length(json_args)) do.call(to_json, c(list(x = payload), json_args)) else to_json(payload)
  # as htmlwidgets does, so the data can't end its <script> element
  if (grepl("</", json, fixed = TRUE)) json <- gsub("</", "\\u003c/", json, fixed = TRUE)

  con <- base::file(file, open = "wb")
  on.exit(close(con), add = TRUE)
  writeChar(parts[[1]], con, eos = NULL, useBytes = TRUE)
  writeChar(json, con, eos = NULL, useBytes = TRUE)
  writeChar(parts[[2]], con, eos = NULL, useBytes = TRUE)
  invisible(file)
}

# Replace the src/href of <script> and <link> elements referring to local
# files (under `dir`) with base64 data URIs, and in stylesheets, url()s of
# local files too.
embed_files <- function(html, dir) {
  refs <- unique(regmatches(html, gregexpr('<(script|link)\\b[^>]*\\b(src|href)="[^"]+"', html))[[1]])
  for (ref in refs) {
    path <- sub('.*\\b(src|href)="([^"]+)"$', "\\2", ref)
    f <- file.path(dir, utils::URLdecode(path))
    if (grepl("^[A-Za-z][A-Za-z0-9+.-]*:", path) || !file.exists(f)) next
    uri <- data_uri(f, embed_urls = grepl("\\.css$", f, ignore.case = TRUE))
    html <- gsub(ref, sub(paste0('"', path, '"'), paste0('"', uri, '"'), ref, fixed = TRUE),
                 html, fixed = TRUE)
  }
  html
}

data_uri <- function(f, embed_urls = FALSE) {
  type <- switch(tolower(sub(".*\\.", "", basename(f))),
    js = , mjs = "application/javascript", css = "text/css", json = "application/json",
    svg = "image/svg+xml", png = "image/png", gif = "image/gif", jpg = , jpeg = "image/jpeg",
    woff = "font/woff", woff2 = "font/woff2", ttf = "font/ttf", eot = "application/vnd.ms-fontobject",
    "application/octet-stream"
  )
  if (embed_urls) {
    css <- readChar(f, file.size(f), useBytes = TRUE)
    urls <- unique(regmatches(css, gregexpr("url\\(\\s*['\"]?[^'\")]+['\"]?\\s*\\)", css))[[1]])
    for (u in urls) {
      path <- gsub("^url\\(\\s*['\"]?|['\"]?\\s*\\)$", "", u)
      g <- file.path(dirname(f), utils::URLdecode(sub("[?#].*$", "", path)))
      if (grepl("^([A-Za-z][A-Za-z0-9+.-]*:|#)", path) || !file.exists(g)) next
      css <- gsub(u, paste0('url("', data_uri(g), '")'), css, fixed = TRUE)
    }
    return(paste0("data:", type, ";base64,", base64enc::base64encode(charToRaw(css))))
  }
  paste0("data:", type, ";base64,", base64enc::base64encode(f))
}
