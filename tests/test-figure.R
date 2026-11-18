# Tests for figures (R/basefigure.R) and the generated figure functions
# (R/zz-gen-figure.R).
library(plotly.core)

json <- function(x) as.character(plotly.core:::to_JSON(x))
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

# Construction ---------------------------------------------------------------------
fig <- go_figure()
stopifnot(
  inherits(fig, "go_figure"),
  length(fig$data) == 0L,
  inherits(fig$layout, "go_layout")
)

fig <- go_figure(go_scatter(y = 1:3), layout = list(title = "T")) # single trace
stopifnot(length(fig$data) == 1L, identical(fig$layout$title$text, "T"))

fig <- go_figure(list(list(type = "scatter", y = 1:3), go_scatter(y = 3:1)))
stopifnot(length(fig$data) == 2L, inherits(fig$data[[1L]], "go_scatter"))

copy <- go_figure(list(data = list(list(y = 1)), layout = list(width = 500))) # dict-style figure
stopifnot(
  identical(copy$layout$width, 500),
  identical(copy$data[[1L]]$type, "scatter")
)
stopifnot(identical(go_figure(fig), fig))

expect_error(go_figure(list(list(type = "bogus"))), "Invalid trace type")
expect_error(go_figure(layout = list(widht = 500)), "Did you mean \"width\"")
f2 <- go_figure(
  list(list(y = 1, bogus = 2)),
  layout = list(widht = 500),
  skip_invalid = TRUE
)
stopifnot(
  identical(names(f2$data[[1L]]), c("type", "y")),
  length(f2$layout) == 0L
)

# Adding traces ---------------------------------------------------------------------
fig <- go_figure() |>
  add_scatter(x = 1:3, y = c(2, 1, 3), name = "a", marker = list(color = "red")) |>
  add_trace(go_scatter(y = 3:1, name = "b", mode = "markers")) |>
  add_traces(list(list(y = c(1, 1, 1), name = "c")))
stopifnot(
  length(fig$data) == 3L,
  identical(fig$data[[1L]]$marker$color, "red"),
  identical(vapply(fig$data, `[[`, "", "name"), c("a", "b", "c"))
)
expect_error(
  add_scatter(fig, marker = list(size = -1)),
  "'size' property of scatter.marker"
)
expect_error(add_trace(list(), go_scatter()), "Don.t know how to add a trace")

# update_layout: merging, overwrite, NULL ------------------------
fig <- fig |>
  update_layout(title = "Title", xaxis = list(range = c(0, 10), title = "x")) |>
  update_layout(
    list(xaxis = list(type = "log")),
    xaxis = list(title = list(font = list(size = 20))),
    width = 600
  )
stopifnot(
  identical(fig$layout$title$text, "Title"),
  identical(fig$layout$xaxis$type, "log"), # merged ...
  json(fig$layout$xaxis$range) == "[0,10]", # ... keeping existing range
  identical(fig$layout$xaxis$title$text, "x"),
  identical(fig$layout$xaxis$title$font$size, 20),
  identical(fig$layout$width, 600)
)
fig2 <- update_layout(fig, xaxis = list(type = "linear"), overwrite = TRUE)
stopifnot(identical(names(fig2$layout$xaxis), "type"))
fig2 <- update_layout(fig, width = NULL)
stopifnot(is.null(fig2$layout$width))
expect_error(update_layout(fig, xaxis = list(rnage = c(0, 1))), "Invalid property")
expect_error(update_layout(fig, xaxis_title = "x"), "xaxis = list\\(title = ...\\)")
expect_error(update_layout(fig, width = 1), "interval \\[10, Inf\\]")

# Selecting and updating traces ---------------------------------------------------------
stopifnot(
  length(select_traces(fig)) == 3L,
  length(select_traces(fig, "scatter")) == 3L,
  identical(select_traces(fig, list(name = "b"))[[1L]]$name, "b"),
  identical(select_traces(fig, list(marker = list(color = "red")))[[1L]]$name, "a"),
  length(select_traces(fig, function(tr) identical(tr$mode, "markers"))) == 1L,
  identical(select_traces(fig, 2:3)[[2L]]$name, "c"),
  length(select_traces(fig, list(name = "zzz"))) == 0L
)
expect_error(select_traces(fig, 4), "out of range")

fig3 <- update_traces(fig, marker = list(size = 12), selector = list(mode = "markers"))
stopifnot(
  identical(fig3$data[[2L]]$marker$size, 12),
  is.null(fig3$data[[1L]]$marker$size)
)
fig3 <- update_traces(fig, list(marker = list(size = 5)))
stopifnot(
  identical(fig3$data[[1L]]$marker$size, 5),
  identical(fig3$data[[1L]]$marker$color, "red")
) # merged into existing marker
expect_error(update_traces(fig, mode = "dots"), "flaglist")

