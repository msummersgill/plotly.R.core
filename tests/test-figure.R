# Tests for figures (R/basefigure.R) and the generated figure functions
# (R/zz-gen-figure.R).
library(plotly.R.core)

json <- function(x) as.character(plotly.R.core:::to_JSON(x))
expect_error <- function(expr, pattern) {
  msg <- tryCatch({ expr; NULL }, error = function(e) conditionMessage(e))
  if (is.null(msg)) stop("Expected an error matching '", pattern, "' but none was raised", call. = FALSE)
  if (!grepl(pattern, msg)) stop("Error message did not match '", pattern, "':\n", msg, call. = FALSE)
  invisible(TRUE)
}

# Construction ---------------------------------------------------------------------
fig <- go_figure()
stopifnot(inherits(fig, "go_figure"), length(fig$data) == 0L, inherits(fig$layout, "go_layout"))

fig <- go_figure(go_scatter(y = 1:3), layout = list(title = "T"))  # single trace
stopifnot(length(fig$data) == 1L, identical(fig$layout$title$text, "T"))

fig <- go_figure(list(list(type = "scatter", y = 1:3), go_scatter(y = 3:1)))
stopifnot(length(fig$data) == 2L, inherits(fig$data[[1L]], "go_scatter"))

copy <- go_figure(list(data = list(list(y = 1)), layout = list(width = 500)))  # dict-style figure
stopifnot(identical(copy$layout$width, 500), identical(copy$data[[1L]]$type, "scatter"))
stopifnot(identical(go_figure(fig), fig))

expect_error(go_figure(list(list(type = "bogus"))), "Invalid trace type")
expect_error(go_figure(layout = list(widht = 500)), "Did you mean \"width\"")
f2 <- go_figure(list(list(y = 1, bogus = 2)), layout = list(widht = 500), skip_invalid = TRUE)
stopifnot(identical(names(f2$data[[1L]]), c("type", "y")), length(f2$layout) == 0L)

# Adding traces ---------------------------------------------------------------------
fig <- go_figure() |>
  add_scatter(x = 1:3, y = c(2, 1, 3), name = "a", marker_color = "red") |>
  add_trace(go_scatter(y = 3:1, name = "b", mode = "markers")) |>
  add_traces(list(list(y = c(1, 1, 1), name = "c")))
stopifnot(
  length(fig$data) == 3L,
  identical(fig$data[[1L]]$marker$color, "red"),
  identical(vapply(fig$data, `[[`, "", "name"), c("a", "b", "c"))
)
expect_error(add_scatter(fig, marker_size = -1), "'size' property of scatter.marker")
expect_error(add_trace(list(), go_scatter()), "Expected a go_figure")

# update_layout: merging, magic underscores, overwrite, NULL ------------------------
fig <- fig |>
  update_layout(title = "Title", xaxis = list(range = c(0, 10), title = "x")) |>
  update_layout(list(xaxis = list(type = "log")), xaxis_title_font_size = 20, width = 600)
stopifnot(
  identical(fig$layout$title$text, "Title"),
  identical(fig$layout$xaxis$type, "log"),                  # merged ...
  json(fig$layout$xaxis$range) == "[0,10]",                 # ... keeping existing range
  identical(fig$layout$xaxis$title$text, "x"),
  identical(fig$layout$xaxis$title$font$size, 20),
  identical(fig$layout$width, 600)
)
fig2 <- update_layout(fig, xaxis = list(type = "linear"), overwrite = TRUE)
stopifnot(identical(names(fig2$layout$xaxis), "type"))
fig2 <- update_layout(fig, width = NULL)
stopifnot(is.null(fig2$layout$width))
expect_error(update_layout(fig, xaxis_rnage = c(0, 1)), "Invalid property")
expect_error(update_layout(fig, width = 1), "interval \\[10, Inf\\]")

# Selecting and updating traces ---------------------------------------------------------
stopifnot(
  length(select_traces(fig)) == 3L,
  length(select_traces(fig, "scatter")) == 3L,
  identical(select_traces(fig, list(name = "b"))[[1L]]$name, "b"),
  identical(select_traces(fig, list(marker_color = "red"))[[1L]]$name, "a"),
  length(select_traces(fig, function(tr) identical(tr$mode, "markers"))) == 1L,
  identical(select_traces(fig, 2:3)[[2L]]$name, "c"),
  length(select_traces(fig, list(name = "zzz"))) == 0L
)
expect_error(select_traces(fig, 4), "out of range")

fig3 <- update_traces(fig, marker_size = 12, selector = list(mode = "markers"))
stopifnot(identical(fig3$data[[2L]]$marker$size, 12), is.null(fig3$data[[1L]]$marker$size))
fig3 <- update_traces(fig, list(marker = list(size = 5)))
stopifnot(identical(fig3$data[[1L]]$marker$size, 5),
          identical(fig3$data[[1L]]$marker$color, "red"))    # merged into existing marker
expect_error(update_traces(fig, mode = "dots"), "flaglist")

fig4 <- for_each_trace(fig, function(tr) { tr$name <- toupper(tr$name); tr }, selector = 1:2)
stopifnot(identical(vapply(fig4$data, `[[`, "", "name"), c("A", "B", "c")))
fig4 <- for_each_trace(fig, function(tr) invisible(NULL))   # non-list result: unchanged
stopifnot(identical(fig4, fig))

# Layout subplots ---------------------------------------------------------------------
fig5 <- go_figure() |> update_layout(yaxis2 = list(overlaying = "y", side = "right"))
stopifnot(identical(names(select_yaxes(fig5)), c("yaxis", "yaxis2")),
          identical(names(select_xaxes(fig5)), "xaxis"))
fig5 <- update_yaxes(fig5, title_text = "y", showgrid = FALSE)
stopifnot(identical(fig5$layout$yaxis$title$text, "y"), identical(fig5$layout$yaxis2$title$text, "y"),
          identical(fig5$layout$yaxis2$side, "right"))
fig5 <- update_yaxes(fig5, range = c(0, 1), selector = list(side = "right"))
stopifnot(is.null(fig5$layout$yaxis$range), json(fig5$layout$yaxis2$range) == "[0,1]")
fig5 <- for_each_yaxis(fig5, function(ax) { ax$gridcolor <- "gray80"; ax })
stopifnot(identical(fig5$layout$yaxis2$gridcolor, "rgba(204,204,204,1)"))
fig5 <- update_legends(fig5, bgcolor = "white")
stopifnot(identical(fig5$layout$legend$bgcolor, "white"))
expect_error(update_xaxes(fig5, type = "bogus"), "'type' property of layout.xaxis")

# Direct modification is validated -------------------------------------------------------
fig6 <- fig
fig6$data[[1L]]$marker$size <- 9
stopifnot(identical(fig6$data[[1L]]$marker$size, 9))
expect_error(fig6$data[[1L]]$marker$size <- -9, "interval")
fig6$layout$title <- "New"
stopifnot(identical(fig6$layout$title$text, "New"))
fig6$data[[4L]] <- list(y = 1:2)
stopifnot(inherits(fig6$data[[4L]], "go_scatter"))
expect_error(fig6$frames <- list(), "only `data` and `layout`")

# Rendering -------------------------------------------------------------------------------
w <- plotly_widget(fig)
j <- json(w$x)
stopifnot(inherits(w, "htmlwidget"),
          grepl('"data":[{"type":"scatter"', j, fixed = TRUE),
          grepl('"title":{"text":"Title"}', j, fixed = TRUE))
