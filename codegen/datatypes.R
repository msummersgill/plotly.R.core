# Graph object constructor codegen (the R counterpart of
# plotly.py/codegen/datatypes.py).
#
# Writes the go_<trace>() and go_layout() constructors, one file each
# (R/zz-gen-<root>.R), and the shared type constructors (go_font(),
# go_colorbar(), ...; R/zz-gen-shared.R), with roxygen docs built from the
# schema descriptions and the validator parameters. Other nested objects are
# named lists, documented in sections of their parent object's help page.

# Arguments of every constructor that are not properties.
RESERVED_ARGS <- c("arg", "skip_invalid")

# Python-style description cleanup (plotly.py codegen/utils.py
# format_description), adapted for R terminology.
format_description <- function(desc) {
  if (is.null(desc) || is.na(desc) || !nzchar(desc)) {
    return("")
  }
  desc <- gsub(
    "(^|[[:space:](,.:])\\*([0-9.]+)\\*([[:space:]),.:]|$)",
    "\\1\\2\\3",
    desc,
    perl = TRUE
  )
  desc <- gsub("*true*", "TRUE", desc, fixed = TRUE)
  desc <- gsub("*false*", "FALSE", desc, fixed = TRUE)
  desc <- gsub(
    "(^|[[:space:](,.:])\\*(\\S+)\\*([[:space:]),.:]|$)",
    '\\1"\\2"\\3',
    desc,
    perl = TRUE
  )
  desc <- gsub("\\*([^*]+)\\*", '"\\1"', desc, perl = TRUE)
  desc <- gsub("an {array}", "a vector", desc, fixed = TRUE)
  desc <- gsub("{2D arrays}", "matrices", desc, fixed = TRUE)
  desc <- gsub("{2D array}", "matrix", desc, fixed = TRUE)
  desc <- gsub("{arrays}", "vectors", desc, fixed = TRUE)
  desc <- gsub("{array}", "vector", desc, fixed = TRUE)
  # Keep docs ASCII so the PDF manual builds (LaTeX lacks e.g. U+2212).
  for (ch in names(ASCII_REPLACEMENTS)) {
    desc <- gsub(ch, ASCII_REPLACEMENTS[[ch]], desc, fixed = TRUE)
  }
  desc
}

ASCII_REPLACEMENTS <- c(
  "\u2212" = "-",
  "\u2013" = "-",
  "\u2014" = "--",
  "\u00d7" = "x",
  "\u2018" = "'",
  "\u2019" = "'",
  "\u201c" = '"',
  "\u201d" = '"'
)

# Escape text for Rd (generated blocks use @noMd, so this is all that's needed).
rd_escape <- function(x) {
  x <- gsub("\\", "\\\\", x, fixed = TRUE)
  x <- gsub("%", "\\%", x, fixed = TRUE)
  x <- gsub("{", "\\{", x, fixed = TRUE)
  x <- gsub("}", "\\}", x, fixed = TRUE)
  x <- gsub("@", "@@", x, fixed = TRUE)
  x
}

rd_code <- function(x) paste0("\\code{", rd_escape(x), "}")

# A string value shown as an R string literal in \code{}, e.g. "a\\b".
# Rd needs each backslash of the literal doubled again.
rd_code_str <- function(x) {
  lit <- gsub("\\", "\\\\", x, fixed = TRUE)
  lit <- gsub('"', '\\"', lit, fixed = TRUE)
  paste0('\\code{"', rd_escape(lit), '"}')
}
rd_link <- function(fn) sprintf("\\code{\\link{%s}()}", fn)
rd_quoted_list <- function(x) paste(rd_code_str(x), collapse = ", ")

# One-line description of the accepted values, from the validator entry.
type_doc <- function(e) {
  arr <- if (isTRUE(e$array_ok)) ", or a vector of these" else ""
  rng <- function() {
    if (is.null(e$min) && is.null(e$max)) {
      return("")
    }
    sprintf(
      " in the interval [%s, %s]",
      format(e$min %||% -Inf),
      format(e$max %||% Inf)
    )
  }
  enum <- function() {
    vals <- c(
      if (length(e$values$chr)) rd_quoted_list(e$values$chr),
      if (length(e$values$num)) rd_code(as.character(e$values$num)),
      if (length(e$values$lgl)) rd_code(toupper(as.character(e$values$lgl)))
    )
    out <- paste0("One of ", paste(vals, collapse = ", "))
    if (length(e$values$regex)) {
      out <- paste0(
        out,
        ", or a string matching ",
        paste(rd_code_str(e$values$regex), collapse = " or ")
      )
    }
    out
  }
  switch(
    e$superclass,
    DataArrayValidator = "Data array: a vector, factor, Date/POSIXct vector, matrix or list",
    EnumeratedValidator = ,
    DashValidator = paste0(enum(), arr),
    BooleanValidator = paste0("Logical", arr),
    NumberValidator = paste0("Number", rng(), arr),
    IntegerValidator = paste0("Integer", rng(), arr),
    StringValidator = paste0(
      "String",
      if (length(e$values$chr)) {
        paste0(", one of ", rd_quoted_list(e$values$chr))
      } else {
        ""
      },
      arr
    ),
    ColorValidator = paste0(
      "Color: a CSS color string or R color name",
      if (!is.null(e$colorscale_path)) {
        paste0(
          ", or a number mapped to a color by ",
          rd_code(e$colorscale_path)
        )
      } else {
        ""
      },
      arr
    ),
    ColorlistValidator = "Vector of colors",
    ColorscaleValidator = paste0(
      "Colorscale: a vector of colors, a two-column data.frame of (value, color), ",
      "or the name of a sequential, diverging or cyclical scale in ",
      rd_link("px_colors"),
      " (append ",
      rd_code_str("_r"),
      " to reverse)"
    ),
    AngleValidator = paste0("Angle in degrees", arr),
    SubplotidValidator = sprintf(
      "Subplot id: %s, %s, %s, ...",
      rd_code_str(e$base),
      rd_code_str(paste0(e$base, "2")),
      rd_code_str(paste0(e$base, "3"))
    ),
    FlaglistValidator = paste0(
      "Any combination of ",
      rd_quoted_list(e$flags),
      " joined with ",
      rd_code_str("+"),
      if (length(e$extras)) {
        paste0(
          ", or one of ",
          paste(
            vapply(
              e$extras,
              function(x) {
                if (is.character(x)) {
                  rd_code_str(x)
                } else {
                  rd_code(toupper(as.character(x)))
                }
              },
              ""
            ),
            collapse = ", "
          )
        )
      } else {
        ""
      },
      arr
    ),
    AnyValidator = "Any value",
    InfoArrayValidator = sprintf(
      "Vector or list of %s%d element(s)",
      if (isTRUE(e$free_length)) "up to " else "",
      length(e$items$validators)
    ),
    CompoundValidator = "Named list",
    TitleValidator = "String (the title text) or named list",
    CompoundArrayValidator = "List of named lists",
    stop("No type_doc for ", e$superclass)
  )
}

