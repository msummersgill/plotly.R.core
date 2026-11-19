library(plotly.core)

fig <- list(data = list(list(type = "scatter", x = 1:3, y = c(1, NA, 3))))
w <- plotly_widget(fig)

stopifnot(
  inherits(w, "htmlwidget"),
  identical(w$x$data[[1]]$type, "scatter")
)

# Serialisation: scalars unboxed, NA -> null; no template by default
json <- as.character(attr(w$x, "TOJSON_FUNC")(w$x))
stopifnot(
  grepl('"type":"scatter"', json, fixed = TRUE),
  grepl(
    '"y":{"dtype":"f8","bdata":"AAAAAAAA8D+iBwAAAADwfwAAAAAAAAhA"}',
    json,
    fixed = TRUE
  ),
  grepl('"layout":{}', json, fixed = TRUE)
)
old <- default_template("plotly")
json <- as.character(attr(plotly_widget(fig)$x, "TOJSON_FUNC")(
  plotly_widget(fig)$x
))
default_template(old)
stopifnot(grepl('"template":{"layout":{"autotypenumbers"', json, fixed = TRUE))
stopifnot(identical(default_template(), "none"))

# Bundled plotly.js is present and matches the yaml dependency version
js <- system.file(
  "htmlwidgets/lib/plotlyjs/plotly.min.js",
  package = "plotly.core"
)
stopifnot(nzchar(js), file.size(js) > 1e6)

# Date-times keep microsecond precision, rounded (format(x, "%OS3") would
# truncate .123 to .122); trailing zeros of the fraction are dropped
to_JSON <- plotly.core:::to_JSON
t <- as.POSIXct(
  c("2024-01-02 03:04:05.123", "2024-01-02 03:04:06", NA),
  tz = "UTC"
)
t[4] <- as.POSIXct("2024-01-02 23:59:59.9999996", tz = "UTC") # rounds into the next day
t[5] <- as.POSIXct("2024-01-02 23:59:59", tz = "UTC") + 0.000123
stopifnot(
  as.character(to_JSON(list(x = t))) ==
    '{"x":["2024-01-02 03:04:05.123","2024-01-02 03:04:06",null,"2024-01-03 00:00:00","2024-01-02 23:59:59.000123"]}',
  as.character(to_JSON(list(x = I(t[1])))) ==
    '{"x":["2024-01-02 03:04:05.123"]}',
  as.character(to_JSON(list(x = as.POSIXlt(t[1])))) ==
    '{"x":"2024-01-02 03:04:05.123"}',
  as.character(to_JSON(list(
    x = as.POSIXct("2024-06-01 12:00:00.5", tz = "America/New_York")
  ))) ==
    '{"x":"2024-06-01 12:00:00.5"}'
)

# Numbers in JSON round-trip exactly (17 significant digits)
set.seed(1)
num <- c(
  runif(1000) * 10^sample(-10:10, 1000, TRUE),
  0.1 + 0.2,
  1 / 3,
  2^53 + 2
)
stopifnot(identical(jsonlite::fromJSON(as.character(to_JSON(num))), num))

# Numeric arrays in traces are sent as base64 typed arrays (like plotly.py)
spec <- plotly.core:::typed_array_spec
decode <- function(s) {
  size <- c(i1 = 1, i2 = 2, i4 = 4, f4 = 4, f8 = 8)[[s$dtype]]
  readBin(
    base64enc::base64decode(s$bdata),
    if (startsWith(s$dtype, "f")) "double" else "integer",
    n = 1e6,
    size = size,
    endian = "little"
  )
}
stopifnot(
  identical(spec(c(1.5, -2, 3))$dtype, "f8"),
  identical(decode(spec(c(1.5, -2, 3))), c(1.5, -2, 3)),
  identical(spec(1:3)$dtype, "i1"),
  identical(decode(spec(c(-5L, 100L))), c(-5L, 100L)),
  identical(spec(c(1L, 300L))$dtype, "i2"),
  identical(decode(spec(c(-1L, 300L))), c(-1L, 300L)),
  identical(spec(c(1L, 1e6L))$dtype, "i4"),
  identical(decode(spec(c(-1L, 1e6L))), c(-1L, 1e6L)),
  identical(spec(c(1L, NA))$dtype, "f8"),
  is.na(decode(spec(c(1L, NA)))[2]),
  identical(spec(I(2.5))$dtype, "f8"),
  # doubles that are whole numbers are sent as integers (lossless)
  identical(spec(c(1, 2, 3))$dtype, "i1"),
  identical(spec(c(1990, 2007))$dtype, "i2"),
  identical(decode(spec(c(-70000, 5))), c(-70000L, 5L)),
  identical(spec(c(-70000, 5))$dtype, "i4"),
  identical(spec(c(1, NA))$dtype, "f8"),
  identical(spec(c(1, Inf))$dtype, "f8"),
  identical(spec(c(3e9, 1))$dtype, "f8"),
  identical(spec(c(1, 1.5))$dtype, "f8"),
  identical(spec(numeric())$dtype, "f8")
)

