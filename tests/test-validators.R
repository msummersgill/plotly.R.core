# Tests for the base validators (R/basevalidators.R) driven by the generated
# validator parameters in R/sysdata.rda.
library(plotly.core)

vc <- plotly.core:::validate_coerce
validate_trace <- plotly.core:::validate_trace
validate_layout <- plotly.core:::validate_layout
to_JSON <- plotly.core:::to_JSON

# expect_error(expr, pattern): expr must fail with a message matching pattern
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
json <- function(x) as.character(to_JSON(x))
# Drop graph-object classes (recursively) to compare with plain lists
plain <- function(x) {
  if (is.list(x)) {
    x <- unclass(x)
    x[] <- lapply(x, plain)
  }
  x
}

# Data arrays ----------------------------------------------------------------
stopifnot(
  identical(vc(1:3, "scatter.x"), 1:3),
  identical(vc(factor(c("a", "b")), "scatter.x"), c("a", "b")),
  json(list(x = vc(5, "scatter.x"))) == '{"x":[5]}', # length 1 stays an array
  inherits(vc(as.Date("2024-01-01") + 0:1, "scatter.x"), "Date")
)
stopifnot(
  json(list(
    customdata = vc(data.frame(a = 1:2, b = c("x", "y")), "scatter.customdata")
  )) ==
    '{"customdata":[[1,"x"],[2,"y"]]}'
)
expect_error(vc(list(a = 1), "scatter.x"), "Invalid value of type 'list'")

# Numbers and integers ---------------------------------------------------------
stopifnot(
  identical(vc(5, "scatter.marker.size"), 5),
  identical(vc(c(1, NA, 3), "scatter.marker.size"), c(1, NA, 3)),
  identical(vc(0.5, "scatter.opacity"), 0.5),
  identical(vc(2, "scatter.marker.colorbar.nticks"), 2L)
)
expect_error(vc(-1, "scatter.marker.size"), "interval \\[0, Inf\\]")
expect_error(
  vc(c(1, -2, 3), "scatter.marker.size"),
  "Invalid elements include: -2"
)
expect_error(vc(1.5, "scatter.opacity"), "'opacity' property of scatter")
expect_error(vc(c(0.1, 0.2), "scatter.opacity"), "Invalid value") # not array_ok
expect_error(vc("big", "scatter.marker.size"), "type 'character'")
expect_error(vc(2.5, "scatter.marker.colorbar.nticks"), "Invalid elements")

# Booleans and strings ---------------------------------------------------------
stopifnot(
  identical(vc(TRUE, "scatter.showlegend"), TRUE),
  identical(vc("a", "scatter.name"), "a"),
  identical(vc(1, "scatter.name"), "1"), # non-strict string
  identical(vc(c("a", "b"), "scatter.text"), c("a", "b"))
)
expect_error(vc("yes", "scatter.showlegend"), "logical value")
expect_error(vc(c("a", "b"), "scatter.name"), "Invalid value")
expect_error(vc("", "layout.font.family"), "'family' property") # no_blank

# Enumerations, dash, subplot ids, flaglists -----------------------------------
stopifnot(
  identical(vc("lines+markers", "scatter.mode"), "lines+markers"),
  identical(vc("markers", "scatter.mode"), "markers"),
  identical(vc("tozeroy", "scatter.fill"), "tozeroy"),
  identical(vc(TRUE, "layout.xaxis.autorange"), TRUE),
  identical(vc("reversed", "layout.xaxis.autorange"), "reversed"),
  identical(vc("y2", "layout.xaxis.anchor"), "y2"),
  identical(vc("y1", "layout.xaxis.anchor"), "y"), # x1 -> x like plotly.py
  identical(vc("dot", "scatter.line.dash"), "dot"),
  identical(vc("5px,10px", "scatter.line.dash"), "5px,10px"),
  identical(vc("x2", "scatter.xaxis"), "x2"),
  identical(vc("x1", "scatter.xaxis"), "x"),
  identical(vc("x, y", "scatter.hoverinfo"), "x+y"),
  identical(vc("none", "scatter.hoverinfo"), "none")
)
expect_error(vc("dots", "scatter.line.dash"), "One of: \"solid\"")
expect_error(vc("y0", "layout.xaxis.anchor"), "Invalid value")
expect_error(vc("x0", "scatter.xaxis"), "subplot of type 'x'")
expect_error(vc("y", "scatter.xaxis"), "subplot of type 'x'")
expect_error(vc("x+q", "scatter.hoverinfo"), "flaglist")
expect_error(vc("circle", "scatter.mode"), "flaglist")