roxygen_lines <- function(text, prefix = "#' ", width = 80L) {
  paras <- strsplit(text, "\n\n", fixed = TRUE)[[1L]]
  out <- character()
  for (i in seq_along(paras)) {
    if (i > 1L) {
      out <- c(out, sub(" +$", "", prefix))
    }
    out <- c(
      out,
      strwrap(paras[[i]], width = width - nchar(prefix), prefix = prefix)
    )
  }
  out
}

# Wrap a function signature at argument boundaries.
wrap_args <- function(args, width = 76L, indent = "    ") {
  lines <- character()
  cur <- ""
  for (i in seq_along(args)) {
    a <- paste0(args[[i]], if (i < length(args)) "," else "")
    cand <- if (nzchar(cur)) paste(cur, a) else a
    if (nchar(indent) + nchar(cand) > width && nzchar(cur)) {
      lines <- c(lines, paste0(indent, cur))
      cur <- a
    } else {
      cur <- cand
    }
  }
  c(lines, paste0(indent, cur))
}

# Shared object types -----------------------------------------------------------
#
# Objects that recur across the schema, exported as go_<type>() constructors
# (the shared interfaces of plotly.js's schema.d.ts). Every schema node whose
# name matches the pattern belongs to the type. Its nodes may differ slightly
# (a font that accepts vectors, a hoverlabel without `split`): a go_<type>()
# object is checked against the type's variants when it is created and against
# the node's own rules when it is placed in a figure.
SHARED_TYPES <- c(
  font = "font$",
  colorbar = "^colorbar$",
  hoverlabel = "^hoverlabel$",
  legendgrouptitle = "^legendgrouptitle$",
  tickformatstop = "^tickformatstop$",
  domain = "^domain$",
  pattern = "pattern$",
  error_bar = "^error_[xyz]$",
  # objects that are the same everywhere they appear (one spec, 2+ places)
  autorangeoptions = "^autorangeoptions$",
  bins = "^[xy]bins$",
  caps = "^caps$",
  domainpad = "^domainpad$",
  gradient = "^gradient$",
  label = "^label$",
  leaf = "^leaf$",
  lightposition = "^lightposition$",
  minor = "^minor$",
  pathbar = "^pathbar$",
  project = "^project$",
  rangebreak = "^rangebreak$",
  root = "^root$",
  slices = "^slices$",
  spaceframe = "^spaceframe$",
  unifiedhovertitle = "^unifiedhovertitle$"
)

