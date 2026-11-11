# Helpers for the legacy plot_ly() compatibility layer (R/compat-*.R), ported
# from the legacy plotly R package without its dplyr, rlang, scales, tibble
# and purrr dependencies.

lp_br <- function() "<br />"

# "Default" values are set by the build step and give way to anything the
# user specifies (the legacy package's default()/is.default()).
lp_default <- function(x) lp_prefix_class(x %||l% list(), "plotly_default")
lp_is_default <- function(x) inherits(x, "plotly_default")
`%|D|%` <- function(x, y) if (!lp_is_default(x)) x %||l% y else y
# The legacy package's %||%: falls back for NULL *and* zero-length values.
`%||l%` <- function(x, y) if (length(x) > 0) x else y

lp_prefix_class <- function(x, y) structure(x, class = unique(c(y, oldClass(x))))
lp_remove_class <- function(x, y) {
  oldClass(x) <- setdiff(oldClass(x), y)
  x
}
lp_modify_list <- function(x, y) utils::modifyList(x %||l% list(), y %||l% list())

lp_is_discrete <- function(x) is.factor(x) || is.character(x) || is.logical(x)
lp_get_levels <- function(x) if (is.factor(x)) levels(x) else sort(unique(x))

lp_uniq <- function(x) {
  u <- unique(x)
  if (identical(u, NA) || length(u) == 0) return(u)
  u <- u[!is.na(u)]
  if (length(u) == 1) u else x
}

lp_deparse <- function(x) {
  if (is.null(x) || !is.language(x)) return(NULL)
  sub("^~", "", paste(deparse(x, 500L), collapse = ""))
}

lp_new_id <- function() basename(tempfile(""))

# Box length-1 vectors as arrays (legacy i()).
lp_i <- function(x) if (is.null(x)) NULL else if (length(x) == 1) I(x) else x

# Evaluate a formula against the data; other values are returned as is.
lp_eval_attr <- function(x, data = NULL) {
  if (!inherits(x, "formula")) return(x)
  eval(x[[length(x)]], if (is.null(data)) list() else as.list(data), environment(x))
}

# Evaluate formulas anywhere in a (nested) attribute list.
lp_eval_attrs <- function(x, data) {
  if (inherits(x, "formula")) return(lp_eval_attr(x, data))
  if (is.list(x) && !is.data.frame(x)) {
    cls <- oldClass(x)
    out <- lapply(x, lp_eval_attrs, data = data)
    oldClass(out) <- cls
    return(out)
  }
  x
}

# Grouping variables of a dplyr grouped_df, read without depending on dplyr.
lp_group_vars <- function(d) {
  if (!inherits(d, "grouped_df")) return(character())
  setdiff(names(attr(d, "groups")), ".rows")
}

# Schema lookups ----------------------------------------------------------------------

lp_has_attr <- function(types, attr = "marker") {
  vapply(types, function(t) !is.null(get_validator(paste(t %||l% "scatter", attr, sep = "."))), logical(1))
}

lp_array_ok <- function(type, path) {
  isTRUE(get_validator(paste(c(type, path), collapse = "."))$array_ok)
}

lp_has_fill <- function(trace) {
  type <- trace[["type"]] %||l% "scatter"
  has_fillcolor <- lp_has_attr(type, "fillcolor")
  if (has_fillcolor && !lp_has_attr(type, "fill")) return(TRUE)
  has_fillcolor && isTRUE((trace[["fill"]] %||l% "none") != "none")
}

lp_has_group <- function(trace) {
  inherits(trace, paste0("plotly_", c("segment", "path", "line", "polygon"))) ||
    (grepl("scatter", trace[["type"]] %||l% "") && grepl("lines", trace[["mode"]] %||l% ""))
}

lp_is_tidy <- function(trace) {
  !(trace[["type"]] %||l% "scatter") %in% c("mesh3d", "heatmap", "histogram2d", "isosurface",
                                         "histogram2dcontour", "contour", "surface")
}

