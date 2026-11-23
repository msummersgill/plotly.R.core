# Linked highlighting (crosstalk) -----------------------------------------------
#
# A trace is linked to a crosstalk group by giving it a key per point (the
# SharedData row keys) and the group's name. Figures keep these as widget
# settings ("keys" and "sets", one entry per trace; "frameKeys" for animation
# frames), not as trace attributes, which plotly.js doesn't know. The widget's
# JavaScript (plotly_core.js) puts them back on the traces and does the
# linking: selecting points in one view selects the same keys in every view
# of the group (other plots, crosstalk filters, DT tables, leaflet maps).
#
# go_figure() and add_<trace>() accept a SharedData as their data and set the
# keys themselves (as do plotly.express's px_*() functions);
# set_crosstalk_keys() links traces of any figure.

# Helpers of highlight() (see highlight.R) --------------------------------------

# TRUE or FALSE from a flag given as e.g. 1, "TRUE" or NULL (as the plotly
# package's highlight() took them)
as_flag <- function(x) {
  isTRUE(as.logical(x[1L]))
}

# Colours as hex, for the colour picker; CSS colours that R doesn't know
# (e.g. "rgba(255,0,0,0.5)" from the plotly package's toRGB()) as they are,
# as plotly.js and the colour picker read them
hex_colour <- function(x) {
  x <- as.character(x)
  css <- grepl("^\\s*(rgba?|hsla?)\\(", x, ignore.case = TRUE)
  x[!css] <- r_hex_colour(x[!css])
  x
}

r_hex_colour <- function(x) {
  if (!length(x)) {
    return(character())
  }
  rgb <- grDevices::col2rgb(x, alpha = TRUE)
  out <- grDevices::rgb(rgb[1L, ], rgb[2L, ], rgb[3L, ], maxColorValue = 255)
  opaque <- rgb[4L, ] == 255
  out[!opaque] <- grDevices::rgb(
    rgb[1L, !opaque],
    rgb[2L, !opaque],
    rgb[3L, !opaque],
    rgb[4L, !opaque],
    maxColorValue = 255
  )
  out
}

#' Link traces to a crosstalk group
#'
#' Gives traces of a figure the keys of a [crosstalk::SharedData], so that
#' selecting their points selects the same rows in other views of the
#' crosstalk group (and the reverse). This happens by itself for
#' `add_<trace>()` traces whose formula properties are evaluated in a
#' SharedData (piped into [go_figure()] or given as `data`); use this for
#' other traces. See [highlight()] for how selections are
#' made and shown.
#'
#' @param fig A [go_figure()].
#' @param key A [crosstalk::SharedData], whose row keys give the keys of the
#'   points, in the same order as the trace's data; or the keys (a vector
#'   with one per point), or a list with the keys of each trace in `traces`.
#' @param group The crosstalk group. Default: the SharedData's group.
#' @param traces Indices of the traces to link (default: all).
#' @param simple Whether each trace as a whole stands for all its keys (e.g. a
#'   line or a fitted curve, which can't be split into points); selecting the
#'   trace selects them all, and it is highlighted when all are selected.
#' @return `fig`, linked.
#' @export
#' @examplesIf requireNamespace("crosstalk", quietly = TRUE)
#' sd <- crosstalk::SharedData$new(iris)
#' go_figure() |>
#'   add_scatter(x = iris$Sepal.Width, y = iris$Sepal.Length, mode = "markers") |>
#'   set_crosstalk_keys(sd) |>
#'   highlight(on = "plotly_selected")
set_crosstalk_keys <- function(
  fig,
  key,
  group = NULL,
  traces = NULL,
  simple = FALSE
) {
  check_figure(fig)
  if (inherits(key, "SharedData")) {
    group <- group %||% key$groupName()
    key <- key$key()
  }
  if (!is.character(group) || length(group) != 1L || is.na(group)) {
    stop(
      "`group` must be a crosstalk group name (or `key` a SharedData)",
      call. = FALSE
    )
  }
  n <- length(fig$data)
  traces <- traces %||% seq_len(n)
  if (!length(traces) || any(traces < 1L | traces > n)) {
    stop(
      sprintf("`traces` must be indices of the figure's %d traces", n),
      call. = FALSE
    )
  }
  if (!is.list(key)) {
    key <- rep(list(key), length(traces))
  }
  if (length(key) != length(traces)) {
    stop("`key` must give the keys of each trace in `traces`", call. = FALSE)
  }
  keys <- pad_list(get_widget_setting(fig, "keys"), n)
  sets <- pad_list(get_widget_setting(fig, "sets"), n)
  for (i in seq_along(traces)) {
    k <- as.character(key[[i]])
    keys[[traces[[i]]]] <- if (simple) list(simple = unique(k)) else k
    sets[[traces[[i]]]] <- group
  }
  fig <- set_widget_setting(fig, "keys", keys)
  set_widget_setting(fig, "sets", sets)
}

