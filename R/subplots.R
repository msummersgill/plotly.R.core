# Subplot grids (a port of plotly.py's plotly/_subplots.py).
#
# make_subplots() lays out a grid of subplots in a figure's layout and
# records, for each grid cell, how traces are attached to it ("subplot
# refs"). The grid is stored as the "grid_ref" attribute of the figure and is
# used by the row/col arguments of add_trace(), update_xaxes(),
# add_annotation(), etc.
#
# A subplot ref is list(subplot_type, layout_keys, trace_kwargs), e.g.
#   list(subplot_type = "xy", layout_keys = c("xaxis2", "yaxis2"),
#        trace_kwargs = list(xaxis = "x2", yaxis = "y2"))

# Subplot types positioned individually with a `domain` property.
SINGLE_SUBPLOT_TYPES <- c("scene", "geo", "polar", "ternary", "map")
SUBPLOT_TYPES_ALL <- c(SINGLE_SUBPLOT_TYPES, "xy", "domain")
# Types whose traces refer to them with a `subplot` property, not `<type>`.
SUBPLOT_PROP_NAMED_SUBPLOT <- c("polar", "ternary", "map")

#' Create a figure with a grid of subplots
#'
#' Lays out a `rows` x `cols` grid of subplots, ported from plotly.py's
#' `make_subplots()`. Traces and layout objects can then be placed in a cell
#' with the `row` and `col` arguments of [add_trace()], the `add_<trace>()`
#' functions, [update_xaxes()], [add_annotation()] and similar functions.
#'
#' @param rows,cols Number of rows and columns in the grid.
#' @param shared_xaxes,shared_yaxes Link axes so they pan and zoom together:
#'   `TRUE` (x axes within each column, y axes within each row), `"columns"`,
#'   `"rows"`, `"all"` or `FALSE`. Tick labels are hidden on all but the
#'   outer axes.
#' @param start_cell Which cell is row 1, column 1: `"top-left"` or
#'   `"bottom-left"`.
#' @param print_grid If `TRUE`, print the grid layout (see [print_grid()]).
#' @param horizontal_spacing,vertical_spacing Space between columns or rows,
#'   as a fraction of the figure width or height. Defaults to `0.2 / cols`
#'   (`0.4 / cols` with secondary y axes) and `0.3 / rows` (`0.5 / rows` with
#'   subplot titles).
#' @param subplot_titles Character vector of titles, one per subplot in
#'   row-major order (insets last). Empty strings are skipped.
#' @param column_widths,row_heights Relative column widths and row heights;
#'   default equal.
#' @param specs Per-cell subplot specifications: a list of `rows` lists, each
#'   holding `cols` elements. Each element is `NULL` (empty cell) or a named
#'   list with any of:
#'   * `type`: `"xy"` (default, 2D cartesian), `"scene"`, `"polar"`,
#'     `"ternary"`, `"geo"`, `"map"`, `"domain"` (e.g. pie charts), or a
#'     trace type such as `"bar"` or `"pie"` to use its subplot type.
#'   * `secondary_y`: `TRUE` to add a second y axis on the right (`"xy"`
#'     only).
#'   * `colspan`, `rowspan`: number of columns or rows the subplot spans.
#'   * `l`, `r`, `b`, `t`: padding on each side, as a fraction of the figure.
#' @param insets List of inset subplots, each a named list with `cell`
#'   (`c(row, col)` of the cell it sits in), `type`, and `l`, `b` (offsets)
#'   and `w`, `h` (size, or `"to_end"`) as fractions of the cell.
#' @param column_titles,row_titles Titles above each column and to the right
#'   of each row.
#' @param x_title,y_title Titles below and to the left of the whole grid.
#' @param figure An existing [go_figure()] to add the subplots to.
#' @param font Font for the subplot, column, row and x/y titles: a named list
#'   or [go_layout_annotation_font()] object. Default `list(size = 16)`.
#' @return A `go_figure` with the subplot grid in its layout.
#' @seealso [print_grid()], [get_subplot()]
#' @export
#' @examples
#' fig <- make_subplots(rows = 1, cols = 2, subplot_titles = c("Left", "Right")) |>
#'   add_scatter(x = 1:3, y = c(4, 5, 6), row = 1, col = 1) |>
#'   add_scatter(x = 20:22, y = c(50, 60, 70), row = 1, col = 2) |>
#'   update_yaxes(title_text = "y", row = 1, col = 1)
#'
#' # Mixed subplot types and a secondary y axis
#' fig <- make_subplots(
#'   rows = 2, cols = 2,
#'   specs = list(
#'     list(list(secondary_y = TRUE), list(type = "domain")),
#'     list(list(colspan = 2), NULL)
#'   ),
#'   print_grid = TRUE
#' )
make_subplots <- function(rows = 1, cols = 1, shared_xaxes = FALSE, shared_yaxes = FALSE,
                          start_cell = "top-left", print_grid = FALSE,
                          horizontal_spacing = NULL, vertical_spacing = NULL,
                          subplot_titles = NULL, column_widths = NULL, row_heights = NULL,
                          specs = NULL, insets = NULL, column_titles = NULL, row_titles = NULL,
                          x_title = NULL, y_title = NULL, figure = NULL, font = NULL) {
  is_count <- function(x) is.numeric(x) && length(x) == 1L && !is.na(x) && x >= 1 && x == round(x)
  if (!is_count(rows)) stop("`rows` must be a whole number greater than 0", call. = FALSE)
  if (!is_count(cols)) stop("`cols` must be a whole number greater than 0", call. = FALSE)
  rows <- as.integer(rows)
  cols <- as.integer(cols)

  row_dir <- switch(start_cell, "bottom-left" = 1L, "top-left" = -1L,
                    stop("`start_cell` must be \"top-left\" or \"bottom-left\"", call. = FALSE))

  specs <- check_specs(specs, rows, cols)
  has_secondary_y <- any(vapply(unlist(specs, recursive = FALSE), function(s) isTRUE(s$secondary_y), logical(1)))
  insets <- check_insets(insets)

  valid_shared <- list(TRUE, FALSE, "rows", "columns", "all")
  for (arg in c("shared_xaxes", "shared_yaxes")) {
    val <- get(arg)
    if (!any(vapply(valid_shared, identical, logical(1), val))) {
      stop(sprintf("`%s` must be TRUE, FALSE, \"rows\", \"columns\" or \"all\"", arg), call. = FALSE)
    }
  }

  horizontal_spacing <- horizontal_spacing %||% ((if (has_secondary_y) 0.4 else 0.2) / cols)
  check_spacing(cols, horizontal_spacing, "Horizontal", "cols", "columns")
  vertical_spacing <- vertical_spacing %||% ((if (!is.null(subplot_titles)) 0.5 else 0.3) / rows)
  check_spacing(rows, vertical_spacing, "Vertical", "rows", "rows")

  if (is.null(subplot_titles)) subplot_titles <- rep("", rows * cols)
  max_width <- if (has_secondary_y) 0.94 else if (length(row_titles)) 0.98 else 1

  widths <- relative_sizes(column_widths, cols, max_width - horizontal_spacing * (cols - 1), "column_widths")
  heights <- relative_sizes(row_heights, rows, 1 - vertical_spacing * (rows - 1), "row_heights")
  if (!is.null(row_heights) && row_dir < 0) heights <- rev(heights)

  layout <- list()
  col_seq <- seq_len(cols)
  row_seq <- if (row_dir > 0) seq_len(rows) else rev(seq_len(rows))
  # Start (x, y) of each cell, in spec order
  grid_x <- function(c) sum(widths[seq_len(c - 1L)]) + (c - 1L) * horizontal_spacing
  grid_y <- function(r) {
    k <- match(r, row_seq) # position of this spec row in the y sequence
    sum(heights[seq_len(k - 1L)]) + (k - 1L) * vertical_spacing
  }

  grid_ref <- lapply(seq_len(rows), function(r) vector("list", cols))
  domains_grid <- lapply(seq_len(rows), function(r) vector("list", cols))
  list_of_domains <- list()
  max_ids <- initial_max_subplot_ids()

  for (r in seq_len(rows)) {
    for (c in seq_len(cols)) {
      spec <- specs[[r]][[c]]
      if (is.null(spec)) next
      c_sp <- c + spec$colspan - 1L
      r_sp <- r + spec$rowspan - 1L
      if (c_sp > cols) stop("Some 'colspan' value is too large for this subplot grid.", call. = FALSE)
      if (r_sp > rows) stop("Some 'rowspan' value is too large for this subplot grid.", call. = FALSE)

      x_domain <- c(grid_x(c) + spec$l, grid_x(c_sp) + widths[[c_sp]] - spec$r)
      if (row_dir > 0) {
        y_s <- grid_y(r) + spec$b
        y_e <- grid_y(r_sp) + heights[[r_sp]] - spec$t
      } else {
        y_s <- grid_y(r_sp) + spec$b
        y_e <- grid_y(r) + heights[[rows + 1L - r]] - spec$t
      }
      y_domain <- c(clamp_domain(y_s, "b"), clamp_domain(y_e, "t"))

      list_of_domains <- c(list_of_domains, list(x_domain, y_domain))
      domains_grid[[r]][c] <- list(list(x_domain, y_domain))
      res <- init_subplot(layout, spec$type, spec$secondary_y, x_domain, y_domain, max_ids)
      layout <- res$layout
      max_ids <- res$max_ids
      grid_ref[[r]][c] <- list(res$refs)
    }
  }

  layout <- configure_shared_axes(layout, grid_ref, specs, "x", shared_xaxes, row_dir, FALSE)
  layout <- configure_shared_axes(layout, grid_ref, specs, "y", shared_yaxes, row_dir, FALSE)
  if (has_secondary_y) layout <- configure_shared_axes(layout, grid_ref, specs, "y", shared_yaxes, row_dir, TRUE)

  insets_ref <- vector("list", length(insets))
  for (i in seq_along(insets)) {
    inset <- insets[[i]]
    r <- inset$cell[[1L]]
    c <- inset$cell[[2L]]
    if (r < 1 || r > rows) stop("Some 'cell' row value is out of range. Note: the starting cell is c(1, 1)", call. = FALSE)
    if (c < 1 || c > cols) stop("Some 'cell' col value is out of range. Note: the starting cell is c(1, 1)", call. = FALSE)
    h <- heights[[rows + 1L - r]]
    x_s <- grid_x(c) + inset$l * widths[[c]]
    x_e <- if (identical(inset$w, "to_end")) grid_x(c) + widths[[c]] else x_s + inset$w * widths[[c]]
    y_s <- grid_y(r) + inset$b * h
    y_e <- if (identical(inset$h, "to_end")) grid_y(r) + h else y_s + inset$h * h
    list_of_domains <- c(list_of_domains, list(c(x_s, x_e), c(y_s, y_e)))
    res <- init_subplot(layout, inset$type, FALSE, c(x_s, x_e), c(y_s, y_e), max_ids)
    layout <- res$layout
    max_ids <- res$max_ids
    insets_ref[[i]] <- res$refs
  }

  grid_str <- build_grid_str(specs, grid_ref, insets, insets_ref, row_seq)

  annotations <- title_annotations(subplot_titles, list_of_domains, font = font)
  if (length(column_titles)) {
    edge_row <- if (row_dir > 0) rows else 1L
    doms <- unlist(lapply(domains_grid[[edge_row]], function(d) d), recursive = FALSE)
    annotations <- c(annotations, title_annotations(column_titles, doms, font = font))
  }
  if (length(row_titles)) {
    doms <- unlist(lapply(domains_grid, function(row) row[[cols]]), recursive = FALSE)
    annotations <- c(annotations, title_annotations(row_titles, doms, edge = "right", font = font))
  }
  if (length(x_title)) {
    annotations <- c(annotations, title_annotations(x_title, list(c(0, max_width), c(0, 1)),
                                                    edge = "bottom", offset = 30, font = font))
  }
  if (length(y_title)) {
    annotations <- c(annotations, title_annotations(y_title, list(c(0, 1), c(0, 1)),
                                                    edge = "left", offset = 40, font = font))
  }
  if (length(annotations)) layout$annotations <- annotations

  if (print_grid) cat(grid_str)

  fig <- update_layout(figure %||% go_figure(), layout)
  attr(fig, "grid_ref") <- grid_ref
  attr(fig, "grid_str") <- grid_str
  fig
}