# Colors and colorscales --------------------------------------------------------
stopifnot(
  identical(vc("#ff0000", "scatter.marker.color"), "#ff0000"),
  identical(
    vc("rgba(0, 0, 255, 0.5)", "scatter.marker.color"),
    "rgba(0, 0, 255, 0.5)"
  ),
  identical(vc("SteelBlue", "scatter.marker.color"), "SteelBlue"),
  identical(vc("gray50", "scatter.marker.color"), "rgba(127,127,127,1)"), # R color name
  identical(
    vc(c("ffff", "FF0000"), "scatter.marker.color"),
    c("#ffff", "#ff0000")
  ), # hex without "#"
  identical(vc(c(1, 2, 3), "scatter.marker.color"), c(1, 2, 3)), # numeric: has colorscale
  identical(vc(c("red", NA), "scatter.marker.color"), c("red", NA)),
  length(vc("viridis", "scatter.marker.colorscale")) == 10L, # expanded like plotly.py
  identical(
    vc("viridis", "scatter.marker.colorscale")[[1L]],
    list(0, "#440154")
  ),
  identical(
    vc("Viridis_r", "scatter.marker.colorscale")[[1L]],
    list(0, "#fde725")
  ),
  json(vc(c("red", "blue"), "scatter.marker.colorscale")) ==
    '[[0,"red"],[1,"blue"]]',
  json(vc(
    data.frame(v = c(0, 1), c = c("red", "blue")),
    "scatter.marker.colorscale"
  )) ==
    '[[0,"red"],[1,"blue"]]',
  json(vc(list(c(0, "red"), c(1, "blue")), "scatter.marker.colorscale")) ==
    '[[0,"red"],[1,"blue"]]'
)
expect_error(vc("notacolor", "scatter.marker.color"), "is a color")
expect_error(
  vc(c("red", "nope"), "scatter.marker.color"),
  "Invalid elements include: \"nope\""
)
expect_error(vc(1, "scatter.line.color"), "type 'numeric'") # no colorscale sibling
expect_error(vc("Nonexistent", "scatter.marker.colorscale"), "px_colors")
expect_error(
  vc(list(c(0, "red"), c(2, "blue")), "scatter.marker.colorscale"),
  "colorscale"
)

# Angles and info arrays ---------------------------------------------------------
stopifnot(
  identical(vc(270, "layout.xaxis.tickangle"), -90),
  json(vc(c(0, 10), "layout.xaxis.range")) == "[0,10]",
  json(vc(c(NA, 10), "layout.xaxis.range")) == "[null,10]",
  json(vc(as.Date(c("2024-01-01", "2024-12-31")), "layout.xaxis.range")) ==
    '["2024-01-01","2024-12-31"]',
  json(vc(c(0, 0.5), "layout.xaxis.domain")) == "[0,0.5]"
)
expect_error(vc(c(0, 1, 2), "layout.xaxis.range"), "array of 2 element")
expect_error(vc(c(0, 2), "layout.xaxis.domain"), "interval \\[0, 1\\]")

# Compound objects, titles, compound arrays ---------------------------------------
m <- vc(
  list(size = 10, color = "red", line = list(width = 2)),
  "scatter.marker"
)
stopifnot(identical(
  plain(m),
  list(size = 10, color = "red", line = list(width = 2))
))
stopifnot(identical(
  plain(vc(list(), "scatter.marker")),
  structure(list(), names = character())
))
expect_error(vc(list(sise = 10), "scatter.marker"), "Did you mean \"size\"")
expect_error(vc(list(10), "scatter.marker"), "Invalid value")
expect_error(
  vc(list(line = list(width = -1)), "scatter.marker"),
  "'width' property of scatter.marker.line"
)

stopifnot(
  identical(plain(vc("My plot", "layout.title")), list(text = "My plot")),
  identical(
    plain(vc(list(text = "A", x = 0.5), "layout.title")),
    list(text = "A", x = 0.5)
  ),
  identical(
    plain(vc(list(list(bounds = c("sat", "mon"))), "layout.xaxis.rangebreaks")),
    list(list(bounds = list("sat", "mon")))
  )
)
expect_error(
  vc(list(bounds = c("sat", "mon")), "layout.xaxis.rangebreaks"),
  "list of objects"
)

# Traces and layout -----------------------------------------------------------------
tr <- validate_trace(list(
  x = 1:3,
  y = c(2, 4, 3),
  mode = "markers",
  marker = list(size = 8)
))
stopifnot(identical(tr$type, "scatter"), identical(tr$marker$size, 8))
expect_error(
  validate_trace(list(type = "bogus", x = 1)),
  "Available trace types: bar, barpolar, box"
)
expect_error(
  validate_trace(list(x = 1, colour = "red")),
  "Invalid property specified for object of type go_scatter: 'colour'"
)

lay <- validate_layout(list(
  title = "T",
  xaxis = list(title = "X", range = c(0, 5)),
  yaxis2 = list(overlaying = "y"),
  showlegend = FALSE
))
stopifnot(
  identical(plain(lay$title), list(text = "T")),
  identical(plain(lay$xaxis$title), list(text = "X")),
  identical(lay$yaxis2$overlaying, "y")
)
expect_error(validate_layout(list(xaxis0 = list())), "Invalid property")
expect_error(validate_layout(list(width = 5)), "interval \\[10, Inf\\]")

# Full figure round trip through the widget serialiser
fig <- list(data = list(tr), layout = lay)
j <- json(plotly_widget(fig)$x)
stopifnot(
  grepl('"type":"scatter"', j, fixed = TRUE),
  grepl('"title":{"text":"T"}', j, fixed = TRUE)
)

# every invalid property of an object is reported, not just the first
local({
  msg <- tryCatch(
    go_scatter(y = 1:3, marker_sise = 3, foo = 1, mode = "markrs"),
    error = conditionMessage
  )
  stopifnot(
    grepl("^3 invalid properties", msg),
    grepl("'sise'", msg),
    grepl("'foo'", msg),
    grepl("'mode'", msg)
  )
  msg <- tryCatch(
    go_figure(list(list(type = "bar", foo = 1, marker = list(colr = "red")))),
    error = conditionMessage
  )
  stopifnot(grepl("^2 invalid properties", msg))
  # a single problem keeps its own message
  msg <- tryCatch(go_scatter(foo = 1), error = conditionMessage)
  stopifnot(grepl(
    "^Invalid property specified for object of type go_scatter: 'foo'",
    msg
  ))
  e <- tryCatch(go_scatter(foo = 1, bar = 2), error = identity)
  stopifnot(inherits(e, "plotly_invalid_property"), length(e$problems) == 2L)
})