LP_NPSCALES <- c("color", "stroke", "symbol", "linetype", "size", "span", "split")
LP_GL_TYPES <- c("scattergl", "scatter3d", "mesh3d", "heatmapgl", "pointcloud", "parcoords", "surface")

# plotly.js's default colorway (the legacy package doesn't apply templates).
LP_COLORWAY <- c("#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "#8c564b",
                 "#e377c2", "#7f7f7f", "#bcbd22", "#17becf")
lp_colorway <- function(p = NULL) {
  lapply(as.list(p$x$layout$colorway %||l% LP_COLORWAY), function(x) structure(x, class = "colorway"))
}

# Colors (replacing scales) ---------------------------------------------------------------

#' Convert colors to rgba() strings
#'
#' `toRGB()` converts R colors (names, hex codes or rgba() strings) to
#' plotly.js `rgba()` strings, with an optional alpha (opacity) multiplier.
#' `showRGB()` draws swatches of `rgba()` colors.
#'
#' @param x A character vector of colors.
#' @param alpha Opacity multiplier between 0 and 1 (length 1 or the length of
#'   `x`).
#' @param ... Unused.
#' @return `toRGB()` returns a character vector; `showRGB()` returns `x`
#'   invisibly.
#' @export
#' @examples
#' toRGB("steelblue", 0.5)
toRGB <- function(x, alpha = 1) {
  if (length(x) == 0) return(x)
  if (any(x %in% "transparent")) return(x)
  if (length(x) != length(alpha)) {
    alpha <- lp_uniq(alpha)
    if (length(x) != length(alpha) && length(alpha) != 1) stop("alpha must be of length 1 or the same length as x", call. = FALSE)
  }
  idx <- grepl("^rgba\\(", x) & alpha <= 1 & 0 <= alpha
  if (any(idx)) x[idx] <- lp_rgb2hex(x[idx])
  if (is.character(x)) x[x == "NA"] <- NA
  alpha[is.na(alpha)] <- 1
  m <- grDevices::col2rgb(x, alpha = TRUE)
  m["alpha", ] <- round(alpha * m["alpha", ] / 255, 4)
  rgba <- sprintf("rgba(%s)", apply(m, 2, paste, collapse = ","))
  rgba[is.na(x)] <- "transparent"
  rgba
}

#' @rdname toRGB
#' @export
showRGB <- function(x, ...) {
  if (!all(grepl("^rgba", x))) stop("All values must begin with rgba", call. = FALSE)
  cols <- vapply(strsplit(x, ","), function(y) {
    v <- as.numeric(gsub("rgba\\(|\\)", "", y))
    grDevices::rgb(v[1] / 255, v[2] / 255, v[3] / 255, v[4])
  }, "")
  n <- length(cols)
  graphics::plot.new()
  graphics::plot.window(c(0, n), c(0, 1))
  graphics::rect(seq_len(n) - 1, 0, seq_len(n), 1, col = cols, border = "white")
  invisible(x)
}

lp_rgb2hex <- function(string) {
  vapply(strsplit(sub("rgba\\(", "", sub("\\)", "", string)), ","), function(v) {
    v <- as.numeric(v)
    grDevices::rgb(v[1], v[2], v[3], v[4] * 255, maxColorValue = 255)
  }, "")
}

lp_rescale <- function(x, to = c(0, 1), from = range(x, na.rm = TRUE)) {
  if (diff(from) == 0) return(ifelse(is.na(x), NA, mean(to)))
  (x - from[1]) / diff(from) * diff(to) + to[1]
}