fig4 <- for_each_trace(
  fig,
  function(tr) {
    tr$name <- toupper(tr$name)
    tr
  },
  selector = 1:2
)
stopifnot(identical(vapply(fig4$data, `[[`, "", "name"), c("A", "B", "c")))
fig4 <- for_each_trace(fig, function(tr) invisible(NULL)) # non-list result: unchanged
stopifnot(identical(fig4, fig))

# Layout subplots ---------------------------------------------------------------------
fig5 <- go_figure() |>
  update_layout(yaxis2 = list(overlaying = "y", side = "right"))
stopifnot(
  identical(names(select_yaxes(fig5)), c("yaxis", "yaxis2")),
  identical(names(select_xaxes(fig5)), "xaxis")
)
fig5 <- update_yaxes(fig5, title = list(text = "y"), showgrid = FALSE)
stopifnot(
  identical(fig5$layout$yaxis$title$text, "y"),
  identical(fig5$layout$yaxis2$title$text, "y"),
  identical(fig5$layout$yaxis2$side, "right")
)
fig5 <- update_yaxes(fig5, range = c(0, 1), selector = list(side = "right"))
stopifnot(
  is.null(fig5$layout$yaxis$range),
  json(fig5$layout$yaxis2$range) == "[0,1]"
)
fig5 <- for_each_yaxis(fig5, function(ax) {
  ax$gridcolor <- "gray80"
  ax
})
stopifnot(identical(fig5$layout$yaxis2$gridcolor, "rgba(204,204,204,1)"))
fig5 <- update_legends(fig5, bgcolor = "white")
stopifnot(identical(fig5$layout$legend$bgcolor, "white"))
expect_error(
  update_xaxes(fig5, type = "bogus"),
  "'type' property of layout.xaxis"
)

# Direct modification is validated -------------------------------------------------------
fig6 <- fig
fig6$data[[1L]]$marker$size <- 9
stopifnot(identical(fig6$data[[1L]]$marker$size, 9))
expect_error(fig6$data[[1L]]$marker$size <- -9, "interval")
fig6$layout$title <- "New"
stopifnot(identical(fig6$layout$title$text, "New"))
fig6$data[[4L]] <- list(y = 1:2)
stopifnot(inherits(fig6$data[[4L]], "go_scatter"))
expect_error(fig6$frame <- list(), "only `data`, `layout` and `frames`")
fig6$frames <- list(list(name = "a", data = list(list(y = 1:2))))
stopifnot(
  inherits(fig6$frames[[1L]]$data[[1L]], "go_scatter"),
  identical(fig6$frames[[1L]]$name, "a")
)
expect_error(
  fig6$frames <- list(list(nme = "a")),
  "Invalid frame properties: nme"
)

# Rendering -------------------------------------------------------------------------------
w <- plotly_widget(fig)
j <- json(w$x)
stopifnot(
  inherits(w, "htmlwidget"),
  grepl('"data":[{"type":"scatter"', j, fixed = TRUE),
  grepl('"title":{"text":"Title"}', j, fixed = TRUE)
)

# Data frames and formula properties in add_<trace>()
iris_df <- data.frame(
  a = 1:4,
  b = c(2, 4, 6, 8),
  g = factor(c("x", "y", "x", "y"))
)
fig <- iris_df |>
  go_figure() |>
  add_scatter(
    x = ~a,
    y = ~ b * 2,
    mode = "markers",
    marker = list(size = ~ a + 5),
    text = ~g
  ) |>
  add_bar(data = data.frame(k = c("p", "q"), v = 3:4), x = ~k, y = ~v)
stopifnot(
  length(fig$data) == 2L,
  identical(fig$data[[1]]$y, c(4, 8, 12, 16)),
  identical(fig$data[[1]]$marker$size, c(6, 7, 8, 9)),
  identical(fig$data[[1]]$text, c("x", "y", "x", "y")),
  identical(fig$data[[2]]$x, c("p", "q")),
  identical(attr(fig, "plotly_data"), iris_df),
  !is.null(attr(update_layout(fig, title = "t"), "plotly_data"))
)
# nested lists, formulas without data, and the data never reaching the JSON
fig <- go_figure() |>
  add_scatter(data = iris_df, x = ~a, y = ~b, marker = list(color = ~b))
stopifnot(identical(fig$data[[1]]$marker$color, iris_df$b))
stopifnot(identical(
  go_figure() |> add_bar(x = ~ 1:3, y = ~ c(2, 1, 3)) |> (\(f) f$data[[1]]$y)(),
  c(2, 1, 3)
))
json <- as.character(plotly_json(
  go_figure(data.frame(unused_col = 1:3, a = 1:3)) |> add_scatter(x = ~a),
  jsonedit = FALSE
))
stopifnot(!grepl("unused_col", json))
err <- tryCatch(go_figure() |> add_scatter(x = ~nope), error = conditionMessage)
stopifnot(grepl("no data", err))
err <- tryCatch(
  go_figure() |> add_scatter(data = 1:3, x = ~a),
  error = conditionMessage
)
stopifnot(grepl("must be a data frame", err))
