# Tests for the generated go_*() constructors (R/zz-gen-*.R) and graph object
# behaviour (R/basedatatypes.R).
library(plotly.core)

to_JSON <- plotly.core:::to_JSON
json <- function(x) as.character(to_JSON(x))
expect_error <- function(expr, pattern) {
  msg <- tryCatch({ expr; NULL }, error = function(e) conditionMessage(e))
  if (is.null(msg)) stop("Expected an error matching '", pattern, "' but none was raised", call. = FALSE)
  if (!grepl(pattern, msg)) stop("Error message did not match '", pattern, "':\n", msg, call. = FALSE)
  invisible(TRUE)
}

# Constructors return classed, validated objects ---------------------------------
tr <- go_scatter(x = 1:3, y = c(2, 1, 3), mode = "markers", marker = go_scatter_marker(size = 12))
stopifnot(
  identical(class(tr), c("go_scatter", "plotly_obj")),
  identical(names(tr)[[1L]], "type"),                 # type first, as in plotly.py
  identical(tr$type, "scatter"),
  identical(class(tr$marker), c("go_scatter_marker", "plotly_obj")),
  identical(tr$marker$size, 12),
  json(tr) == '{"type":"scatter","marker":{"size":12},"mode":"markers","x":[1,2,3],"y":[2,1,3]}'
)

# Nested plain lists become graph objects too
tr2 <- go_scatter(marker = list(line = list(width = 2)))
stopifnot(identical(class(tr2$marker$line), c("go_scatter_marker_line", "plotly_obj")))

# Every constructor in scope exists and builds an empty object
ns <- asNamespace("plotly.core")
ctors <- setdiff(grep("^go_", getNamespaceExports("plotly.core"), value = TRUE), "go_figure")
stopifnot(length(ctors) == 979L)
for (fn in ctors) {
  obj <- get(fn, ns)()
  stopifnot(inherits(obj, fn), inherits(obj, "plotly_obj"))
}
stopifnot(json(go_layout()) == "{}", json(go_scatter()) == '{"type":"scatter"}')

# arg, named arguments and magic underscores ---------------------------------------
base <- list(x = 1:2, marker = list(size = 5, color = "blue"))
t3 <- go_scatter(base, marker = list(size = 9))            # named args take precedence
stopifnot(identical(t3$marker$size, 9), is.null(t3$marker$color), identical(t3$x, 1:2))
t4 <- go_scatter(base, marker_size = 9)                    # magic underscore merges
stopifnot(identical(t4$marker$size, 9), identical(t4$marker$color, "blue"))
t5 <- go_scatter(go_scatter(y = 1:2), x = 3:4)             # arg may be a graph object
stopifnot(identical(t5$y, 1:2), identical(t5$x, 3:4))
t6 <- go_scatter(error_x = list(value = 5), marker_colorbar_title_text = "cb")
stopifnot(identical(t6$error_x$value, 5),                  # underscore property not split
          identical(t6$marker$colorbar$title$text, "cb"))
l <- go_layout(title = "T", title_x = 0.5, xaxis2_title = "X2", paper_bgcolor = "white")
stopifnot(identical(l$title$text, "T"), identical(l$title$x, 0.5),
          identical(l$xaxis2$title$text, "X2"), identical(l$paper_bgcolor, "white"))

expect_error(go_scatter(1:3), "must be a named list")
expect_error(go_scatter(colour = "red"), "Invalid property .* go_scatter: 'colour'")
expect_error(go_scatter(marker_sise = 3), "Did you mean \"size\"")
expect_error(go_scatter(marker = list(size = -1)), "'size' property of scatter.marker")
expect_error(go_scatter(type = "bar"), "does not match go_scatter")
expect_error(go_layout(scen = list()), "Did you mean \"scene\"")

# skip_invalid drops bad properties at every level
t7 <- go_scatter(list(x = 1, bogus = 2, marker = list(size = -1, color = "red")), skip_invalid = TRUE)
stopifnot(identical(names(t7), c("type", "x", "marker")), identical(names(t7$marker), "color"))

# Modification is validated ---------------------------------------------------------
m <- go_scatter_marker(size = 10)
m$color <- "gray50"
m[["symbol"]] <- "diamond"
stopifnot(identical(m$color, "rgba(127,127,127,1)"), identical(m$symbol, "diamond"))
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

# Figure data validation accepts graph objects and plain lists -----------------------
d <- plotly.core:::validate_data(list(tr, list(type = "scatter", y = 1:3)))
stopifnot(length(d) == 2L, inherits(d[[2L]], "go_scatter"))