# Argument checks ------------------------------------------------------------------

SPEC_DEFAULTS <- list(type = "xy", secondary_y = FALSE, colspan = 1L, rowspan = 1L,
                      l = 0, r = 0, b = 0, t = 0)
INSET_DEFAULTS <- list(cell = c(1L, 1L), type = "xy", l = 0, w = "to_end", b = 0, h = "to_end")

fill_defaults <- function(item, defaults, name) {
  if (is.null(item)) return(NULL)
  if (!is.list(item) || (length(item) && is.null(names(item)))) {
    stop(sprintf("Elements of `%s` must be named lists or NULL", name), call. = FALSE)
  }
  bad <- setdiff(names(item), names(defaults))
  if (length(bad)) {
    stop(sprintf("Invalid key in an element of `%s`: %s\n    Valid keys: %s", name,
                 paste(bad, collapse = ", "), paste(names(defaults), collapse = ", ")), call. = FALSE)
  }
  utils::modifyList(defaults, item)
}

check_specs <- function(specs, rows, cols) {
  if (is.null(specs)) return(rep(list(rep(list(SPEC_DEFAULTS), cols)), rows))
  ok <- is.list(specs) && length(specs) == rows &&
    all(vapply(specs, function(row) is.list(row) && length(row) == cols && is.null(names(row)), logical(1)))
  if (!ok) {
    stop(sprintf("`specs` must be a list of %d rows, each a list of %d elements (named lists or NULL)", rows, cols),
         call. = FALSE)
  }
  lapply(specs, function(row) lapply(row, function(spec) {
    spec <- fill_defaults(spec, SPEC_DEFAULTS, "specs")
    if (!is.null(spec) && isTRUE(spec$secondary_y) && !identical(spec$type, "xy")) {
      stop(sprintf("The 'secondary_y' spec property is not supported for subplot of type '%s'\n     'secondary_y' is only supported for subplots of type 'xy'", spec$type), call. = FALSE)
    }
    spec
  }))
}

