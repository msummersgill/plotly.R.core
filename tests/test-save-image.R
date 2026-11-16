library(plotly.core)

# Finding a browser: set-up (no browser, or missing libraries that can be
# downloaded) is offered once as install_chrome() in interactive sessions;
# never run without a yes
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
installed <- FALSE
inst <- function() {
  installed <<- TRUE
  "/downloaded/chrome"
}
fec <- function(...) {
  plotly.core:::find_export_chrome(
    ...,
    install = inst,
    can_fetch = function() TRUE
  )
}
nolibs <- function(path) character()
gbm <- function(path) "libgbm.so.1"
# a browser with everything it needs: no question
stopifnot(identical(
  fec(
    find = function() "/chrome",
    missing_libs = nolibs,
    confirm = function(...) stop("asked")
  ),
  "/chrome"
))
# no browser, not interactive: an error pointing to install_chrome()
msg <- err(fec(find = none, ask = FALSE, confirm = function(...) stop("asked")))
stopifnot(
  grepl("wasn't found", msg),
  grepl("plotly.core::install_chrome()", msg, fixed = TRUE),
  !installed
)
# no browser, interactive: one question, install_chrome() only after a yes
asked <- NULL
msg <- err(fec(find = none, ask = TRUE, confirm = function(m) {
  asked <<- m
  FALSE
}))
stopifnot(
  grepl("No Chrome", msg),
  grepl("install_chrome()", asked, fixed = TRUE),
  grepl("Chrome Headless Shell", asked),
  !installed
)
stopifnot(
  identical(
    fec(find = none, ask = TRUE, confirm = function(...) TRUE),
    "/downloaded/chrome"
  ),
  installed
)
# a browser missing libraries: the question names them
installed <- FALSE
asked <- NULL
got <- fec(
  find = function() "/chrome",
  missing_libs = gbm,
  ask = TRUE,
  confirm = function(m) {
    asked <<- m
    TRUE
  }
)
stopifnot(
  identical(got, "/downloaded/chrome"),
  grepl("libgbm.so.1", asked),
  installed
)
# declined, or not interactive: the browser, for ensure_chrome_libs() to report
installed <- FALSE
stopifnot(
  identical(
    fec(
      find = function() "/chrome",
      missing_libs = gbm,
      ask = TRUE,
      confirm = function(...) FALSE
    ),
    "/chrome"
  ),
  identical(
    fec(find = function() "/chrome", missing_libs = gbm, ask = FALSE),
    "/chrome"
  ),
  !installed
)
# libraries that can't be downloaded here: no question
stopifnot(identical(
  plotly.core:::find_export_chrome(
    find = function() "/chrome",
    missing_libs = gbm,
    can_fetch = function() FALSE,
    ask = TRUE,
    confirm = function(...) stop("asked"),
    install = inst
  ),
  "/chrome"
))

# chromote 0.5.0 or later (Chrome Headless Shell downloads)
chk <- plotly.core:::check_chromote
stopifnot(
  isTRUE(chk(package_version("0.5.1"))),
  grepl("0.5.0 or later", err(chk(package_version("0.3.1")))),
  grepl("install.packages", err(chk(NULL)))
)

# LaTeX detection
stopifnot(
  plotly.core:::uses_mathjax('{"title":{"text":"$\\\\alpha^2$"}}'),
  !plotly.core:::uses_mathjax('{"title":{"text":"costs $5 or $6"}}')
)

