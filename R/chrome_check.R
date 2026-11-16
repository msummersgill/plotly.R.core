# Checks that the Chrome found or downloaded for static image export can
# start, with errors that say why not and what to do: missing shared
# libraries on Linux (the usual problem with a downloaded Chrome Headless
# Shell on a server without a browser) and Chrome's own startup errors, which
# chromote reports as "Cannot find an available port".
#
# Missing libraries can be downloaded without administrator rights: the
# packages that provide them are fetched from the system's own repositories
# (apt-get download / dnf download, which need no root), unpacked into
# plotly.core's user cache, and Chrome started with LD_LIBRARY_PATH pointing
# there.

# Shared libraries Chrome links to, with the Debian/Ubuntu and RHEL/Fedora
# packages that provide them.
CHROME_LIBS <- data.frame(
  lib = c(
    "libnss3.so",
    "libnssutil3.so",
    "libsmime3.so",
    "libnspr4.so",
    "libplc4.so",
    "libplds4.so",
    "libatk-1.0.so.0",
    "libatk-bridge-2.0.so.0",
    "libatspi.so.0",
    "libcups.so.2",
    "libdbus-1.so.3",
    "libdrm.so.2",
    "libgbm.so.1",
    "libxkbcommon.so.0",
    "libX11.so.6",
    "libxcb.so.1",
    "libXcomposite.so.1",
    "libXdamage.so.1",
    "libXext.so.6",
    "libXfixes.so.3",
    "libXrandr.so.2",
    "libpango-1.0.so.0",
    "libcairo.so.2",
    "libasound.so.2",
    "libexpat.so.1",
    "libglib-2.0.so.0",
    "libgobject-2.0.so.0",
    "libgio-2.0.so.0",
    "libudev.so.1"
  ),
  debian = c(
    "libnss3",
    "libnss3",
    "libnss3",
    "libnspr4",
    "libnspr4",
    "libnspr4",
    "libatk1.0-0",
    "libatk-bridge2.0-0",
    "libatspi2.0-0",
    "libcups2",
    "libdbus-1-3",
    "libdrm2",
    "libgbm1",
    "libxkbcommon0",
    "libx11-6",
    "libxcb1",
    "libxcomposite1",
    "libxdamage1",
    "libxext6",
    "libxfixes3",
    "libxrandr2",
    "libpango-1.0-0",
    "libcairo2",
    "libasound2",
    "libexpat1",
    "libglib2.0-0",
    "libglib2.0-0",
    "libglib2.0-0",
    "libudev1"
  ),
  rhel = c(
    "nss",
    "nss-util",
    "nss",
    "nspr",
    "nspr",
    "nspr",
    "atk",
    "at-spi2-atk",
    "at-spi2-core",
    "cups-libs",
    "dbus-libs",
    "libdrm",
    "mesa-libgbm",
    "libxkbcommon",
    "libX11",
    "libxcb",
    "libXcomposite",
    "libXdamage",
    "libXext",
    "libXfixes",
    "libXrandr",
    "pango",
    "cairo",
    "alsa-lib",
    "expat",
    "glib2",
    "glib2",
    "glib2",
    "systemd-libs"
  ),
  stringsAsFactors = FALSE
)

# The shared libraries `path` links to that can't be found, from `ldd` with
# the directories `lib_path` added to the search path (Linux only;
# character(0) elsewhere or when ldd isn't available).
chrome_missing_libs <- function(
  path,
  ldd_output = NULL,
  lib_path = character()
) {
  if (is.null(ldd_output)) {
    if (
      !identical(Sys.info()[["sysname"]], "Linux") || !nzchar(Sys.which("ldd"))
    ) {
      return(character())
    }
    ldd_output <- tryCatch(
      suppressWarnings(system2(
        "ldd",
        shQuote(path),
        stdout = TRUE,
        stderr = TRUE,
        env = if (length(lib_path)) {
          paste0("LD_LIBRARY_PATH=", shQuote(ld_library_path(lib_path)))
        }
      )),
      error = function(e) character()
    )
  }
  miss <- grep("=>\\s*not found", ldd_output, value = TRUE)
  unique(trimws(sub("=>.*$", "", miss)))
}