# float32: as_float32() vectors or options(plotly.core.float32 = TRUE)
x <- c(0.1, 2.5, NA)
stopifnot(
  identical(spec(as_float32(x))$dtype, "f4"),
  isTRUE(all.equal(decode(spec(as_float32(x)))[1:2], x[1:2], tolerance = 1e-7)),
  is.na(decode(spec(as_float32(x)))[3]),
  identical(spec(as_float32(c(1, 2)))$dtype, "i1"), # whole numbers stay lossless
  identical(spec(x)$dtype, "f8")
)
old <- options(plotly.core.float32 = TRUE)
stopifnot(
  identical(spec(x)$dtype, "f4"),
  identical(spec(matrix(x[1:2], 1))$dtype, "f4")
)
options(old)
stopifnot(
  inherits(as_float32(x)[2:3], "plotly_float32"),
  inherits(tryCatch(as_float32("a"), error = identity), "error"),
  inherits(tryCatch(as_float32(Sys.Date()), error = identity), "error")
)
# the mark survives validation (graph objects, formulas) and px; plain JSON drops it
f <- data.frame(a = x) |>
  go_figure() |>
  add_scatter(
    x = ~ as_float32(a),
    y = as_float32(1:3 / 2),
    marker = list(size = as_float32(c(1.5, 2, 3)))
  )
stopifnot(
  inherits(f$data[[1]]$x, "plotly_float32"),
  inherits(f$data[[1]]$marker$size, "plotly_float32"),
  grepl('"x":[0.1,2.5,null]', plotly.core:::to_JSON(f$data[[1]]), fixed = TRUE),
  grepl(
    '"x":{"dtype":"f4"',
    htmlwidgets:::toJSON(list(x = as_widget(f)$x)),
    fixed = TRUE
  )
)
d <- iris
d$Sepal.Length <- as_float32(d$Sepal.Length)
stopifnot(
  inherits(
    go_figure(d) |>
      add_scatter(x = ~Sepal.Length, y = ~Sepal.Width) |>
      (\(f) f$data[[1]]$x)(),
    "plotly_float32"
  )
)
m <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2) # rows: 1 3 5 / 2 4 6
stopifnot(
  identical(spec(m)$shape, "2, 3"),
  identical(decode(spec(m)), c(1L, 3L, 5L, 2L, 4L, 6L)),
  identical(decode(spec(m + 0.5)), c(1, 3, 5, 2, 4, 6) + 0.5)
)

enc <- plotly.core:::b64_encode
tr <- enc(list(
  type = "scatter",
  x = 1:3,
  y = 5,
  ids = I(7),
  text = c("a", "b"),
  visible = c(TRUE, FALSE),
  d = as.Date(c("2024-01-01", "2024-01-02")),
  f = factor(c("a", "b")),
  marker = list(size = c(4, 8), line = list(width = 1:2)),
  geojson = list(bbox = c(1, 2)),
  range = c(0, 1),
  z = list(c(1, 2), c(3, 4))
))
stopifnot(
  identical(tr$x$dtype, "i1"),
  identical(tr$y, 5),
  identical(tr$ids$dtype, "i1"),
  is.character(tr$text),
  is.logical(tr$visible),
  identical(tr$d$rdate, "date"),
  is.factor(tr$f),
  identical(tr$marker$size$dtype, "i1"),
  identical(tr$marker$line$width$dtype, "i1"),
  identical(tr$geojson$bbox, c(1, 2)),
  identical(tr$range, c(0, 1)),
  identical(tr$z, list(c(1, 2), c(3, 4))) # unnamed lists aren't encoded
)