check_insets <- function(insets) {
  if (is.null(insets) || isFALSE(insets)) return(list())
  if (!is.list(insets) || !all(vapply(insets, is.list, logical(1)))) {
    stop("`insets` must be a list of named lists", call. = FALSE)
  }
  lapply(insets, fill_defaults, defaults = INSET_DEFAULTS, name = "insets")
}

check_spacing <- function(n, spacing, name, var, dim) {
  if (spacing < 0 || spacing > 1) stop(name, " spacing must be between 0 and 1.", call. = FALSE)
  if (n <= 1) return(invisible())
  max_spacing <- 1 / (n - 1)
  if (spacing > max_spacing) {
    stop(sprintf("%s spacing cannot be greater than (1 / (%s - 1)) = %f.\nThe resulting plot would have %d %s (%s=%d).",
                 name, var, max_spacing, n, dim, var, n), call. = FALSE)
  }
}

relative_sizes <- function(sizes, n, total, name) {
  if (is.null(sizes)) return(rep(total / n, n))
  if (!is.numeric(sizes) || length(sizes) != n) {
    stop(sprintf("`%s` must be a numeric vector of length %d", name, n), call. = FALSE)
  }
  total * sizes / sum(sizes)
}

# Snap small floating point overshoots into [0, 1].
clamp_domain <- function(v, side) {
  if (v < 0) {
    if (v > -0.01) return(0)
    stop(sprintf("A combination of the '%s' values, heights, and number of subplots too large for this subplot grid.", side), call. = FALSE)
  }
  if (v > 1) {
    if (v < 1.01) return(1)
    stop(sprintf("A combination of the '%s' values, heights, and number of subplots too large for this subplot grid.", side), call. = FALSE)
  }
  v
}