# The Linux distribution family, from /etc/os-release: "debian", "rhel",
# "suse", "alpine" or NA.
linux_family <- function(os_release = "/etc/os-release") {
  if (!file.exists(os_release)) {
    return(NA_character_)
  }
  lines <- readLines(os_release, warn = FALSE)
  field <- function(k) {
    v <- sub(
      paste0("^", k, "="),
      "",
      grep(paste0("^", k, "="), lines, value = TRUE)
    )
    tolower(gsub("\"", "", v))
  }
  ids <- unlist(strsplit(c(field("ID"), field("ID_LIKE")), "\\s+"))
  if (any(ids %in% c("debian", "ubuntu"))) {
    "debian"
  } else if (
    any(
      ids %in% c("rhel", "fedora", "centos", "rocky", "almalinux", "amzn", "ol")
    )
  ) {
    "rhel"
  } else if (any(ids %in% c("suse", "opensuse", "sles"))) {
    "suse"
  } else if (any(ids == "alpine")) {
    "alpine"
  } else {
    NA_character_
  }
}

# How to install the packages providing the libraries `libs` on `family`.
lib_install_hint <- function(libs, family = linux_family()) {
  if (identical(family, "alpine")) {
    return(paste0(
      "Chrome Headless Shell doesn't run on Alpine Linux (it needs glibc). ",
      "Install Chromium instead (apk add chromium) and set the ",
      "CHROMOTE_CHROME environment variable to /usr/bin/chromium-browser."
    ))
  }
  i <- match(libs, CHROME_LIBS$lib)
  unknown <- libs[is.na(i)]
  out <- character()
  cmd <- function(pkgs) paste(unique(pkgs), collapse = " ")
  if (identical(family, "debian")) {
    pkgs <- CHROME_LIBS$debian[i[!is.na(i)]]
    if (length(pkgs)) {
      out <- c(out, paste("sudo apt-get install -y", cmd(pkgs)))
    }
    finder <- "apt-file search <library>"
  } else if (identical(family, "rhel")) {
    pkgs <- CHROME_LIBS$rhel[i[!is.na(i)]]
    if (length(pkgs)) {
      out <- c(out, paste("sudo dnf install -y", cmd(pkgs)))
    }
    finder <- "dnf provides '*/<library>'"
  } else {
    deb <- CHROME_LIBS$debian[i[!is.na(i)]]
    rh <- CHROME_LIBS$rhel[i[!is.na(i)]]
    if (length(deb)) {
      out <- c(
        out,
        paste("Debian/Ubuntu: sudo apt-get install -y", cmd(deb)),
        paste("RHEL/Fedora:   sudo dnf install -y", cmd(rh))
      )
    }
    finder <- "your package manager's search for files"
  }
  if (length(unknown)) {
    out <- c(
      out,
      paste0(
        "Find the package for ",
        paste(unknown, collapse = ", "),
        " with ",
        finder,
        "."
      )
    )
  }
  out
}

# Libraries downloaded for Chrome ----------------------------------------------

# Where downloaded libraries are kept: a folder per OS release (they are
# built for it), under chrome_libs_root(). Folders for other releases are
# removed when libraries are next downloaded (prune_chrome_libs()), and
# remove_chrome() removes them all.
chrome_libs_root <- function() {
  file.path(tools::R_user_dir("plotly.core", "cache"), "chrome-libs")
}

chrome_lib_dir <- function() {
  file.path(chrome_libs_root(), os_release_id())
}

# The OS release, e.g. "ubuntu-24.04", from /etc/os-release.
os_release_id <- function(os_release = "/etc/os-release") {
  if (!file.exists(os_release)) {
    return("unknown")
  }
  lines <- readLines(os_release, warn = FALSE)
  field <- function(k) {
    v <- grep(paste0("^", k, "="), lines, value = TRUE)
    if (length(v)) gsub("\"", "", sub(paste0("^", k, "="), "", v[[1]])) else ""
  }
  id <- paste(
    Filter(nzchar, c(field("ID"), field("VERSION_ID"))),
    collapse = "-"
  )
  id <- gsub("[^A-Za-z0-9._-]", "_", id)
  if (nzchar(id)) id else "unknown"
}

# Remove downloaded libraries for other OS releases (e.g. after an upgrade).
prune_chrome_libs <- function(
  root = chrome_libs_root(),
  keep = os_release_id()
) {
  old <- setdiff(list.files(root), keep)
  unlink(file.path(root, old), recursive = TRUE)
  invisible(old)
}

