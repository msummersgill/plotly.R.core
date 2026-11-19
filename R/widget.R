#' Render a figure as an htmlwidget
#'
#' `plotly_widget()` and `as_widget()` turn a figure into an htmlwidget,
#' which is what printing a figure does. Use them to embed figures with
#' htmltools or [htmlwidgets::saveWidget()].
#'
#' @param fig A [go_figure()], or a list
#'   with `data` (list of traces), `layout`, `frames` and `config` elements.
#' @param x A figure or htmlwidget. `as_widget()` is an S3 generic: the
#'   plotly package adds a method for its `plot_ly()` objects.
#' @param width,height Widget size in CSS units, or `NULL` for the layout's
#'   `width`/`height` or to fill the container.
#' @param elementId Optional element id for the widget.
#' @param config Plotly.js configuration options (e.g.
#'   `list(displayModeBar = FALSE)`), merged over those set with [config()].
#' @param bundle The plotly.js bundle to load: `"full"`, `"auto"` (the
#'   smallest bundle with all the figure's trace types) or the name of a
#'   partial bundle (see [partial_bundle()]). By default, the one set with
#'   [partial_bundle()], or the `plotly.core.bundle` option (`"full"` if unset).
#' @param ... Passed to `plotly_widget()`.
#' @return An object of class `htmlwidget`.
#' @details If the figure's layout has no `template`, the default template
#'   (see [default_template()]) is applied. With the `"none"` default,
#'   figures get plotly 4.x's margins (`l = 60, r = 10, t = 25, b = 40`
#'   pixels) unless their layout sets them (e.g.
#'   `update_layout(margin = go_margin(t = 50))`).
#'
#'   Numeric arrays in traces are sent to the browser as base64-encoded typed
#'   arrays (`{dtype, bdata}` objects, as plotly.py does), which are smaller
#'   and faster to load than JSON numbers. JavaScript that reads `x.data` in
#'   [htmlwidgets::onRender()] sees these objects rather than arrays; read the
#'   plotted values from `el._fullData` instead. [plotly_json()] shows plain
#'   JSON. Vectors of whole numbers are sent as integers; see [as_float32()]
#'   to send other numbers in single precision. Dates and date-times are sent
#'   as numbers and turned back into "YYYY-MM-DD HH:MM:SS" strings (in the
#'   vector's time zone) in the browser before plotting.
#' @export
#' @examples
#' plotly_widget(list(data = list(list(type = "bar", x = 1:3, y = c(2, 5, 3)))))
plotly_widget <- function(
  fig,
  width = NULL,
  height = NULL,
  elementId = NULL,
  config = NULL,
  bundle = NULL
) {
  check_no_formulas(fig)
  layout <- unclass(fig$layout %||% list())
  if (is.null(layout$template)) {
    tpl <- default_template()
    layout$template <- if (identical(tpl, "none")) {
      # plotly 4.x's margins, as defaults the layout can override side by side
      list(layout = list(margin = DEFAULT_MARGIN))
    } else {
      get_template(tpl)
    }
  }
  if (!length(layout)) {
    layout <- structure(list(), names = character())
  }
  setting <- function(name) {
    attr(fig, paste0("plotly_", name), exact = TRUE) %||% fig[[name]]
  }
  cfg <- utils::modifyList(setting("config") %||% list(), config %||% list())
  x <- list(
    data = unname(fig$data %||% list()),
    layout = layout,
    frames = unname(fig$frames %||% list()),
    config = if (length(cfg)) cfg else structure(list(), names = character()),
    source = setting("source") %||% "A",
    shinyEvents = I(setting("shinyEvents") %||% DEFAULT_EVENTS)
  )
  for (k in c("keys", "sets", "frameKeys", "highlight", "fitBounds")) {
    if (!is.null(setting(k))) x[[k]] <- setting(k)
  }
  if (!is.null(x$sets)) {
    x <- crosstalk_payload(x, setting("selectize"))
  }
  attr(x, "TOJSON_FUNC") <- widget_to_JSON
  bundle <- bundle %||%
    setting("bundle") %||%
    getOption("plotly.core.bundle", "full")
  deps <- list(plotlyjs_dependency(choose_bundle(
    bundle,
    figure_trace_types(x)
  )))
  if (!is.null(cfg$locale) && cfg$locale != "en") {
    deps <- c(deps, list(locale_dependency(cfg$locale)))
  }
  if (!is.null(setting("mathjax"))) {
    deps <- c(deps, list(mathjax_dependency(setting("mathjax"))))
  }
  if (!is.null(x$sets)) {
    deps <- c(deps, crosstalk_deps(x$highlight))
  }
  htmlwidgets::createWidget(
    name = "plotly_core",
    x = x,
    width = width %||% layout$width,
    height = height %||% layout$height,
    package = "plotly.core",
    elementId = elementId,
    dependencies = deps,
    sizingPolicy = htmlwidgets::sizingPolicy(
      browser.fill = TRUE,
      padding = 0,
      defaultWidth = "100%",
      defaultHeight = 400
    )
  )
}

