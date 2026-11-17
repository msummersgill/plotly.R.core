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
# px_*() functions accept a SharedData as `data_frame` and set the keys
# themselves; set_crosstalk_keys() links traces of any figure.

#' Highlight linked selections
#'
#' Sets how a figure responds to, and shows, selections of points linked with
#' crosstalk. A figure is linked when its data come from a
#' [crosstalk::SharedData] (give one as the `data_frame` of a `px_*()`
#' function, or link traces with [set_crosstalk_keys()]): selecting points
#' then selects the rows with the same keys in every view of the same
#' crosstalk group, such as other plots, [crosstalk::filter_select()] inputs,
#' DT tables or leaflet maps. Linked figures highlight on click by default;
#' `highlight()` changes that.
#'
#' The options match the plotly package's `highlight()`, and `highlight()`
#' also works on plotly htmlwidgets.
#'
#' @param p A [go_figure()] (e.g. from a `px_*()` function) or a plotly
#'   htmlwidget.
#' @param on The event that selects points: `"plotly_click"`,
#'   `"plotly_hover"`, `"plotly_selected"` (box or lasso selection) or
#'   `"plotly_selecting"` (selection while dragging). `NULL` turns selecting
#'   from this plot off.
#' @param off The event that clears the selection: `"plotly_doubleclick"`,
#'   `"plotly_deselect"` or `"plotly_relayout"`. The default matches `on`:
#'   `"plotly_deselect"` for selections, otherwise `"plotly_doubleclick"`.
#'   `NULL` turns clearing off.
#' @param persistent Whether new selections add to the current one rather
#'   than replace it. Holding the shift key while selecting does this too.
#' @param dynamic Whether to show a colour picker for the selection colour.
#' @param color The selection colour (several, for `dynamic = TRUE`): R
#'   colour names, hex colours or CSS colours such as `"rgba(255,0,0,0.5)"`.
#'   `NULL` keeps the points' own colours and dims the rest.
#' @param selectize Whether to show a searchable dropdown of the keys, which
#'   selects them; or a list of selectize.js options for it.
#' @param defaultValues Keys selected when the figure is first shown.
#' @param opacityDim Opacity multiplier (0 to 1) of points not selected.
#' @param selected Trace attributes of the selected points, made with
#'   `attrs_selected()`.
#' @param debounce Milliseconds to wait before selecting, for frequent events
#'   such as `"plotly_hover"` and `"plotly_selecting"`.
#' @param ... Unused.
#' @return `p` with the highlighting options. `attrs_selected()` returns a
#'   list of trace attributes.
#' @seealso [set_crosstalk_keys()]
#' @export
#' @examplesIf requireNamespace("crosstalk", quietly = TRUE)
#' sd <- crosstalk::SharedData$new(px_data_iris())
#' px_scatter(sd, x = ~sepal_width, y = ~sepal_length, color = ~species) |>
#'   highlight(on = "plotly_selected", color = "red")
highlight <- function(
  p,
  on = "plotly_click",
  off,
  persistent = getOption("persistent", FALSE),
  dynamic = FALSE,
  color = NULL,
  selectize = FALSE,
  defaultValues = NULL,
  opacityDim = getOption("opacityDim", 0.2),
  selected = attrs_selected(),
  debounce = 0,
  ...
) {
  if (...length()) {
    warning(
      "Unsupported arguments: ",
      paste(names(list(...)), collapse = ", "),
      call. = FALSE
    )
  }
  if (!is.null(on)) {
    on <- match.arg(on, HIGHLIGHT_ON)
  }
  # A default `off` is marked (as the plotly package's default() does), so
  # the plotly package can say which event it chose
  off <- if (missing(off)) {
    structure(default_off(on), class = "plotly_default")
  } else if (!is.null(off)) {
    match.arg(off, HIGHLIGHT_OFF)
  }
  if (
    !is.numeric(opacityDim) ||
      length(opacityDim) != 1L ||
      opacityDim < 0 ||
      opacityDim > 1
  ) {
    stop("`opacityDim` must be a number between 0 and 1", call. = FALSE)
  }
  persistent <- as_flag(persistent)
  dynamic <- as_flag(dynamic)
  if (!is.list(selectize)) {
    selectize <- as_flag(selectize)
  }
  if (persistent) {
    message(
      "We recommend setting `persistent` to `FALSE` (the default) because ",
      "persistent selection mode can now be used by holding the shift key ",
      "(while triggering the `on` event)."
    )
  }
  if (dynamic && length(color) < 2L) {
    message("Adding more colors to the selection color palette.")
    color <- c(color, SELECTION_PALETTE)
  }
  if (!dynamic && length(color) > 1L) {
    warning(
      "Only one selection colour is used unless `dynamic = TRUE`",
      call. = FALSE
    )
    color <- color[[1L]]
  }
  hl <- list(
    on = on,
    off = off,
    persistent = persistent,
    dynamic = dynamic,
    color = if (length(color)) hex_colour(color),
    selectize = selectize,
    defaultValues = defaultValues,
    opacityDim = opacityDim,
    selected = selected,
    debounce = debounce
  )
  if (inherits(p, "htmlwidget")) {
    # As the plotly package's highlight() does: the widget's libraries are
    # fixed before it renders. Only the plotly package's widgets (built
    # later, by plotly_build()) use the default marker.
    if (!inherits(p, "plotly") && !is.null(hl$off)) {
      hl$off <- as.character(hl$off)
    }
    p$x$highlight <- hl
    p$dependencies <- c(
      p$dependencies,
      crosstalk_deps(list(selectize = selectize, dynamic = dynamic))
    )
    return(p)
  }
  set_widget_setting(p, "highlight", hl)
}

