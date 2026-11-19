# Example codegen: one example per help page that draws a figure from one of
# R's datasets.
#
# A trace's example is chosen by the first pattern in EXAMPLE_PATTERNS that
# fits its data properties (x, y, lat, lon, labels, ...) and schema categories.
# Pages of nested objects (go_scatter_marker(), go_font(), go_xaxis(), ...)
# reuse the example of a trace they belong to, adding themselves to it.

# A pattern returns NULL if it doesn't fit, or a list with
#   setup: lines run first (data preparation),
#   data:  the data piped into go_figure() (NULL for none),
#   args:  named arguments of add_<trace>() (name = R code),
#   before: calls added to the figure before add_<trace>() (e.g. a carpet),
#   layout: named arguments of update_layout() afterwards.
# `t` has the trace's name, its properties (`props`), its schema categories
# (`cats`) and whether its `mode` has markers (`markers`).
EXAMPLE_PATTERNS <- list(
  # hierarchies: sunburst, treemap, icicle
  function(t) {
    if (!all(c("labels", "parents") %in% t$props)) {
      return(NULL)
    }
    list(
      setup = c(
        "cyl <- table(paste(mtcars$cyl, \"cylinders\"))",
        "d <- data.frame(",
        "  labels = c(\"all cars\", names(cyl)),",
        "  parents = c(\"\", rep(\"all cars\", length(cyl))),",
        "  values = c(0, as.vector(cyl))",
        ")"
      ),
      data = "d",
      args = c(labels = "~labels", parents = "~parents", values = "~values")
    )
  },
  # parts of a whole: pie, funnelarea
  function(t) {
    if (!all(c("labels", "values") %in% t$props)) {
      return(NULL)
    }
    list(
      setup = "d <- as.data.frame(table(cylinders = mtcars$cyl))",
      data = "d",
      args = c(labels = "~cylinders", values = "~Freq")
    )
  },
  # US states
  function(t) {
    if (!"locations" %in% t$props || !"geo" %in% t$cats || !"z" %in% t$props) {
      return(NULL)
    }
    list(
      data = "USArrests",
      args = c(
        locations = "state.abb",
        z = "~Murder",
        locationmode = "\"USA-states\""
      ),
      layout = c(geo = "go_geo(scope = \"usa\")")
    )
  },
  # points on a map
  function(t) {
    if (!all(c("lat", "lon") %in% t$props)) {
      return(NULL)
    }
    list(
      data = "quakes",
      args = c(
        lat = "~lat",
        lon = "~long",
        if ("z" %in% t$props) c(z = "~mag")
      )
    )
  },
  # polar
  function(t) {
    if (!all(c("r", "theta") %in% t$props)) {
      return(NULL)
    }
    list(data = "mtcars", args = c(r = "~mpg", theta = "~hp"))
  },
  # ternary
  function(t) {
    if (!all(c("a", "b", "c") %in% t$props)) {
      return(NULL)
    }
    list(
      data = "iris",
      args = c(a = "~Sepal.Length", b = "~Sepal.Width", c = "~Petal.Length")
    )
  },
  # smith charts
  function(t) {
    if (!all(c("real", "imag") %in% t$props)) {
      return(NULL)
    }
    list(data = "mtcars", args = c(real = "~wt", imag = "~drat"))
  },
  # carpets, and traces drawn on one
  function(t) {
    if (!all(c("a", "b") %in% t$props)) {
      return(NULL)
    }
    setup <- c(
      "d <- expand.grid(a = c(4, 5, 6), b = c(1, 2, 3))",
      "d$y <- d$a * d$b"
    )
    if (t$trace == "carpet") {
      return(list(
        setup = setup,
        data = "d",
        args = c(a = "~a", b = "~b", y = "~y")
      ))
    }
    list(
      setup = setup,
      data = "d",
      before = "add_carpet(a = ~a, b = ~b, y = ~y, carpet = \"c\")",
      args = c(
        a = "~a",
        b = "~b",
        if ("z" %in% t$props) c(z = "~y"),
        carpet = "\"c\""
      )
    )
  },
  # open-high-low-close
  function(t) {
    if (!all(c("open", "high", "low", "close") %in% t$props)) {
      return(NULL)
    }
    list(
      setup = c(
        "d <- data.frame(day = 1:30, close = EuStockMarkets[1:30, \"DAX\"])",
        "d$open <- c(d$close[1], head(d$close, -1))",
        "d$high <- pmax(d$open, d$close) + 5",
        "d$low <- pmin(d$open, d$close) - 5"
      ),
      data = "d",
      args = c(
        x = "~day",
        open = "~open",
        high = "~high",
        low = "~low",
        close = "~close"
      )
    )
  },
  # 3D vector fields: cone, streamtube
  function(t) {
    if (!all(c("u", "v", "w") %in% t$props)) {
      return(NULL)
    }
    list(
      setup = "d <- expand.grid(x = 1:3, y = 1:3, z = 1:3)",
      data = "d",
      args = c(
        x = "~x",
        y = "~y",
        z = "~z",
        u = "~y",
        v = "~-x",
        w = "~z"
      )
    )
  },
  # 2D vector fields: quiver
  function(t) {
    if (!all(c("u", "v") %in% t$props)) {
      return(NULL)
    }
    list(
      setup = "d <- expand.grid(x = 1:5, y = 1:5)",
      data = "d",
      args = c(x = "~x", y = "~y", u = "~y / 10", v = "~-x / 10")
    )
  },
  # values on a 3D grid: isosurface, volume
  function(t) {
    if (!all(c("value", "x", "y", "z") %in% t$props)) {
      return(NULL)
    }
    list(
      setup = "d <- expand.grid(x = 1:5, y = 1:5, z = 1:5)",
      data = "d",
      args = c(
        x = "~x",
        y = "~y",
        z = "~z",
        value = "~x * y * z",
        isomin = "10",
        isomax = "50"
      )
    )
  },
  # dimensions: splom, parcoords (numbers), parcats (categories)
  function(t) {
    if (!t$trace %in% c("splom", "parcoords", "parcats")) {
      return(NULL)
    }
    dim <- t$ctor(paste0(t$trace, ".dimension"))
    cols <- if (t$trace == "parcats") {
      c("cyl", "gear", "am")
    } else {
      c("Sepal.Length", "Sepal.Width", "Petal.Length")
    }
    list(
      data = if (t$trace == "parcats") "mtcars" else "iris",
      args = c(
        dimensions = sprintf(
          "list(\n%s\n)",
          paste0(
            "  ",
            sprintf("%s(label = \"%s\", values = ~%s)", dim, cols, cols),
            collapse = ",\n"
          )
        )
      )
    )
  },
  # flows
  function(t) {
    if (t$trace != "sankey") {
      return(NULL)
    }
    list(
      setup = c(
        "d <- aggregate(Freq ~ Class + Survived, as.data.frame(Titanic), sum)",
        "nodes <- c(levels(d$Class), paste(\"Survived:\", levels(d$Survived)))",
        "d$source <- as.integer(d$Class) - 1",
        "d$target <- nlevels(d$Class) + as.integer(d$Survived) - 1"
      ),
      data = "d",
      args = c(
        node = sprintf("%s(label = nodes)", t$ctor("sankey.node")),
        link = sprintf(
          "%s(source = ~source, target = ~target, value = ~Freq)",
          t$ctor("sankey.link")
        )
      )
    )
  },
  # tables
  function(t) {
    if (t$trace != "table") {
      return(NULL)
    }
    list(
      setup = "d <- head(mtcars)",
      data = "d",
      args = c(
        header = sprintf("%s(values = names(d))", t$ctor("table.header")),
        cells = sprintf("%s(values = d)", t$ctor("table.cells"))
      )
    )
  },
  # single values
  function(t) {
    if (t$trace != "indicator") {
      return(NULL)
    }
    list(
      data = "mtcars",
      args = c(
        mode = "\"number+gauge\"",
        value = "mean(mtcars$mpg)",
        title = sprintf("%s(text = \"mean mpg\")", t$ctor("indicator.title"))
      )
    )
  },
  # images
  function(t) {
    if (t$trace != "image") {
      return(NULL)
    }
    list(
      setup = c(
        "rgb <- col2rgb(terrain.colors(100)[cut(volcano, 100)])",
        "z <- array(t(rgb), c(dim(volcano), 3))"
      ),
      args = c(z = "z")
    )
  },
  # surfaces from a matrix
  function(t) {
    if (t$trace != "surface") {
      return(NULL)
    }
    list(args = c(z = "volcano"))
  },
  # values on an x-y grid: heatmap, contour
  function(t) {
    if (!"2dMap" %in% t$cats || "histogram" %in% t$cats) {
      return(NULL)
    }
    list(
      data = "airquality",
      args = c(x = "~Day", y = "~Month", z = "~Temp")
    )
  },
  # 2D histograms
  function(t) {
    if (!"histogram" %in% t$cats || !"2dMap" %in% t$cats) {
      return(NULL)
    }
    list(data = "faithful", args = c(x = "~eruptions", y = "~waiting"))
  },
  # histograms
  function(t) {
    if (!"histogram" %in% t$cats) {
      return(NULL)
    }
    list(data = "mtcars", args = c(x = "~mpg"))
  },
  # 3D points: scatter3d, mesh3d
  function(t) {
    if (!all(c("x", "y", "z") %in% t$props) || !"gl3d" %in% t$cats) {
      return(NULL)
    }
    list(data = "mtcars", args = c(x = "~wt", y = "~hp", z = "~mpg"))
  },
  # categories: bars, boxes, violins, funnels, waterfalls
  function(t) {
    if (!any(c("bar-like", "box-violin") %in% t$cats)) {
      return(NULL)
    }
    list(data = "mtcars", args = c(x = "~factor(cyl)", y = "~mpg"))
  },
  # points: scatter, scattergl, ...
  function(t) {
    if (!all(c("x", "y") %in% t$props)) {
      return(NULL)
    }
    list(
      data = "mtcars",
      args = c(x = "~wt", y = "~mpg", if (t$markers) c(mode = "\"markers\""))
    )
  }
)