#' @rdname plotly_widget
#' @export
as_widget <- function(x, ...) UseMethod("as_widget")

#' @export
as_widget.default <- function(x, ...) plotly_widget(x, ...)

#' @export
as_widget.htmlwidget <- function(x, ...) x

# Linked highlighting (crosstalk) --------------------------------------------
# Figures carry crosstalk settings as "plotly_keys", "plotly_sets",
# "plotly_highlight" and "plotly_selectize" attributes (see crosstalk.R; the
# plotly package sets them too); the widget's JavaScript does the linking.

# selectize options with their items as a list of rows
selectize_json <- function(s) {
  lapply(s, function(o) {
    if (is.data.frame(o$items)) {
      it <- o$items
      o$items <- lapply(seq_len(nrow(it)), function(i) {
        lapply(as.list(it[i, , drop = FALSE]), as.character)
      })
    }
    o
  })
}

#' @rdname set_plotlyjs_dependency
#' @param highlight Linked-highlighting options (as set by the plotly
#'   package's `highlight()`): `selectize` and `dynamic` add their libraries.
#' @export
crosstalk_deps <- function(highlight = list()) {
  if (!requireNamespace("crosstalk", quietly = TRUE)) {
    stop(
      "Linked highlighting needs the crosstalk package: install.packages(\"crosstalk\")",
      call. = FALSE
    )
  }
  deps <- crosstalk::crosstalkLibs()
  if (!identical(highlight$selectize %||% FALSE, FALSE)) {
    deps <- c(
      deps,
      list(htmltools::htmlDependency(
        name = "selectize",
        version = "0.12.4",
        package = "crosstalk",
        src = "lib/selectize",
        script = "js/selectize.min.js",
        stylesheet = "css/selectize.bootstrap3.css"
      ))
    )
  }
  if (isTRUE(highlight$dynamic)) {
    deps <- c(
      deps,
      list(htmltools::htmlDependency(
        name = "colourpicker",
        version = "1.1",
        package = "plotly.core",
        src = "htmlwidgets/lib/colourpicker",
        script = "colourpicker.min.js",
        stylesheet = "colourpicker.min.css"
      ))
    )
  }
  deps
}

#' JSON of a plot
#'
#' Returns the JSON plotly.js receives for a plot.
#'
#' @param p A [go_figure()] or anything [as_widget()] accepts (default: the
#'   last plot printed).
#' @param jsonedit Show it in an interactive viewer (needs the listviewer
#'   package)?
#' @param pretty Pretty-print the JSON?
#' @param ... Passed to `listviewer::jsonedit()`.
#' @return The JSON string (or a listviewer widget).
#' @export
#' @examples
#' cat(plotly_json(go_figure(go_bar(y = 1:3)), jsonedit = FALSE))
plotly_json <- function(
  p = last_plot(),
  jsonedit = interactive(),
  pretty = TRUE,
  ...
) {
  x <- as_widget(p)$x
  json <- to_JSON(x[c("data", "layout", "frames", "config")], pretty = pretty)
  if (jsonedit && requireNamespace("listviewer", quietly = TRUE)) {
    listviewer::jsonedit(json, mode = "form", ...)
  } else {
    json
  }
}

#' The last plot
#'
#' `last_plot()` returns the plot most recently printed (or, for the plotly
#' package's `plot_ly()` objects, built). `set_last_plot()` records one; it is
#' for packages that build plots of their own classes.
#'
#' @param p A plot.
#' @return `last_plot()`: the plot. `set_last_plot()`: `p`, invisibly.
#' @export
last_plot <- function() {
  p <- the$last_plot
  if (is.null(p)) {
    stop("The last plot doesn't exist", call. = FALSE)
  }
  p
}

#' @rdname last_plot
#' @export
set_last_plot <- function(p) {
  the$last_plot <- p
  invisible(p)
}