# Subplot initialisation -------------------------------------------------------------

initial_max_subplot_ids <- function() {
  ids <- as.list(rep(0L, length(SINGLE_SUBPLOT_TYPES) + 2L))
  names(ids) <- c(SINGLE_SUBPLOT_TYPES, "xaxis", "yaxis")
  ids
}

id_suffix <- function(n) if (n > 1L) as.character(n) else ""

subplot_ref <- function(type, layout_keys, trace_kwargs) {
  list(subplot_type = type, layout_keys = layout_keys, trace_kwargs = trace_kwargs)
}

# Subplot type used by a trace type ("bar" -> "xy", "pie" -> "domain", ...),
# from the trace's properties as in plotly.py's _subplot_type_for_trace_type.
subplot_type_for_trace_type <- function(trace_type) {
  entry <- get_validator(trace_type)
  if (is.null(entry$trace_type)) return(NULL)
  props <- entry$children
  if ("domain" %in% props) return("domain")
  if (all(c("xaxis", "yaxis") %in% props)) return("xy")
  if ("geo" %in% props) return("geo")
  if ("scene" %in% props) return("scene")
  if ("subplot" %in% props) {
    base <- get_validator(paste0(trace_type, ".subplot"))$base
    if (base %in% SUBPLOT_PROP_NAMED_SUBPLOT) return(base)
  }
  NULL
}