SHARED_DOCS <- list(
  autorangeoptions = list(
    title = "Autorange options",
    desc = "Limits on the range an axis chooses when autoranging (\\code{autorange = TRUE}): values to include, and bounds the range is clipped to.",
    example = c(
      "go_figure() |>",
      "  add_scatter(x = 1:10, y = (1:10)^2) |>",
      "  update_yaxes(autorangeoptions = go_autorangeoptions(minallowed = 0, maxallowed = 50))"
    )
  ),
  bins = list(
    title = "Histogram bins",
    desc = "The bins of a histogram trace along x (\\code{xbins}) or y (\\code{ybins}): where they start and end, and their size.",
    example = c(
      "go_figure() |>",
      "  add_histogram(x = rnorm(200), xbins = go_bins(start = -3, end = 3, size = 0.25))"
    )
  ),
  caps = list(
    title = "Isosurface caps",
    desc = "The end caps of an isosurface or volume trace, drawn where its surfaces meet the edges of the data along x, y and z.",
    example = c(
      "g <- expand.grid(x = 1:5, y = 1:5, z = 1:5)",
      "go_figure() |>",
      "  add_isosurface(",
      "    x = g$x, y = g$y, z = g$z, value = g$x + g$y + g$z, isomin = 6, isomax = 12,",
      "    caps = go_caps(x = list(show = FALSE), y = list(show = FALSE))",
      "  )"
    )
  ),
  domainpad = list(
    title = "Axis domain padding",
    desc = "Space in pixels to reserve inside the edges of an x or y axis \\code{domain}.",
    example = c(
      "make_subplots(rows = 1, cols = 2) |>",
      "  add_scatter(y = 1:3, row = 1, col = 1) |>",
      "  add_scatter(y = 3:1, row = 1, col = 2) |>",
      "  update_xaxes(domainpad = go_domainpad(left = 20, right = 20))"
    )
  ),
  gradient = list(
    title = "Marker gradients",
    desc = "A color gradient filling scatter-type markers (\\code{marker = list(gradient = ...)}).",
    example = c(
      "go_figure() |>",
      "  add_scatter(",
      "    x = 1:3, y = c(2, 1, 3), mode = \"markers\",",
      "    marker = list(size = 30, gradient = go_gradient(type = \"radial\", color = \"white\"))",
      "  )"
    )
  ),
  label = list(
    title = "Shape labels",
    desc = "A text label on a layout shape (\\code{add_shape()}), or on shapes drawn by the user (\\code{layout.newshape}).",
    example = c(
      "go_figure() |>",
      "  add_scatter(x = 1:3, y = 1:3) |>",
      "  add_shape(",
      "    type = \"rect\", x0 = 1, x1 = 2, y0 = 1, y1 = 2,",
      "    label = go_label(text = \"box\", font = go_font(size = 14))",
      "  )"
    )
  ),
  leaf = list(
    title = "Hierarchy leaves",
    desc = "The appearance of the leaves (sectors with no children) of a sunburst or icicle trace.",
    example = c(
      "go_figure() |>",
      "  add_sunburst(",
      "    labels = c(\"all\", \"a\", \"b\"), parents = c(\"\", \"all\", \"all\"),",
      "    leaf = go_leaf(opacity = 0.6)",
      "  )"
    )
  ),
  lightposition = list(
    title = "3D light position",
    desc = "The position of the light source of a 3D surface-type trace (surface, mesh3d, isosurface, volume, cone, streamtube).",
    example = c(
      "go_figure() |>",
      "  add_surface(z = volcano, lightposition = go_lightposition(x = 1000, y = 1000, z = 0))"
    )
  ),
  minor = list(
    title = "Minor ticks and grid lines",
    desc = "Minor ticks and grid lines of an x or y axis.",
    example = c(
      "go_figure() |>",
      "  add_scatter(x = 1:10, y = 1:10) |>",
      "  update_xaxes(minor = go_minor(ticks = \"outside\", showgrid = TRUE))"
    )
  ),
  pathbar = list(
    title = "Path bars",
    desc = "The path bar of a treemap or icicle trace, showing the path to the sector at the root of the view.",
    example = c(
      "go_figure() |>",
      "  add_treemap(",
      "    labels = c(\"all\", \"a\", \"b\"), parents = c(\"\", \"all\", \"all\"),",
      "    pathbar = go_pathbar(visible = TRUE, side = \"bottom\")",
      "  )"
    )
  ),
  project = list(
    title = "Contour projections",
    desc = "Projections of a surface trace's contour lines onto the walls of the 3D scene (\\code{contours = list(z = list(project = ...))}).",
    example = c(
      "go_figure() |>",
      "  add_surface(",
      "    z = volcano,",
      "    contours = list(z = list(show = TRUE, project = go_project(z = TRUE)))",
      "  )"
    )
  ),
  rangebreak = list(
    title = "Axis range breaks",
    desc = "A gap in a date axis, such as weekends or nights. Axes take a list of them as \\code{rangebreaks}.",
    example = c(
      "go_figure() |>",
      "  add_scatter(x = as.Date(\"2024-01-01\") + 0:29, y = cumsum(rnorm(30))) |>",
      "  update_xaxes(rangebreaks = list(go_rangebreak(bounds = c(\"sat\", \"mon\"))))"
    )
  ),
  root = list(
    title = "Hierarchy roots",
    desc = "The appearance of the root sector of a sunburst, treemap or icicle trace.",
    example = c(
      "go_figure() |>",
      "  add_sunburst(",
      "    labels = c(\"all\", \"a\", \"b\"), parents = c(\"\", \"all\", \"all\"),",
      "    root = go_root(color = \"lightgray\")",
      "  )"
    )
  ),
  slices = list(
    title = "Isosurface slices",
    desc = "Slices through an isosurface or volume trace along x, y and z.",
    example = c(
      "g <- expand.grid(x = 1:5, y = 1:5, z = 1:5)",
      "go_figure() |>",
      "  add_isosurface(",
      "    x = g$x, y = g$y, z = g$z, value = g$x + g$y + g$z, isomin = 6, isomax = 12,",
      "    slices = go_slices(z = list(show = TRUE, locations = 3))",
      "  )"
    )
  ),
  spaceframe = list(
    title = "Isosurface space frames",
    desc = "The space frame of an isosurface or volume trace: the cells between its surfaces.",
    example = c(
      "g <- expand.grid(x = 1:5, y = 1:5, z = 1:5)",
      "go_figure() |>",
      "  add_isosurface(",
      "    x = g$x, y = g$y, z = g$z, value = g$x + g$y + g$z, isomin = 6, isomax = 12,",
      "    spaceframe = go_spaceframe(show = TRUE, fill = 0.5)",
      "  )"
    )
  ),
  unifiedhovertitle = list(
    title = "Unified hover titles",
    desc = "The title of the unified hover label of an x or y axis (\\code{hovermode = \"x unified\"}).",
    example = c(
      "go_figure() |>",
      "  add_scatter(x = 1:3, y = c(2, 1, 3)) |>",
      "  add_scatter(x = 1:3, y = c(1, 3, 2)) |>",
      "  update_layout(hovermode = \"x unified\") |>",
      "  update_xaxes(unifiedhovertitle = go_unifiedhovertitle(text = \"x = %{x}\"))"
    )
  ),
  error_bar = list(
    title = "Error bars",
    desc = "Error bars of a trace's points, for its \\code{error_x}, \\code{error_y} or (3D traces) \\code{error_z}.",
    example = c(
      "go_figure() |>",
      "  add_scatter(",
      "    x = 1:3, y = c(2, 1, 3), mode = \"markers\",",
      "    error_y = go_error_bar(type = \"data\", array = c(0.2, 0.1, 0.3), color = \"gray\")",
      "  )"
    )
  ),
  font = list(
    title = "Fonts",
    desc = "Text font settings, used for every font property of traces and layout objects: \\code{font}, \\code{tickfont}, \\code{textfont}, \\code{insidetextfont}, \\code{outsidetextfont}, \\code{labelfont}, \\code{rangefont} and \\code{grouptitlefont}.",
    example = c(
      "go_figure() |>",
      "  add_scatter(",
      "    x = 1:3, y = c(2, 1, 3), mode = \"markers+text\", text = c(\"a\", \"b\", \"c\"),",
      "    textposition = \"top center\", textfont = go_font(size = 18, color = \"firebrick\")",
      "  ) |>",
      "  update_layout(font = go_font(family = \"Georgia\"))"
    )
  ),
  colorbar = list(
    title = "Color bars",
    desc = "The color bar of a trace with a colorscale (heatmaps, contours, surfaces, ...), or of markers and lines colored by a colorscale (\\code{marker = list(colorbar = ...)}), or of a layout \\code{coloraxis}.",
    example = c(
      "go_figure() |>",
      "  add_heatmap(",
      "    z = volcano,",
      "    colorbar = go_colorbar(title = list(text = \"Height\"), thickness = 15, len = 0.6)",
      "  )"
    )
  ),
  hoverlabel = list(
    title = "Hover labels",
    desc = "Hover label appearance, for a trace or (as defaults) for the figure's layout.",
    example = c(
      "go_figure() |>",
      "  add_scatter(",
      "    x = 1:3, y = c(2, 1, 3),",
      "    hoverlabel = go_hoverlabel(bgcolor = \"white\", font = go_font(size = 14))",
      "  )"
    )
  ),
  legendgrouptitle = list(
    title = "Legend group titles",
    desc = "The title shown above a trace's legend group.",
    example = c(
      "go_figure() |>",
      "  add_scatter(",
      "    x = 1:3, y = c(2, 1, 3), legendgroup = \"g\",",
      "    legendgrouptitle = go_legendgrouptitle(text = \"Group\")",
      "  ) |>",
      "  add_scatter(x = 1:3, y = c(1, 3, 2), legendgroup = \"g\")"
    )
  ),
  tickformatstop = list(
    title = "Tick format stops",
    desc = "A tick label format that applies over a range of zoom levels. Axes and color bars take a list of them as \\code{tickformatstops}.",
    example = c(
      "day <- 24 * 60 * 60 * 1000",
      "go_figure() |>",
      "  add_scatter(x = Sys.Date() + 0:99, y = cumsum(rnorm(100))) |>",
      "  update_xaxes(tickformatstops = list(",
      "    go_tickformatstop(dtickrange = list(NULL, day), value = \"%H:%M\"),",
      "    go_tickformatstop(dtickrange = list(day, NULL), value = \"%e %b\")",
      "  ))"
    )
  ),
  domain = list(
    title = "Domains",
    desc = "The area of the figure a trace (pie, sunburst, table, ...) or subplot (\\code{geo}, \\code{polar}, \\code{scene}, ...) occupies, as fractions of the plotting area or a cell of the layout's \\code{grid}.",
    example = c(
      "go_figure() |>",
      "  add_pie(values = 1:3, domain = go_domain(x = c(0, 0.45))) |>",
      "  add_pie(values = 3:1, domain = go_domain(x = c(0.55, 1)))"
    )
  ),
  pattern = list(
    title = "Fill patterns",
    desc = "A fill pattern for bars, areas and other filled marks (\\code{marker = list(pattern = ...)}, \\code{fillpattern}).",
    example = c(
      "go_figure() |>",
      "  add_bar(x = c(\"a\", \"b\"), y = c(2, 3), marker = list(pattern = go_pattern(shape = \"/\")))"
    )
  )
)