# Startup checks: missing shared libraries (Linux) and Chrome's own errors
ldd <- c(
  "\tlinux-vdso.so.1 (0x00007ffd)",
  "\tlibnss3.so => not found",
  "\tlibgbm.so.1 => not found",
  "\tlibfoo.so.9 => not found",
  "\tlibc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f)"
)
stopifnot(identical(
  plotly.core:::chrome_missing_libs("chrome", ldd),
  c("libnss3.so", "libgbm.so.1", "libfoo.so.9")
))
osr <- function(...) {
  f <- tempfile()
  writeLines(c(...), f)
  f
}
fam <- plotly.core:::linux_family
stopifnot(
  identical(fam(osr('ID=ubuntu', 'ID_LIKE=debian')), "debian"),
  identical(fam(osr('ID="rocky"', 'ID_LIKE="rhel centos fedora"')), "rhel"),
  identical(fam(osr('ID=alpine')), "alpine"),
  is.na(fam(osr('ID=gentoo'))),
  is.na(fam(tempfile()))
)
hint <- plotly.core:::lib_install_hint
stopifnot(
  identical(
    hint(c("libnss3.so", "libgbm.so.1"), "debian"),
    "sudo apt-get install -y libnss3 libgbm1"
  ),
  identical(
    hint(c("libnss3.so", "libgbm.so.1"), "rhel"),
    "sudo dnf install -y nss mesa-libgbm"
  ),
  any(grepl("apt-file search", hint("libfoo.so.9", "debian"))),
  grepl("Alpine", hint("libnss3.so", "alpine")),
  length(hint("libnss3.so", NA)) == 2L # both families when unknown
)
ens <- plotly.core:::ensure_chrome_libs
need <- c("libxkbcommon.so.0", "libgbm.so.1")
# nothing missing: the downloaded library directories (none here)
stopifnot(identical(
  ens("/x/chrome", missing = function(lp) character()),
  plotly.core:::chrome_lib_path()
))
# missing, and the libraries can be downloaded: offered in interactive
# sessions, then Chrome gets the download directories
asked <- NULL
got <- ens(
  "/x/chrome",
  ask = TRUE,
  confirm = function(msg) {
    asked <<- msg
    TRUE
  },
  missing = function(lp) if (identical(lp, "/dl")) character() else need,
  fetch = function() "/dl",
  family = "debian",
  fetchable = TRUE
)
stopifnot(
  identical(got, "/dl"),
  grepl("libxkbcommon.so.0, libgbm.so.1", asked, fixed = TRUE),
  grepl("No administrator rights", asked, fixed = TRUE)
)
# not interactive: an error pointing to install_chrome() and the sudo command
msg <- err(ens(
  "/x/chrome",
  ask = FALSE,
  missing = function(lp) need,
  fetch = function() stop("fetched"),
  family = "debian",
  fetchable = TRUE
))
stopifnot(
  grepl("libxkbcommon.so.0, libgbm.so.1", msg, fixed = TRUE),
  grepl("plotly.core::install_chrome()", msg, fixed = TRUE),
  grepl("sudo apt-get install -y libxkbcommon0 libgbm1", msg, fixed = TRUE)
)
# declined, or no package tools to download with: the sudo command only
msg <- err(ens(
  "/x/chrome",
  ask = TRUE,
  confirm = function(msg) FALSE,
  missing = function(lp) need,
  family = "rhel",
  fetchable = TRUE
))
stopifnot(grepl(
  "sudo dnf install -y libxkbcommon mesa-libgbm",
  msg,
  fixed = TRUE
))
msg <- err(ens(
  "/x/chrome",
  ask = TRUE,
  confirm = function(msg) stop("asked"),
  missing = function(lp) need,
  family = "suse",
  fetchable = FALSE
))
stopifnot(!grepl("install_chrome", msg), grepl("Debian/Ubuntu", msg))
# Debian package names, from the table or by Debian's naming rules
stopifnot(identical(
  plotly.core:::debian_packages(c(
    "libxkbcommon.so.0",
    "libwayland-server.so.0",
    "libatk-1.0.so.0",
    "libfoo-2.so.0",
    "libX11-xcb.so.1"
  )),
  c(
    "libxkbcommon0",
    "libwayland-server0",
    "libatk1.0-0",
    "libfoo-2-0",
    "libx11-xcb1"
  )
))
lerr <- plotly.core:::chrome_launch_error
msg <- lerr(
  "/x/chrome",
  character(),
  "Cannot find an available port",
  output = "[0101/000000.0:ERROR:zygote_host_impl_linux.cc(100)] Running as root without --no-sandbox is not supported."
)
stopifnot(
  grepl("failed to start", msg),
  grepl("Running as root", msg),
  grepl("--no-sandbox", msg, fixed = TRUE),
  grepl("set_chrome_args", msg, fixed = TRUE)
)
msg <- lerr(
  "/x/chrome",
  character(),
  "Cannot find an available port",
  output = "/x/chrome: error while loading shared libraries: libnss3.so: cannot open shared object file: No such file or directory"
)
stopifnot(grepl("Missing shared libraries: libnss3.so", msg, fixed = TRUE))

# A Chrome that fails to start: the error shows what it printed (not
# chromote's "Cannot find an available port")
if (
  .Platform$OS.type == "unix" &&
    requireNamespace("chromote", quietly = TRUE) &&
    requireNamespace("processx", quietly = TRUE)
) {
  fake <- tempfile("chrome-")
  writeLines(
    c(
      "#!/bin/sh",
      "echo 'Running as root without --no-sandbox is not supported.' >&2",
      "exit 1"
    ),
    fake
  )
  Sys.chmod(fake, "755")
  old <- Sys.getenv("CHROMOTE_CHROME")
  Sys.setenv(CHROMOTE_CHROME = fake)
  msg <- err(suppressMessages(chrome_exporter()))
  Sys.setenv(CHROMOTE_CHROME = old)
  stopifnot(
    grepl("failed to start", msg),
    grepl("Running as root", msg),
    grepl("set_chrome_args", msg, fixed = TRUE)
  )
}

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