# The directories under `dir` holding shared libraries, for LD_LIBRARY_PATH.
chrome_lib_path <- function(dir = chrome_lib_dir()) {
  if (!dir.exists(dir)) {
    return(character())
  }
  so <- list.files(
    dir,
    pattern = "\\.so(\\.[0-9.]+)?$",
    recursive = TRUE,
    full.names = TRUE,
    all.files = TRUE
  )
  unique(dirname(so))
}

ld_library_path <- function(lib_path) {
  old <- Sys.getenv("LD_LIBRARY_PATH")
  paste(c(lib_path, if (nzchar(old)) old), collapse = ":")
}

# Whether the system's package tools can download packages without root.
can_fetch_libs <- function(family = linux_family()) {
  has <- function(x) all(nzchar(Sys.which(x)))
  if (identical(family, "debian")) {
    has(c("apt-get", "dpkg-deb"))
  } else if (identical(family, "rhel")) {
    has("dnf") && (has("rpm2archive") || has(c("rpm2cpio", "cpio")))
  } else {
    FALSE
  }
}

# Debian package names for libraries: from CHROME_LIBS, else by Debian's
# naming of library packages (libfoo.so.1 -> libfoo1, libfoo-2.so.0 ->
# libfoo-2-0).
debian_packages <- function(libs) {
  i <- match(libs, CHROME_LIBS$lib)
  out <- CHROME_LIBS$debian[i]
  guess <- is.na(i)
  if (any(guess)) {
    base <- tolower(sub("\\.so.*$", "", libs[guess]))
    ver <- sub("^.*\\.so\\.?", "", libs[guess])
    out[guess] <- ifelse(
      !nzchar(ver),
      base,
      ifelse(grepl("[0-9]$", base), paste0(base, "-", ver), paste0(base, ver))
    )
  }
  unique(out)
}

# Download the packages providing `libs` from the system's repositories and
# unpack them into `dir`. TRUE if any were unpacked.
download_libs <- function(
  libs,
  family = linux_family(),
  dir = chrome_lib_dir()
) {
  prune_chrome_libs()
  dir.create(dir, recursive = TRUE, showWarnings = FALSE)
  tmp <- tempfile("chrome-libs-")
  dir.create(tmp)
  on.exit(unlink(tmp, recursive = TRUE), add = TRUE)
  run <- function(cmd, args, wd = tmp) {
    processx::run(cmd, args, wd = wd, error_on_status = FALSE)$status == 0
  }
  if (identical(family, "debian")) {
    for (pkg in debian_packages(libs)) {
      # Ubuntu 24.04 renamed some library packages (e.g. libasound2t64)
      if (!run("apt-get", c("download", pkg))) {
        run("apt-get", c("download", paste0(pkg, "t64")))
      }
    }
    files <- list.files(tmp, "\\.deb$", full.names = TRUE)
    for (f in files) {
      run("dpkg-deb", c("-x", f, dir))
    }
  } else if (identical(family, "rhel")) {
    # dnf resolves a library's soname to the package providing it
    bits <- if (.Machine$sizeof.pointer == 8) "(64bit)" else ""
    # one at a time: an unknown one shouldn't stop the others
    for (lib in libs) {
      run("dnf", c("download", "-q", "--destdir", tmp, paste0(lib, "()", bits)))
    }
    files <- list.files(tmp, "\\.rpm$", full.names = TRUE)
    # only this machine's architecture (dnf may fetch i686 builds too)
    files <- files[grepl(
      paste0("\\.(", R.version$arch, "|noarch)\\.rpm$"),
      files
    )]
    for (f in files) {
      if (nzchar(Sys.which("rpm2archive"))) {
        # rpm2archive writes <file>.tgz, which R unpacks itself
        if (run("rpm2archive", f)) {
          utils::untar(paste0(f, ".tgz"), exdir = dir)
        }
      } else {
        run(
          "sh",
          c("-c", sprintf("rpm2cpio %s | cpio -idm --quiet", shQuote(f))),
          wd = dir
        )
      }
    }
  } else {
    files <- character()
  }
  length(files) > 0
}

# Download what Chrome at `path` is missing, repeating for the libraries the
# downloaded ones need in turn. The library directories, for LD_LIBRARY_PATH.
fetch_chrome_libs <- function(path, family = linux_family()) {
  last <- NULL
  for (round in 1:8) {
    lib_path <- chrome_lib_path()
    libs <- chrome_missing_libs(path, lib_path = lib_path)
    if (!length(libs) || identical(libs, last)) {
      break
    }
    message("Downloading ", paste(libs, collapse = ", "))
    if (!download_libs(libs, family)) {
      break
    }
    last <- libs
  }
  chrome_lib_path()
}