# Widget JSON encodes traces and frame traces, not the layout; to_JSON() stays plain
fig <- list(
  data = list(list(type = "bar", x = 1:3, y = c(2, 5, 3))),
  layout = list(xaxis = list(tickvals = c(1, 2))),
  frames = list(list(name = "a", data = list(list(y = c(1, 2, 3)))))
)
w <- plotly_widget(fig)
j <- jsonlite::fromJSON(
  as.character(attr(w$x, "TOJSON_FUNC")(w$x)),
  simplifyVector = FALSE
)
stopifnot(
  identical(j$data[[1]]$y$dtype, "i1"),
  identical(j$frames[[1]]$data[[1]]$y$dtype, "i1"),
  identical(unlist(j$layout$xaxis$tickvals), c(1L, 2L)),
  grepl('"y":[2,5,3]', as.character(plotly.core:::to_JSON(fig)), fixed = TRUE)
)
# ... including when htmlwidgets passes its payload (as when printing or saving)
stopifnot(grepl(
  '"y":{"dtype":"i1"',
  htmlwidgets:::toJSON(list(x = w$x)),
  fixed = TRUE
))

# Dates and date-times in traces are sent as typed arrays of days / wall-clock
# ms (marked `rdate`); the widget JS turns them back into these same strings
ds <- plotly.core:::date_array_spec
tt <- as.POSIXct(
  c("2024-03-10 01:59:59", "2024-03-10 03:00:00.25", NA),
  tz = "America/New_York"
)
s <- ds(tt)
stopifnot(
  identical(s$rdate, "datetime"),
  identical(s$dtype, "f8"),
  identical(
    decode(s)[1:2],
    c(
      as.numeric(as.POSIXct("2024-03-10 01:59:59", tz = "UTC")) * 1000,
      as.numeric(as.POSIXct("2024-03-10 03:00:00.25", tz = "UTC")) * 1000
    )
  ),
  is.na(decode(s)[3]),
  is.null(s$usec), # whole milliseconds: no microseconds sent
  identical(ds(as.Date(c("1970-01-02", "2024-01-01")))$rdate, "date"),
  identical(decode(ds(as.Date(c("1970-01-02", "2024-01-01")))), c(1L, 19723L)),
  is.null(ds(as.POSIXct(c("0900-01-01", "2000-01-01"), tz = "UTC"))), # outside 1000-9999: strings
  is.null(ds(as.POSIXct(c(NA, NA), tz = "UTC")))
)
# fractions of a millisecond: whole ms plus `usec` (0-999)
su <- ds(as.POSIXct("2024-01-02", tz = "UTC") + c(0.000123, 1.5, 2.0015))
stopifnot(
  identical(decode(su) %% 1000, c(0, 500, 1)),
  identical(as.numeric(decode(su$usec)), c(123, 0, 500))
)
old <- options(plotly.core.float32 = TRUE) # never single precision
stopifnot(identical(ds(tt)$dtype, "f8"))
options(old)
tm <- tt[1:2]
dim(tm) <- c(1L, 2L)
tr <- enc(list(
  x = tt,
  y = tt[1],
  base = I(tt[1]),
  customdata = as.Date(c("2024-01-01", NA)),
  z = tm
))
stopifnot(
  identical(tr$x$rdate, "datetime"),
  inherits(tr$y, "POSIXct"),
  identical(tr$base$rdate, "datetime"),
  identical(tr$customdata$rdate, "date"),
  inherits(tr$z, "POSIXct")
)
# Plain JSON writes date-time arrays directly (json_verbatim)
stopifnot(
  identical(
    as.character(to_JSON(list(x = tt, y = I(tt[1]), z = tt[1], e = tt[0]))),
    '{"x":["2024-03-10 01:59:59","2024-03-10 03:00:00.25",null],"y":["2024-03-10 01:59:59"],"z":"2024-03-10 01:59:59","e":[]}'
  )
)

