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

# Browsers other than Google Chrome: Edge (every Windows 10/11 machine),
# Chromium, Brave, and per-user installs
bc <- plotly.core:::browser_candidates
win <- bc(
  os = "Windows",
  env = c(
    LOCALAPPDATA = "C:\\Users\\me\\AppData\\Local",
    `PROGRAMFILES(X86)` = "C:\\Program Files (x86)",
    PROGRAMFILES = "C:\\Program Files"
  ),
  registry = function(exe, hive) {
    if (exe == "msedge.exe" && hive == "HLM") "C:\\Edge\\msedge.exe"
  }
)
stopifnot(
  identical(
    win[1],
    "C:/Users/me/AppData/Local/Google/Chrome/Application/chrome.exe"
  ),
  identical(win[2], "C:\\Edge\\msedge.exe"), # the registry entry, before guesses
  "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" %in% win,
  "C:/Users/me/AppData/Local/Chromium/Application/chrome.exe" %in% win,
  "C:/Program Files/BraveSoftware/Brave-Browser/Application/brave.exe" %in% win
)
mac <- bc(os = "Darwin", env = c(HOME = "/Users/me"))
stopifnot(
  "/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge" %in% mac,
  "/Applications/Chromium.app/Contents/MacOS/Chromium" %in% mac,
  "/Users/me/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" %in%
    mac,
  # /Applications/Google Chrome.app is chromote's own default
  !"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" %in% mac
)
stopifnot(identical(
  bc(os = "Linux", which = function(x) {
    setNames(ifelse(x == "microsoft-edge", "/usr/bin/microsoft-edge", ""), x)
  }),
  "/usr/bin/microsoft-edge"
))
# lookup order: chromote's, then other browsers, then a downloaded shell
cf <- plotly.core:::chrome_found
# an existing file standing in for a browser (any OS: on Windows R's own is R.exe)
exe <- tempfile("browser")
file.create(exe)
stopifnot(
  identical(cf(function() exe, "/nope", function() "/nope"), exe),
  identical(cf(function() NULL, c("/nope", exe), function() "/nope"), exe),
  identical(cf(function() stop("x"), character(), function() exe), exe),
  is.null(cf(function() NULL, "/nope", function() character())),
  # a folder (e.g. an .app bundle's directory) isn't a browser
  is.null(cf(function() R.home(), R.home(), function() NULL))
)

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
# nothing missing on the system: no downloaded libraries are used, even if
# some were downloaded before
stopifnot(identical(
  ens("/x/chrome", missing = function(lp) character(), cached = function() {
    stop("cache used")
  }),
  character()
))
# the system lacks some, the earlier download has them: its directories; when
# they are stale, interactive sessions are asked whether to download again,
# and other sessions get a message (once)
sys_lacks <- function(lp) if (length(lp)) character() else need
stopifnot(identical(
  ens(
    "/x/chrome",
    missing = sys_lacks,
    cached = function() "/cache",
    fetchable = TRUE,
    family = "debian",
    stale = function() FALSE
  ),
  "/cache"
))
asked <- NULL
stopifnot(identical(
  ens(
    "/x/chrome",
    ask = TRUE,
    missing = sys_lacks,
    cached = function() "/cache",
    fetchable = TRUE,
    family = "debian",
    stale = function() TRUE,
    confirm = function(msg) {
      asked <<- msg
      TRUE
    },
    refresh = function() "/fresh"
  ),
  "/fresh"
))
stopifnot(grepl("days old", asked), grepl("again", asked))
stopifnot(identical(
  ens(
    "/x/chrome",
    ask = TRUE,
    missing = sys_lacks,
    cached = function() "/cache",
    fetchable = TRUE,
    family = "debian",
    stale = function() TRUE,
    confirm = function(msg) FALSE,
    refresh = function() stop("refreshed")
  ),
  "/cache"
))
assign("stale_libs_noted", FALSE, envir = plotly.core:::export_env)
msgs <- character()
for (i in 1:2) {
  withCallingHandlers(
    ens(
      "/x/chrome",
      ask = FALSE,
      missing = sys_lacks,
      cached = function() "/cache",
      fetchable = TRUE,
      family = "debian",
      stale = function() TRUE,
      refresh = function() stop("refreshed")
    ),
    message = function(m) {
      msgs <<- c(msgs, conditionMessage(m))
      invokeRestart("muffleMessage")
    }
  )
}
stopifnot(length(msgs) == 1L, grepl("install_chrome()", msgs, fixed = TRUE))

# Staleness: age, and the Chrome they were downloaded for
libdir <- tempfile("libs-")
dir.create(libdir)
chrome <- tempfile("chrome")
writeLines("x", chrome)
stale <- plotly.core:::chrome_libs_stale
stopifnot(stale(chrome, libdir)) # no stamp (downloaded before stamps)
plotly.core:::write_chrome_libs_stamp(chrome, libdir)
stopifnot(
  !stale(chrome, libdir),
  stale(chrome, libdir, today = Sys.Date() + 91),
  !stale(chrome, libdir, max_age = 365, today = Sys.Date() + 91)
)
Sys.sleep(1.1)
writeLines("a new version", chrome)
stopifnot(stale(chrome, libdir)) # Chrome changed
# a refresh's folder isn't pruned while it downloads
root <- tempfile("libs-")
dir.create(file.path(root, "ubuntu-24.04.new"), recursive = TRUE)
dir.create(file.path(root, "ubuntu-22.04"))
plotly.core:::prune_chrome_libs(root, "ubuntu-24.04")
stopifnot(identical(list.files(root), "ubuntu-24.04.new"))
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
# Downloaded libraries are kept per OS release; other releases' are pruned
stopifnot(
  identical(
    plotly.core:::os_release_id(osr('ID=ubuntu', 'VERSION_ID="24.04"')),
    "ubuntu-24.04"
  ),
  identical(
    plotly.core:::os_release_id(osr('ID="rocky"', 'VERSION_ID="9.8"')),
    "rocky-9.8"
  ),
  identical(plotly.core:::os_release_id(tempfile()), "unknown")
)
root <- tempfile("libs-")
dir.create(file.path(root, "ubuntu-22.04"), recursive = TRUE)
dir.create(file.path(root, "ubuntu-24.04"))
stopifnot(
  identical(
    plotly.core:::prune_chrome_libs(root, "ubuntu-24.04"),
    "ubuntu-22.04"
  ),
  identical(list.files(root), "ubuntu-24.04")
)

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
  identical(Sys.getenv("NOT_CRAN"), "true") &&
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

