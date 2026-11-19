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

# Every object in the schema has a constructor: traces, the layout, shared
# types (go_font(), go_colorbar_title(), ...) and one per other object, named
# after its path (go_scatter_marker(), go_xaxis(), go_scene_camera_eye(), ...).
ns <- asNamespace("plotly.core")
ctors <- setdiff(
  grep("^go_", getNamespaceExports("plotly.core"), value = TRUE),
  "go_figure"
)
shared <- paste0("go_", names(plotly.core:::shared_types()))
stopifnot(all(shared %in% ctors), length(shared) == 40L)
made <- character()
for (fn in ctors) {
  obj <- get(fn, ns)()
  stopifnot(inherits(obj, "plotly_obj"))
  if (!fn %in% shared) made <- c(made, class(obj)[[1L]])
}
env <- plotly.core:::validators_env()
compound <- Filter(
  function(k) env[[k]]$superclass %in% c("CompoundValidator", "TitleValidator"),
  ls(env)
)
need <- compound[is.na(vapply(compound, plotly.core:::shared_type_of, ""))]
stopifnot(
  setequal(made, vapply(need, function(k) env[[k]]$data_class, "")), # one constructor per object
  length(ctors) == 310L,
  all(
    c(
      "go_scatter_marker",
      "go_scatter_marker_line",
      "go_selected_marker",
      "go_sankey_link",
      "go_scene_camera_eye",
      "go_xaxis",
      "go_slider_step",
      "go_layout_title",
      "go_colorbar_title",
      "go_caps_axis"
    ) %in%
      ctors
  )
)
stopifnot(json(go_layout()) == "{}", json(go_scatter()) == '{"type":"scatter"}')

# named arguments only: constructors take no positional arguments --------------------
base <- list(x = 1:2, marker = list(size = 5, color = "blue"))
t3 <- do.call(
  go_scatter,
  utils::modifyList(base, list(marker = list(size = 9)))
)
stopifnot(
  identical(t3$marker$size, 9),
  identical(t3$marker$color, "blue"),
  identical(t3$x, 1:2)
)
stopifnot(
  !"arg" %in% names(formals(go_scatter)),
  !"arg" %in% names(formals(go_font))
)
# partial names aren't matched: `mark` is reported, not taken as `marker`
expect_error(go_scatter(mark = list(size = 1)), "Invalid property .* 'mark'")
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

expect_error(go_scatter(1:3), "must be named: properties are given by name")
expect_error(
  go_scatter(colour = "red"),
  "Invalid property .* go_scatter\\(\\): 'colour'"
)
# plotly.py's "magic underscore" names are not supported
expect_error(
  go_scatter(marker_size = 3),
  "Nested properties are set with their objects: marker = go_scatter_marker\\(size = ...\\)"
)
expect_error(go_layout(xaxis_title = "x"), "xaxis = go_xaxis\\(title = ...\\)")
expect_error(go_scatter(marker = list(sise = 3)), "Did you mean \"size\"")
expect_error(
  go_scatter(marker = list(size = -1)),
  "'size' property of scatter.marker"
)
expect_error(go_scatter(type = "bar"), "does not match go_scatter")
expect_error(go_layout(scen = list()), "Did you mean \"scene\"")

