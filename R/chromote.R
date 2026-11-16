# Static image export with headless Chrome via chromote: plotly.js's own
# Plotly.toImage() in a page that loads the bundled plotly.js. PDF is made by
# printing the SVG image to a page of the figure's size (as plotly's Kaleido
# does), EPS by converting the SVG image with rsvg.

# the MathJax the widget loads with config(mathjax = "cdn")
MATHJAX_URL <- "https://cdn.jsdelivr.net/npm/mathjax@3.2.2/es5/tex-svg.js"

#' @rdname save_image
#' @export
chrome_exporter <- function(...) {
  if (!requireNamespace("chromote", quietly = TRUE)) {
    stop(
      "Static image export with Chrome needs the chromote package: ",
      "install.packages(\"chromote\")",
      call. = FALSE
    )
  }
  chrome <- find_export_chrome()

  page <- tempfile("plotly-core-export-", fileext = ".html")
  writeLines(
    c(
      "<!DOCTYPE html>",
      "<html><head><meta charset=\"utf-8\">",
      "<style>html,body{margin:0;padding:0;background:transparent}</style>",
      sprintf(
        "<script src=\"%s\"></script>",
        file_url(plotlyjs_bundle_path())
      ),
      "</head><body><div id=\"plot\"></div></body></html>"
    ),
    page
  )

  # Chrome uses the GPU for WebGL traces (scattergl, 3D, maps) where it can;
  # where it can't (no GPU, --disable-gpu on Linux), SwiftShader renders them
  # in software, which recent Chrome only allows with this flag.
  browser <- chromote::Chrome$new(
    path = chrome,
    args = c(chromote::default_chrome_args(), "--enable-unsafe-swiftshader")
  )
  cm <- chromote::Chromote$new(browser = browser)
  session <- cm$new_session(wait_ = TRUE)
  session$Page$enable()
  loaded <- session$Page$loadEventFired(wait_ = FALSE)
  session$Page$navigate(file_url(page), wait_ = FALSE)
  session$wait_for(loaded)
  if (!isTRUE(js_eval(session, "typeof Plotly === 'object'"))) {
    stop("plotly.js failed to load in Chrome", call. = FALSE)
  }

  state <- new.env(parent = emptyenv())
  state$mathjax <- FALSE
  res <- list2env(list(
    transform = function(
      p,
      file,
      ...,
      width = NULL,
      height = NULL,
      scale = NULL
    ) {
      chrome_transform(session, state, p, file, width, height, scale)
    },
    alive = function() {
      isTRUE(js_eval(session, "typeof Plotly === 'object'"))
    },
    shutdown = function() {
      try(session$close(), silent = TRUE)
      try(cm$close(), silent = TRUE)
      unlink(page)
      invisible(NULL)
    }
  ))
  reg.finalizer(res, function(x) x$shutdown(), onexit = TRUE)
  class(res) <- "chromeExporter"
  res
}

#' @export
print.chromeExporter <- function(x, ...) {
  cat(
    "<Chrome image exporter>\n$transform: function(p, file, width = NULL, height = NULL, scale = NULL)\n$shutdown: function()\n"
  )
  invisible(x)
}

# Browser lookup ------------------------------------------------------------

# A Chrome for export, without downloading: the one chromote finds (an
# installed Chrome, or CHROMOTE_CHROME), else a Chrome Headless Shell that
# chromote downloaded earlier. NULL if there is none.
chrome_found <- function() {
  path <- tryCatch(
    suppressMessages(chromote::find_chrome()),
    error = function(e) NULL
  )
  if (length(path) && nzchar(path) && file.exists(path)) {
    return(path)
  }
  cached <- tryCatch(
    chromote::chrome_versions_list("installed", "chrome-headless-shell"),
    error = function(e) NULL
  )
  if (NROW(cached)) {
    paths <- cached$path[file.exists(cached$path)]
    if (length(paths)) return(paths[[length(paths)]])
  }
  NULL
}

# The Chrome to export with. If there is none, an interactive session is
# asked whether to download Chrome Headless Shell (with chromote); otherwise
# it's an error saying how to get one.
find_export_chrome <- function(
  find = chrome_found,
  ask = interactive(),
  confirm = utils::askYesNo,
  download = function() {
    chromote::chrome_versions_add("latest-stable", "chrome-headless-shell")
  }
) {
  path <- find()
  if (!is.null(path)) {
    return(path)
  }
  how <- paste0(
    "Install Chrome, set the CHROMOTE_CHROME environment variable to a ",
    "Chrome or Chromium binary, or download Chrome Headless Shell with ",
    "chromote::chrome_versions_add(\"latest-stable\", \"chrome-headless-shell\")."
  )
  if (!ask) {
    stop(
      "Static image export needs Chrome, which wasn't found. ",
      how,
      call. = FALSE
    )
  }
  ok <- confirm(paste0(
    "Static image export needs Chrome, which wasn't found. Download Chrome ",
    "Headless Shell (about 100 MB, from Google's Chrome for Testing) to ",
    "chromote's cache? It is reused by later sessions."
  ))
  if (!isTRUE(ok)) {
    stop("No Chrome for static image export. ", how, call. = FALSE)
  }
  path <- download()
  if (is.null(path) || !file.exists(path)) {
    stop("Downloading Chrome Headless Shell failed. ", how, call. = FALSE)
  }
  path
}