# Shared type families: for each type, its member keys, the keys standing for
# each distinct variant (most common first) and the union of its properties.
shared_families <- function(nodes, validators) {
  cmp <- nodes[nodes$kind %in% c("compound", "compound_element"), ]
  hits <- vapply(SHARED_TYPES, function(p) grepl(p, cmp$name), logical(nrow(cmp)))
  if (any(rowSums(hits) > 1L)) {
    stop("Schema keys match several shared types: ", paste(cmp$key[rowSums(hits) > 1L], collapse = ", "))
  }
  lapply(SHARED_TYPES, function(pattern) {
    keys <- sort(cmp$key[grepl(pattern, cmp$name)])
    sig <- vapply(
      keys,
      function(k) {
        sub_keys <- grep(paste0("^", gsub(".", "\\.", k, fixed = TRUE), "\\."), names(validators), value = TRUE)
        rel <- substring(sub_keys, nchar(k) + 2L)
        # compare relative to `k`: drop names and paths that include it
        entries <- lapply(unname(validators[sub_keys]), function(e) {
          e$data_class <- NULL
          for (p in c("element_key", "colorscale_path")) {
            if (!is.null(e[[p]])) e[[p]] <- substring(e[[p]], nchar(k) + 2L)
          }
          e
        })
        paste(deparse(list(rel, entries)), collapse = "")
      },
      ""
    )
    groups <- split(keys, sig)
    groups <- groups[order(-lengths(groups), vapply(groups, `[[`, "", 1L))]
    list(
      keys = keys,
      variants = unname(vapply(groups, `[[`, "", 1L)),
      fields = sort(unique(unlist(lapply(keys, function(k) validators[[k]]$children))))
    )
  })
}