# A palette given as RColorBrewer/viridis names or a vector of colors, as a
# function of n (scales' toPaletteFunc()).
lp_palette_fun <- function(pal) {
  if (is.character(pal) && length(pal) == 1 && pal %in% rownames(RColorBrewer::brewer.pal.info)) {
    maxn <- RColorBrewer::brewer.pal.info[pal, "maxcolors"]
    cols <- RColorBrewer::brewer.pal(maxn, pal)
    return(function(n) if (n <= maxn) RColorBrewer::brewer.pal(max(n, 3L), pal)[seq_len(n)] else lp_ramp(cols)(seq(0, 1, length.out = n)))
  }
  if (is.character(pal) && length(pal) == 1 && pal %in% c("viridis", "magma", "inferno", "plasma", "cividis")) {
    return(function(n) substr(viridisLite::viridis(n, option = pal), 1, 7))
  }
  ramp <- lp_ramp(pal)
  function(n) if (n == 1) ramp(0) else ramp(seq(0, 1, length.out = n))
}

# Interpolate colors in CIE Lab space (like scales::colour_ramp()); values
# that fall exactly on a palette color return it unchanged.
lp_ramp <- function(colors) {
  f <- grDevices::colorRamp(colors, space = "Lab", interpolate = "linear")
  hex <- substr(grDevices::rgb(t(grDevices::col2rgb(colors)), maxColorValue = 255), 1, 7)
  m <- length(colors)
  function(x) {
    out <- rep(NA_character_, length(x))
    ok <- !is.na(x)
    if (any(ok)) {
      xv <- pmin(pmax(x[ok], 0), 1)
      rgbm <- f(xv)
      res <- grDevices::rgb(round(rgbm[, 1]), round(rgbm[, 2]), round(rgbm[, 3]), maxColorValue = 255)
      pos <- xv * (m - 1)
      exact <- abs(pos - round(pos)) < 1e-9
      res[exact] <- hex[round(pos[exact]) + 1]
      out[ok] <- res
    }
    out
  }
}

lp_col_factor <- function(pal, levels, na.color = "transparent") {
  if (!is.null(names(pal))) {
    return(function(x) {
      out <- unname(pal[as.character(x)])
      out[is.na(out)] <- na.color
      out
    })
  }
  cols <- lp_palette_fun(pal)(length(levels))
  function(x) {
    out <- cols[match(as.character(x), levels)]
    out[is.na(out)] <- na.color
    out
  }
}

lp_col_numeric <- function(pal, domain, na.color = "transparent") {
  ramp <- if (is.character(pal) && length(pal) == 1) lp_ramp(lp_palette_fun(pal)(256)) else lp_ramp(pal)
  function(x) {
    out <- ramp(lp_rescale(x, from = domain))
    out[is.na(out)] <- na.color
    out
  }
}

# R plotting symbols/line types -> plotly.js names (legacy pch2symbol/lty2dash).
LP_PCH <- c("0" = "square-open", "1" = "circle-open", "2" = "triangle-up-open", "3" = "cross-thin-open",
            "4" = "x-thin-open", "5" = "diamond-open", "6" = "triangle-down-open", "7" = "square-x-open",
            "8" = "asterisk-open", "9" = "diamond-x-open", "10" = "circle-cross-open", "11" = "hexagram-open",
            "12" = "square-cross-open", "13" = "circle-x-open", "14" = "square-open-dot", "15" = "square",
            "16" = "circle", "17" = "triangle-up", "18" = "diamond", "19" = "circle", "20" = "circle",
            "21" = "circle", "22" = "square", "23" = "diamond", "24" = "triangle-up", "25" = "triangle-down",
            "32" = "circle", "35" = "hash-open", "42" = "asterisk-open", "43" = "cross-thin-open",
            "45" = "line-ew-open", "47" = "line-ne-open", "48" = "circle-open", "79" = "circle-open",
            "88" = "x-thin-open", "92" = "line-nw-open", "95" = "line-ew-open", "111" = "circle-open",
            "o" = "circle-open", "O" = "circle-open", "+" = "cross-thin-open")
LP_LTY <- c("0" = "none", "1" = "solid", "2" = "dash", "3" = "dot", "4" = "dashdot", "5" = "longdash",
            "6" = "longdashdot", "blank" = "none", "solid" = "solid", "dashed" = "dash", "dotted" = "dot",
            "dotdash" = "dashdot", "longdash" = "longdash", "twodash" = "longdashdot", "22" = "dash",
            "42" = "dot", "44" = "dashdot", "13" = "longdash", "1343" = "longdashdot", "73" = "dash",
            "2262" = "dashdot", "12223242" = "dashdot", "F282" = "dash", "F4448444" = "dash",
            "224282F2" = "dash", "F1" = "dash")