# skip_invalid drops bad properties at every level
t7 <- go_scatter(
  x = 1,
  bogus = 2,
  marker = list(size = -1, color = "red"),
  skip_invalid = TRUE
)
stopifnot(
  setequal(names(t7), c("type", "x", "marker")),
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
expect_error(
  go_font(colour = "red"),
  "go_font\\(\\): 'colour'.*Did you mean \"color\""
)
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
expect_error(
  go_layout(hoverlabel = go_hoverlabel(split = TRUE)),
  "layout.hoverlabel: 'split'"
)
expect_error(
  go_scatter(marker = go_font(size = 3)),
  "go_font\\(\\) object can't be used for scatter.marker"
)
tfs <- go_layout(
  xaxis = list(
    tickformatstops = list(
      go_tickformatstop(dtickrange = list(NULL, 1000), value = "%H:%M")
    )
  )
)
stopifnot(identical(tfs$xaxis$tickformatstops[[1L]]$value, "%H:%M"))
stopifnot(
  identical(
    unlist(go_pie(domain = go_domain(x = c(0, 0.5)))$domain$x),
    c(0, 0.5)
  ),
  identical(
    go_bar(
      marker = list(pattern = go_pattern(shape = "/"))
    )$marker$pattern$shape,
    "/"
  ),
  identical(
    go_scatter(
      legendgrouptitle = go_legendgrouptitle(text = "g")
    )$legendgrouptitle$text,
    "g"
  )
)

e <- go_error_bar(type = "data", array = c(0.2, 0.1), copy_ystyle = TRUE)
stopifnot(inherits(go_scatter(error_x = e)$error_x, "go_scatter_error_x"))
expect_error(go_scatter(error_y = e), "scatter.error_y: 'copy_ystyle'")

# types that are the same everywhere they appear
stopifnot(
  identical(go_histogram(xbins = go_bins(size = 1))$xbins$size, 1),
  identical(go_histogram(ybins = go_bins(size = 1))$ybins$size, 1),
  identical(
    go_layout(
      xaxis = list(minor = go_minor(ticks = "outside"))
    )$xaxis$minor$ticks,
    "outside"
  )
)
expect_error(
  go_histogram(xbins = go_minor()),
  "go_minor\\(\\) object can't be used for histogram.xbins"
)

# per-trace constructors have exactly their trace's properties
m <- go_scatter_marker(size = 12, line = go_scatter_marker_line(width = 2))
stopifnot(
  identical(class(m), c("go_scatter_marker", "plotly_obj")),
  identical(class(m$line), c("go_scatter_marker_line", "plotly_obj")),
  identical(go_scatter(marker = m)$marker, m),
  identical(
    go_scatter(line = go_scatter_line(width = 3, shape = "spline"))$line$shape,
    "spline"
  )
)
expect_error(go_scatter_marker(sise = 1), "scatter.marker: 'sise'")
expect_error(go_bar_marker(size = 1), "bar.marker: 'size'")
expect_error(go_bar_marker_line(shape = "spline"), "bar.marker.line: 'shape'")
# a bar marker line placed in a scatter marker is checked again there
stopifnot(inherits(
  go_scatter(marker = list(line = go_bar_marker_line(width = 1)))$marker$line,
  "go_scatter_marker_line"
))

# axis constructors
xa <- go_xaxis(title = "x", rangeslider = list(visible = TRUE))
stopifnot(
  identical(class(xa), c("go_layout_xaxis", "plotly_obj")),
  identical(go_layout(xaxis2 = xa)$xaxis2, xa),
  identical(
    go_layout(
      scene = list(zaxis = go_scene_axis(title = "z"))
    )$scene$zaxis$title$text,
    "z"
  )
)
expect_error(
  go_yaxis(rangeslider = list(visible = TRUE)),
  "layout.yaxis: 'rangeslider'"
)
expect_error(
  go_scene_axis(rangeslider = list()),
  "go_scene_axis\\(\\): 'rangeslider'"
)
# x, y and z (a, b and c) axes share a constructor; placed objects move between them
sx <- go_layout(
  scene = list(xaxis = go_scene_axis(range = c(0, 1)))
)$scene$xaxis
stopifnot(
  inherits(
    go_layout(scene = list(zaxis = sx))$scene$zaxis,
    "go_layout_scene_zaxis"
  ),
  identical(
    go_layout(
      ternary = list(caxis = go_ternary_axis(min = 0.1))
    )$ternary$caxis$min,
    0.1
  ),
  inherits(
    go_isosurface(caps = list(y = go_caps_axis(show = FALSE)))$caps$y,
    "go_isosurface_caps_y"
  )
)
# selected/unselected are checked against the trace's own when placed
sel <- go_selected(marker = go_selected_marker(size = 12, color = "red"))
stopifnot(identical(go_scatter(selected = sel)$selected$marker$size, 12))
expect_error(go_bar(selected = sel), "bar.selected.marker: 'size'")
stopifnot(identical(
  go_bar(
    unselected = go_unselected(marker = go_unselected_marker(opacity = 0.2))
  )$unselected$marker$opacity,
  0.2
))
fig <- go_figure() |>
  add_scatter(y = 1:3) |>
  update_xaxes(go_xaxis(showgrid = FALSE))
stopifnot(identical(fig$layout$xaxis$showgrid, FALSE))

# layout object constructors
steps <- lapply(1:2, function(i) {
  go_slider_step(
    label = as.character(i),
    method = "restyle",
    args = list("marker.size", 5 * i)
  )
})
l <- go_layout(
  sliders = list(go_slider(steps = steps)),
  annotations = list(go_annotation(text = "a", x = 1, y = 1)),
  title = go_layout_title(text = "T", x = 0),
  scene2 = go_scene(aspectmode = "cube")
)
stopifnot(
  inherits(l$sliders[[1L]]$steps[[2L]], "go_layout_slider_step"),
  identical(l$annotations[[1L]]$text, "a"),
  identical(l$title$x, 0),
  inherits(l$scene2, "go_layout_scene")
)
expect_error(go_slider_step(lable = "x"), "Did you mean \"label\"")
expect_error(
  go_updatemenu(buttons = list(go_slider_step())),
  "A layout.slider.step object can't be used for layout.updatemenu.button"
)
expect_error(
  go_scatter(line = go_scatter_marker()),
  "A scatter.marker object can't be used for scatter.line"
)
fig <- go_figure() |>
  add_scatter(y = 1:3) |>
  add_annotation(go_annotation(text = "hi", x = 2, y = 2))
stopifnot(identical(fig$layout$annotations[[1L]]$text, "hi"))

# piping a figure into a constructor points to the add_*() function
expect_error(
  go_figure(mtcars) |> go_scatter(x = ~mpg),
  "To add a scatter trace to a figure, use add_scatter"
)
expect_error(go_figure() |> go_layout(title = "t"), "use update_layout")
expect_error(
  go_figure() |> go_xaxis(title = "x"),
  "go_xaxis\\(\\) creates an object, not a figure"
)
expect_error(
  go_figure() |> go_font(size = 3),
  "go_font\\(\\) creates an object, not a figure"
)

# Figure data validation accepts graph objects and plain lists -----------------------
d <- plotly.core:::validate_data(list(tr, list(type = "scatter", y = 1:3)))
stopifnot(length(d) == 2L, inherits(d[[2L]], "go_scatter"))