#' @rdname highlight
#' @param opacity Opacity of the selected points.
#' @export
attrs_selected <- function(opacity = 1, ...) {
  if (!is.numeric(opacity) || opacity < 0 || opacity > 1) {
    stop("`opacity` must be between 0 and 1", call. = FALSE)
  }
  c(list(...), list(opacity = opacity))
}

HIGHLIGHT_ON <- paste0("plotly_", c("click", "hover", "selected", "selecting"))
HIGHLIGHT_OFF <- paste0("plotly_", c("doubleclick", "deselect", "relayout"))

# ColorBrewer's "Set1", for dynamic = TRUE
SELECTION_PALETTE <- c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3")

default_off <- function(on) {
  switch(
    on %||% "",
    plotly_selected = ,
    plotly_selecting = "plotly_deselect",
    plotly_click = ,
    plotly_hover = "plotly_doubleclick",
    "plotly_relayout"
  )
}

# The defaults of highlight(), for linked figures without highlight()
highlight_defaults <- function() {
  list(
    on = "plotly_click",
    off = "plotly_doubleclick",
    persistent = getOption("persistent", FALSE),
    dynamic = FALSE,
    color = NULL,
    selectize = FALSE,
    defaultValues = NULL,
    opacityDim = getOption("opacityDim", 0.2),
    selected = attrs_selected(),
    debounce = 0
  )
}

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
#' crosstalk group (and the reverse). `px_*()` functions do this themselves
#' when `data_frame` is a SharedData; use this for traces made otherwise,
#' such as with `add_scatter()`. See [highlight()] for how selections are
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
#' sd <- crosstalk::SharedData$new(px_data_iris())
#' iris <- sd$origData()
#' go_figure() |>
#'   add_scatter(x = iris$sepal_width, y = iris$sepal_length, mode = "markers") |>
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
    stop(sprintf("`traces` must be indices of the figure's %d traces", n), call. = FALSE)
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
  if (is.null(x$layout$dragmode) && is.null(x$layout$template$layout$dragmode)) {
    if (identical(hl$on, "plotly_selected") || identical(hl$on, "plotly_selecting")) {
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

# Plotly Express ---------------------------------------------------------------

# Trace types whose points are the data frame's rows, so they can carry its
# keys (aggregating traces, such as pies, sunbursts and heatmaps, can't)
PX_KEYED_TYPES <- c(
  "scatter",
  "scattergl",
  "scatter3d",
  "scatterpolar",
  "scatterpolargl",
  "scatterternary",
  "scattergeo",
  "scattermap",
  "bar",
  "histogram",
  "box",
  "violin",
  "funnel",
  "choropleth",
  "choroplethmap",
  "splom"
)

# The column of px data frames holding the SharedData's keys
PX_KEY_COL <- ".plotly_crosstalk_key"

# A SharedData given as `data_frame`: its data, with its keys and group kept
# in args
px_shared_data <- function(args) {
  sd <- args$data_frame
  if (!inherits(sd, "SharedData")) {
    return(args)
  }
  args$data_frame <- sd$origData()
  args$crosstalk_key <- as.character(sd$key())
  args$crosstalk_group <- sd$groupName()
  args
}

# Keys of a px trace made from `trace_data`
px_trace_key <- function(args, ctor, spec, trace_data) {
  if (is.null(args$crosstalk_key) || !PX_KEY_COL %in% names(trace_data)) {
    return(NULL)
  }
  k <- as.character(trace_data[[PX_KEY_COL]])
  if ("trendline" %in% spec$attrs) {
    return(list(simple = unique(k)))
  }
  if (!ctor %in% PX_KEYED_TYPES) {
    return(NULL)
  }
  k
}

# Set the figure's keys from those of the px traces of each frame
# (`frame_keys`: per frame, a list with each trace's keys or NULL)
px_set_keys <- function(fig, args, frame_keys) {
  if (is.null(args$crosstalk_key)) {
    return(fig)
  }
  sets_of <- function(keys) {
    lapply(keys, function(k) if (!is.null(k)) args$crosstalk_group)
  }
  first <- if (length(frame_keys)) frame_keys[[1L]] else list()
  if (all(vapply(first, is.null, logical(1)))) {
    warning(
      "This kind of figure can't be linked with crosstalk: its traces don't ",
      "show the data frame's rows as points",
      call. = FALSE
    )
    return(fig)
  }
  n <- length(fig$data)
  fig <- set_widget_setting(fig, "keys", pad_list(first, n))
  fig <- set_widget_setting(fig, "sets", pad_list(sets_of(first), n))
  if (length(frame_keys) > 1L) {
    fig <- set_widget_setting(
      fig,
      "frameKeys",
      lapply(frame_keys, function(k) list(keys = k, sets = sets_of(k)))
    )
  }
  fig
}