lp_lookup <- function(x, table) {
  x <- as.character(x)
  idx <- x %in% names(table)
  x[idx] <- table[x[idx]]
  x
}

#' Insert missing values between groups
#'
#' Sorts data by group and inserts a row of `NA`s after each group (on the
#' non-group columns), so a single line trace draws each group separately,
#' which is faster than one trace per group.
#'
#' @param data A data frame.
#' @param groupNames Grouping column names.
#' @param nested Columns defining an outer grouping that is not separated.
#' @param ordered Columns to order by within each group.
#' @param retrace.first Repeat the first row of each group (to close polygons).
#' @return A data frame of the same class as `data`.
#' @export
#' @examples
#' group2NA(data.frame(g = c(1, 1, 2, 2), x = 1:4), "g")
group2NA <- function(data, groupNames = "group", nested = NULL, ordered = NULL, retrace.first = FALSE) {
  if (NROW(data) == 0) return(data)
  cls <- oldClass(data)
  groupNames <- groupNames[groupNames %in% names(data)]
  nested <- nested[nested %in% names(data)]
  ordered <- ordered[ordered %in% names(data)]
  dt <- data.table::as.data.table(data)
  if (!length(groupNames)) {
    keys <- c(nested, ordered)
    if (length(keys)) data.table::setorderv(dt, cols = keys)
    return(structure(dt, class = cls))
  }
  data.table::setorderv(dt, cols = c(nested, groupNames, ordered))
  key_vars <- c(nested, groupNames)
  grp <- do.call(paste, c(unname(as.list(dt[, key_vars, with = FALSE])), sep = "\r"))
  starts <- which(!duplicated(grp))
  ends <- c(starts[-1] - 1L, nrow(dt))
  idx <- unlist(Map(function(s, e) c(s:e, if (retrace.first) s, NA), starts, ends))
  out <- dt[idx]
  na_rows <- which(is.na(idx))
  for (k in key_vars) {
    v <- out[[k]]
    v[na_rows] <- v[na_rows - 1L]
    data.table::set(out, j = k, value = v)
  }
  if (length(nested)) {
    ng <- do.call(paste, c(unname(as.list(out[, nested, with = FALSE])), sep = "\r"))
    last <- c(ng[-1] != ng[-length(ng)], TRUE)
    out <- out[!last | !is.na(idx)]
  } else {
    out <- out[-nrow(out)]
  }
  structure(out, class = cls)
}

#' Encode a raster as a data URI
#'
#' Converts a raster (or matrix/array convertible with
#' [grDevices::as.raster()]) to a PNG data URI, e.g. for layout images.
#' Requires the png package.
#'
#' @param r A raster, matrix or array.
#' @param ... Passed to [grDevices::as.raster()].
#' @return A character string.
#' @export
#' @examples
#' if (requireNamespace("png", quietly = TRUE)) substr(raster2uri(matrix(1:4 / 4, 2)), 1, 30)
raster2uri <- function(r, ...) {
  if (!requireNamespace("png", quietly = TRUE)) stop("raster2uri() needs the png package", call. = FALSE)
  if (inherits(r, "nativeRaster")) {
    img <- r
  } else {
    r <- grDevices::as.raster(r, ...)
    rgbs <- grDevices::col2rgb(c(r), alpha = TRUE) / 255
    nr <- dim(r)[1]
    nc <- dim(r)[2]
    ch <- function(i) matrix(rgbs[i, ], nrow = nr, ncol = nc, byrow = TRUE)
    img <- array(c(ch(1), ch(2), ch(3), ch(4)), dim = c(dim(r), 4))
  }
  paste0("data:image/png;base64,", base64enc::base64encode(png::writePNG(img)))
}