# The example spec of a trace (see EXAMPLE_PATTERNS), or NULL.
trace_example_spec <- function(trace, ctx) {
  props <- ctx$validators[[trace]]$children
  t <- list(
    trace = trace,
    props = props,
    cats = unlist(
      ctx$schema$traces[[trace]]$meta$categories %||%
        ctx$schema$traces[[trace]]$categories
    ),
    markers = "markers" %in% ctx$validators[[paste0(trace, ".mode")]]$flags,
    ctor = function(key) ctor_of(key, ctx)
  )
  for (pattern in EXAMPLE_PATTERNS) {
    spec <- pattern(t)
    if (!is.null(spec)) {
      return(spec)
    }
  }
  NULL
}

# "name = value" lines of a call's arguments, multi-line values indented.
format_args <- function(args) {
  lines <- character()
  for (i in seq_along(args)) {
    val <- strsplit(args[[i]], "\n", fixed = TRUE)[[1L]]
    val[[1L]] <- paste(names(args)[[i]], "=", val[[1L]])
    last <- length(val)
    if (i < length(args)) {
      val[[last]] <- paste0(val[[last]], ",")
    }
    lines <- c(lines, val)
  }
  lines
}

# A call over several lines: fn(\n  args\n).
format_call <- function(fn, args) {
  if (!length(args)) {
    return(paste0(fn, "()"))
  }
  one <- sprintf("%s(%s)", fn, paste(names(args), "=", args, collapse = ", "))
  if (nchar(one) <= 70L && !any(grepl("\n", args, fixed = TRUE))) {
    return(one)
  }
  c(paste0(fn, "("), paste0("  ", format_args(args)), ")")
}

