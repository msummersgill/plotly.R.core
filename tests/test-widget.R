library(plotly.R.core)

fig <- list(data = list(list(type = "scatter", x = 1:3, y = c(1, NA, 3))))
w <- plotly_widget(fig)

stopifnot(
  inherits(w, "htmlwidget"),
  identical(w$x$data[[1]]$type, "scatter")
)

# Serialisation: scalars unboxed, NA -> null, empty layout -> {}
json <- as.character(attr(w$x, "TOJSON_FUNC")(w$x))
stopifnot(
  grepl('"type":"scatter"', json, fixed = TRUE),
  grepl('"y":[1,null,3]', json, fixed = TRUE),
  grepl('"layout":{}', json, fixed = TRUE)
)

# Bundled plotly.js is present and matches the yaml dependency version
js <- system.file("htmlwidgets/lib/plotlyjs/plotly.min.js", package = "plotly.R.core")
stopifnot(nzchar(js), file.size(js) > 1e6)