# Help pages ---------------------------------------------------------------------
#
# Only the trace constructors (go_<trace>()), go_layout() and the shared types
# (go_font(), go_colorbar(), ...) are functions. Other nested objects are named
# lists, documented in sections of the page of the object they belong to:
# go_<trace>() with add_<trace>(); go_layout(); update_<xaxes, scenes, ...>()
# for layout subplot objects; add_<annotation, shape, ...>() for positioned
# layout array elements; go_<shared type>().

# Arguments of figure functions documented on constructor pages.
FIGURE_ARG_DOCS <- list(
  fig = "A \\code{go_figure} object.",
  data = paste(
    "A data frame in which formula properties (e.g. \\code{x = ~col},",
    "\\code{marker = list(size = ~col)}) are evaluated. Default: the data given to",
    "\\code{\\link{go_figure}()}. Only the evaluated values are added to the trace.",
    "A \\code{crosstalk::SharedData} works the same way, and links the trace",
    "to its crosstalk group (see \\code{\\link{highlight}()})."
  ),
  row = paste(
    "Subplot grid row (figures created with \\code{\\link{make_subplots}()} only).",
    "May be \\code{\"all\"} or a vector to address several cells."
  ),
  col = paste(
    "Subplot grid column (figures created with \\code{\\link{make_subplots}()} only).",
    "May be \\code{\"all\"} or a vector to address several cells."
  ),
  secondary_y = "If \\code{TRUE}, use the secondary y axis of the subplot.",
  exclude_empty_subplots = "If \\code{TRUE}, skip subplots that have no traces or layout objects."
)

# Visible children (properties) of a compound key.
child_nodes <- function(key, nodes) {
  ch <- nodes[nodes$parent == key & nodes$kind != "compound_element", ]
  ch <- ch[order(ch$name), ]
  bad <- ch$name[ch$name %in% RESERVED_ARGS | make.names(ch$name) != ch$name]
  if (length(bad)) {
    stop(
      "Property names clash with constructor arguments or are not syntactic: ",
      paste(bad, collapse = ", ")
    )
  }
  ch
}

# Layout array elements positioned with xref/yref get add_<element>() pages.
positioned_elements <- function(validators) {
  vapply(layout_array_props(validators), function(k) validators[[k]]$element_key, "")
}

figure_fn_for_element <- function(element_key) {
  singular <- sub("^layout\\.", "", element_key)
  paste0("add_", if (singular == "image") "layout_" else "", singular)
}

# Everything the help pages need to know about where an object is documented.
doc_context <- function(nodes, validators, schema) {
  nodes <- as.data.frame(nodes)
  families <- shared_families(nodes, validators)
  shared_of <- unlist(lapply(names(families), function(t) {
    stats::setNames(rep(t, length(families[[t]]$keys)), families[[t]]$keys)
  }))
  subplot_roots <- paste0("layout.", SUBPLOT_TYPES)
  element_roots <- positioned_elements(validators)
  parent_of <- stats::setNames(nodes$parent, nodes$key)
  ancestors <- function(key) {
    out <- character()
    while (nzchar(key)) {
      out <- c(out, key)
      key <- parent_of[[key]]
    }
    out
  }
  # The object whose help page documents compound key `key` in a section: the
  # nearest enclosing shared type, or the trace, layout, layout subplot or
  # positioned layout array element it belongs to.
  page_root <- function(key) {
    anc <- ancestors(key)[-1L]
    sh <- anc[anc %in% names(shared_of)]
    if (length(sh)) {
      return(sh[[1L]])
    }
    anc <- ancestors(key)
    root <- anc[[length(anc)]]
    if (root != "layout") {
      return(root)
    }
    hit <- anc[anc %in% c(subplot_roots, element_roots)]
    if (length(hit)) hit[[length(hit)]] else "layout"
  }
  list(
    nodes = nodes,
    validators = validators,
    schema = schema,
    families = families,
    shared_of = shared_of,
    subplot_roots = subplot_roots,
    element_roots = element_roots,
    page_root = page_root
  )
}

# Documentation link for a page root.
page_link <- function(root, ctx) {
  if (root %in% ctx$subplot_roots) {
    return(rd_link(paste0("update_", pluralize(sub("^layout\\.", "", root)))))
  }
  if (root %in% ctx$element_roots) {
    return(rd_link(figure_fn_for_element(root)))
  }
  rd_link(ctx$validators[[root]]$data_class)
}

# Section label of a nested object on its page: its path below the page root.
section_label <- function(key, root) substring(key, nchar(root) + 2L)

# "a, b, c" for an object's property names (the first `max` of them).
property_names <- function(key, ctx, max = 12L) {
  ch <- paste0("\\code{", sort(ctx$validators[[key]]$children), "}")
  if (length(ch) > max + 4L) {
    return(sprintf("%s and %d more", paste(ch[seq_len(max)], collapse = ", "), length(ch) - max))
  }
  if (length(ch) == 1L) ch else paste(paste(utils::head(ch, -1L), collapse = ", "), "and", utils::tail(ch, 1L))
}

