library(plotly.core)

# Finding a browser: no prompt outside interactive sessions; in them, a
# download only after a yes.
none <- function() NULL
err <- function(expr) {
  tryCatch(
    {
      expr
      ""
    },
    error = conditionMessage
  )
}
downloaded <- FALSE
dl <- function() {
  downloaded <<- TRUE
  file.path(R.home("bin"), "R")
}
stopifnot(identical(
  plotly.core:::find_export_chrome(find = function() "/chrome"),
  "/chrome"
))
msg <- err(plotly.core:::find_export_chrome(
  find = none,
  ask = FALSE,
  confirm = function(...) stop("asked"),
  download = dl
))
stopifnot(grepl("wasn't found", msg), grepl("chrome_versions_add", msg))
msg <- err(plotly.core:::find_export_chrome(
  find = none,
  ask = TRUE,
  confirm = function(...) FALSE,
  download = dl
))
stopifnot(grepl("No Chrome", msg), !downloaded)
stopifnot(identical(
  plotly.core:::find_export_chrome(
    find = none,
    ask = TRUE,
    confirm = function(...) TRUE,
    download = dl
  ),
  dl()
))

# LaTeX detection
stopifnot(
  plotly.core:::uses_mathjax('{"title":{"text":"$\\\\alpha^2$"}}'),
  !plotly.core:::uses_mathjax('{"title":{"text":"costs $5 or $6"}}')
)

# Exports start a browser, so only run them off CRAN, where Chrome is found.
if (
  identical(Sys.getenv("NOT_CRAN"), "true") &&
    requireNamespace("chromote", quietly = TRUE) &&
    plotly.core:::chrome_available()
) {
  dir <- tempfile("save-image-")
  dir.create(dir)
  path <- function(x) file.path(dir, x)
  starts_with <- function(f, magic) {
    identical(readBin(f, "raw", length(magic)), magic)
  }

  # one marker per trace: length-1 arrays must survive the export
  fig <- px_scatter(
    data.frame(x = c(1, 2, 3), y = c(3, 1, 2), g = c("a", "b", "c")),
    x = ~x,
    y = ~y,
    color = ~g
  )
  save_image(fig, path("f.svg"))
  svg <- paste(readLines(path("f.svg"), warn = FALSE), collapse = "\n")
  stopifnot(lengths(regmatches(svg, gregexpr('class="point"', svg))) == 3)

  save_image(fig, path("f.png"), width = 400, height = 300, scale = 2)
  stopifnot(starts_with(path("f.png"), as.raw(c(0x89, 0x50, 0x4e, 0x47))))
  if (requireNamespace("png", quietly = TRUE)) {
    stopifnot(identical(dim(png::readPNG(path("f.png")))[1:2], c(600L, 800L)))
  }
  save_image(fig, path("f.jpg"))
  stopifnot(starts_with(path("f.jpg"), as.raw(c(0xff, 0xd8, 0xff))))
  save_image(fig, path("f.webp"))
  stopifnot(starts_with(path("f.webp"), charToRaw("RIFF")))
  save_image(fig, path("f.pdf"))
  stopifnot(starts_with(path("f.pdf"), charToRaw("%PDF")))
  if (requireNamespace("rsvg", quietly = TRUE)) {
    save_image(fig, path("f.eps"))
    stopifnot(starts_with(path("f.eps"), charToRaw("%!PS-Adobe")))
  }
  stopifnot(grepl("Unsupported", err(save_image(fig, path("f.tiff")))))

  # WebGL and date-time axes
  gl <- go_figure() |>
    add_scattergl(
      x = seq(
        as.POSIXct("2024-01-01", tz = "UTC"),
        by = "1 min",
        length.out = 1000
      ),
      y = cumsum(rnorm(1000))
    )
  save_image(gl, path("gl.png"))
  stopifnot(file.size(path("gl.png")) > 10000)

  # LaTeX is typeset by MathJax (when the CDN can be reached)
  tex <- go_figure() |>
    add_scatter(x = 1:3, y = 1:3) |>
    update_layout(title = list(text = TeX("\\alpha^2 + \\beta")))
  warned <- FALSE
  withCallingHandlers(
    save_image(tex, path("tex.svg")),
    warning = function(w) {
      warned <<- TRUE
      invokeRestart("muffleWarning")
    }
  )
  if (!warned) {
    svg <- paste(readLines(path("tex.svg"), warn = FALSE), collapse = "\n")
    stopifnot(grepl("-math-group", svg), !grepl(">$\\alpha", svg, fixed = TRUE))
  }

  plotly.core:::export_env$chrome$shutdown()
}
