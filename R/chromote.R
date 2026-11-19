# Static image export with headless Chrome via chromote: plotly.js's own
# Plotly.toImage() in a page that loads the bundled plotly.js. PDF is made by
# printing the SVG image to a page of the figure's size (as plotly's Kaleido
# does), EPS by converting the SVG image with rsvg.

#' @rdname save_image
#' @export
chrome_exporter <- function(...) {
  check_chromote()
  chrome <- find_export_chrome()

  page <- tempfile("plotly-core-export-", fileext = ".html")
  writeLines(
    c(
      "<!DOCTYPE html>",
      "<html><head><meta charset=\"utf-8\">",
      "<style>html,body{margin:0;padding:0;background:transparent}</style>",
      sprintf(
        "<script src=\"%s\"></script>",
        file_url(c(plotlyjs_bundle_path(), codec_js_path()))
      ),
      "</head><body><div id=\"plot\"></div></body></html>"
    ),
    page
  )

  # Chrome uses the GPU for WebGL traces (scattergl, 3D, maps) where it can;
  # where it can't (no GPU, --disable-gpu on Linux), SwiftShader renders them
  # in software, which recent Chrome only allows with this flag.
  # a clear error for what stops Chrome starting (see chrome_check.R)
  # set-up was offered by find_export_chrome(): only check here
  lib_path <- ensure_chrome_libs(chrome, ask = FALSE)
  browser <- chrome_launch(
    chrome,
    # the export page is a local file, and maps (MapLibre) fail to load in
    # one unless file pages may load files
    c(
      chromote::get_chrome_args(),
      "--enable-unsafe-swiftshader",
      "--allow-file-access-from-files"
    ),
    lib_path
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
  state$page <- file_url(page)
  state$reload <- FALSE
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

# chromote 0.5.0 added downloading Chrome Headless Shell (chrome_versions_*()).
check_chromote <- function(
  version = tryCatch(
    utils::packageVersion("chromote"),
    error = function(e) NULL
  )
) {
  if (is.null(version)) {
    stop(
      "Static image export needs the chromote package: ",
      "install.packages(\"chromote\")",
      call. = FALSE
    )
  }
  if (version < "0.5.0") {
    stop(
      "Static image export needs chromote 0.5.0 or later (installed: ",
      version,
      "): install.packages(\"chromote\")",
      call. = FALSE
    )
  }
  invisible(TRUE)
}

# A Chrome for export, without downloading, in this order: the one chromote
# finds (CHROMOTE_CHROME, else an installed Google Chrome), another installed
# Chromium-based browser (Microsoft Edge, which every Windows 10/11 machine
# has, Chromium, Brave; see browser_candidates()), else a Chrome Headless
# Shell that chromote downloaded earlier. NULL if there is none.
chrome_found <- function(
  find_system = function() suppressMessages(chromote::find_chrome()),
  candidates = browser_candidates(),
  downloaded = function() {
    chromote::chrome_versions_list("installed", "chrome-headless-shell")$path
  }
) {
  usable <- function(p) {
    if (!is.character(p) || !length(p)) {
      return(character())
    }
    p <- p[!is.na(p) & nzchar(p)]
    p[file.exists(p) & !dir.exists(p)]
  }
  path <- usable(tryCatch(find_system(), error = function(e) NULL))
  if (length(path)) {
    return(path[[1]])
  }
  path <- usable(candidates)
  if (length(path)) {
    return(path[[1]])
  }
  path <- usable(tryCatch(downloaded(), error = function(e) NULL))
  if (length(path)) {
    return(path[[length(path)]])
  }
  NULL
}

# Installed Chromium-based browsers chromote doesn't look for itself (it
# finds Google Chrome in the standard places), most preferred first.
browser_candidates <- function(
  os = Sys.info()[["sysname"]],
  env = Sys.getenv(),
  registry = windows_app_path,
  which = Sys.which
) {
  if (identical(os, "Windows")) {
    dirs <- function(...) {
      vars <- c(...)
      vals <- unname(env[vars[vars %in% names(env)]])
      vals[nzchar(vals)]
    }
    under <- function(roots, rel) {
      if (length(roots)) {
        file.path(gsub("\\\\", "/", roots), rel)
      } else {
        character()
      }
    }
    c(
      # Chrome installed for the current user only isn't registered where
      # chromote looks (HKEY_LOCAL_MACHINE)
      registry("chrome.exe", "HCU"),
      under(dirs("LOCALAPPDATA"), "Google/Chrome/Application/chrome.exe"),
      registry("msedge.exe", "HLM"),
      registry("msedge.exe", "HCU"),
      under(
        dirs("PROGRAMFILES(X86)", "PROGRAMFILES", "LOCALAPPDATA"),
        "Microsoft/Edge/Application/msedge.exe"
      ),
      under(dirs("LOCALAPPDATA"), "Chromium/Application/chrome.exe"),
      under(
        dirs("PROGRAMFILES", "LOCALAPPDATA"),
        "BraveSoftware/Brave-Browser/Application/brave.exe"
      )
    )
  } else if (identical(os, "Darwin")) {
    apps <- c(
      "Google Chrome.app/Contents/MacOS/Google Chrome",
      "Chromium.app/Contents/MacOS/Chromium",
      "Microsoft Edge.app/Contents/MacOS/Microsoft Edge",
      "Brave Browser.app/Contents/MacOS/Brave Browser"
    )
    home <- if ("HOME" %in% names(env)) env[["HOME"]] else path.expand("~")
    # /Applications/Google Chrome.app is chromote's; the rest, and apps
    # installed for the current user in ~/Applications
    c(
      file.path("/Applications", apps[-1]),
      file.path(home, "Applications", apps)
    )
  } else {
    found <- which(c(
      "chromium",
      "microsoft-edge",
      "microsoft-edge-stable",
      "brave-browser"
    ))
    unname(found[nzchar(found)])
  }
}

# A Windows "App Paths" registry entry (where installers register browsers).
windows_app_path <- function(exe, hive) {
  tryCatch(
    utils::readRegistry(
      paste0(
        "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\App Paths\\",
        exe,
        "\\"
      ),
      hive = hive
    )[["(Default)"]],
    error = function(e) NULL
  )
}

# The Chrome to export with. When set-up is needed (no browser, or on Linux
# shared libraries it lacks that can be downloaded), an interactive session
# is asked once whether to run install_chrome(), which does it all;
# otherwise it's an error saying how to set up. Libraries that can't be
# downloaded are reported by ensure_chrome_libs().
find_export_chrome <- function(
  find = chrome_found,
  missing_libs = function(path) {
    chrome_missing_libs(path, lib_path = chrome_lib_path())
  },
  can_fetch = function() can_fetch_libs(linux_family()),
  ask = interactive(),
  confirm = utils::askYesNo,
  install = install_chrome
) {
  path <- find()
  libs <- if (is.null(path)) character() else missing_libs(path)
  if (!is.null(path) && (!length(libs) || !can_fetch())) {
    return(path)
  }
  how <- paste0(
    "Run plotly.core::install_chrome() once to download Chrome Headless ",
    "Shell (no administrator rights needed), install Chrome, or set the ",
    "CHROMOTE_CHROME environment variable to a Chrome or Chromium binary."
  )
  if (!ask) {
    if (is.null(path)) {
      stop(
        "Static image export needs Chrome, which wasn't found. ",
        how,
        call. = FALSE
      )
    }
    # missing libraries: ensure_chrome_libs() says how to get them
    return(path)
  }
  ok <- confirm(paste0(
    "Static image export needs ",
    if (is.null(path)) {
      paste0(
        "Chrome, which wasn't found. Run plotly.core::install_chrome() to ",
        "download Chrome Headless Shell (about 100 MB, from Google's Chrome ",
        "for Testing) and, on Linux, any shared libraries it needs"
      )
    } else {
      paste0(
        "shared libraries Chrome lacks (",
        paste(libs, collapse = ", "),
        "). Run plotly.core::install_chrome() to download them from your ",
        "system's package repositories"
      )
    },
    "? Downloads are kept in your user cache for later sessions; no ",
    "administrator rights are needed."
  ))
  if (!isTRUE(ok)) {
    if (is.null(path)) {
      stop("No Chrome for static image export. ", how, call. = FALSE)
    }
    return(path)
  }
  install()
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
  # a failed export (an error, or a timeout of a drawing that never finished,
  # e.g. a map that can't load) can leave the page broken: start afresh
  if (isTRUE(state$reload)) {
    chrome_reload_page(session, state)
  }
  fig <- export_figure(p)
  json <- fig$json
  if (!state$mathjax && uses_mathjax(json)) {
    state$mathjax <- chrome_load_mathjax(session)
  }
  layout <- fig$layout
  width <- width %||% layout$width %||% 700
  height <- height %||% layout$height %||% 500
  scale <- scale %||% 1
  # toImage has no PDF or EPS: make an SVG, then print it or convert it
  img_fmt <- if (fmt %in% c("pdf", "eps")) "svg" else fmt

  state$reload <- TRUE
  out <- js_eval(
    session,
    sprintf(
      "(async function () {
        // the figure itself, not a drawn plot: toImage then lays it out at
        // the export size (axis ranges constrained by scaleanchor depend on it)
        // typed arrays, shared arrays and dates decoded as the widget does
        var fig = PlotlyCoreCodec.prepareFigure((%s).x);
        var url = await Plotly.toImage(fig, {format: '%s', width: %s, height: %s, scale: %s});
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

  state$reload <- FALSE
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

# Load the export page again, as when the exporter started.
chrome_reload_page <- function(session, state) {
  loaded <- session$Page$loadEventFired(wait_ = FALSE)
  session$Page$navigate(state$page, wait_ = FALSE)
  session$wait_for(loaded)
  if (!isTRUE(js_eval(session, "typeof Plotly === 'object'"))) {
    stop("plotly.js failed to load in Chrome", call. = FALSE)
  }
  state$mathjax <- FALSE
  state$reload <- FALSE
  invisible()
}

# plotly.js typesets strings that start and end with "$" (see TeX()) when
# MathJax is loaded.
uses_mathjax <- function(json) {
  grepl("\"\\$[^\"]*\\$\"", json)
}

# Load MathJax 3, the copy bundled with the package (as the widget's
# config(mathjax = "local") does), into the page, once.
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
        file_url(mathjax_path())
      )
    ),
    error = function(e) FALSE
  )
  if (!isTRUE(ok)) {
    warning(
      "MathJax couldn't be loaded, so LaTeX is exported as plain text.",
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
    pageRanges = "1",
    timeout_ = export_timeout()
  )
  base64enc::base64decode(pdf$data)
}

# Seconds to wait for Chrome to draw and encode an image (chromote's own
# default, 10 s, is too short for large figures).
export_timeout <- function() {
  getOption("plotly.core.export_timeout", 300)
}

js_eval <- function(session, expr) {
  res <- session$Runtime$evaluate(
    expr,
    awaitPromise = TRUE,
    returnByValue = TRUE,
    timeout_ = export_timeout()
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
    ifelse(startsWith(path, "/"), "file://", "file:///"),
    vapply(path, utils::URLencode, "", USE.NAMES = FALSE)
  )
}
