library(plotly.core)

# the figure data (JSON) in a page written by write_html() or saveWidget()
page_data <- function(f) {
  html <- readChar(f, file.size(f), useBytes = TRUE)
  m <- regmatches(html, regexpr('<script type="application/json" data-for="[^"]+">.*?</script>', html))
  sub("^<script[^>]*>", "", sub("</script>$", "", m))
}
dir <- tempfile("write-html-")
dir.create(dir)

# The same page as saveWidget(), but for the widget's id; "</" in strings escaped
fig <- go_figure() |>
  add_heatmap(z = as_float32(volcano)) |>
  add_scatter(x = 1:3, y = c(2, 1, 3), name = "</script> & <b>") |>
  update_layout(title = list(text = "a </b> title"))
f1 <- file.path(dir, "a.html")
f2 <- file.path(dir, "b.html")
stopifnot(identical(write_html(fig, f1, selfcontained = FALSE), f1))
htmlwidgets::saveWidget(plotly_widget(fig), f2, selfcontained = FALSE)
strip <- function(f) gsub("htmlwidget-[0-9a-f]+", "ID", gsub("(a|b)_files", "lib", readLines(f, warn = FALSE)))
stopifnot(
  identical(page_data(f1), page_data(f2)),
  !grepl("</script> &", page_data(f1), fixed = TRUE),
  dir.exists(file.path(dir, "a_files")),
  identical(strip(f1), strip(f2))
)

# Self-contained: the files the page needs are embedded
f3 <- file.path(dir, "c.html")
write_html(go_figure() |> add_bar(x = c("a", "b"), y = 1:2), f3)
html <- readChar(f3, file.size(f3), useBytes = TRUE)
stopifnot(
  !grepl('src="lib/', html, fixed = TRUE),
  grepl('<script src="data:application/javascript;base64,', html, fixed = TRUE),
  !dir.exists(file.path(dir, "c_files")),
  !dir.exists(file.path(dir, "lib")),
  nzchar(page_data(f3))
)

# The widget's preRenderHook is run
w <- plotly_widget(go_figure() |> add_scatter(x = 1:2, y = 1:2))
w$preRenderHook <- function(w) {
  w$x$layout$title <- list(text = "hooked")
  w
}
f4 <- file.path(dir, "d.html")
write_html(w, f4, selfcontained = FALSE)
stopifnot(grepl('"hooked"', page_data(f4), fixed = TRUE))

# Other widgets are saved with saveWidget()
w <- htmlwidgets::createWidget("plotly_core", list(data = list(), layout = list()), package = "plotly.core")
f5 <- file.path(dir, "e.html")
write_html(w, f5, selfcontained = FALSE)
stopifnot(file.exists(f5))

unlink(dir, recursive = TRUE)