# plotly.js bundles -------------------------------------------------------------
# The full plotly.js bundle and the partial bundles plotly.js publishes (in
# inst/htmlwidgets/lib/plotlyjs; their trace types are PLOTLYJS_BUNDLE_TRACES,
# generated with the plotly.js update in commands.R).

#' Use a smaller plotly.js bundle
#'
#' By default, figures load the full plotly.js bundle (about 4.8 MB). plotly.js
#' also publishes partial bundles with fewer trace types, which make pages
#' (and files saved with [htmlwidgets::saveWidget()]) much smaller:
#'
#' * `"basic"`: bar, pie, scatter (about 1.2 MB)
#' * `"cartesian"`: also box, contour, heatmap, histogram, histogram2d,
#'   histogram2dcontour, image, scatterternary, violin
#' * `"finance"`: bar, candlestick, funnel, funnelarea, histogram,
#'   indicator, ohlc, pie, scatter, waterfall
#' * `"geo"`: choropleth, scatter, scattergeo
#' * `"gl2d"`: parcoords, scatter, scattergl, splom
#' * `"gl3d"`: cone, isosurface, mesh3d, scatter, scatter3d, streamtube,
#'   surface, volume
#' * `"map"`: choroplethmap, densitymap, scatter, scattermap
#'
#' `type = "auto"` uses the smallest bundle with all the figure's trace types
#' (including those in animation frames), or the full bundle if none has
#' them all. Use `options(plotly.core.bundle = "auto")` to do this for every
#' figure.
#'
#' A page has a single plotly.js: when it shows several figures, they should
#' use the same bundle (or the full one, which is used if any figure needs it).
#'
#' `partial_bundle()` is an S3 generic, so packages can add methods for their
#' own figure classes (the plotly package does for `plot_ly()` objects).
#'
#' @param p A [go_figure()] or htmlwidget.
#' @param type `"auto"`, `"full"`, or the name of a partial bundle.
#' @param local,minified Unused: the bundles are always the minified ones
#'   shipped with the package (kept for compatibility with the plotly package).
#' @return The figure, which renders with that bundle.
#' @export
#' @examples
#' fig <- go_figure(go_bar(x = c("a", "b"), y = 1:2)) |> partial_bundle()
partial_bundle <- function(p, type = "auto", local = TRUE, minified = TRUE) {
  UseMethod("partial_bundle")
}

#' @export
partial_bundle.default <- function(
  p,
  type = "auto",
  local = TRUE,
  minified = TRUE
) {
  type <- match.arg(type, c("auto", "full", names(PLOTLYJS_BUNDLE_TRACES)))
  p <- set_widget_setting(p, "bundle", type)
  # a widget: its plotly.js dependency is replaced now
  if (inherits(p, "htmlwidget")) {
    p <- set_plotlyjs_dependency(
      p,
      choose_bundle(type, figure_trace_types(p$x))
    )
  }
  p
}

#' The plotly.js dependency of a widget
#'
#' For packages that create widgets with plotly.core's widget (as the plotly
#' package does): `plotlyjs_dependency()` is the [htmltools::htmlDependency()]
#' of a plotly.js bundle, and `set_plotlyjs_dependency()` replaces a widget's.
#' `locale_dependency()`, `mathjax_dependency()` and `crosstalk_deps()` are
#' the other dependencies [plotly_widget()] attaches (for a locale, MathJax
#' and linked highlighting).
#' The dependency must be attached when the widget is created: htmlwidgets
#' collects dependencies before a widget's `preRenderHook` runs.
#'
#' @param bundle `"full"` or the name of a partial bundle (see
#'   [partial_bundle()]).
#' @param w An htmlwidget.
#' @return An `html_dependency` (a list of them for `crosstalk_deps()`), or
#'   the widget.
#' @keywords internal
#' @export
set_plotlyjs_dependency <- function(w, bundle = "full") {
  keep <- !vapply(
    w$dependencies,
    function(d) identical(d$name, "plotly-main"),
    logical(1)
  )
  w$dependencies <- c(list(plotlyjs_dependency(bundle)), w$dependencies[keep])
  w
}

# trace types of a widget payload (traces and frames' traces)
figure_trace_types <- function(x) {
  traces <- c(x$data, unlist(lapply(x$frames, `[[`, "data"), recursive = FALSE))
  unique(vapply(
    traces,
    function(tr) as.character(tr[["type"]] %||% "scatter"),
    ""
  ))
}