# After add_<trace>(): link the traces it added to the crosstalk group of a
# SharedData given as its data (see trace_data()), when their points are
# the SharedData's rows (a data array with one value per row)
link_shared_traces <- function(fig, data, n_before) {
  ct <- attr(data, "crosstalk", exact = TRUE)
  n <- length(fig$data)
  if (is.null(ct) || n <= n_before) {
    return(fig)
  }
  rows <- length(ct$key)
  linked <- Filter(
    function(i) trace_has_rows(fig$data[[i]], rows),
    seq.int(n_before + 1L, n)
  )
  if (!length(linked)) {
    return(fig)
  }
  set_crosstalk_keys(fig, ct$key, ct$group, traces = linked)
}

TRACE_ROW_ARRAYS <- c(
  "x",
  "y",
  "z",
  "lat",
  "lon",
  "locations",
  "values",
  "labels",
  "r",
  "theta",
  "a",
  "b",
  "c",
  "real",
  "imag",
  "ids",
  "customdata"
)

trace_has_rows <- function(trace, n) {
  tr <- unclass(trace)
  any(vapply(
    intersect(names(tr), TRACE_ROW_ARRAYS),
    function(nm) !is.list(tr[[nm]]) && NROW(tr[[nm]]) == n,
    logical(1)
  ))
}

#' @rdname plotly.core-extending
#' @export
pad_list <- function(x, n) {
  x <- as.list(x)
  length(x) <- max(length(x), n)
  x
}

# Rendering -------------------------------------------------------------------

# The widget payload's crosstalk settings, when traces are linked: keys as
# strings, the highlight options (defaults unless set), keys selected at
# first (from defaultValues), the selectize dropdowns' items and a dragmode
# suiting the selection event.
crosstalk_payload <- function(x, selectize = NULL) {
  hl <- utils::modifyList(highlight_defaults(), x$highlight %||% list())
  if (!is.null(hl$off)) {
    hl$off <- as.character(hl$off)
  }
  x$keys <- lapply(x$keys, key_json)
  x$frameKeys <- lapply(x$frameKeys, function(fk) {
    fk$keys <- lapply(fk$keys, key_json)
    fk
  })
  sets <- unlist(x$sets, use.names = FALSE)
  groups <- unique(sets[!is.na(sets)])
  # selectize payloads given by the plotly package, keyed by a hash of the
  # group name: find them by their group
  given <- selectize_json(selectize)
  sel <- list()
  default_sel <- list()
  for (g in groups) {
    k <- unique(unlist(
      lapply(seq_along(x$sets), function(i) {
        if (identical(x$sets[[i]], g)) key_values(x$keys[[i]])
      }),
      use.names = FALSE
    ))
    vals <- intersect(as.character(hl$defaultValues), k)
    if (length(vals)) {
      default_sel[[g]] <- I(vals)
    }
    if (!isFALSE(hl$selectize)) {
      old <- given[[g]] %||%
        Find(function(o) identical(o$group, g), given)
      opts <- if (!is.null(old) && all(k %in% item_values(old))) {
        old
      } else {
        o <- list(
          items = lapply(k, function(v) list(value = v, label = v)),
          group = g
        )
        if (is.list(hl$selectize)) utils::modifyList(o, hl$selectize) else o
      }
      sel[[g]] <- opts
    }
  }
  hl$defaultValues <- NULL
  if (length(default_sel)) {
    hl$defaultSelection <- default_sel
  }
  x$highlight <- hl
  x$selectize <- if (length(sel)) sel
  if (
    is.null(x$layout$dragmode) && is.null(x$layout$template$layout$dragmode)
  ) {
    if (
      identical(hl$on, "plotly_selected") ||
        identical(hl$on, "plotly_selecting")
    ) {
      x$layout$dragmode <- "select"
    }
  }
  x
}

# A trace's keys for JSON: per-point keys as an array (even of one), or
# {simple: [...]}
key_json <- function(k) {
  if (is.null(k)) {
    return(NULL)
  }
  if (is.list(k) && !is.null(k$simple)) {
    return(list(simple = I(as.character(k$simple))))
  }
  if (is.list(k)) {
    return(lapply(k, function(kk) I(as.character(kk))))
  }
  I(as.character(k))
}

key_values <- function(k) {
  if (is.list(k) && !is.null(k$simple)) {
    return(as.character(k$simple))
  }
  as.character(unlist(k, use.names = FALSE))
}

item_values <- function(o) {
  vapply(o$items, function(it) as.character(it$value), "")
}