# Export ----------------------------------------------------------------------

chrome_transform <- function(session, state, p, file, width, height, scale) {
  fmt <- image_format(file)
  if (fmt == "eps" && !requireNamespace("rsvg", quietly = TRUE)) {
    stop(
      "EPS export needs the rsvg package: install.packages(\"rsvg\")",
      call. = FALSE
    )
  }
  json <- figure_json(p)
  if (!state$mathjax && uses_mathjax(json)) {
    state$mathjax <- chrome_load_mathjax(session)
  }
  layout <- jsonlite::fromJSON(json, simplifyVector = FALSE)$layout
  width <- width %||% layout$width %||% 700
  height <- height %||% layout$height %||% 500
  scale <- scale %||% 1
  # toImage has no PDF or EPS: make an SVG, then print it or convert it
  img_fmt <- if (fmt %in% c("pdf", "eps")) "svg" else fmt

  out <- js_eval(
    session,
    sprintf(
      "(async function () {
        var fig = %s;
        var gd = document.getElementById('plot');
        await Plotly.newPlot(gd, fig.data, fig.layout, fig.config);
        var url = await Plotly.toImage(gd, {format: '%s', width: %s, height: %s, scale: %s});
        Plotly.purge(gd);
        var i = url.indexOf(',');
        return url.slice(0, i).indexOf(';base64') >= 0 ?
          {base64: true, data: url.slice(i + 1)} :
          {base64: false, data: decodeURIComponent(url.slice(i + 1))};
      })()",
      json,
      img_fmt,
      width,
      height,
      scale
    )
  )

  file <- normalizePath(file, mustWork = FALSE)
  if (fmt == "pdf") {
    writeBin(chrome_svg_to_pdf(session, out$data, width, height), file)
  } else if (fmt == "eps") {
    rsvg::rsvg_eps(
      charToRaw(enc2utf8(out$data)),
      file,
      width = width * scale,
      height = height * scale
    )
  } else if (isTRUE(out$base64)) {
    writeBin(base64enc::base64decode(out$data), file)
  } else {
    writeLines(enc2utf8(out$data), file, useBytes = TRUE)
  }
  invisible(file)
}

# plotly.js typesets strings that start and end with "$" (see TeX()) when
# MathJax is loaded.
uses_mathjax <- function(json) {
  grepl("\"\\$[^\"]*\\$\"", json)
}

# Load MathJax 3 (as the widget's config(mathjax = "cdn") does) into the page,
# once. Without network access, LaTeX is left as text, with a warning.
chrome_load_mathjax <- function(session) {
  ok <- tryCatch(
    js_eval(
      session,
      sprintf(
        "new Promise(function (resolve, reject) {
          window.MathJax = {startup: {typeset: false}};
          var s = document.createElement('script');
          s.src = '%s';
          s.onload = function () {
            MathJax.startup.promise.then(function () { resolve(true); }, reject);
          };
          s.onerror = function () { reject(new Error('MathJax could not be loaded')); };
          document.head.appendChild(s);
          setTimeout(function () { reject(new Error('MathJax timed out')); }, 20000);
        })",
        MATHJAX_URL
      )
    ),
    error = function(e) FALSE
  )
  if (!isTRUE(ok)) {
    warning(
      "MathJax couldn't be loaded from ",
      MATHJAX_URL,
      ", so LaTeX is exported as plain text.",
      call. = FALSE
    )
  }
  # don't retry on every figure
  TRUE
}

# Print an SVG to a one-page PDF of the same size (CSS px are 1/96 inch).
chrome_svg_to_pdf <- function(session, svg, width, height) {
  js_eval(
    session,
    sprintf(
      "new Promise(function (resolve, reject) {
        var img = new Image();
        img.onload = function () { resolve(true); };
        img.onerror = function () { reject(new Error('SVG failed to load')); };
        img.style.display = 'block';
        img.style.width = '%1$spx';
        img.style.height = '%2$spx';
        img.src = 'data:image/svg+xml;base64,%3$s';
        document.body.replaceChildren(img);
      })",
      width,
      height,
      base64enc::base64encode(charToRaw(enc2utf8(svg)))
    )
  )
  on.exit(js_eval(
    session,
    "document.body.innerHTML = '<div id=\"plot\"></div>'; true"
  ))
  pdf <- session$Page$printToPDF(
    printBackground = TRUE,
    paperWidth = width / 96,
    paperHeight = height / 96,
    marginTop = 0,
    marginBottom = 0,
    marginLeft = 0,
    marginRight = 0,
    pageRanges = "1"
  )
  base64enc::base64decode(pdf$data)
}

js_eval <- function(session, expr) {
  res <- session$Runtime$evaluate(
    expr,
    awaitPromise = TRUE,
    returnByValue = TRUE
  )
  if (!is.null(res$exceptionDetails)) {
    msg <- res$exceptionDetails$exception$description %||%
      res$exceptionDetails$text
    stop("Chrome image export failed: ", msg, call. = FALSE)
  }
  res$result$value
}

file_url <- function(path) {
  path <- normalizePath(path, winslash = "/", mustWork = FALSE)
  paste0(
    if (startsWith(path, "/")) "file://" else "file:///",
    utils::URLencode(path)
  )
}
