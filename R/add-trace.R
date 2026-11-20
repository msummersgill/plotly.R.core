# add_<trace>() with data: formulas evaluated in the data, one trace per group
# (`split`, and colour properties mapped to a discrete column), and defaults
# taken from the data as plotly 4.x does: trace names, axis and colorbar
# titles from the formulas, and factor levels as the category order.

# Called by every generated add_<trace>.default().
add_trace_with_data <- function(
  fig,
  type,
  env,
  dots,
  data,
  split,
  skip_invalid,
  row = NULL,
  col = NULL,
  secondary_y = NULL
) {
  data <- trace_data(fig, data)
  # the trace with its formulas, validated but not evaluated
  raw <- unclass(plotly_object(type, NULL, env, dots, skip_invalid))
  raw$type <- NULL
  n_before <- length(fig$data)
  groups <- trace_groups(raw, data, split, fig)

  rows <- if (is.data.frame(data)) seq_len(nrow(data))
  added <- list()
  for (g in groups) {
    tr <- raw
    for (p in g$colors) {
      tr <- set_path(tr, p$path, p$color)
    }
    sub <- if (is.null(g$rows)) data else data[g$rows, , drop = FALSE]
    vals <- tr
    vals[] <- lapply(names(tr), function(n) eval_formulas(tr[[n]], sub, n))
    vals <- collapse_constant(vals, raw, type)
    vals <- data_defaults(vals, raw, type, g$label)
    trace <- plotly_object(type, vals, skip_invalid = skip_invalid, data = sub)
    before <- length(fig$data)
    fig <- add_trace(
      fig,
      trace,
      row = row,
      col = col,
      secondary_y = secondary_y
    )
    added[[length(added) + 1L]] <- list(
      traces = seq_len(length(fig$data) - before) + before,
      rows = g$rows %||% rows
    )
  }

  fig <- link_split_traces(fig, data, n_before, groups, added)
  layout_defaults(fig, raw, data, n_before, env)
}

# A formula for a property that takes one value (legendgroup = ~g) gives one
# value per row: when they're all the same (as within a group), use it.
collapse_constant <- function(vals, raw, type) {
  for (n in names(raw)) {
    if (!inherits(raw[[n]], "formula")) {
      next
    }
    v <- vals[[n]]
    entry <- get_validator(paste(type, n, sep = "."))
    takes_one <- !is.null(entry) &&
      !entry$superclass %in% c("DataArrayValidator", "InfoArrayValidator") &&
      !isTRUE(entry$array_ok)
    if (
      takes_one && is.atomic(v) && length(v) > 1L && length(unique(v)) == 1L
    ) {
      vals[[n]] <- v[[1L]]
    }
  }
  vals
}

# Groups of rows that become separate traces: by `split` and by colour
# properties given a discrete column (`marker = go_scatter_marker(color = ~g)`).
# Each group has its rows (NULL: all), a label and the colours to set.
trace_groups <- function(raw, data, split, fig) {
  single <- list(list(rows = NULL, label = NULL, colors = list()))
  if (!is.data.frame(data)) {
    if (!is.null(split)) {
      stop(
        "`split` needs data: pass `data` or pipe a data frame into go_figure()",
        call. = FALSE
      )
    }
    return(single)
  }
  keys <- list()
  if (!is.null(split)) {
    keys$split <- list(values = split_values(split, data))
  }
  for (path in color_formula_paths(raw)) {
    v <- eval_formulas(get_path(raw, path), data, paste(path, collapse = "."))
    if (is_discrete_color(v)) {
      keys[[paste(path, collapse = ".")]] <- list(values = v, path = path)
    }
  }
  if (!length(keys)) {
    return(single)
  }
  n <- nrow(data)
  for (k in names(keys)) {
    v <- keys[[k]]$values
    if (length(v) != n) {
      stop(
        sprintf(
          "`%s` has %d values, not one per row of the data (%d)",
          k,
          length(v),
          n
        ),
        call. = FALSE
      )
    }
    keys[[k]]$factor <- if (is.factor(v)) droplevels(v) else factor(v)
  }
  # colours of each discrete colour column's levels
  for (k in setdiff(names(keys), "split")) {
    f <- keys[[k]]$factor
    keys[[k]]$palette <- stats::setNames(
      discrete_palette(nlevels(f), is.ordered(keys[[k]]$values), fig),
      levels(f)
    )
  }
  # one group per combination present, in level order
  facs <- lapply(keys, `[[`, "factor")
  id <- interaction(facs, drop = TRUE, lex.order = TRUE, sep = "\r")
  lapply(levels(id), function(lev) {
    rows <- which(id == lev)
    parts <- strsplit(lev, "\r", fixed = TRUE)[[1L]]
    names(parts) <- names(keys)
    list(
      rows = rows,
      label = paste(unique(parts), collapse = ", "),
      colors = lapply(setdiff(names(keys), "split"), function(k) {
        list(path = keys[[k]]$path, color = keys[[k]]$palette[[parts[[k]]]])
      })
    )
  })
}