# Example lines for a trace's figure, with `extra` (named R code) added to
# add_<trace>()'s arguments and `layout` to update_layout()'s.
figure_example <- function(trace, ctx, extra = NULL, layout = NULL) {
  spec <- trace_example_spec(trace, ctx)
  if (is.null(spec)) {
    return(NULL)
  }
  # an object of a property the example already sets can't be added to it
  if (any(names(extra) %in% names(spec$args))) {
    return(NULL)
  }
  steps <- c(
    "go_figure()",
    spec$before,
    list(format_call(paste0("add_", trace), c(spec$args, extra))),
    if (length(c(spec$layout, layout))) {
      list(format_call("update_layout", c(spec$layout, layout)))
    }
  )
  lines <- c(spec$setup, if (!is.null(spec$data)) paste(spec$data, "|>"))
  for (i in seq_along(steps)) {
    step <- steps[[i]]
    if (i < length(steps)) {
      step[[length(step)]] <- paste(step[[length(step)]], "|>")
    }
    indent <- if (!is.null(spec$data) || i > 1L) "  " else ""
    lines <- c(lines, paste0(indent, step))
  }
  lines
}

# The trace a layout subplot object is drawn by, for examples of the objects
# in it (go_scene_camera() needs a 3D trace).
LAYOUT_EXAMPLE_TRACES <- c(
  scene = "scatter3d",
  polar = "scatterpolar",
  geo = "scattergeo",
  ternary = "scatterternary",
  smith = "scattersmith",
  map = "scattermap"
)