validate_subplot_type <- function(type) {
  t <- tolower(type)
  if (t %in% SUBPLOT_TYPES_ALL) return(t)
  st <- subplot_type_for_trace_type(t)
  if (is.null(st)) stop(sprintf("Unsupported subplot type: '%s'", type), call. = FALSE)
  st
}

init_subplot <- function(layout, type, secondary_y, x_domain, y_domain, max_ids) {
  type <- validate_subplot_type(type)
  x_domain <- c(max(0, x_domain[[1L]]), min(1, x_domain[[2L]]))
  y_domain <- c(max(0, y_domain[[1L]]), min(1, y_domain[[2L]]))

  if (type == "xy") {
    x_cnt <- max_ids$xaxis + 1L
    y_cnt <- max_ids$yaxis + 1L
    x_label <- paste0("x", id_suffix(x_cnt))
    y_label <- paste0("y", id_suffix(y_cnt))
    xaxis_name <- paste0("xaxis", id_suffix(x_cnt))
    yaxis_name <- paste0("yaxis", id_suffix(y_cnt))
    layout[[xaxis_name]] <- list(domain = x_domain, anchor = y_label)
    layout[[yaxis_name]] <- list(domain = y_domain, anchor = x_label)
    refs <- list(subplot_ref("xy", c(xaxis_name, yaxis_name), list(xaxis = x_label, yaxis = y_label)))
    if (isTRUE(secondary_y)) {
      y_cnt <- y_cnt + 1L
      y2_name <- paste0("yaxis", id_suffix(y_cnt))
      y2_label <- paste0("y", y_cnt)
      refs <- c(refs, list(subplot_ref("xy", c(xaxis_name, y2_name), list(xaxis = x_label, yaxis = y2_label))))
      layout[[y2_name]] <- list(anchor = x_label, overlaying = y_label, side = "right")
    }
    max_ids$xaxis <- x_cnt
    max_ids$yaxis <- y_cnt
  } else if (type %in% SINGLE_SUBPLOT_TYPES) {
    cnt <- max_ids[[type]] + 1L
    label <- paste0(type, id_suffix(cnt))
    layout[[label]] <- list(domain = list(x = x_domain, y = y_domain))
    trace_key <- if (type %in% SUBPLOT_PROP_NAMED_SUBPLOT) "subplot" else type
    refs <- list(subplot_ref(type, label, stats_named(list(label), trace_key)))
    max_ids[[type]] <- cnt
  } else {
    # Domain traces (pie, ...) are positioned individually; layout unchanged.
    refs <- list(subplot_ref("domain", character(), list(domain = list(x = x_domain, y = y_domain))))
  }
  list(layout = layout, refs = refs, max_ids = max_ids)
}

stats_named <- function(x, nm) {
  names(x) <- nm
  x
}

# Shared axes -------------------------------------------------------------------------

configure_shared_axes <- function(layout, grid_ref, specs, x_or_y, shared, row_dir, secondary_y) {
  rows <- length(grid_ref)
  cols <- length(grid_ref[[1L]])
  key_ind <- if (x_or_y == "x") 1L else 2L
  rows_iter <- if (row_dir < 0) rev(seq_len(rows)) else seq_len(rows)
  cols_iter <- if (secondary_y) rev(seq_len(cols)) else seq_len(cols)
  axis_index <- if (secondary_y) 2L else 1L

  first_id <- NULL
  match_axis <- function(r, c, remove_label) {
    refs <- grid_ref[[r]][[c]]
    if (is.null(refs) || axis_index > length(refs)) return()
    ref <- refs[[axis_index]]
    span <- if (x_or_y == "x") specs[[r]][[c]]$colspan else specs[[r]][[c]]$rowspan
    if (ref$subplot_type != "xy" || span != 1L) return()
    axis_name <- ref$layout_keys[[key_ind]]
    if (is.null(first_id)) {
      first_id <<- sub("axis", "", axis_name, fixed = TRUE)
    } else {
      layout[[axis_name]]$matches <<- first_id
      if (remove_label) layout[[axis_name]]$showticklabels <<- FALSE
    }
  }

  if (identical(shared, "columns") || (x_or_y == "x" && isTRUE(shared))) {
    for (c in cols_iter) {
      first_id <- NULL
      for (r in rows_iter) match_axis(r, c, x_or_y == "x")
    }
  } else if (identical(shared, "rows") || (x_or_y == "y" && isTRUE(shared))) {
    for (r in rows_iter) {
      first_id <- NULL
      for (c in cols_iter) match_axis(r, c, x_or_y == "y")
    }
  } else if (identical(shared, "all")) {
    first_id <- NULL
    for (ri in seq_along(rows_iter)) {
      r <- rows_iter[[ri]]
      for (c in cols_iter) {
        remove <- if (x_or_y == "y") {
          if (secondary_y) c < cols else c > 1L
        } else {
          if (row_dir > 0) ri > 1L else r < rows
        }
        match_axis(r, c, remove)
      }
    }
  }
  layout
}

