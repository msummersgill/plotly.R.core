#' Render a figure as an htmlwidget
#'
#' `plotly_widget()` and `as_widget()` turn a figure into an htmlwidget,
#' which is what printing a figure does. Use them to embed figures with
#' htmltools or [htmlwidgets::saveWidget()].
#'
#' @param fig A [go_figure()], a figure from a `px_*()` function, or a list
#'   with `data` (list of traces), `layout`, `frames` and `config` elements.
#' @param x A figure, [plot_ly()] object or htmlwidget.
#' @param width,height Widget size in CSS units, or `NULL` for the layout's
#'   `width`/`height` or to fill the container.
#' @param elementId Optional element id for the widget.
#' @param config Plotly.js configuration options (e.g.
#'   `list(displayModeBar = FALSE)`), merged over those set with [config()].
#' @param ... Passed to `plotly_widget()`.
#' @return An object of class `htmlwidget`.
#' @details If the figure's layout has no `template`, the default template
#'   (see [default_template()]) is applied.
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
plotly_widget <- function(fig, width = NULL, height = NULL, elementId = NULL, config = NULL) {
  layout <- unclass(fig$layout %||% list())
  if (is.null(layout$template)) {
    tpl <- default_template()
    if (!identical(tpl, "none")) layout$template <- get_template(tpl)
  }
  if (!length(layout)) layout <- structure(list(), names = character())
  setting <- function(name) attr(fig, paste0("plotly_", name), exact = TRUE) %||% fig[[name]]
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
  if (!is.null(setting("selectize"))) x$selectize <- lp_selectize_json(setting("selectize"))
  attr(x, "TOJSON_FUNC") <- widget_to_JSON
  deps <- list()
  if (!is.null(cfg$locale) && cfg$locale != "en") deps <- c(deps, list(locale_dependency(cfg$locale)))
  if (identical(setting("mathjax"), "cdn")) deps <- c(deps, list(mathjax_dependency()))
  if (!is.null(x$sets)) deps <- c(deps, lp_crosstalk_deps(x$highlight))
  htmlwidgets::createWidget(
    name = "plotly_R_core",
    x = x,
    width = width %||% layout$width,
    height = height %||% layout$height,
    package = "plotly.R.core",
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
as_widget <- function(x, ...) {
  if (inherits(x, "htmlwidget") && !is_legacy_plot(x)) return(x)
  if (is_legacy_plot(x)) return(legacy_widget(x, ...))
  plotly_widget(x, ...)
}

locale_dependency <- function(locale) {
  htmltools::htmlDependency(
    name = paste0("plotly-locale-", locale), version = plotlyjs_version(),
    src = "htmlwidgets/lib/plotlyjs/locales", script = paste0(locale, ".js"),
    package = "plotly.R.core", all_files = FALSE
  )
}

mathjax_dependency <- function() {
  htmltools::htmlDependency(
    name = "mathjax", version = "2.7.5",
    src = c(href = "https://cdn.jsdelivr.net/npm/mathjax@2.7.5"),
    script = "MathJax.js?config=TeX-AMS-MML_SVG"
  )
}

# JSON serialiser used by the widget: length-1 vectors become scalars and
# missing values become null, matching what plotly.js expects.
to_JSON <- function(x, ...) {
  jsonlite::toJSON(
    prepare_json(x), digits = NA, auto_unbox = TRUE, force = TRUE,
    null = "null", na = "null", dataframe = "values", json_verbatim = TRUE, ...
  )
}

# Widget serialiser: numeric arrays in traces (and frame traces) are sent as
# base64-encoded typed arrays, which plotly.js decodes much faster than JSON
# number lists, like plotly.py's convert_to_base64().
# htmlwidgets calls it with its payload, list(x = <widget data>, evals, ...).
widget_to_JSON <- function(x, ...) {
  if (is.list(x[["x"]])) x[["x"]] <- b64_figure(x[["x"]]) else x <- b64_figure(x)
  to_JSON(x, ...)
}

b64_figure <- function(x) {
  x[["data"]] <- b64_traces(x[["data"]])
  if (length(x[["frames"]])) {
    x[["frames"]] <- lapply(x[["frames"]], function(f) {
      if (is.list(f) && length(f[["data"]])) f[["data"]] <- b64_traces(f[["data"]])
      f
    })
  }
  x
}

# Keys plotly.py never encodes (plotly.js reads them without decoding).
B64_SKIP_KEYS <- c("geojson", "layer", "layers", "range")

b64_traces <- function(traces) {
  if (!is.list(traces)) return(traces)
  lapply(traces, b64_encode)
}

# Like convert_to_base64(): only named entries are encoded, unnamed lists
# (e.g. a z given as a list of rows) are searched but left as JSON arrays.
b64_encode <- function(x) {
  if (!is.list(x) || !length(x)) return(x)
  nms <- names(x)
  for (i in seq_along(x)) {
    key <- if (is.null(nms)) "" else nms[[i]]
    if (key %in% B64_SKIP_KEYS) next
    v <- x[[i]]
    if (nzchar(key) && is_b64_array(v)) {
      x[[i]] <- typed_array_spec(v)
    } else if (nzchar(key) && is_b64_date(v)) {
      x[[i]] <- date_array_spec(v) %||% v
    } else if (is.list(v) && !is.data.frame(v)) {
      x[[i]] <- b64_encode(v)
    }
  }
  x
}

# Plain numeric vectors that serialise as JSON arrays (length 0 or 1 stays
# as is, unless wrapped in I()), and numeric matrices; as_float32() vectors too.
is_b64_array <- function(v) {
  if (!(is.double(v) || is.integer(v))) return(FALSE)
  cls <- oldClass(v)
  if (!all(cls %in% c("AsIs", "plotly_float32"))) return(FALSE)
  d <- dim(v)
  if (!is.null(d)) return(length(d) == 2L && length(v) > 0L)
  length(v) > 1L || (length(v) == 1L && "AsIs" %in% cls)
}

# Date and date-time vectors (not matrices) that serialise as JSON arrays.
is_b64_date <- function(v) {
  if (!inherits(v, c("POSIXt", "Date")) || !is.null(dim(v))) return(FALSE)
  if (!all(oldClass(v) %in% c("AsIs", "POSIXct", "POSIXlt", "POSIXt", "Date"))) return(FALSE)
  length(v) > 1L || (length(v) == 1L && inherits(v, "AsIs"))
}

# Dates as days since 1970 and date-times as milliseconds since 1970 in the
# object's time zone (wall-clock time), with `rdate` marking them for the
# widget's JavaScript, which turns them back into the strings to_JSON() would
# write ("YYYY-MM-DD", "YYYY-MM-DD HH:MM:SS[.mmm]") before plotting: much
# faster than formatting and escaping strings in R. NULL (send strings) for
# years outside 1000-9999 or an unknown time zone offset.
date_array_spec <- function(v) {
  if (inherits(v, "Date")) {
    days <- floor(as.numeric(v))
    rng <- suppressWarnings(range(days, na.rm = TRUE))
    if (all(is.finite(rng)) && (rng[1] < -354285 || rng[2] > 2932896)) return(NULL)
    out <- typed_array_spec(days, float32 = FALSE)
    out$rdate <- "date"
    return(out)
  }
  v <- as.POSIXct(v)
  secs <- as.numeric(v)
  off <- as.POSIXlt(v)$gmtoff
  ok <- !is.na(secs)
  if (!any(ok)) return(NULL)
  if (is.null(off) || anyNA(off[ok])) return(NULL)
  off[!ok] <- 0
  ms <- round((secs + off) * 1000)
  rng <- range(ms[ok])
  if (!all(is.finite(rng)) || rng[1] < -30610224000000 || rng[2] > 253402300799999) return(NULL)
  out <- typed_array_spec(ms, float32 = FALSE)
  out$rdate <- "datetime"
  out
}

INT32_MAX <- .Machine$integer.max

# A plotly.js typed array spec: {dtype, bdata[, shape]}. Integers, and doubles
# that are all whole numbers in the 32-bit range, are sent as the smallest
# signed integer type that holds them (lossless). Other doubles are float64,
# or float32 for as_float32() vectors or with options(plotly.R.core.float32 =
# TRUE). Missing values become NaN (a gap in plotly.js), so integers with
# missing values are sent as floats.
typed_array_spec <- function(v, float32 = isTRUE(getOption("plotly.R.core.float32"))) {
  float32 <- float32 || inherits(v, "plotly_float32")
  d <- dim(v)
  v <- unclass(v)
  if (length(d) == 2L) v <- t(v)
  v <- as.vector(v)
  if (is.double(v) && length(v)) {
    r <- range(v)
    if (all(is.finite(r)) && r[1] >= -INT32_MAX && r[2] <= INT32_MAX && all(v == trunc(v))) {
      v <- as.integer(v)
    }
  }
  if (is.integer(v) && anyNA(v)) v <- as.double(v)
  if (is.integer(v) && length(v)) {
    r <- range(v)
    size <- if (r[1] >= -128L && r[2] <= 127L) 1L else if (r[1] >= -32768L && r[2] <= 32767L) 2L else 4L
    dtype <- c("i1", "i2", NA, "i4")[size]
  } else {
    v <- as.double(v)
    size <- if (float32) 4L else 8L
    dtype <- if (float32) "f4" else "f8"
  }
  out <- list(dtype = dtype,
              bdata = base64enc::base64encode(writeBin(v, raw(), size = size, endian = "little")))
  if (length(d) == 2L) out$shape <- paste(d, collapse = ", ")
  out
}

#' Send numeric data to the browser in single precision
#'
#' Marks a numeric vector or matrix to be sent to plotly.js as a float32
#' typed array: 4 bytes per value instead of 8, halving the size of the
#' widget's data and of plotly.js's copy of it. Use it in trace properties,
#' or on data frame columns used by [px_scatter()] and the other `px_*()`
#' functions. Set `options(plotly.R.core.float32 = TRUE)` to send all
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
  if (!is.numeric(x) || is.object(x) && !all(oldClass(x) %in% c("AsIs", "plotly_float32"))) {
    stop("as_float32() needs a numeric vector or matrix, not an object of class: ",
         class(x)[1], call. = FALSE)
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
  if (!length(oldClass(v))) v <- unclass(v)
  v
}

# Convert values jsonlite would serialise lossily. Date-times become strings
# with millisecond precision; other values are left as they are.
prepare_json <- function(x) {
  if (inherits(x, "plotly_float32")) return(unclass_float32(x))
  if (inherits(x, "POSIXt")) {
    out <- format_datetime(x)
    if (is.null(dim(x)) && (length(out) != 1L || inherits(x, "AsIs"))) return(json_strings(out))
    if (inherits(x, "AsIs")) out <- I(out)
    dim(out) <- dim(x)
    return(out)
  }
  if (is.list(x) && length(x)) x[] <- lapply(x, prepare_json)
  x
}

# Format date-times as "YYYY-MM-DD HH:MM:SS[.mmm]" in the object's time zone
# (plotly.js has no time zones). Milliseconds are rounded, not truncated as
# format(x, "%OS3") does, and omitted when zero.
format_datetime <- function(x) {
  x <- as.POSIXct(x)
  tz <- attr(x, "tzone")[1L] %||% ""
  secs <- round(as.numeric(x) * 1000) / 1000
  whole <- floor(secs)
  out <- format(.POSIXct(whole, tz = tz), "%Y-%m-%d %H:%M:%S")
  ms <- round((secs - whole) * 1000)
  i <- which(ms > 0)
  if (length(i)) out[i] <- paste0(out[i], ".", formatC(as.integer(ms[i]), width = 3, flag = "0"))
  out[is.na(x)] <- NA_character_
  out
}

# A JSON array of strings that need no escaping (e.g. formatted dates), kept
# as is by jsonlite (json_verbatim): faster than its per-string escaping.
json_strings <- function(x) {
  if (!length(x)) return(structure("[]", class = "json"))
  s <- paste0('"', x, '"')
  s[is.na(x)] <- "null"
  structure(paste0("[", paste(s, collapse = ","), "]"), class = "json")
}

`%||%` <- function(x, y) if (is.null(x)) y else x