# Fonts: available_fonts() and the warning for fonts that are not installed
if (requireNamespace("systemfonts", quietly = TRUE)) {
  fonts <- available_fonts()
  stopifnot(is.character(fonts), length(fonts) > 0L, !is.unsorted(fonts))
  fig <- go_figure() |>
    add_scatter(
      y = 1:3,
      textfont = go_font(family = "No Such Font Abc, Arial")
    ) |>
    update_layout(
      font = go_font(family = "sans-serif"),
      template = list(layout = list(font = list(family = "Template Only Font")))
    )
  stopifnot(identical(
    plotly.core:::figure_font_families(unclass(fig)[c("data", "layout")]),
    c("No Such Font Abc, Arial", "sans-serif")
  ))
  assign("font_warned", NULL, envir = plotly.core:::the)
  msg <- tryCatch(
    plotly.core:::check_figure_fonts(fig),
    warning = conditionMessage
  )
  stopifnot(grepl('"No Such Font Abc" is not installed', msg))
  if ("arial" %in% tolower(fonts)) {
    stopifnot(grepl('uses "Arial" instead', msg))
  }
  # once a session per font, and nothing for installed or generic fonts
  stopifnot(is.null(tryCatch(
    plotly.core:::check_figure_fonts(fig),
    warning = conditionMessage
  )))
  ok <- go_figure() |>
    update_layout(font = go_font(family = paste(fonts[[1L]], ", serif")))
  stopifnot(is.null(tryCatch(
    plotly.core:::check_figure_fonts(ok),
    warning = conditionMessage
  )))
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

  # date-times and an x shared by traces are sent as typed arrays and decoded
  # in the export page (codec.js), as in the widget: the axis shows the dates
  tt <- as.POSIXct("2024-03-01", tz = "UTC") + (0:47) * 3600
  shared <- go_figure() |>
    add_scatter(x = tt, y = cumsum(rnorm(48))) |>
    add_scatter(x = tt, y = cumsum(rnorm(48)))
  stopifnot(grepl(
    '"bref"',
    plotly.core:::export_figure(shared)$json,
    fixed = TRUE
  ))
  save_image(shared, path("dates.svg"))
  svg <- paste(readLines(path("dates.svg"), warn = FALSE), collapse = "\n")
  stopifnot(grepl("Mar 2", svg, fixed = TRUE), grepl("2024", svg, fixed = TRUE))

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

  # LaTeX is typeset by the bundled MathJax
  tex <- go_figure() |>
    add_scatter(x = 1:3, y = 1:3) |>
    update_layout(title = list(text = TeX("\\alpha^2 + \\beta")))
  save_image(tex, path("tex.svg"))
  svg <- paste(readLines(path("tex.svg"), warn = FALSE), collapse = "\n")
  stopifnot(grepl("-math-group", svg), !grepl(">$\\alpha", svg, fixed = TRUE))

  # maps (MapLibre) draw in the export page, which is a local file
  map_png <- path("map.png")
  save_image(
    go_figure() |>
      add_scattermap(lat = c(45, 46), lon = c(-73, -74)) |>
      update_layout(map = go_map(style = "white-bg")),
    map_png
  )
  stopifnot(file.size(map_png) > 0)

  # a failed export doesn't break the next ones
  bad <- tryCatch(
    plotly.core:::shared_chrome_exporter()$transform(
      go_figure(),
      path("never.png"),
      width = -1
    ),
    error = function(e) "failed"
  )
  stopifnot(identical(bad, "failed"))
  save_image(go_figure() |> add_bar(y = 1:3), path("after.png"))
  stopifnot(file.size(path("after.png")) > 0)

  # knitting without pandoc (R's "Run examples" help pages, knitr::knit()):
  # static images, one file per figure, never a PhantomJS screenshot
  if (requireNamespace("knitr", quietly = TRUE)) {
    old <- setwd(dir)
    rhtml <- c(
      "<html><body>",
      "<!--begin.rcode two-figures",
      "library(plotly.core)",
      "go_figure() |> add_bar(x = 1:2, y = 1:2)",
      "go_figure() |> add_scatter(x = 1:2, y = 2:1)",
      "end.rcode-->",
      "</body></html>"
    )
    out <- knitr::knit(text = rhtml, quiet = TRUE)
    setwd(old)
    imgs <- regmatches(out, gregexpr("figure/[^\"]+[.]png", out))[[1L]]
    stopifnot(
      length(unique(imgs)) == 2L,
      all(file.exists(file.path(dir, imgs))),
      !any(grepl("PhantomJS", out))
    )
  }

  plotly.core:::export_env$chrome$shutdown()
}