# Titles ---------------------------------------------------------------------------------

title_annotations <- function(titles, domains, edge = "top", offset = 0, font = NULL) {
  x_dom <- domains[seq(1L, length(domains), by = 2L)]
  y_dom <- domains[seq(2L, length(domains), by = 2L)]
  font <- font %||% list(size = 16)
  pos <- switch(edge,
    top = list(x = vapply(x_dom, function(d) sum(d) / 2, 0), y = vapply(y_dom, `[[`, 0, 2L),
               angle = 0, xanchor = "center", yanchor = "bottom", xshift = 0, yshift = offset),
    bottom = list(x = vapply(x_dom, function(d) sum(d) / 2, 0), y = vapply(y_dom, `[[`, 0, 1L),
                  angle = 0, xanchor = "center", yanchor = "top", xshift = 0, yshift = -offset),
    right = list(x = vapply(x_dom, `[[`, 0, 2L), y = vapply(y_dom, function(d) sum(d) / 2, 0),
                 angle = 90, xanchor = "left", yanchor = "middle", xshift = offset, yshift = 0),
    left = list(x = vapply(x_dom, `[[`, 0, 1L), y = vapply(y_dom, function(d) sum(d) / 2, 0),
                angle = -90, xanchor = "right", yanchor = "middle", xshift = -offset, yshift = 0),
    stop("Invalid annotation edge '", edge, "'", call. = FALSE)
  )
  out <- list()
  for (i in seq_along(titles)) {
    if (i > length(pos$y) || is.na(titles[[i]]) || !nzchar(titles[[i]])) next
    a <- list(y = pos$y[[i]], xref = "paper", x = pos$x[[i]], yref = "paper", text = titles[[i]],
              showarrow = FALSE, font = font, xanchor = pos$xanchor, yanchor = pos$yanchor)
    if (pos$xshift != 0) a$xshift <- pos$xshift
    if (pos$yshift != 0) a$yshift <- pos$yshift
    if (pos$angle != 0) a$textangle <- pos$angle
    out <- c(out, list(a))
  }
  out
}

# Grid description -------------------------------------------------------------------------

build_grid_str <- function(specs, grid_ref, insets, insets_ref, row_seq) {
  rows <- length(specs)
  cols <- length(specs[[1L]])
  s_str <- "[ "
  e_str <- " ]"
  s_top <- "\u23a1 "
  s_mid <- "\u23a2 "
  s_bot <- "\u23a3 "
  e_top <- " \u23a4"
  e_mid <- " \u239f"
  e_bot <- " \u23a6"
  colspan_str <- "       -"
  rowspan_str <- "       :"
  empty_str <- "    (empty) "

  cell_str_of <- function(r, c, refs) {
    keys <- sort(unique(unlist(lapply(refs, `[[`, "layout_keys"))))
    sprintf("(%d,%d) %s", r, c, gsub("axis", "", paste(keys, collapse = ","), fixed = TRUE))
  }
  lens <- unlist(lapply(seq_len(rows), function(r) lapply(seq_len(cols), function(c) {
    if (!is.null(grid_ref[[r]][[c]])) nchar(cell_str_of(r, c, grid_ref[[r]][[c]]))
  })))
  cell_len <- max(c(lens, 0L)) + nchar(s_str) + nchar(e_str)
  pad <- function(s) strrep(" ", max(0L, cell_len - nchar(s)))

  tmp <- matrix("", rows, cols)
  for (r in seq_len(rows)) {
    for (c in seq_len(cols)) {
      spec <- specs[[r]][[c]]
      ref <- grid_ref[[r]][[c]]
      if (is.null(ref)) {
        if (tmp[r, c] == "") tmp[r, c] <- paste0(empty_str, pad(empty_str))
        next
      }
      cell <- paste0(if (spec$rowspan > 1L) s_top else s_str, cell_str_of(r, c, ref))
      if (spec$colspan > 1L) {
        for (cc in seq_len(spec$colspan - 2L)) tmp[r, c + cc] <- paste0(colspan_str, pad(colspan_str))
        tmp[r, c + spec$colspan - 1L] <- paste0(colspan_str, pad(paste0(colspan_str, e_str)),
                                                if (spec$rowspan > 1L) e_top else e_str)
      } else {
        cell <- paste0(cell, strrep(" ", max(0L, cell_len - nchar(cell) - 2L)),
                       if (spec$rowspan > 1L) e_top else e_str)
      }
      if (spec$rowspan > 1L) {
        for (cc in seq_len(spec$colspan) - 1L) {
          for (rr in seq_len(spec$rowspan - 1L)) {
            row_str <- paste0(rowspan_str, pad(rowspan_str))
            last <- rr == spec$rowspan - 1L
            if (cc == 0L) row_str <- paste0(if (last) s_bot else s_mid, substring(row_str, 3L))
            if (cc == spec$colspan - 1L) row_str <- paste0(substr(row_str, 1L, nchar(row_str) - 2L), if (last) e_bot else e_mid)
            tmp[r + rr, c + cc] <- row_str
          }
        }
      }
      tmp[r, c] <- paste0(cell, pad(cell))
    }
  }
  out <- "This is the format of your plot grid:\n"
  for (r in rev(row_seq)) out <- paste0(out, paste(tmp[r, ], collapse = "  "), "\n")
  if (length(insets)) {
    out <- paste0(out, "\nWith insets:\n")
    for (i in seq_along(insets)) {
      r <- insets[[i]]$cell[[1L]]
      c <- insets[[i]]$cell[[2L]]
      labels <- gsub("axis", "", paste(insets_ref[[i]][[1L]]$layout_keys, collapse = ","), fixed = TRUE)
      out <- paste0(out, s_str, labels, e_str, " over ", s_str, cell_str_of(r, c, grid_ref[[r]][[c]]), e_str, "\n")
    }
  }
  out
}

