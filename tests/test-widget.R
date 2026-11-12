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
  grepl('"y":{"dtype":"f8","bdata":"AAAAAAAA8D+iBwAAAADwfwAAAAAAAAhA"}', json, fixed = TRUE),
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

# Numeric arrays in traces are sent as base64 typed arrays (like plotly.py)
spec <- plotly.R.core:::typed_array_spec
decode <- function(s) {
  size <- c(i1 = 1, i2 = 2, i4 = 4, f4 = 4, f8 = 8)[[s$dtype]]
  readBin(base64enc::base64decode(s$bdata), if (startsWith(s$dtype, "f")) "double" else "integer",
          n = 1e6, size = size, endian = "little")
}
stopifnot(
  identical(spec(c(1.5, -2, 3))$dtype, "f8"), identical(decode(spec(c(1.5, -2, 3))), c(1.5, -2, 3)),
  identical(spec(1:3)$dtype, "i1"), identical(decode(spec(c(-5L, 100L))), c(-5L, 100L)),
  identical(spec(c(1L, 300L))$dtype, "i2"), identical(decode(spec(c(-1L, 300L))), c(-1L, 300L)),
  identical(spec(c(1L, 1e6L))$dtype, "i4"), identical(decode(spec(c(-1L, 1e6L))), c(-1L, 1e6L)),
  identical(spec(c(1L, NA))$dtype, "f8"), is.na(decode(spec(c(1L, NA)))[2]),
  identical(spec(I(2.5))$dtype, "f8"),
  # doubles that are whole numbers are sent as integers (lossless)
  identical(spec(c(1, 2, 3))$dtype, "i1"), identical(spec(c(1990, 2007))$dtype, "i2"),
  identical(decode(spec(c(-70000, 5))), c(-70000L, 5L)), identical(spec(c(-70000, 5))$dtype, "i4"),
  identical(spec(c(1, NA))$dtype, "f8"), identical(spec(c(1, Inf))$dtype, "f8"),
  identical(spec(c(3e9, 1))$dtype, "f8"), identical(spec(c(1, 1.5))$dtype, "f8"),
  identical(spec(numeric())$dtype, "f8")
)

# float32: as_float32() vectors or options(plotly.R.core.float32 = TRUE)
x <- c(0.1, 2.5, NA)
stopifnot(
  identical(spec(as_float32(x))$dtype, "f4"),
  isTRUE(all.equal(decode(spec(as_float32(x)))[1:2], x[1:2], tolerance = 1e-7)),
  is.na(decode(spec(as_float32(x)))[3]),
  identical(spec(as_float32(c(1, 2)))$dtype, "i1"),          # whole numbers stay lossless
  identical(spec(x)$dtype, "f8")
)
old <- options(plotly.R.core.float32 = TRUE)
stopifnot(identical(spec(x)$dtype, "f4"), identical(spec(matrix(x[1:2], 1))$dtype, "f4"))
options(old)
stopifnot(
  inherits(as_float32(x)[2:3], "plotly_float32"),
  inherits(tryCatch(as_float32("a"), error = identity), "error"),
  inherits(tryCatch(as_float32(Sys.Date()), error = identity), "error")
)
# the mark survives validation (graph objects, formulas), px and plot_ly(); plain JSON drops it
f <- data.frame(a = x) |> go_figure() |>
  add_scatter(x = ~as_float32(a), y = as_float32(1:3 / 2), marker_size = as_float32(c(1.5, 2, 3)))
stopifnot(
  inherits(f$data[[1]]$x, "plotly_float32"), inherits(f$data[[1]]$marker$size, "plotly_float32"),
  grepl('"x":[0.1,2.5,null]', plotly.R.core:::to_JSON(f$data[[1]]), fixed = TRUE),
  grepl('"x":{"dtype":"f4"', htmlwidgets:::toJSON(list(x = as_widget(f)$x)), fixed = TRUE)
)
d <- px_data_iris()
d$sepal_length <- as_float32(d$sepal_length)
stopifnot(
  inherits(px_scatter(d, x = ~sepal_length, y = ~sepal_width, color = ~species)$data[[1]]$x, "plotly_float32"),
  inherits(as_widget(plot_ly(d, x = ~sepal_length, y = ~sepal_width, type = "scatter", mode = "markers"))$x$data[[1]]$x,
           "plotly_float32")
)
m <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2)          # rows: 1 3 5 / 2 4 6
stopifnot(identical(spec(m)$shape, "2, 3"), identical(decode(spec(m)), c(1L, 3L, 5L, 2L, 4L, 6L)),
          identical(decode(spec(m + 0.5)), c(1, 3, 5, 2, 4, 6) + 0.5))