split_values <- function(split, data) {
  if (inherits(split, "formula")) {
    return(eval_formulas(split, data, "split"))
  }
  if (is.character(split) && length(split) == 1L && split %in% names(data)) {
    return(data[[split]])
  }
  split
}

# Paths of the trace's colour properties given as formulas
# (c("marker", "color"), c("marker", "line", "color"), ...).
color_formula_paths <- function(x, path = character()) {
  out <- list()
  x <- if (inherits(x, "plotly_obj")) unclass(x) else x
  if (!is.list(x) || is.data.frame(x)) {
    return(out)
  }
  for (nm in names(x)) {
    v <- x[[nm]]
    if (inherits(v, "formula") && nm %in% c("color", "fillcolor")) {
      out[[length(out) + 1L]] <- c(path, nm)
    } else if (is.list(v)) {
      out <- c(out, color_formula_paths(v, c(path, nm)))
    }
  }
  out
}

# A colour column to map to discrete colours: a factor, logical, or
# character values that aren't all CSS colours ("red", "#ff0000",
# "rgb(...)") themselves.
is_discrete_color <- function(v) {
  if (is.factor(v) || is.logical(v)) {
    return(TRUE)
  }
  is.character(v) && !all(is_css_color(unique(v[!is.na(v)])))
}

is_css_color <- function(x) {
  norm <- tolower(gsub("\\s+", "", x))
  grepl(RE_HEX, norm, perl = TRUE) |
    grepl(RE_RGB_ETC, norm, perl = TRUE) |
    norm %in% .named_colors
}

# Colours for n levels: evenly spaced viridis for an ordered factor (as
# plotly 4.x), otherwise the figure's colorway (or its template's, or
# plotly.js's), recycled.
discrete_palette <- function(n, ordered, fig) {
  if (ordered) {
    vir <- .plotlyjs_colorscales$Viridis
    ramp <- grDevices::colorRamp(unname(vir))
    pos <- if (n == 1L) 0 else seq(0, 1, length.out = n)
    m <- ramp(pos)
    return(grDevices::rgb(m[, 1L], m[, 2L], m[, 3L], maxColorValue = 255))
  }
  way <- unlist(fig$layout$colorway) %||%
    tryCatch(
      unlist(template_layout_value(
        fig$layout$template %||% default_template(),
        "colorway"
      )),
      error = function(e) NULL
    ) %||%
    PLOTLYJS_COLORWAY
  rep_len(way, n)
}

PLOTLYJS_COLORWAY <- c(
  "#1f77b4",
  "#ff7f0e",
  "#2ca02c",
  "#d62728",
  "#9467bd",
  "#8c564b",
  "#e377c2",
  "#7f7f7f",
  "#bcbd22",
  "#17becf"
)

get_path <- function(x, path) {
  for (p in path) {
    x <- unclass(x)[[p]]
  }
  x
}

set_path <- function(x, path, value) {
  x <- if (inherits(x, "plotly_obj")) unclass(x) else x
  if (length(path) == 1L) {
    x[[path]] <- value
    return(x)
  }
  x[[path[[1L]]]] <- set_path(x[[path[[1L]]]], path[-1L], value)
  x
}