# Section title of a nested object documented on page `root`.
section_title <- function(key, root) {
  sprintf("%s properties", section_label(key, root))
}

# Accepted values of a compound property `ck` documented on page `root`:
# what the object is, its properties, and where they are documented.
compound_type_doc <- function(ck, root, ctx) {
  e <- ctx$validators[[ck]]
  target <- if (e$superclass == "CompoundArrayValidator") e$element_key else ck
  shared <- ctx$shared_of[target]
  props <- property_names(target, ctx)
  ctor <- if (!is.na(shared)) paste0("go_", shared)
  what <- if (!is.null(ctor)) {
    sprintf(
      "a %s object or named list, with properties %s (see %s)",
      rd_link(ctor),
      props,
      rd_link(ctor)
    )
  } else {
    pr <- ctx$page_root(target)
    if (identical(pr, root)) {
      sprintf(
        "a named list with properties %s (described in section \"%s\" below)",
        props,
        section_title(target, root)
      )
    } else {
      sprintf("a named list with properties %s (see %s)", props, page_link(pr, ctx))
    }
  }
  switch(
    e$superclass,
    CompoundValidator = paste0(toupper(substr(what, 1L, 1L)), substring(what, 2L)),
    TitleValidator = paste0("String (the title text), or ", what),
    CompoundArrayValidator = paste0("List, each element ", what)
  )
}

# Text documenting property `ck` of an object on page `root`.
property_text <- function(ck, root, ctx) {
  i <- match(ck, ctx$nodes$key)
  desc <- ctx$nodes$description[[i]]
  desc <- if (is.na(desc)) "" else rd_escape(format_description(desc))
  e <- ctx$validators[[ck]]
  type <- if (e$superclass %in% c("CompoundValidator", "TitleValidator", "CompoundArrayValidator")) {
    compound_type_doc(ck, root, ctx)
  } else {
    type_doc(e)
  }
  paste0(if (nzchar(desc)) paste0(desc, " ") else "", type, ".")
}

param_block <- function(name, paras) {
  first <- strwrap(
    paras[[1L]],
    width = 76L,
    initial = paste0("#' @param ", name, " "),
    prefix = "#'   "
  )
  rest <- unlist(lapply(paras[-1L], function(p) {
    c("#'", strwrap(p, width = 76L, prefix = "#'   "))
  }))
  c(first, rest)
}

# @param lines for the properties of `key` (and figure function arguments).
property_params <- function(key, root, ctx, extra = list()) {
  ch <- child_nodes(key, ctx$nodes)
  texts <- stats::setNames(
    lapply(ch$key, function(ck) property_text(ck, root, ctx)),
    ch$name
  )
  texts <- c(texts, extra[setdiff(names(extra), names(texts))])
  unlist(lapply(sort(names(texts)), function(n) param_block(n, texts[[n]])))
}

# \describe{} lines for the properties of `key`.
property_describe <- function(key, root, ctx) {
  ch <- child_nodes(key, ctx$nodes)
  items <- vapply(
    seq_len(nrow(ch)),
    function(i) {
      sprintf("\\item{\\code{%s}}{%s}", ch$name[[i]], property_text(ch$key[[i]], root, ctx))
    },
    ""
  )
  c("#' \\describe{", unlist(lapply(items, roxygen_lines)), "#' }")
}

object_description <- function(key, ctx) {
  i <- match(key, ctx$nodes$key)
  kind <- ctx$nodes$kind[[i]]
  desc <- if (kind == "trace") {
    ctx$schema$traces[[key]]$meta$description
  } else if (kind == "layout") {
    "Layout properties of a figure: axes, title, legend, margins, fonts and other settings that are not specific to a trace."
  } else {
    ctx$nodes$description[[i]]
  }
  rd_escape(format_description(if (is.null(desc) || is.na(desc)) "" else desc))
}

# One @section per nested object documented on page `root`.
nested_sections <- function(root, ctx) {
  cmp <- ctx$nodes$key[ctx$nodes$kind %in% c("compound", "compound_element")]
  keys <- cmp[startsWith(cmp, paste0(root, "."))]
  keys <- keys[!keys %in% names(ctx$shared_of)]
  keys <- keys[vapply(keys, function(k) identical(ctx$page_root(k), root), logical(1))]
  unlist(lapply(sort(keys), function(k) {
    desc <- object_description(k, ctx)
    is_element <- ctx$nodes$kind[[match(k, ctx$nodes$key)]] == "compound_element"
    c(
      "#'",
      sprintf("#' @section %s%s:", section_title(k, root), if (is_element) " (each list element)" else ""),
      if (nzchar(desc)) c(roxygen_lines(desc), "#'"),
      property_describe(k, root, ctx)
    )
  }))
}

# Details text on trace, layout and layout object pages.
nested_details <- function() {
  links <- paste0("\\code{\\link{go_", names(SHARED_TYPES), "}()}")
  paste(
    "Nested objects are named lists, e.g. \\code{marker = list(size = 10, line = list(width = 2))}.",
    "Each nested object's properties are described in a section of its own near the end of",
    "this page (after \\emph{Value}), titled with its path: \\emph{marker properties},",
    "\\emph{marker.line properties}, ....",
    "Objects that appear in several places in the schema can also be created with a",
    "constructor of their own, and are documented on its page:",
    paste0(paste(utils::head(links, -1L), collapse = ", "), " and ", utils::tail(links, 1L), "."),
    "Every property is checked against the plotly.js schema when the object is created",
    "or modified (see \\code{\\link{plotly_obj-modify}})."
  )
}