# The bundle to load: "full", or a partial bundle with all `types`
choose_bundle <- function(bundle, types) {
  bundle <- match.arg(bundle, c("auto", "full", names(PLOTLYJS_BUNDLE_TRACES)))
  if (identical(bundle, "full")) {
    return("full")
  }
  covers <- vapply(
    PLOTLYJS_BUNDLE_TRACES,
    function(t) all(types %in% t),
    logical(1)
  )
  if (identical(bundle, "auto")) {
    if (!any(covers)) {
      return("full")
    }
    candidates <- names(PLOTLYJS_BUNDLE_TRACES)[covers]
    sizes <- file.size(vapply(candidates, plotlyjs_bundle_file, ""))
    return(candidates[[which.min(sizes)]])
  }
  if (!covers[[bundle]]) {
    warning(
      sprintf(
        "The '%s' plotly.js bundle doesn't have trace type(s) %s; using the full bundle",
        bundle,
        paste0(
          "'",
          setdiff(types, PLOTLYJS_BUNDLE_TRACES[[bundle]]),
          "'",
          collapse = ", "
        )
      ),
      call. = FALSE
    )
    return("full")
  }
  bundle
}

plotlyjs_bundle_file <- function(bundle) {
  file.path(
    system.file("htmlwidgets", "lib", "plotlyjs", package = "plotly.core"),
    if (identical(bundle, "full")) {
      "plotly.min.js"
    } else {
      paste0("plotly-", bundle, ".min.js")
    }
  )
}

# All bundles share a dependency name, so a page loads one plotly.js. Of the
# versions, the widget YAML's full bundle has the lowest (it is replaced by
# the bundle a widget attaches) and an attached full bundle the highest (so
# htmltools picks it when a page also has figures with a partial bundle).
# Each partial bundle has a version of its own (4.3.0.1.<k>), so pages saved
# with a shared library folder (saveWidget()/write_html() with `libdir`) get
# each bundle in a folder of its own: htmltools copies a dependency's folder
# (name-version) only once.
#' @rdname set_plotlyjs_dependency
#' @export
plotlyjs_dependency <- function(bundle = "full") {
  htmltools::htmlDependency(
    name = "plotly-main",
    version = paste0(
      plotlyjs_version(),
      if (identical(bundle, "full")) {
        ".2"
      } else {
        paste0(".1.", match(bundle, names(PLOTLYJS_BUNDLE_TRACES)))
      }
    ),
    src = "htmlwidgets/lib/plotlyjs",
    script = basename(plotlyjs_bundle_file(bundle)),
    package = "plotly.core",
    all_files = FALSE
  )
}

#' @rdname set_plotlyjs_dependency
#' @param locale A plotly.js locale, e.g. `"de"`.
#' @export
locale_dependency <- function(locale) {
  htmltools::htmlDependency(
    name = paste0("plotly-locale-", locale),
    version = plotlyjs_version(),
    src = "htmlwidgets/lib/plotlyjs/locales",
    script = paste0(locale, ".js"),
    package = "plotly.core",
    all_files = FALSE
  )
}

#' @rdname set_plotlyjs_dependency
#' @param source For `mathjax_dependency()`: `"local"` for the MathJax
#'   bundled with the package (works offline, and is embedded in
#'   self-contained HTML), or `"cdn"` to load it from cdn.jsdelivr.net.
#' @export
mathjax_dependency <- function(source = c("local", "cdn")) {
  source <- match.arg(source)
  # plotly.js 4 typesets with MathJax 3 or 4 (not 2); tex-svg.js is MathJax
  # 3.2.2's single-file TeX-to-SVG build
  if (source == "cdn") {
    return(htmltools::htmlDependency(
      name = "mathjax",
      version = MATHJAX_VERSION,
      src = c(href = "https://cdn.jsdelivr.net/npm/mathjax@3.2.2/es5"),
      script = "tex-svg.js"
    ))
  }
  htmltools::htmlDependency(
    name = "mathjax",
    version = MATHJAX_VERSION,
    src = "htmlwidgets/lib/mathjax",
    package = "plotly.core",
    script = "tex-svg.js",
    all_files = FALSE
  )
}

MATHJAX_VERSION <- "3.2.2"

mathjax_path <- function() {
  system.file(
    "htmlwidgets",
    "lib",
    "mathjax",
    "tex-svg.js",
    package = "plotly.core"
  )
}