#' Print or query a figure's subplot grid
#'
#' `print_grid()` prints the layout of a grid created by [make_subplots()].
#' `get_subplot()` returns the layout object(s) of one grid cell: a list with
#' `xaxis` and `yaxis` for 2D cartesian subplots, the `scene`, `polar`, etc.
#' object for other subplot types, or the `x` and `y` domain for `"domain"`
#' subplots.
#'
#' @param fig A figure created by [make_subplots()].
#' @param row,col Grid cell (1-based).
#' @param secondary_y If `TRUE`, the cell's secondary y axis.
#' @return `print_grid()` returns `fig` invisibly; `get_subplot()` returns
#'   the subplot's layout objects, or `NULL` for an empty cell.
#' @export
#' @examples
#' fig <- make_subplots(rows = 2, cols = 2, specs = list(
#'   list(list(), list(type = "polar")),
#'   list(list(colspan = 2), NULL)
#' ))
#' print_grid(fig)
#' get_subplot(fig, 1, 2)
print_grid <- function(fig) {
  check_figure(fig)
  if (is.null(attr(fig, "grid_str"))) stop("Use make_subplots() to create a subplot grid.", call. = FALSE)
  cat(attr(fig, "grid_str"))
  invisible(fig)
}

#' @rdname print_grid
#' @export
get_subplot <- function(fig, row, col, secondary_y = FALSE) {
  grid_ref <- validate_grid_ref(fig)
  if (!is.numeric(row) || length(row) != 1L || row < 1 || row > length(grid_ref)) {
    stop(sprintf("`row` must be a whole number between 1 and %d", length(grid_ref)), call. = FALSE)
  }
  if (!is.numeric(col) || length(col) != 1L || col < 1 || col > length(grid_ref[[1L]])) {
    stop(sprintf("`col` must be a whole number between 1 and %d", length(grid_ref[[1L]])), call. = FALSE)
  }
  refs <- grid_ref[[row]][[col]]
  if (is.null(refs)) return(NULL)
  if (secondary_y && length(refs) < 2L) return(NULL)
  ref <- refs[[if (secondary_y) 2L else 1L]]
  keys <- ref$layout_keys
  get_layout_obj <- function(k) fig$layout[[k]] %||% validate_coerce(list(), child_key("layout", k))
  switch(length(keys) + 1L,
    ref$trace_kwargs$domain,
    get_layout_obj(keys[[1L]]),
    list(xaxis = get_layout_obj(keys[[1L]]), yaxis = get_layout_obj(keys[[2L]]))
  )
}