enc <- plotly.R.core:::b64_encode
tr <- enc(list(type = "scatter", x = 1:3, y = 5, ids = I(7), text = c("a", "b"), visible = c(TRUE, FALSE),
               d = as.Date(c("2024-01-01", "2024-01-02")), f = factor(c("a", "b")),
               marker = list(size = c(4, 8), line = list(width = 1:2)),
               geojson = list(bbox = c(1, 2)), range = c(0, 1), z = list(c(1, 2), c(3, 4))))
stopifnot(
  identical(tr$x$dtype, "i1"), identical(tr$y, 5), identical(tr$ids$dtype, "i1"),
  is.character(tr$text), is.logical(tr$visible), identical(tr$d$rdate, "date"), is.factor(tr$f),
  identical(tr$marker$size$dtype, "i1"), identical(tr$marker$line$width$dtype, "i1"),
  identical(tr$geojson$bbox, c(1, 2)), identical(tr$range, c(0, 1)),
  identical(tr$z, list(c(1, 2), c(3, 4)))               # unnamed lists aren't encoded
)

# Widget JSON encodes traces and frame traces, not the layout; to_JSON() stays plain
fig <- list(data = list(list(type = "bar", x = 1:3, y = c(2, 5, 3))),
            layout = list(xaxis = list(tickvals = c(1, 2))),
            frames = list(list(name = "a", data = list(list(y = c(1, 2, 3))))))
w <- plotly_widget(fig)
j <- jsonlite::fromJSON(as.character(attr(w$x, "TOJSON_FUNC")(w$x)), simplifyVector = FALSE)
stopifnot(
  identical(j$data[[1]]$y$dtype, "i1"), identical(j$frames[[1]]$data[[1]]$y$dtype, "i1"),
  identical(unlist(j$layout$xaxis$tickvals), c(1L, 2L)),
  grepl('"y":[2,5,3]', as.character(plotly.R.core:::to_JSON(fig)), fixed = TRUE)
)
# ... including when htmlwidgets passes its payload (as when printing or saving)
stopifnot(grepl('"y":{"dtype":"i1"', htmlwidgets:::toJSON(list(x = w$x)), fixed = TRUE))

# Dates and date-times in traces are sent as typed arrays of days / wall-clock
# ms (marked `rdate`); the widget JS turns them back into these same strings
ds <- plotly.R.core:::date_array_spec
tt <- as.POSIXct(c("2024-03-10 01:59:59", "2024-03-10 03:00:00.25", NA), tz = "America/New_York")
s <- ds(tt)
stopifnot(
  identical(s$rdate, "datetime"), identical(s$dtype, "f8"),
  identical(decode(s)[1:2], c(as.numeric(as.POSIXct("2024-03-10 01:59:59", tz = "UTC")) * 1000,
                              as.numeric(as.POSIXct("2024-03-10 03:00:00.25", tz = "UTC")) * 1000)),
  is.na(decode(s)[3]),
  identical(ds(as.Date(c("1970-01-02", "2024-01-01")))$rdate, "date"),
  identical(decode(ds(as.Date(c("1970-01-02", "2024-01-01")))), c(1L, 19723L)),
  is.null(ds(as.POSIXct(c("0900-01-01", "2000-01-01"), tz = "UTC"))),   # outside 1000-9999: strings
  is.null(ds(as.POSIXct(c(NA, NA), tz = "UTC")))
)
old <- options(plotly.R.core.float32 = TRUE)                           # never single precision
stopifnot(identical(ds(tt)$dtype, "f8"))
options(old)
tm <- tt[1:2]
dim(tm) <- c(1L, 2L)
tr <- enc(list(x = tt, y = tt[1], base = I(tt[1]), customdata = as.Date(c("2024-01-01", NA)), z = tm))
stopifnot(
  identical(tr$x$rdate, "datetime"), inherits(tr$y, "POSIXct"), identical(tr$base$rdate, "datetime"),
  identical(tr$customdata$rdate, "date"), inherits(tr$z, "POSIXct")
)
# Plain JSON writes date-time arrays directly (json_verbatim)
stopifnot(
  identical(as.character(to_JSON(list(x = tt, y = I(tt[1]), z = tt[1], e = tt[0]))),
            '{"x":["2024-03-10 01:59:59","2024-03-10 03:00:00.250",null],"y":["2024-03-10 01:59:59"],"z":"2024-03-10 01:59:59","e":[]}')
)