# Formulas kept by constructors must be evaluated before a figure is drawn.
check_no_formulas <- function(fig) {
  where <- function(x, path) {
    if (inherits(x, "formula")) {
      return(paste0(path, " = ", paste(deparse(x), collapse = " ")))
    }
    if (is.list(x) && !is.data.frame(x)) {
      for (i in seq_along(x)) {
        nm <- names(x)[i]
        sub <- if (is.null(nm) || !nzchar(nm)) {
          sprintf("%s[[%d]]", path, i)
        } else if (nzchar(path)) {
          paste(path, nm, sep = "$")
        } else {
          nm
        }
        found <- where(x[[i]], sub)
        if (!is.null(found)) return(found)
      }
    }
    NULL
  }
  found <- where(unclass(fig)[c("data", "layout", "frames")], "")
  if (!is.null(found)) {
    stop(
      sprintf(
        paste(
          "Can't draw a figure with an unevaluated formula (%s). Formulas are",
          "evaluated in the data when a trace is added with add_<trace>() or",
          "add_trace(): pass `data` there, or pipe a data frame into go_figure()."
        ),
        found
      ),
      call. = FALSE
    )
  }
}

# JSON serialiser used by the widget: length-1 vectors become scalars and
# missing values become null, matching what plotly.js expects.
to_JSON <- function(x, ...) {
  jsonlite::toJSON(
    prepare_json(x),
    # doubles are written by prepare_json(); 17 significant digits for any
    # left (e.g. in data frames) so they round-trip exactly too
    digits = I(17),
    auto_unbox = TRUE,
    force = TRUE,
    null = "null",
    na = "null",
    dataframe = "values",
    json_verbatim = TRUE,
    ...
  )
}

# Widget serialiser: numeric arrays in traces (and frame traces) are sent as
# base64-encoded typed arrays, which plotly.js decodes much faster than JSON
# number lists, like plotly.py's convert_to_base64().
# htmlwidgets calls it with its payload, list(x = <widget data>, evals, ...).
# The base64 is kept out of R strings: jsonlite writes the figure with a
# placeholder for each typed array's bdata and C copies the base64 in once
# (C_json_splice() in src/typed_array.c).
# An array repeated in the figure (e.g. the same x in many traces) is sent
# once: its first spec gets `"bid": k` and later ones are {"bref": k}, which
# the widget's JavaScript turns back into the same object.
widget_to_JSON <- function(x, ...) {
  blobs <- new.env(parent = emptyenv())
  blobs$list <- list()
  blobs$seen <- list()
  if (is.list(x[["x"]])) {
    x[["x"]] <- b64_figure(x[["x"]], blobs)
  } else {
    x <- b64_figure(x, blobs)
  }
  json <- to_JSON(x, ...)
  if (!length(blobs$list)) {
    return(json)
  }
  for (k in unique(blobs$reused)) {
    # after the bdata string of the first spec: ,"bid":k
    blobs$list[[k]] <- c(blobs$list[[k]], charToRaw(paste0(',"bid":', k)))
  }
  out <- .Call(C_json_splice, json, blobs$list)
  class(out) <- class(json)
  out
}

# `blobs`: an environment collecting the base64 of typed arrays (raw vectors,
# for widget_to_JSON()); NULL to write it in the specs as strings.
# `dates = FALSE` leaves date-times as strings (for pages without the
# widget's JavaScript, which turns date typed arrays back into strings).
b64_figure <- function(x, blobs = NULL, dates = TRUE) {
  x[["data"]] <- b64_traces(x[["data"]], blobs, dates)
  if (length(x[["frames"]])) {
    x[["frames"]] <- lapply(x[["frames"]], function(f) {
      if (is.list(f) && length(f[["data"]])) {
        f[["data"]] <- b64_traces(f[["data"]], blobs, dates)
      }
      f
    })
  }
  x
}

# Keys plotly.py never encodes (plotly.js reads them without decoding).
B64_SKIP_KEYS <- c("geojson", "layer", "layers", "range")

b64_traces <- function(traces, blobs = NULL, dates = TRUE) {
  if (!is.list(traces)) {
    return(traces)
  }
  lapply(traces, b64_encode, blobs = blobs, dates = dates)
}