validate_grid_ref <- function(fig) {
  check_figure(fig)
  grid_ref <- attr(fig, "grid_ref")
  if (is.null(grid_ref)) {
    stop("In order to reference traces by row and column, you must first use make_subplots() ",
         "to create the figure with a subplot grid.", call. = FALSE)
  }
  grid_ref
}

# Subplot ref of an existing trace (plotly.py _get_subplot_ref_for_trace).
subplot_ref_for_trace <- function(trace) {
  props <- get_validator(trace$type)$children
  if ("domain" %in% props) {
    dom <- function(v) if (is.null(v)) NULL else as.numeric(unlist(v))
    return(subplot_ref("domain", character(), list(domain = list(x = dom(trace$domain$x), y = dom(trace$domain$y)))))
  }
  if (all(c("xaxis", "yaxis") %in% props)) {
    xa <- trace$xaxis %||% "x"
    ya <- trace$yaxis %||% "y"
    return(subplot_ref("xy", c(paste0("xaxis", substring(xa, 2L)), paste0("yaxis", substring(ya, 2L))),
                       list(xaxis = xa, yaxis = ya)))
  }
  for (t in c("geo", "scene")) {
    if (t %in% props) {
      v <- trace[[t]] %||% t
      return(subplot_ref(t, v, stats_named(list(v), t)))
    }
  }
  if ("subplot" %in% props) {
    base <- get_validator(paste0(trace$type, ".subplot"))$base
    v <- trace$subplot %||% base
    return(subplot_ref(base, v, list(subplot = v)))
  }
  NULL
}

# Grid cells addressed by row/col arguments that may be "all" or vectors
# (plotly.py _select_subplot_coordinates). Returns a list of c(row, col).
select_subplot_coordinates <- function(fig, rows, cols) {
  grid_ref <- validate_grid_ref(fig)
  n_rows <- length(grid_ref)
  n_cols <- length(grid_ref[[1L]])
  product <- identical(rows, "all") || identical(cols, "all")
  rows <- if (identical(rows, "all")) seq_len(n_rows) else rows
  cols <- if (identical(cols, "all")) seq_len(n_cols) else cols
  pairs <- if (product) {
    g <- expand.grid(r = rows, c = cols)
    g <- g[order(g$r, g$c), ]
    Map(c, g$r, g$c)
  } else {
    if (length(rows) == 1L) rows <- rep(rows, length(cols))
    if (length(cols) == 1L) cols <- rep(cols, length(rows))
    if (length(rows) != length(cols)) stop("`row` and `col` must have the same length", call. = FALSE)
    Map(c, rows, cols)
  }
  Filter(function(p) !is.null(grid_ref[[p[[1L]]]][[p[[2L]]]]), pairs)
}

is_multi_cell <- function(row, col) {
  identical(row, "all") || identical(col, "all") || length(row) > 1L || length(col) > 1L
}

# Set a trace's subplot reference properties (xaxis/yaxis, scene, domain, ...)
# for grid cell (row, col) (plotly.py _set_trace_grid_reference).
set_trace_grid_reference <- function(trace, grid_ref, row, col, secondary_y = FALSE) {
  if (row < 1 || col < 1) stop("Row and col values are out of range. Note: the starting cell is (1, 1)", call. = FALSE)
  if (row > length(grid_ref) || col > length(grid_ref[[1L]])) {
    stop("The (row, col) pair sent is out of range. Use print_grid() to view the subplot grid.", call. = FALSE)
  }
  refs <- grid_ref[[row]][[col]]
  if (is.null(refs)) stop(sprintf("No subplot specified at grid position (%d, %d)", row, col), call. = FALSE)
  if (isTRUE(secondary_y)) {
    if (length(refs) < 2L) {
      stop(sprintf("Subplot with type '%s' at grid position (%d, %d) was not created with the secondary_y spec property set to TRUE. See the `specs` argument of make_subplots().",
                   refs[[1L]]$subplot_type, row, col), call. = FALSE)
    }
    kw <- refs[[2L]]$trace_kwargs
  } else {
    kw <- refs[[1L]]$trace_kwargs
  }
  props <- get_validator(trace$type)$children
  if (!all(names(kw) %in% props)) {
    stop(sprintf("Trace type '%s' is not compatible with subplot type '%s'\nat grid position (%d, %d)\nSee the `specs` argument of make_subplots() for more information on subplot types",
                 trace$type, refs[[1L]]$subplot_type, row, col), call. = FALSE)
  }
  update_object(trace, trace$type, kw)
}