# UTC offsets looked up per 15-minute bin (with the transition instant found
# in bins holding one) match as.POSIXlt() for every value, for sorted and
# unsorted values, next to DST transitions and with fractional seconds
for (tz in c(
  "America/Chicago",
  "Europe/London",
  "Australia/Lord_Howe",
  "UTC",
  ""
)) {
  set.seed(1)
  dst <- as.numeric(as.POSIXct("2024-03-10 01:59:59", tz = "America/Chicago"))
  for (s in list(
    c(dst + c(-0.5, 0, 0.5, 1, 1.5), runif(5000, 1.6e9, 1.8e9), NA),
    c(seq(1.7e9, 1.74e9, by = 997.3), NA)
  )) {
    t <- .POSIXct(s, tz = tz)
    off <- as.POSIXlt(t)$gmtoff
    sp <- ds(t)
    # whole milliseconds plus microseconds, from the rounded microseconds of
    # the fraction of a second
    whole <- floor(s)
    us <- round((s - whole) * 1e6)
    whole[us >= 1e6] <- whole[us >= 1e6] + 1
    us[us >= 1e6] <- us[us >= 1e6] - 1e6
    ok <- !is.na(s)
    stopifnot(
      identical(
        decode(sp)[ok],
        ((whole + off) * 1000 + floor(us / 1000))[ok]
      ),
      if (any(us[ok] %% 1000 != 0)) {
        identical(as.numeric(decode(sp$usec))[ok], (us %% 1000)[ok])
      } else {
        is.null(sp$usec)
      },
      is.na(tail(decode(sp), 1))
    )
  }
}
# The widget serialiser splices the base64 into the JSON jsonlite writes;
# the result is the same as writing the base64 strings with jsonlite
fig <- go_figure() |>
  add_scatter(
    x = as.POSIXct("2024-01-01", tz = "UTC") + 1:5,
    y = c(1.5, 2, NA, 4, 5),
    text = letters[1:5]
  ) |>
  add_scatter(
    x = 1:3,
    y = as_float32(c(0.1, 0.2, 0.3)),
    customdata = c(1e6, 2, 3)
  )
w <- as_widget(fig)
pl <- list(x = w$x, evals = list())
direct <- to_JSON(list(x = plotly.core:::b64_figure(w$x), evals = list()))
spliced <- plotly.core:::widget_to_JSON(pl)
stopifnot(
  identical(as.character(spliced), as.character(direct)),
  inherits(spliced, "json"),
  !grepl("\001", spliced, fixed = TRUE),
  grepl('"rdate":"datetime"', spliced, fixed = TRUE)
)
# base64 of every length mod 3 matches base64enc
for (n in 1:7) {
  x <- as.double(seq_len(n)) + 0.5
  stopifnot(
    identical(
      spec(x)$bdata,
      base64enc::base64encode(writeBin(x, raw(), size = 8L, endian = "little"))
    ),
    identical(
      spec(as_float32(x))$bdata,
      base64enc::base64encode(writeBin(x, raw(), size = 4L, endian = "little"))
    ),
    identical(
      spec(seq_len(n))$bdata,
      base64enc::base64encode(writeBin(seq_len(n), raw(), size = 1L))
    )
  )
}

# Arrays repeated in the figure are sent once: the first spec gets "bid" and
# later ones are {"bref": k}; resolving them gives the figure without sharing
tt <- as.POSIXct("2024-01-01", tz = "America/Chicago") + 1:50
yy <- as_float32(sin(1:50 / 7))
fig <- go_figure() |>
  add_scattergl(x = tt, y = yy) |>
  add_scattergl(x = tt, y = cos(1:50 / 7)) |>
  add_scattergl(x = tt + 0, y = yy, customdata = 1:50) |> # equal copy of x, same y
  add_scattergl(x = as.POSIXct(format(tt), tz = "UTC"), y = cos(1:50 / 7) + 0.5) # other time zone
w <- as_widget(fig)
w$x$frames <- list(list(
  name = "f",
  data = list(list(x = tt, y = cos(1:50 / 7)))
))
shared <- jsonlite::parse_json(
  plotly.core:::widget_to_JSON(list(x = w$x, evals = list())),
  simplifyVector = FALSE
)$x
plain <- jsonlite::parse_json(
  to_JSON(list(x = plotly.core:::b64_figure(w$x))),
  simplifyVector = FALSE
)$x
ids <- list()
collect <- function(o) {
  if (is.list(o)) {
    if (!is.null(o$bid)) {
      ids[[as.character(o$bid)]] <<- o[setdiff(names(o), "bid")]
    }
    for (e in o) {
      collect(e)
    }
  }
}
resolve <- function(o) {
  if (!is.list(o)) {
    return(o)
  }
  if (identical(names(o), "bref")) {
    return(ids[[as.character(o$bref)]])
  }
  o$bid <- NULL
  o[] <- lapply(o, resolve)
  o
}
collect(shared)
stopifnot(
  length(ids) == 3L, # x (data and frame), y of traces 1 and 3, y of traces 2 and frame
  identical(shared$data[[2]]$x, list(bref = 1L)),
  identical(shared$data[[3]]$x, list(bref = 1L)),
  identical(shared$data[[3]]$y, list(bref = 2L)),
  identical(shared$frames[[1]]$data[[1]]$x, list(bref = 1L)),
  identical(shared$data[[4]]$x$rdate, "datetime"), # different time zone: not shared
  identical(resolve(shared), plain)
)