# The typed array spec of `v` (`kind` "array" or "date") for
# widget_to_JSON(): bdata is a placeholder (JSON written as is) for its raw
# base64, added to `blobs`; or {bref: k} when the same values (identical(),
# which is quick for the same vector) were encoded before as blob k.
shared_spec <- function(v, kind, blobs) {
  f32 <- kind == "array" && isTRUE(getOption("plotly.core.float32"))
  for (s in blobs$seen) {
    if (
      s$kind == kind &&
        s$f32 == f32 &&
        length(s$v) == length(v) &&
        identical(s$v, v)
    ) {
      blobs$reused <- c(blobs$reused, s$k)
      return(list(bref = s$k))
    }
  }
  spec <- if (kind == "date") {
    date_array_spec(v, raw = TRUE)
  } else {
    typed_array_spec(v, raw = TRUE)
  }
  if (is.null(spec)) {
    return(NULL)
  }
  k <- length(blobs$list) + 1L
  blobs$list[[k]] <- spec$bdata
  blobs$seen[[length(blobs$seen) + 1L]] <- list(
    v = v,
    kind = kind,
    f32 = f32,
    k = k
  )
  spec$bdata <- structure(paste0("\001", k, "\001"), class = "json")
  spec
}

# Like convert_to_base64(): only named entries are encoded, unnamed lists
# (e.g. a z given as a list of rows) are searched but left as JSON arrays.
b64_encode <- function(x, blobs = NULL, dates = TRUE) {
  if (!is.list(x) || !length(x)) {
    return(x)
  }
  nms <- names(x)
  for (i in seq_along(x)) {
    key <- if (is.null(nms)) "" else nms[[i]]
    if (key %in% B64_SKIP_KEYS) {
      next
    }
    v <- x[[i]]
    if (nzchar(key) && is_b64_array(v)) {
      x[[i]] <- if (is.null(blobs)) {
        typed_array_spec(v)
      } else {
        shared_spec(v, "array", blobs)
      }
    } else if (dates && nzchar(key) && is_b64_date(v)) {
      x[[i]] <- (if (is.null(blobs)) {
        date_array_spec(v)
      } else {
        shared_spec(v, "date", blobs)
      }) %||%
        v
    } else if (is.list(v) && !is.data.frame(v)) {
      x[[i]] <- b64_encode(v, blobs, dates)
    }
  }
  x
}

# Plain numeric vectors that serialise as JSON arrays (length 0 or 1 stays
# as is, unless wrapped in I()), and numeric matrices; as_float32() vectors too.
is_b64_array <- function(v) {
  if (!(is.double(v) || is.integer(v))) {
    return(FALSE)
  }
  cls <- oldClass(v)
  if (!all(cls %in% c("AsIs", "plotly_float32"))) {
    return(FALSE)
  }
  d <- dim(v)
  if (!is.null(d)) {
    return(length(d) == 2L && length(v) > 0L)
  }
  length(v) > 1L || (length(v) == 1L && "AsIs" %in% cls)
}

# Date and date-time vectors (not matrices) that serialise as JSON arrays.
is_b64_date <- function(v) {
  if (!inherits(v, c("POSIXt", "Date")) || !is.null(dim(v))) {
    return(FALSE)
  }
  if (
    !all(oldClass(v) %in% c("AsIs", "POSIXct", "POSIXlt", "POSIXt", "Date"))
  ) {
    return(FALSE)
  }
  length(v) > 1L || (length(v) == 1L && inherits(v, "AsIs"))
}

# Dates as days since 1970 and date-times as whole milliseconds since 1970 in
# the object's time zone (wall-clock time), plus `usec` (0-999) when any has a
# fraction of a millisecond, with `rdate` marking them for the widget's
# JavaScript, which turns them back into the strings to_JSON() would write
# ("YYYY-MM-DD", "YYYY-MM-DD HH:MM:SS[.ffffff]") before plotting: much
# faster than formatting and escaping strings in R. NULL (send strings) for
# years outside 1000-9999 or an unknown time zone offset.
date_array_spec <- function(v, raw = FALSE) {
  if (inherits(v, "Date")) {
    days <- floor(as.numeric(v))
    rng <- suppressWarnings(range(days, na.rm = TRUE))
    if (all(is.finite(rng)) && (rng[1] < -354285 || rng[2] > 2932896)) {
      return(NULL)
    }
    out <- typed_array_spec(days, float32 = FALSE, raw = raw)
    out$rdate <- "date"
    return(out)
  }
  v <- as.POSIXct(v)
  secs <- as.numeric(v)
  tz <- attr(v, "tzone")
  # UTC offsets only change at time zone transitions, which are at whole
  # seconds and at most one per 15 minutes: they are looked up (with
  # as.POSIXlt(), which is slow) at the start and end of each 15-minute bin
  # holding values, and the transition instant found in the few bins where
  # they differ. The C code applies them to each value.
  bins <- .Call(C_time_bins, secs)
  if (!length(bins)) {
    return(NULL)
  }
  gmtoff <- function(s) as.POSIXlt(.POSIXct(s, tz = tz))$gmtoff
  off0 <- gmtoff(bins * 900)
  off1 <- gmtoff(bins * 900 + 899)
  if (is.null(off0) || is.null(off1) || anyNA(off0) || anyNA(off1)) {
    return(NULL)
  }
  trans <- rep(Inf, length(bins))
  mixed <- which(off0 != off1)
  if (length(mixed)) {
    trans[mixed] <- transition_instants(bins[mixed] * 900, off1[mixed], gmtoff)
  }
  out <- .Call(
    C_datetime_array,
    secs,
    bins,
    as.numeric(off0),
    trans,
    as.numeric(off1),
    raw,
    typed_array_threads()
  )
  if (is.null(out)) {
    return(NULL)
  }
  spec <- out[[1]]
  spec$rdate <- "datetime"
  # microseconds within each millisecond, only when there are any
  if (!is.null(out[[2]])) {
    spec$usec <- typed_array_spec(out[[2]])
  }
  spec
}