# fn(name = inner), or fn(inner) without a name, over several lines when long.
wrap_call <- function(fn, inner, name = NULL, extra = NULL) {
  lines <- strsplit(inner, "\n", fixed = TRUE)[[1L]]
  lines[[1L]] <- paste0(
    extra,
    if (!is.null(name)) paste(name, "= "),
    lines[[1L]]
  )
  one <- paste0(fn, "(", lines, ")")
  if (length(lines) == 1L && nchar(one) <= 60L) {
    return(one)
  }
  paste(c(paste0(fn, "("), paste0("  ", lines), ")"), collapse = "\n")
}

# Example for a nested object: its trace's (or, for the layout, a fitting
# trace's) figure with the object added, through the constructors around it.
# Falls back to building the object in its trace or layout.
object_figure_example <- function(key, ctx) {
  nodes <- ctx$nodes
  # list elements with a range (gauge steps) aren't drawn without one
  needs_range <- function(k) {
    nodes$kind[[match(k, nodes$key)]] == "compound_element" &&
      "range" %in% ctx$validators[[k]]$children
  }
  arg <- object_example_arg(key, ctx$validators)
  if (needs_range(key)) {
    arg <- paste(c("range = c(0, 20)", if (nzchar(arg)) arg), collapse = ", ")
  }
  chain <- sprintf("%s(%s)", ctor_of(key, ctx), arg)
  cur <- key
  repeat {
    i <- match(cur, nodes$key)
    parent <- nodes$parent[[i]]
    if (nodes$kind[[i]] == "compound_element") {
      prop <- nodes$name[which(nodes$element_key == cur)[[1L]]]
      chain <- wrap_call("list", chain)
    } else {
      prop <- nodes$name[[i]]
    }
    kind <- nodes$kind[[match(parent, nodes$key)]]
    if (kind %in% c("trace", "layout")) {
      break
    }
    chain <- wrap_call(
      ctor_of(parent, ctx),
      chain,
      prop,
      extra = if (needs_range(parent)) "range = c(0, 20), "
    )
    cur <- parent
  }
  arg <- stats::setNames(chain, prop)
  ex <- if (kind == "trace") {
    figure_example(parent, ctx, extra = arg)
  } else {
    sub <- sub("^layout\\.([a-z]+).*$", "\\1", key)
    trace <- LAYOUT_EXAMPLE_TRACES[sub]
    figure_example(if (is.na(trace)) "scatter" else trace, ctx, layout = arg)
  }
  ex %||% object_example(key, ctx)
}
