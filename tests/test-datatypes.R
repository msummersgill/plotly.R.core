# Tests for the generated go_*() constructors (R/zz-gen-*.R) and graph object
# behaviour (R/basedatatypes.R).
library(plotly.core)

to_JSON <- plotly.core:::to_JSON
json <- function(x) as.character(to_JSON(x))
expect_error <- function(expr, pattern) {
  msg <- tryCatch(
    {
      expr
      NULL
    },
    error = function(e) conditionMessage(e)
  )
  if (is.null(msg)) {
    stop(
      "Expected an error matching '",
      pattern,
      "' but none was raised",
      call. = FALSE
    )
  }
  if (!grepl(pattern, msg)) {
    stop("Error message did not match '", pattern, "':\n", msg, call. = FALSE)
  }
  invisible(TRUE)
}

# Constructors return classed, validated objects ---------------------------------
tr <- go_scatter(
  x = 1:3,
  y = c(2, 1, 3),
  mode = "markers",
  marker = list(size = 12)
)
stopifnot(
  identical(class(tr), c("go_scatter", "plotly_obj")),
  identical(names(tr)[[1L]], "type"), # type first, as in plotly.py
  identical(tr$type, "scatter"),
  identical(class(tr$marker), c("go_scatter_marker", "plotly_obj")),
  identical(tr$marker$size, 12),
  json(tr) ==
    '{"type":"scatter","marker":{"size":12},"mode":"markers","x":[1,2,3],"y":[2,1,3]}'
)

# Nested plain lists become graph objects too
tr2 <- go_scatter(marker = list(line = list(width = 2)))
stopifnot(identical(
  class(tr2$marker$line),
  c("go_scatter_marker_line", "plotly_obj")
))

# Every exported constructor builds an empty object: one per trace type, the
# layout and the shared types. Nested objects have no constructors.
ns <- asNamespace("plotly.core")
ctors <- setdiff(
  grep("^go_", getNamespaceExports("plotly.core"), value = TRUE),
  "go_figure"
)
shared <- paste0("go_", names(plotly.core:::shared_types()))
stopifnot(length(shared) == 24L)
stopifnot(
  all(shared %in% ctors),
  length(setdiff(ctors, shared)) == length(available_trace_types()) + 1L,
  !any(c("go_scatter_marker", "go_layout_xaxis") %in% ls(ns))
)
for (fn in ctors) {
  obj <- get(fn, ns)()
  stopifnot(inherits(obj, fn), inherits(obj, "plotly_obj"))
}
stopifnot(json(go_layout()) == "{}", json(go_scatter()) == '{"type":"scatter"}')

# arg and named arguments ----------------------------------------------------------
base <- list(x = 1:2, marker = list(size = 5, color = "blue"))
t3 <- go_scatter(base, marker = list(size = 9)) # named args take precedence
stopifnot(
  identical(t3$marker$size, 9),
  is.null(t3$marker$color),
  identical(t3$x, 1:2)
)
t5 <- go_scatter(go_scatter(y = 1:2), x = 3:4) # arg may be a graph object
stopifnot(identical(t5$y, 1:2), identical(t5$x, 3:4))
t6 <- go_scatter(error_x = list(value = 5)) # property names with underscores
stopifnot(identical(t6$error_x$value, 5))
l <- go_layout(
  title = list(text = "T", x = 0.5),
  xaxis2 = list(title = "X2"),
  paper_bgcolor = "white"
)
stopifnot(
  identical(l$title$text, "T"),
  identical(l$title$x, 0.5),
  identical(l$xaxis2$title$text, "X2"),
  identical(l$paper_bgcolor, "white")
)

expect_error(go_scatter(1:3), "must be a named list")
expect_error(
  go_scatter(colour = "red"),
  "Invalid property .* go_scatter\\(\\): 'colour'"
)
# plotly.py's "magic underscore" names are not supported
expect_error(
  go_scatter(marker_size = 3),
  "Nested properties are set with named lists: marker = list\\(size = ...\\)"
)
expect_error(go_layout(xaxis_title = "x"), "xaxis = list\\(title = ...\\)")
expect_error(go_scatter(marker = list(sise = 3)), "Did you mean \"size\"")
expect_error(
  go_scatter(marker = list(size = -1)),
  "'size' property of scatter.marker"
)
expect_error(go_scatter(type = "bar"), "does not match go_scatter")
expect_error(go_layout(scen = list()), "Did you mean \"scene\"")