# The library directories Chrome at `path` needs on LD_LIBRARY_PATH. When it
# is missing shared libraries, an interactive session is offered a download
# into the user cache (no administrator rights needed, see download_libs());
# otherwise it's an error saying how to get them.
ensure_chrome_libs <- function(
  path,
  ask = interactive(),
  confirm = utils::askYesNo,
  missing = function(lib_path) chrome_missing_libs(path, lib_path = lib_path),
  fetch = function() fetch_chrome_libs(path, family),
  family = NULL,
  fetchable = NULL
) {
  lib_path <- chrome_lib_path()
  libs <- missing(lib_path)
  if (!length(libs)) {
    return(lib_path)
  }
  family <- family %||% linux_family()
  fetchable <- fetchable %||% can_fetch_libs(family)
  if (fetchable && ask) {
    ok <- confirm(paste0(
      "Chrome needs shared libraries that are missing: ",
      paste(libs, collapse = ", "),
      ". Download them from your system's package repositories into ",
      "plotly.core's cache? No administrator rights are needed."
    ))
    if (isTRUE(ok)) {
      lib_path <- fetch()
      libs <- missing(lib_path)
      if (!length(libs)) {
        return(lib_path)
      }
    }
  }
  stop_missing_libs(path, libs, family, fetchable)
}

stop_missing_libs <- function(path, libs, family, fetchable) {
  stop(
    "Chrome at ",
    path,
    " can't start: shared libraries it needs are missing:\n  ",
    paste(libs, collapse = ", "),
    if (fetchable) {
      paste0(
        "\nDownload them into your user cache, without administrator ",
        "rights, by running once:\n  plotly.core::install_chrome()"
      )
    },
    "\n",
    if (fetchable) "Or install" else "Install",
    " them with your system's package manager (this needs administrator ",
    "rights):\n  ",
    paste(lib_install_hint(libs, family), collapse = "\n  "),
    "\nOr install Google Chrome or Chromium, which brings them in.",
    call. = FALSE
  )
}

#' Set up Chrome for static image export
#'
#' Makes sure [save_image()] can start Chrome, without asking: finds a
#' Chrome or Chromium (see [save_image()]) or else downloads Chrome Headless
#' Shell with chromote, and on Linux downloads the shared libraries it needs
#' that are missing. The libraries come from the system's own package
#' repositories (with `apt-get download` or `dnf download`, which need no
#' administrator rights) and are unpacked into plotly.core's user cache
#' (`tools::R_user_dir("plotly.core", "cache")`), where `save_image()` finds
#' them. Run it once on a new machine, e.g. before scripts that export images;
#' interactive sessions are offered the same downloads when needed.
#'
#' Downloaded libraries are kept in a folder for the OS release, and those
#' for other releases (e.g. after an upgrade) are removed when libraries are
#' next downloaded. `remove_chrome()` removes everything plotly.core has
#' downloaded and, with `browser = TRUE`, the Chrome Headless Shell builds
#' chromote downloaded.
#'
#' The downloaded software is not part of plotly.core and keeps its own
#' licence: Chrome Headless Shell is built from Chromium by Google (see the
#' licence files in its download), and the libraries are your distribution's
#' packages (each package's copyright file is kept with it, under
#' `usr/share/doc`).
#'
#' @param browser For `remove_chrome()`, also remove the Chrome Headless Shell
#'   builds downloaded with chromote.
#' @return `install_chrome()`: the path to Chrome, invisibly.
#'   `remove_chrome()`: `NULL`, invisibly.
#' @export
#' @examples
#' \dontrun{
#' install_chrome()
#'
#' # remove the downloaded libraries (and Chrome Headless Shell)
#' remove_chrome(browser = TRUE)
#' }
install_chrome <- function() {
  check_chromote()
  chrome <- chrome_found() %||%
    chromote::chrome_versions_add("latest-stable", "chrome-headless-shell")
  lib_path <- ensure_chrome_libs(chrome, ask = TRUE, confirm = function(...) {
    TRUE
  })
  message("Chrome for static image export: ", chrome)
  if (length(lib_path)) {
    message("Shared libraries from: ", chrome_lib_dir())
  }
  invisible(chrome)
}