DOTS_DOC <- c(
  "#' @param ... Further properties, by their full names (e.g. numbered subplots",
  "#'   such as \\code{xaxis2} in \\code{go_layout()}). Nested properties are set",
  "#'   with named lists: \\code{marker = list(size = 10)}."
)

page_title <- function(page, kind) {
  if (kind == "trace") {
    return(paste(tools::toTitleCase(page), "traces"))
  }
  "Figure layout"
}

# Example call for a trace constructor, using only properties the trace has.
trace_example <- function(fn, key, validators) {
  props <- validators[[key]]$children
  args <- c(
    if (all(c("x", "y") %in% props)) c("x = 1:3", "y = c(2, 1, 3)"),
    if ("markers" %in% validators[[paste0(key, ".mode")]]$flags) {
      'mode = "markers"'
    },
    if (
      !is.null(validators[[paste0(key, ".marker.color")]]) &&
        !"values" %in% props
    ) {
      "marker = list(color = \"red\")"
    }
  )
  sprintf("%s(%s)", fn, paste(args, collapse = ", "))
}

# Roxygen block for a trace page (go_<trace>() and add_<trace>()) or go_layout().
page_doc <- function(page, ctx, figure_fns) {
  validators <- ctx$validators
  root_fn <- validators[[page]]$data_class
  kind <- ctx$nodes$kind[[match(page, ctx$nodes$key)]]
  desc <- object_description(page, ctx)
  if (!nzchar(desc)) {
    desc <- sprintf("Properties of %s.", rd_code(page))
  }
  fig_docs <- list()
  for (f in figure_fns) {
    for (a in f$args) fig_docs[[a]] <- FIGURE_ARG_DOCS[[a]]
  }
  lines <- c(
    paste0("#' ", page_title(page, kind)),
    "#'",
    roxygen_lines(desc),
    "#'",
    roxygen_lines(paste0(
      rd_code(paste0(root_fn, "()")),
      " creates a validated graph object (a named list).",
      if (length(figure_fns)) {
        paste0(
          " ",
          paste(vapply(figure_fns, function(f) rd_code(paste0(f$fn, "()")), ""), collapse = ", "),
          " creates one and adds it to a figure."
        )
      } else {
        ""
      }
    )),
    "#'",
    "#' @details",
    roxygen_lines(nested_details()),
    "#'",
    "#' @param arg Optional named list, or graph object of the same type, to",
    "#'   initialise properties from (constructors). Named arguments take precedence.",
    property_params(page, page, ctx, fig_docs),
    DOTS_DOC,
    "#' @param skip_invalid If \\code{TRUE}, silently drop invalid properties",
    "#'   instead of raising an error.",
    "#' @return \\code{go_*()} functions return a graph object;",
    "#'   \\code{add_*()} functions return the modified figure.",
    sprintf(
      "#' @seealso %s",
      if (kind == "trace") {
        paste(rd_link("go_figure"), rd_link("add_trace"), sep = ", ")
      } else {
        paste(rd_link("go_figure"), rd_link("update_layout"), sep = ", ")
      }
    ),
    nested_sections(page, ctx),
    "#'",
    "#' @noMd",
    "#' @export",
    "#' @examples",
    if (kind == "trace") {
      paste0("#' ", trace_example(root_fn, page, validators))
    } else {
      sprintf(
        "#' %s(title = \"My plot\", xaxis = list(title = \"x\", range = c(0, 10)))",
        root_fn
      )
    }
  )
  lines
}

# Documentation for a shared type's property: from the variant that has it (the
# most common first), noting where other variants differ.
shared_param_text <- function(type, field, ctx) {
  fam <- ctx$families[[type]]
  has <- fam$variants[vapply(fam$variants, function(v) field %in% ctx$validators[[v]]$children, logical(1))]
  root <- fam$variants[[1L]]
  texts <- vapply(has, function(v) {
    i <- match(paste(v, field, sep = "."), ctx$nodes$key)
    e <- ctx$validators[[ctx$nodes$key[[i]]]]
    if (e$superclass %in% c("CompoundValidator", "TitleValidator", "CompoundArrayValidator")) {
      compound_type_doc(ctx$nodes$key[[i]], v, ctx)
    } else {
      type_doc(e)
    }
  }, "")
  i <- match(paste(has[[1L]], field, sep = "."), ctx$nodes$key)
  desc <- ctx$nodes$description[[i]]
  desc <- if (is.na(desc)) "" else rd_escape(format_description(desc))
  # descriptions mention the context they were written for; use the first
  out <- paste0(if (nzchar(desc)) paste0(desc, " ") else "", texts[[1L]], ".")
  others <- setdiff(unique(texts), texts[[1L]])
  vec <- ", or a vector of these"
  scalar_only <- others == sub(vec, "", texts[[1L]], fixed = TRUE)
  if (any(scalar_only) && endsWith(texts[[1L]], vec)) {
    out <- paste0(out, " Vectors are accepted only in some contexts (e.g. trace text fonts).")
    others <- others[!scalar_only]
  }
  if (length(others)) {
    out <- paste0(out, " In some contexts: ", paste(others, collapse = "; or "), ".")
  }
  if (length(has) < length(fam$variants)) {
    out <- paste0(out, " Not available in every context.")
  }
  out
}

