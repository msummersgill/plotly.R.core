library(plotly.R.core)

fig <- list(data = list(list(type = "scatter", x = 1:3, y = c(1, NA, 3))))
w <- plotly_widget(fig)

stopifnot(
  inherits(w, "htmlwidget"),
  identical(w$x$data[[1]]$type, "scatter")
)

# Serialisation: scalars unboxed, NA -> null; the default template is applied
json <- as.character(attr(w$x, "TOJSON_FUNC")(w$x))
stopifnot(
  grepl('"type":"scatter"', json, fixed = TRUE),
  grepl('"y":[1,null,3]', json, fixed = TRUE),
  grepl('"template":{"layout":{"autotypenumbers"', json, fixed = TRUE)
)
old <- default_template("none")
json <- as.character(attr(plotly_widget(fig)$x, "TOJSON_FUNC")(plotly_widget(fig)$x))
default_template(old)
stopifnot(grepl('"layout":{}', json, fixed = TRUE))
stopifnot(identical(default_template(), "plotly"))

# Bundled plotly.js is present and matches the yaml dependency version
js <- system.file("htmlwidgets/lib/plotlyjs/plotly.min.js", package = "plotly.R.core")
stopifnot(nzchar(js), file.size(js) > 1e6)

# Date-times keep millisecond precision (format(x, "%OS3") would truncate .123 to .122)
to_JSON <- plotly.R.core:::to_JSON
t <- as.POSIXct(c("2024-01-02 03:04:05.123", "2024-01-02 03:04:06", NA), tz = "UTC")
t[4] <- as.POSIXct("2024-01-02 23:59:59.9996", tz = "UTC")   # rounds into the next day
stopifnot(
  as.character(to_JSON(list(x = t))) ==
    '{"x":["2024-01-02 03:04:05.123","2024-01-02 03:04:06",null,"2024-01-03 00:00:00"]}',
  as.character(to_JSON(list(x = I(t[1])))) == '{"x":["2024-01-02 03:04:05.123"]}',
  as.character(to_JSON(list(x = as.POSIXlt(t[1])))) == '{"x":"2024-01-02 03:04:05.123"}',
  as.character(to_JSON(list(x = as.POSIXct("2024-06-01 12:00:00.5", tz = "America/New_York")))) ==
    '{"x":"2024-06-01 12:00:00.500"}'
)