#' @rdname install_chrome
#' @export
remove_chrome <- function(browser = FALSE) {
  # stop the browser save_image() keeps, which may use these files
  ex <- export_env$chrome
  if (!is.null(ex)) {
    try(ex$shutdown(), silent = TRUE)
    export_env$chrome <- NULL
  }
  root <- chrome_libs_root()
  if (dir.exists(root)) {
    unlink(root, recursive = TRUE)
    message("Removed ", root)
  }
  if (isTRUE(browser)) {
    check_chromote()
    shells <- chromote::chrome_versions_list(
      "installed",
      "chrome-headless-shell"
    )
    for (v in unique(shells$version)) {
      chromote::chrome_versions_remove(v, "chrome-headless-shell", ask = FALSE)
    }
  }
  invisible(NULL)
}

# Launching ---------------------------------------------------------------------

# Start Chrome for chromote, with the downloaded libraries `lib_path` on
# LD_LIBRARY_PATH; if it fails, run it once more directly to show what Chrome
# itself printed, with hints for the common causes.
chrome_launch <- function(path, args, lib_path = character()) {
  if (length(lib_path)) {
    old <- Sys.getenv("LD_LIBRARY_PATH", unset = NA)
    Sys.setenv(LD_LIBRARY_PATH = ld_library_path(lib_path))
    on.exit(
      if (is.na(old)) {
        Sys.unsetenv("LD_LIBRARY_PATH")
      } else {
        Sys.setenv(LD_LIBRARY_PATH = old)
      },
      add = TRUE
    )
  }
  tryCatch(
    # chromote's check after a failed start looks for a system Chrome and
    # prints "not found" for every retry: our error says what went wrong
    suppressMessages(chromote::Chrome$new(path = path, args = args)),
    error = function(e) {
      stop(chrome_launch_error(path, args, conditionMessage(e)), call. = FALSE)
    }
  )
}

chrome_launch_error <- function(path, args, chromote_msg, output = NULL) {
  if (is.null(output)) {
    res <- tryCatch(
      processx::run(
        path,
        c(chrome_headless_arg(), args, "--dump-dom", "about:blank"),
        timeout = 30,
        error_on_status = FALSE
      ),
      error = function(e) list(stdout = "", stderr = conditionMessage(e))
    )
    output <- c(res$stderr, res$stdout)
  }
  lines <- unlist(strsplit(paste(output, collapse = "\n"), "\n"))
  lines <- trimws(lines[nzchar(trimws(lines))])
  hints <- character()
  if (any(grepl("no-sandbox|without --no-sandbox", lines))) {
    hints <- c(
      hints,
      paste0(
        "Chrome can't use its sandbox here (e.g. when R runs as root). ",
        "Allow running without it with ",
        "chromote::set_chrome_args(c(chromote::get_chrome_args(), \"--no-sandbox\"))."
      )
    )
  }
  if (any(grepl("error while loading shared libraries", lines))) {
    libs <- unique(sub(
      ".*error while loading shared libraries: ([^:]+):.*",
      "\\1",
      grep("error while loading shared libraries", lines, value = TRUE)
    ))
    hints <- c(
      hints,
      paste0(
        "Missing shared libraries: ",
        paste(libs, collapse = ", "),
        ". Install them with:\n    ",
        paste(lib_install_hint(libs), collapse = "\n    ")
      )
    )
  }
  if (any(grepl("dev/shm|shared memory", lines, ignore.case = TRUE))) {
    hints <- c(
      hints,
      paste0(
        "Chrome is short of shared memory (/dev/shm). Add ",
        "\"--disable-dev-shm-usage\" with chromote::set_chrome_args()."
      )
    )
  }
  paste0(
    "Chrome at ",
    path,
    " failed to start.",
    if (length(lines)) {
      paste0(
        "\nChrome's output:\n  ",
        paste(utils::tail(lines, 12), collapse = "\n  ")
      )
    } else {
      paste0("\n(chromote: ", chromote_msg, ")")
    },
    if (length(hints)) paste0("\n", paste("*", hints, collapse = "\n"))
  )
}

# The --headless flag chromote launches Chrome with.
chrome_headless_arg <- function() {
  mode <- getOption("chromote.headless", NULL) %||%
    (if (nzchar(Sys.getenv("CHROMOTE_HEADLESS"))) {
      Sys.getenv("CHROMOTE_HEADLESS")
    })
  if (is.null(mode)) "--headless" else paste0("--headless=", mode)
}