# The first whole second in [lo, lo + 899] with UTC offset `off1` (each bin
# holding one transition, from another offset before it), by bisection.
transition_instants <- function(lo, off1, gmtoff) {
  hi <- lo + 899
  while (any(hi - lo > 1)) {
    mid <- floor((lo + hi) / 2)
    after <- gmtoff(mid) == off1
    hi[after] <- mid[after]
    lo[!after] <- mid[!after]
  }
  hi
}

# Threads used to encode typed arrays (when built with OpenMP).
typed_array_threads <- function() getOption("plotly.core.threads", 2L)

# A plotly.js typed array spec: {dtype, bdata[, shape]}. Integers, and doubles
# that are all whole numbers in the 32-bit range, are sent as the smallest
# signed integer type that holds them (lossless). Other doubles are float64,
# or float32 for as_float32() vectors or with options(plotly.core.float32 =
# TRUE). Missing values become NaN (a gap in plotly.js), so integers with
# missing values are sent as floats. The scan and encoding are in C
# (src/typed_array.c). `raw`: bdata is a raw vector of the base64 in double
# quotes, for widget_to_JSON().
typed_array_spec <- function(
  v,
  float32 = isTRUE(getOption("plotly.core.float32")),
  raw = FALSE
) {
  float32 <- float32 || inherits(v, "plotly_float32")
  d <- dim(v)
  if (length(d) == 2L) {
    v <- t(unclass(v))
  }
  if (!is.null(attributes(v))) {
    attributes(v) <- NULL
  }
  out <- .Call(C_typed_array, v, float32, raw, typed_array_threads())
  if (length(d) == 2L) {
    out$shape <- paste(d, collapse = ", ")
  }
  out
}

#' Send numeric data to the browser in single precision
#'
#' Marks a numeric vector or matrix to be sent to plotly.js as a float32
#' typed array: 4 bytes per value instead of 8, halving the size of the
#' widget's data and of plotly.js's copy of it. Use it in trace properties,
#' or on data frame columns used in formula properties (`x = ~col`). Set
#' `options(plotly.core.float32 = TRUE)` to send all
#' numeric arrays in single precision.
#'
#' Single precision keeps about 7 significant digits: values shown in hover
#' labels and returned by [event_data()] change (`0.1` becomes
#' `0.100000001490116`), whole numbers above 2^24 (16,777,216) aren't exact
#' and numeric times in seconds since 1970 are only accurate to minutes.
#' Vectors of whole numbers (in the 32-bit integer range) are always sent as
#' integers without loss, and date-times as text, so neither is affected.
#' WebGL traces (e.g. [go_scattergl()]) draw in single precision anyway.
#'
#' @param x A numeric vector or matrix.
#' @return `x`, marked with class `plotly_float32`.
#' @export
#' @examples
#' n <- 1e4
#' data.frame(x = rnorm(n), y = rnorm(n)) |>
#'   go_figure() |>
#'   add_scattergl(x = ~as_float32(x), y = ~as_float32(y), mode = "markers")
as_float32 <- function(x) {
  if (
    !is.numeric(x) ||
      is.object(x) && !all(oldClass(x) %in% c("AsIs", "plotly_float32"))
  ) {
    stop(
      "as_float32() needs a numeric vector or matrix, not an object of class: ",
      class(x)[1],
      call. = FALSE
    )
  }
  class(x) <- union("plotly_float32", oldClass(x))
  x
}