# The text of a property's formula (~col -> "col"), or NULL.
formula_text <- function(x) {
  if (!inherits(x, "formula")) {
    return(NULL)
  }
  paste(deparse(x[[length(x)]], width.cutoff = 500L), collapse = " ")
}

# The property naming a trace: its main values.
TRACE_NAME_FROM <- c("y", "values", "r", "z", "lat", "a")

# Trace-level defaults from the data: the trace name (the group, or the
# column of its main values) and colorbar titles (the columns of z and of
# a continuous marker colour).
data_defaults <- function(vals, raw, type, label) {
  if (is.null(vals$name)) {
    main <- if (identical(vals$orientation, "h")) "x" else TRACE_NAME_FROM
    from <- Find(function(p) !is.null(formula_text(raw[[p]])), main)
    nm <- label %||% if (!is.null(from)) formula_text(raw[[from]])
    if (!is.null(nm) && !is.null(get_validator(paste0(type, ".name")))) {
      vals$name <- nm
    }
  }
  # z -> colorbar title (heatmap, contour, surface, ...)
  z <- formula_text(raw$z)
  if (
    !is.null(z) &&
      !is.null(get_validator(paste0(type, ".colorbar.title"))) &&
      is.null(get_path(vals, c("colorbar", "title")))
  ) {
    vals <- set_path(vals, c("colorbar", "title"), list(text = z))
  }
  # a continuous marker colour -> marker colorbar title
  mc <- formula_text(get_path(raw, c("marker", "color")))
  if (
    !is.null(mc) &&
      is.numeric(get_path(vals, c("marker", "color"))) &&
      !is.null(get_validator(paste0(type, ".marker.colorbar.title"))) &&
      is.null(get_path(vals, c("marker", "colorbar", "title")))
  ) {
    vals <- set_path(vals, c("marker", "colorbar", "title"), list(text = mc))
  }
  vals
}

# Layout defaults from the data, for the traces just added: axis titles from
# the x/y (and 3D z) formulas, and the levels of factor x/y values as the
# category order. Only where the layout doesn't set them.
layout_defaults <- function(fig, raw, data, n_before, env = NULL) {
  if (length(fig$data) <= n_before) {
    return(fig)
  }
  tr <- fig$data[[n_before + 1L]]
  type <- tr$type %||% "scatter"
  patch <- list()
  set_default <- function(key, path, value) {
    current <- get_path(fig$layout[[key]], path) %||%
      get_path(patch[[key]], path)
    if (is.null(current)) {
      patch[[key]] <<- set_path(patch[[key]] %||% list(), path, value)
    }
  }
  if (!is.null(get_validator(paste0(type, ".xaxis")))) {
    for (ax in c("x", "y")) {
      ref <- tr[[paste0(ax, "axis")]] %||% ax
      key <- sub("^([xy])", "\\1axis", ref)
      txt <- formula_text(raw[[ax]])
      # not on axes whose tick labels are hidden (shared subplot axes)
      if (!is.null(txt) && !isFALSE(fig$layout[[key]]$showticklabels)) {
        set_default(key, c("title", "text"), txt)
      }
      v <- given_value(raw, ax, data, env)
      if (is.factor(v) && is.null(fig$layout[[key]]$categoryorder)) {
        set_default(key, "categoryorder", "array")
        set_default(key, "categoryarray", levels(v))
      }
    }
  } else if (!is.null(get_validator(paste0(type, ".scene")))) {
    key <- tr$scene %||% "scene"
    for (ax in c("x", "y", "z")) {
      axis <- paste0(ax, "axis")
      txt <- formula_text(raw[[ax]])
      if (!is.null(txt)) {
        set_default(key, c(axis, "title", "text"), txt)
      }
      v <- given_value(raw, ax, data, env)
      if (is.factor(v) && is.null(fig$layout[[key]][[axis]]$categoryorder)) {
        set_default(key, c(axis, "categoryorder"), "array")
        set_default(key, c(axis, "categoryarray"), levels(v))
      }
    }
  }
  if (!length(patch)) {
    return(fig)
  }
  update_layout(fig, patch)
}