# skip_invalid drops bad properties at every level
t7 <- go_scatter(
  list(x = 1, bogus = 2, marker = list(size = -1, color = "red")),
  skip_invalid = TRUE
)
stopifnot(
  identical(names(t7), c("type", "x", "marker")),
  identical(names(t7$marker), "color")
)

# Modification is validated ---------------------------------------------------------
m <- go_scatter(marker = list(size = 10))$marker
m$color <- "gray50"
m[["symbol"]] <- "diamond"
stopifnot(
  identical(m$color, "rgba(127,127,127,1)"),
  identical(m$symbol, "diamond")
)
m$size <- NULL
stopifnot(is.null(m$size), inherits(m, "go_scatter_marker"))
expect_error(m$size <- -1, "interval \\[0, Inf\\]")
expect_error(m[["colour"]] <- "red", "Did you mean \"color\"")
tr$marker$size <- 20
stopifnot(identical(tr$marker$size, 20))
expect_error(tr$marker$size <- "x", "type 'character'")
tr$marker <- list(color = "red")
stopifnot(inherits(tr$marker, "go_scatter_marker"))
expect_error(tr$type <- "bar", "Cannot change the type")

# Shared types: go_font(), go_colorbar(), ... ---------------------------------------
f <- go_font(size = 18, color = "red")
stopifnot(
  identical(class(f), c("go_font", "plotly_shared", "plotly_obj")),
  json(f) == '{"color":"red","size":18}'
)
# checked against the type's variants on creation: arrays are valid for some fonts
stopifnot(identical(go_font(color = c("red", "blue"))$color, c("red", "blue")))
expect_error(go_font(size = -1), "'size' property of go_font\\(\\)")
expect_error(go_font(colour = "red"), "go_font\\(\\): 'colour'.*Did you mean \"color\"")
f$size <- 20
stopifnot(identical(f$size, 20), inherits(f, "go_font"))
expect_error(f$size <- -1, "go_font")
# and against the exact schema key when placed
cb <- go_colorbar(title = list(text = "z", font = f), thickness = 10)
tr <- go_heatmap(z = matrix(1:4, 2), colorbar = cb)
stopifnot(
  inherits(tr$colorbar, "go_heatmap_colorbar"),
  inherits(tr$colorbar$title$font, "go_heatmap_colorbar_title_font"),
  identical(tr$colorbar$title$font$size, 20)
)
expect_error(
  go_layout(font = go_font(color = c("red", "blue"))),
  "'color' property of layout.font"
)
stopifnot(identical(go_hoverlabel(split = TRUE)$split, TRUE))
expect_error(go_layout(hoverlabel = go_hoverlabel(split = TRUE)), "layout.hoverlabel: 'split'")
expect_error(go_scatter(marker = go_font(size = 3)), "go_font\\(\\) object can't be used for scatter.marker")
tfs <- go_layout(xaxis = list(tickformatstops = list(
  go_tickformatstop(dtickrange = list(NULL, 1000), value = "%H:%M")
)))
stopifnot(identical(tfs$xaxis$tickformatstops[[1L]]$value, "%H:%M"))
stopifnot(
  identical(unlist(go_pie(domain = go_domain(x = c(0, 0.5)))$domain$x), c(0, 0.5)),
  identical(go_bar(marker = list(pattern = go_pattern(shape = "/")))$marker$pattern$shape, "/"),
  identical(go_scatter(legendgrouptitle = go_legendgrouptitle(text = "g"))$legendgrouptitle$text, "g")
)

e <- go_error_bar(type = "data", array = c(0.2, 0.1), copy_ystyle = TRUE)
stopifnot(inherits(go_scatter(error_x = e)$error_x, "go_scatter_error_x"))
expect_error(go_scatter(error_y = e), "scatter.error_y: 'copy_ystyle'")

# types that are the same everywhere they appear
stopifnot(
  identical(go_histogram(xbins = go_bins(size = 1))$xbins$size, 1),
  identical(go_histogram(ybins = go_bins(size = 1))$ybins$size, 1),
  identical(go_layout(xaxis = list(minor = go_minor(ticks = "outside")))$xaxis$minor$ticks, "outside")
)
expect_error(go_histogram(xbins = go_minor()), "go_minor\\(\\) object can't be used for histogram.xbins")

# Figure data validation accepts graph objects and plain lists -----------------------
d <- plotly.core:::validate_data(list(tr, list(type = "scatter", y = 1:3)))
stopifnot(length(d) == 2L, inherits(d[[2L]], "go_scatter"))