#' @export
`[.plotly_float32` <- function(x, ...) as_float32(NextMethod())

#' @export
print.plotly_float32 <- function(x, ...) {
  cat("<float32>\n")
  print(unclass(x), ...)
  invisible(x)
}

unclass_float32 <- function(v) {
  class(v) <- setdiff(oldClass(v), "plotly_float32")
  if (!length(oldClass(v))) {
    v <- unclass(v)
  }
  v
}

# Convert values jsonlite would serialise lossily or verbosely. Date-times
# become strings with microsecond precision; doubles are written (as JSON
# kept as is) in the fewest digits that read back exactly (see num_json());
# other values are left as they are.
prepare_json <- function(x) {
  if (inherits(x, "plotly_float32")) {
    return(num_json(unclass_float32(x), f32 = TRUE))
  }
  if (is.double(x) && is_plain_num(x)) {
    return(num_json(x))
  }
  if (is.data.frame(x)) {
    # columns stay vectors for jsonlite (date-times as formatted strings)
    for (j in which(vapply(x, inherits, NA, "POSIXt"))) {
      x[[j]] <- format_datetime(x[[j]])
    }
    return(x)
  }
  if (inherits(x, "POSIXt")) {
    out <- format_datetime(x)
    if (is.null(dim(x)) && (length(out) != 1L || inherits(x, "AsIs"))) {
      return(json_strings(out))
    }
    if (inherits(x, "AsIs")) {
      out <- I(out)
    }
    dim(out) <- dim(x)
    return(out)
  }
  if (is.list(x) && length(x)) {
    x[] <- lapply(x, prepare_json)
  }
  x
}

# Plain double vectors and matrices (no class but AsIs; names are dropped, as
# jsonlite does), which num_json() writes as jsonlite would lay them out.
is_plain_num <- function(x) {
  cls <- oldClass(x)
  if (length(cls) && !identical(cls, "AsIs")) {
    return(FALSE)
  }
  d <- dim(x)
  is.null(d) || length(d) == 2L
}

# JSON for a double vector or matrix with each number in the fewest
# significant digits that read back as the same double (C_num_json(), as
# JavaScript prints numbers; jsonlite's digits = NA keeps only 15, which loses
# precision, and 17 writes 0.1 as 0.10000000000000001). Like jsonlite with
# auto_unbox: a length-1 vector is a bare number unless wrapped in I(), and a
# matrix is an array of rows.
num_json <- function(x, f32 = FALSE) {
  d <- dim(x)
  scalar <- is.null(d) && length(x) == 1L && !inherits(x, "AsIs")
  out <- .Call(
    C_num_json,
    as.double(x),
    if (is.null(d)) 0L else d[[1]],
    if (is.null(d)) -1L else d[[2]],
    scalar,
    f32
  )
  structure(out, class = "json")
}

# Format date-times as "YYYY-MM-DD HH:MM:SS[.ffffff]" in the object's time
# zone (plotly.js has no time zones). Microseconds are rounded, not truncated
# as format(x, "%OS6") does; trailing zeros of the fraction are dropped, and
# the fraction is omitted when zero.
#' @rdname plotly.core-extending
#' @export
format_datetime <- function(x) {
  x <- as.POSIXct(x)
  tz <- attr(x, "tzone")[1L] %||% ""
  secs <- as.numeric(x)
  # to the microsecond, rounding the fraction of a second (as C_datetime_array)
  whole <- floor(secs)
  us <- round((secs - whole) * 1e6)
  carry <- which(us >= 1e6)
  whole[carry] <- whole[carry] + 1
  us[carry] <- us[carry] - 1e6
  out <- format(.POSIXct(whole, tz = tz), "%Y-%m-%d %H:%M:%S")
  i <- which(us > 0)
  if (length(i)) {
    # trailing zeros dropped: .5, .123, .000123
    frac <- sub("0+$", "", formatC(as.integer(us[i]), width = 6, flag = "0"))
    out[i] <- paste0(out[i], ".", frac)
  }
  out[is.na(x)] <- NA_character_
  out
}

# A JSON array of strings that need no escaping (e.g. formatted dates), kept
# as is by jsonlite (json_verbatim): faster than its per-string escaping.
json_strings <- function(x) {
  if (!length(x)) {
    return(structure("[]", class = "json"))
  }
  s <- paste0('"', x, '"')
  s[is.na(x)] <- "null"
  structure(paste0("[", paste(s, collapse = ","), "]"), class = "json")
}

`%||%` <- function(x, y) if (is.null(x)) y else x