# A property's value as given (validation turns factors into character).
given_value <- function(raw, name, data, env) {
  if (is.data.frame(data) && inherits(raw[[name]], "formula")) {
    eval_formulas(raw[[name]], data, name)
  } else if (!is.null(env) && exists(name, envir = env, inherits = FALSE)) {
    get(name, envir = env, inherits = FALSE)
  }
}

# Crosstalk: each trace is linked to the keys of its rows.
link_split_traces <- function(fig, data, n_before, groups, added) {
  ct <- attr(data, "crosstalk", exact = TRUE)
  if (is.null(ct) || length(fig$data) <= n_before) {
    return(fig)
  }
  if (length(groups) == 1L && is.null(groups[[1L]]$rows)) {
    return(link_shared_traces(fig, data, n_before))
  }
  for (a in added) {
    linked <- Filter(
      function(i) trace_has_rows(fig$data[[i]], length(a$rows)),
      a$traces
    )
    if (length(linked)) {
      fig <- set_crosstalk_keys(
        fig,
        ct$key[a$rows],
        ct$group,
        traces = linked
      )
    }
  }
  fig
}

# add_annotation(), add_shape(), ...: properties that take one value may be
# given vectors, adding one object per element (other properties recycled).
add_layout_items <- function(
  fig,
  key,
  prop,
  arg,
  env,
  dots,
  data,
  skip_invalid,
  row,
  col,
  secondary_y,
  exclude_empty_subplots
) {
  entry <- get_validator(key)
  # the starting properties of `arg` (anything else is reported by
  # plotly_object())
  args <- list()
  if (is.list(arg) && !is.data.frame(arg)) {
    args <- unclass(arg)
    arg <- NULL
  }
  for (name in entry$children) {
    val <- get(name, envir = env, inherits = FALSE)
    if (!is.null(val)) {
      args[[name]] <- val
    }
  }
  args[names(dots)] <- dots
  # formulas (text = ~label) are evaluated in `data` or the figure's data, as
  # plotly 4.x's add_annotations() did
  if (has_formula(args)) {
    data <- trace_data(fig, data)
    args[] <- lapply(names(args), function(n) eval_formulas(args[[n]], data, n))
  }
  scalar <- vapply(
    names(args),
    function(nm) {
      v <- get_validator(paste(key, nm, sep = "."))
      !is.null(v) &&
        !v$superclass %in%
          c(
            "DataArrayValidator",
            "InfoArrayValidator",
            "ColorscaleValidator",
            "CompoundValidator",
            "CompoundArrayValidator"
          ) &&
        !isTRUE(v$array_ok)
    },
    NA
  )
  vec <- names(args)[
    scalar &
      vapply(
        args,
        function(a) is.atomic(a) && length(a) > 1L,
        NA
      )
  ]
  if (!length(vec)) {
    obj <- plotly_object(key, arg, NULL, args, skip_invalid)
    return(add_layout_array_item(
      fig,
      prop,
      obj,
      row,
      col,
      secondary_y,
      exclude_empty_subplots
    ))
  }
  n <- max(lengths(args[vec]))
  bad <- vec[!lengths(args[vec]) %in% c(1L, n)]
  if (length(bad)) {
    stop(
      sprintf(
        "Vector properties must have the same length (%d): %s",
        n,
        paste(bad, collapse = ", ")
      ),
      call. = FALSE
    )
  }
  for (i in seq_len(n)) {
    args_i <- args
    for (nm in vec) {
      args_i[[nm]] <- args[[nm]][[(i - 1L) %% length(args[[nm]]) + 1L]]
    }
    obj <- plotly_object(key, arg, NULL, args_i, skip_invalid)
    fig <- add_layout_array_item(
      fig,
      prop,
      obj,
      row,
      col,
      secondary_y,
      exclude_empty_subplots
    )
  }
  fig
}