# plotly.js bundles: the full one by default; partial_bundle() picks the
# smallest partial bundle with the figure's trace types
local({
  js <- function(w) {
    Filter(function(d) identical(d$name, "plotly-main"), w$dependencies)[[
      1
    ]]$script
  }
  bar <- go_figure(go_bar(x = c("a", "b"), y = 1:2))
  stopifnot(
    identical(js(plotly_widget(bar)), "plotly.min.js"),
    identical(js(plotly_widget(partial_bundle(bar))), "plotly-basic.min.js"),
    identical(
      js(plotly_widget(partial_bundle(go_figure(go_violin(y = 1:3))))),
      "plotly-cartesian.min.js"
    ),
    identical(
      js(plotly_widget(partial_bundle(go_figure(go_scatter3d(
        x = 1,
        y = 1,
        z = 1
      ))))),
      "plotly-gl3d.min.js"
    ),
    # no partial bundle has sunburst
    identical(
      js(plotly_widget(partial_bundle(go_figure(go_sunburst(
        labels = "a",
        parents = ""
      ))))),
      "plotly.min.js"
    ),
    identical(
      js(plotly_widget(bar, bundle = "cartesian")),
      "plotly-cartesian.min.js"
    ),
    # every bundle file exists
    all(file.exists(vapply(
      c("full", names(plotly.core:::PLOTLYJS_BUNDLE_TRACES)),
      plotly.core:::plotlyjs_bundle_file,
      ""
    )))
  )
  # a named bundle without the figure's trace types: the full one, with a warning
  w <- tryCatch(
    plotly_widget(go_figure(go_violin(y = 1:3)), bundle = "basic"),
    warning = identity
  )
  stopifnot(inherits(w, "warning"), grepl("violin", conditionMessage(w)))
  # trace types in animation frames count
  anim <- partial_bundle(go_figure(
    go_bar(y = 1:2),
    frames = list(list(data = list(go_violin(y = 1:3))))
  ))
  stopifnot(identical(js(plotly_widget(anim)), "plotly-cartesian.min.js"))
  # the option applies to every figure
  op <- options(plotly.core.bundle = "auto")
  on.exit(options(op))
  stopifnot(identical(js(plotly_widget(bar)), "plotly-basic.min.js"))
})

# The widget's JavaScript turns date-time typed arrays back into the strings
# to_JSON() writes (needs a browser, so off CRAN only)
if (
  identical(Sys.getenv("NOT_CRAN"), "true") &&
    requireNamespace("chromote", quietly = TRUE) &&
    plotly.core:::chrome_available()
) {
  tt <- c(
    as.POSIXct("2024-03-10 01:59:59", tz = "America/New_York") +
      c(0, 0.000123, 0.25, 3601.9999996, 0.0015),
    NA
  )
  fig <- go_figure() |> add_scatter(x = tt, y = seq_along(tt))
  f <- tempfile(fileext = ".html")
  write_html(fig, f)
  b <- chromote::ChromoteSession$new()
  loaded <- b$Page$loadEventFired(wait_ = FALSE)
  b$Page$navigate(paste0("file://", normalizePath(f)), wait_ = FALSE)
  b$wait_for(loaded)
  got <- b$Runtime$evaluate(
    "new Promise(function (r) { (function w() { var g = document.querySelector('.js-plotly-plot'); if (g && g.data) r(g.data[0].x.map(String)); else setTimeout(w, 50); })(); })",
    awaitPromise = TRUE,
    returnByValue = TRUE
  )$result$value
  b$close()
  want <- plotly.core:::format_datetime(tt)
  want[is.na(want)] <- "null"
  stopifnot(identical(unlist(got), want))
}