shared_doc <- function(type, ctx) {
  fam <- ctx$families[[type]]
  info <- SHARED_DOCS[[type]]
  fn <- paste0("go_", type)
  names_used <- unique(sub("^.*\\.", "", fam$keys))
  c(
    paste0("#' ", info$title),
    "#'",
    roxygen_lines(paste0(
      info$desc,
      " \\code{", fn, "()} creates one; a named list with the same properties works too."
    )),
    "#'",
    "#' @details",
    roxygen_lines(if (length(fam$variants) == 1L) {
      sprintf(
        "These objects appear in %d places in the plotly.js schema (properties named %s), all with the same properties and rules.",
        length(fam$keys),
        paste0("\\code{", names_used, "}", collapse = ", ")
      )
    } else {
      sprintf(
        paste(
          "These objects appear in %d places in the plotly.js schema (properties named %s),",
          "with small differences between them: for example, not every context",
          "has every property below. \\code{%s()} checks the values against the",
          "contexts it can be used in; when the object is placed in a figure it is",
          "checked again against that context's rules."
        ),
        length(fam$keys),
        paste0("\\code{", names_used, "}", collapse = ", "),
        fn
      )
    }),
    "#'",
    "#' @param arg Optional named list, or graph object of the same type, to",
    "#'   initialise properties from. Named arguments take precedence.",
    unlist(lapply(fam$fields, function(f) param_block(f, shared_param_text(type, f, ctx)))),
    "#' @param ... Not used: properties must be named in full.",
    "#' @param skip_invalid If \\code{TRUE}, silently drop invalid properties",
    "#'   instead of raising an error.",
    sprintf("#' @return A \\code{%s} object (a named list).", fn),
    nested_sections(fam$variants[[1L]], ctx),
    "#'",
    "#' @noMd",
    "#' @export",
    "#' @examples",
    paste0("#' ", info$example)
  )
}

shared_constructor_code <- function(type, ctx) {
  fields <- ctx$families[[type]]$fields
  args <- c("arg = NULL", "...", paste0(fields, " = NULL"), "skip_invalid = FALSE")
  c(
    sprintf("go_%s <- function(", type),
    wrap_args(args),
    ") {",
    sprintf('  shared_object("%s", arg, environment(), list(...), skip_invalid)', type),
    "}",
    ""
  )
}

constructor_code <- function(key, nodes, validators) {
  ch <- child_nodes(key, nodes)
  # Properties come after `...` so they must be named in full (no partial matching).
  args <- c(
    "arg = NULL",
    "...",
    paste0(ch$name, " = NULL"),
    "skip_invalid = FALSE"
  )
  c(
    sprintf("%s <- function(", validators[[key]]$data_class),
    wrap_args(args),
    ") {",
    sprintf(
      '  plotly_object("%s", arg, environment(), list(...), skip_invalid)',
      key
    ),
    "}",
    ""
  )
}

# Figure functions documented on trace pages: add_<trace>().
page_figure_fns <- function(page, validators) {
  entry <- validators[[page]]
  if (is.null(entry$trace_type)) {
    return(list())
  }
  has_xy <- all(c("xaxis", "yaxis") %in% entry$children)
  list(list(
    fn = paste0("add_", page),
    args = c("fig", "data", "row", "col", if (has_xy) "secondary_y")
  ))
}

check_ascii <- function(src) {
  non_ascii <- grep("[^\\x01-\\x7F]", src, value = TRUE, perl = TRUE)
  if (length(non_ascii)) {
    stop(
      "Non-ASCII characters in generated docs; add them to ASCII_REPLACEMENTS:\n",
      paste(utils::head(non_ascii, 5L), collapse = "\n")
    )
  }
}

write_datatypes <- function(ctx, outdir = ".") {
  validators <- ctx$validators
  roots <- c(
    sort(names(validators)[vapply(validators, function(v) !is.null(v$trace_type), logical(1))]),
    "layout"
  )
  version <- schema_version(outdir)
  header <- c(
    sprintf(
      "# Generated by codegen/datatypes.R from the plotly.js %s schema. Do not edit by hand.",
      version
    ),
    ""
  )
  # Remove stale generated files before writing.
  stale <- list.files(file.path(outdir, "R"), "^zz-gen-.*\\.R$", full.names = TRUE)
  unlink(stale[!basename(stale) %in% c("zz-gen-version.R", "zz-gen-figure.R")])
  files <- character()
  for (page in roots) {
    src <- c(
      header,
      page_doc(page, ctx, page_figure_fns(page, validators)),
      constructor_code(page, ctx$nodes, validators)
    )
    check_ascii(src)
    path <- file.path(outdir, "R", sprintf("zz-gen-%s.R", page))
    writeLines(src, path)
    files <- c(files, path)
  }
  src <- header
  for (type in names(SHARED_TYPES)) {
    src <- c(src, shared_doc(type, ctx), shared_constructor_code(type, ctx))
  }
  check_ascii(src)
  path <- file.path(outdir, "R", "zz-gen-shared.R")
  writeLines(src, path)
  files <- c(files, path)
  message(sprintf(
    "Wrote %d trace/layout constructors and %d shared type constructors to %d files",
    length(roots),
    length(SHARED_TYPES),
    length(files)
  ))
  invisible(files)
}

# Runtime data for shared types (R/sysdata.rda).
shared_types_data <- function(ctx) {
  lapply(ctx$families, function(f) f[c("keys", "variants", "fields")])
}

schema_version <- function(outdir) {
  yaml <- readLines(file.path(
    outdir,
    "inst",
    "htmlwidgets",
    "plotly_core.yaml"
  ))
  trimws(sub(
    "^\\s*version:",
    "",
    grep("^\\s*version:", yaml, value = TRUE)[[1L]]
  ))
}
