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
      rd_link("plotly_colors"),
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
  unifiedhovertitle = "^unifiedhovertitle$",
  # x, y and z (or a, b and c) objects that are the same; patterns starting
  # "key:" match the schema key rather than the property name
  scene_axis = "key:^layout\\.scene\\.[xyz]axis$",
  ternary_axis = "key:^layout\\.ternary\\.[abc]axis$",
  scatter3d_projection_axis = "key:^scatter3d\\.projection\\.[xyz]$",
  surface_contours_axis = "key:^surface\\.contours\\.[xyz]$",
  # a trace's selected/unselected point styles, checked against the trace's
  # own when placed
  selected = "^selected$",
  unselected = "^unselected$"
)

# A family of schema keys that share one constructor: its keys, the keys
# standing for each distinct variant (most common first) and the union of
# its properties.
family_from_keys <- function(keys, validators) {
  keys <- sort(keys)
  sig <- vapply(
    keys,
    function(k) {
      sub_keys <- grep(
        paste0("^", gsub(".", "\\.", k, fixed = TRUE), "\\."),
        names(validators),
        value = TRUE
      )
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
    fields = sort(unique(unlist(lapply(keys, function(k) {
      validators[[k]]$children
    }))))
  )
}

# Shared types: the SHARED_TYPES families, plus a family for each object nested
# in them that is not itself of a shared type, named after the type and its
# path within it: colorbar.title -> "colorbar_title" (go_colorbar_title()).
shared_families <- function(nodes, validators) {
  cmp <- nodes[nodes$kind %in% c("compound", "compound_element"), ]
  matches <- function(p) {
    if (startsWith(p, "key:")) {
      grepl(substring(p, 5L), cmp$key)
    } else {
      grepl(p, cmp$name)
    }
  }
  hits <- vapply(SHARED_TYPES, matches, logical(nrow(cmp)))
  if (any(rowSums(hits) > 1L)) {
    stop(
      "Schema keys match several shared types: ",
      paste(cmp$key[rowSums(hits) > 1L], collapse = ", ")
    )
  }
  base <- lapply(SHARED_TYPES, function(pattern) cmp$key[matches(pattern)])
  members <- unlist(base)
  derived <- list()
  for (type in names(base)) {
    for (k in base[[type]]) {
      inner <- cmp$key[startsWith(cmp$key, paste0(k, "."))]
      inner <- inner[!inner %in% members]
      # skip objects nested in another shared type inside this one
      inner <- inner[
        !vapply(
          inner,
          function(i) {
            mid <- members[
              startsWith(i, paste0(members, ".")) & nchar(members) > nchar(k)
            ]
            length(mid) > 0L
          },
          logical(1)
        )
      ]
      for (i in inner) {
        rel <- gsub(".", "_", substring(i, nchar(k) + 2L), fixed = TRUE)
        # caps.x, caps.y and caps.z are one type: "caps_axis"
        rel <- sub("(^|_)[xyz]$", "\\1axis", rel)
        name <- paste(type, rel, sep = "_")
        derived[[name]] <- c(derived[[name]], i)
      }
    }
  }
  if (length(intersect(names(derived), names(base)))) {
    stop(
      "Derived shared type names clash: ",
      paste(intersect(names(derived), names(base)), collapse = ", ")
    )
  }
  lapply(
    c(base, derived[sort(names(derived))]),
    family_from_keys,
    validators = validators
  )
}

# Generated title, description and example for a shared type's help page.
shared_info <- function(type, ctx) {
  fam <- ctx$families[[type]]
  rep_key <- fam$variants[[1L]]
  # the example uses it where it shows: in the layout, or as a property of a
  # common trace, if it is used there
  depth <- lengths(strsplit(fam$keys, ".", fixed = TRUE))
  visible <- c(
    fam$keys[startsWith(fam$keys, "layout.") & depth == 2L],
    intersect(
      paste0(
        c("scatter", "bar", "heatmap", "pie"),
        ".",
        sub("^.*\\.", "", fam$keys)
      ),
      fam$keys[depth == 2L]
    ),
    fam$keys[depth == 2L]
  )
  example_key <- if (length(visible)) visible[[1L]] else rep_key
  names_used <- unique(sub("^.*\\.", "", fam$keys))
  # the schema's description, if every place it is used has the same one
  descs <- unique(vapply(fam$keys, object_description, "", ctx = ctx))
  desc <- if (length(descs) == 1L) descs else ""
  title <- gsub("_", " ", type)
  list(
    title = paste0(
      toupper(substr(title, 1L, 1L)),
      substring(title, 2L),
      " objects"
    ),
    desc = paste0(
      if (nzchar(desc)) paste0(desc, " ") else "",
      sprintf(
        "Used for %s in %d places in the schema.",
        paste0("\\code{", names_used, "}", collapse = ", "),
        length(fam$keys)
      )
    ),
    example = object_figure_example(example_key, ctx)
  )
}

# Constructors for every other object --------------------------------------------
#
# Every object in the schema has a constructor. Objects of a shared type use its
# constructor (go_font(), go_colorbar_title(), ...); every other one has its own,
# named after its schema path without "layout." (go_scatter_marker(),
# go_sankey_link(), go_xaxis(), go_scene_camera_eye(), go_slider_step(), ...),
# with exactly its properties, except where NAME_OVERRIDES gives another name.
# Their help pages (titles, descriptions, examples) are generated too.
NAME_OVERRIDES <- c(
  "layout.title" = "go_layout_title", # not titles elsewhere
  "layout.image" = "go_layout_image", # go_image() is the image trace
  "layout.colorscale" = "go_layout_colorscale", # not the colorscale property
  "layout.transition" = "go_layout_transition" # not slider transitions
)

object_fn_for <- function(key, validators) {
  if (!is.na(NAME_OVERRIDES[key])) {
    return(NAME_OVERRIDES[[key]])
  }
  sub("^go_layout_", "go_", validators[[key]]$data_class)
}

# Every compound object that is not a trace, the layout or of a shared type.
object_roots_for <- function(nodes, shared_of) {
  keys <- nodes$key[nodes$kind %in% c("compound", "compound_element")]
  sort(keys[!keys %in% names(shared_of)])
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
    "A data frame in which formula properties (e.g. \\code{x = ~col})",
    "are evaluated. Default: the data given to",
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

# The `data` argument of add_<trace>(), with formula examples for the trace:
# a data array (x = ~col) and an array property of a nested object
# (marker = go_bar_marker(color = ~col)).
DATA_EXAMPLE_ARRAYS <- c(
  "x",
  "y",
  "z",
  "values",
  "r",
  "lat",
  "a",
  "real",
  "labels",
  "locations",
  "dimensions",
  "u",
  "open",
  "ids",
  "parents"
)
DATA_EXAMPLE_OBJECTS <- c(
  "marker",
  "link",
  "cells",
  "line",
  "textfont",
  "hoverlabel"
)
DATA_EXAMPLE_NESTED <- c(
  "color",
  "colors",
  "value",
  "values",
  "size",
  "width",
  "family"
)

data_arg_doc <- function(page, ctx) {
  v <- ctx$validators
  kids <- ctx$nodes[ctx$nodes$parent == page, ]
  is_array <- function(k) identical(v[[k]]$superclass, "DataArrayValidator")
  arrays <- kids$name[vapply(kids$key, is_array, NA)]
  top <- c(intersect(DATA_EXAMPLE_ARRAYS, arrays), arrays)[1L]
  nested <- NULL
  for (obj in intersect(DATA_EXAMPLE_OBJECTS, kids$name)) {
    ok <- paste(page, obj, sep = ".")
    sub <- ctx$nodes[ctx$nodes$parent == ok, ]
    accepts <- sub$name[vapply(
      sub$key,
      function(k) isTRUE(v[[k]]$array_ok) || is_array(k),
      NA
    )]
    prop <- intersect(DATA_EXAMPLE_NESTED, accepts)[1L]
    if (!is.na(prop)) {
      fn <- if (ok %in% names(ctx$shared_of)) {
        paste0("go_", ctx$shared_of[[ok]])
      } else {
        ctx$object_fn[[ok]]
      }
      nested <- sprintf("%s = %s(%s = ~col)", obj, fn, prop)
      break
    }
  }
  examples <- c(
    if (!is.na(top)) sprintf("%s = ~col", top),
    nested
  )
  paste(
    "A data frame in which formula properties",
    if (length(examples)) {
      sprintf(
        "(e.g. %s)",
        paste(rd_code(examples), collapse = ", ")
      )
    },
    "are evaluated. Default: the data given to",
    "\\code{\\link{go_figure}()}. Only the evaluated values are added to the trace.",
    "A \\code{crosstalk::SharedData} works the same way, and links the trace",
    "to its crosstalk group (see \\code{\\link{highlight}()})."
  )
}

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
  vapply(
    layout_array_props(validators),
    function(k) validators[[k]]$element_key,
    ""
  )
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
  object_roots <- object_roots_for(nodes, shared_of)
  object_fn <- stats::setNames(
    vapply(object_roots, object_fn_for, "", validators = validators),
    object_roots
  )
  # every name must be unique and not taken by a trace, the layout or a shared type
  taken <- c(
    paste0("go_", nodes$key[nodes$kind == "trace"]),
    "go_layout",
    "go_figure",
    paste0("go_", names(families))
  )
  clash <- c(object_fn[duplicated(object_fn)], intersect(object_fn, taken))
  if (length(clash)) {
    stop(
      "Constructor names clash: ",
      paste(unique(clash), collapse = ", "),
      "; add them to NAME_OVERRIDES"
    )
  }
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
      hit <- anc[anc %in% object_roots]
      return(if (length(hit)) hit[[1L]] else root)
    }
    obj <- anc[anc %in% object_roots]
    if (length(obj)) {
      return(obj[[1L]])
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
    object_roots = object_roots,
    object_fn = object_fn,
    page_root = page_root
  )
}

# Documentation link for a page root.
page_link <- function(root, ctx) {
  if (root %in% ctx$object_roots) {
    return(rd_link(ctx$object_fn[[root]]))
  }
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
    return(sprintf(
      "%s and %d more",
      paste(ch[seq_len(max)], collapse = ", "),
      length(ch) - max
    ))
  }
  if (length(ch) == 1L) {
    ch
  } else {
    paste(
      paste(utils::head(ch, -1L), collapse = ", "),
      "and",
      utils::tail(ch, 1L)
    )
  }
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
  ctor <- if (!is.na(shared)) {
    paste0("go_", shared)
  } else if (target %in% ctx$object_roots) {
    ctx$object_fn[[target]]
  }
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
      sprintf(
        "a named list with properties %s (see %s)",
        props,
        page_link(pr, ctx)
      )
    }
  }
  switch(
    e$superclass,
    CompoundValidator = paste0(
      toupper(substr(what, 1L, 1L)),
      substring(what, 2L)
    ),
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
  type <- if (
    e$superclass %in%
      c("CompoundValidator", "TitleValidator", "CompoundArrayValidator")
  ) {
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
      sprintf(
        "\\item{\\code{%s}}{%s}",
        ch$name[[i]],
        property_text(ch$key[[i]], root, ctx)
      )
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
  keys <- keys[vapply(
    keys,
    function(k) identical(ctx$page_root(k), root),
    logical(1)
  )]
  unlist(lapply(sort(keys), function(k) {
    desc <- object_description(k, ctx)
    is_element <- ctx$nodes$kind[[match(k, ctx$nodes$key)]] ==
      "compound_element"
    c(
      "#'",
      sprintf(
        "#' @section %s%s:",
        section_title(k, root),
        if (is_element) " (each list element)" else ""
      ),
      if (nzchar(desc)) c(roxygen_lines(desc), "#'"),
      property_describe(k, root, ctx)
    )
  }))
}

# Details text on trace, layout and layout object pages.
nested_details <- function() {
  paste(
    "Nested objects are given as named lists or with their constructors, which are",
    "linked from the arguments below. Every property is checked against the plotly.js",
    "schema when the object is created or modified (see \\code{\\link{plotly_obj-modify}}).",
    "One-sided formulas (\\code{~col}) are evaluated in the data, and then checked, when",
    "the trace is added with \\code{add_<trace>()} or \\code{add_trace()}."
  )
}

# `...` of constructors: it comes before the properties so that they must be
# named in full (R would partially match "mark" to "marker"), and unknown or
# abbreviated names get plotly.core's errors, with suggestions.
dots_doc <- function(layout = FALSE) {
  c(
    "#' @param ... Not for properties, which must be named in full: an",
    "#'   abbreviated or unknown name is an error that suggests the right one.",
    if (layout) {
      "#'   Numbered subplots (\\code{xaxis2}, \\code{scene3}, ...) are given here."
    }
  )
}

page_title <- function(page, kind) {
  if (kind == "trace") {
    return(paste(tools::toTitleCase(page), "traces"))
  }
  "Figure layout"
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
    for (a in f$args) {
      fig_docs[[a]] <- FIGURE_ARG_DOCS[[a]]
    }
  }
  if (!is.null(fig_docs$data) && kind == "trace") {
    fig_docs$data <- data_arg_doc(page, ctx)
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
          paste(
            vapply(figure_fns, function(f) rd_code(paste0(f$fn, "()")), ""),
            collapse = ", "
          ),
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
    property_params(page, page, ctx, fig_docs),
    if (kind == "trace") {
      dots_doc()
    } else {
      dots_doc(layout = TRUE)
    },
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
    sprintf(
      "#' @concept %s",
      if (kind == "trace") "traces" else "layout objects"
    ),
    "#' @noMd",
    "#' @export",
    "#' @examples",
    if (kind == "trace") {
      paste0("#' ", figure_example(page, ctx) %||% paste0(root_fn, "()"))
    } else {
      sprintf(
        "#' %s(title = \"My plot\", xaxis = go_xaxis(title = \"x\", range = c(0, 10)))",
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
  has <- fam$variants[vapply(
    fam$variants,
    function(v) field %in% ctx$validators[[v]]$children,
    logical(1)
  )]
  root <- fam$variants[[1L]]
  texts <- vapply(
    has,
    function(v) {
      i <- match(paste(v, field, sep = "."), ctx$nodes$key)
      e <- ctx$validators[[ctx$nodes$key[[i]]]]
      if (
        e$superclass %in%
          c("CompoundValidator", "TitleValidator", "CompoundArrayValidator")
      ) {
        compound_type_doc(ctx$nodes$key[[i]], v, ctx)
      } else {
        type_doc(e)
      }
    },
    ""
  )
  i <- match(paste(has[[1L]], field, sep = "."), ctx$nodes$key)
  desc <- ctx$nodes$description[[i]]
  desc <- if (is.na(desc)) "" else rd_escape(format_description(desc))
  # descriptions mention the context they were written for; use the first
  out <- paste0(if (nzchar(desc)) paste0(desc, " ") else "", texts[[1L]], ".")
  others <- setdiff(unique(texts), texts[[1L]])
  vec <- ", or a vector of these"
  scalar_only <- others == sub(vec, "", texts[[1L]], fixed = TRUE)
  if (any(scalar_only) && endsWith(texts[[1L]], vec)) {
    out <- paste0(
      out,
      " Vectors are accepted only in some contexts (e.g. trace text fonts)."
    )
    others <- others[!scalar_only]
  }
  if (length(others)) {
    out <- paste0(
      out,
      " In some contexts: ",
      paste(others, collapse = "; or "),
      "."
    )
  }
  if (length(has) < length(fam$variants)) {
    out <- paste0(out, " Not available in every context.")
  }
  out
}

shared_doc <- function(type, ctx) {
  fam <- ctx$families[[type]]
  info <- shared_info(type, ctx)
  fn <- paste0("go_", type)
  names_used <- unique(sub("^.*\\.", "", fam$keys))
  c(
    paste0("#' ", info$title),
    "#'",
    roxygen_lines(paste0(
      info$desc,
      " \\code{",
      fn,
      "()} creates one; a named list with the same properties works too."
    )),
    "#'",
    "#' @details",
    roxygen_lines(
      if (length(fam$variants) == 1L) {
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
      }
    ),
    "#'",
    unlist(lapply(fam$fields, function(f) {
      param_block(f, shared_param_text(type, f, ctx))
    })),
    dots_doc(),
    "#' @param skip_invalid If \\code{TRUE}, silently drop invalid properties",
    "#'   instead of raising an error.",
    sprintf("#' @return A \\code{%s} object (a named list).", fn),
    nested_sections(fam$variants[[1L]], ctx),
    "#'",
    "#' @concept shared object types",
    "#' @noMd",
    "#' @export",
    "#' @examples",
    paste0("#' ", info$example)
  )
}

# Constructor of the object at `key`, for examples and links.
ctor_of <- function(key, ctx) {
  kind <- ctx$nodes$kind[[match(key, ctx$nodes$key)]]
  if (kind %in% c("trace", "layout")) {
    return(ctx$validators[[key]]$data_class)
  }
  if (key %in% names(ctx$shared_of)) {
    return(paste0("go_", ctx$shared_of[[key]]))
  }
  ctx$object_fn[[key]]
}

# Where the object at `key` goes, for its help page.
object_where <- function(key, ctx) {
  nodes <- ctx$nodes
  i <- match(key, nodes$key)
  owner <- nodes$parent[[i]]
  root <- sub("\\..*$", "", key)
  article <- function(x) if (grepl("^[aeiou]", x)) "an" else "a"
  owner_link <- function() sprintf("(%s)", rd_link(ctor_of(owner, ctx)))
  if (nodes$kind[[i]] == "compound_element") {
    arr <- nodes$name[which(nodes$element_key == key)[[1L]]]
    if (owner == "layout") {
      helper <- if (key %in% ctx$element_roots) {
        paste0(" (or use ", rd_link(figure_fn_for_element(key)), ")")
      } else {
        ""
      }
      return(sprintf(
        "an element of the figure layout's \\code{%s} list%s",
        arr,
        helper
      ))
    }
    if (owner == root) {
      return(sprintf(
        "an element of the \\code{%s} list of %s %s trace %s",
        arr,
        article(root),
        root,
        owner_link()
      ))
    }
    rel <- if (root == "layout") {
      sub("^layout\\.", "", owner)
    } else {
      substring(owner, nchar(root) + 2L)
    }
    return(sprintf(
      "an element of the \\code{%s} list of %s's \\code{%s} %s",
      arr,
      if (root == "layout") {
        "the layout"
      } else {
        paste(article(root), root, "trace")
      },
      rel,
      owner_link()
    ))
  }
  name <- nodes$name[[i]]
  if (owner == "layout") {
    if (key %in% ctx$subplot_roots) {
      return(sprintf(
        "the figure layout's \\code{%s} (and \\code{%s2}, \\code{%s3}, ...: see %s)",
        name,
        name,
        name,
        rd_link(paste0("update_", pluralize(name)))
      ))
    }
    return(sprintf("the figure layout's \\code{%s}", name))
  }
  rel <- if (root == "layout") {
    sub("^layout\\.", "", key)
  } else {
    substring(key, nchar(root) + 2L)
  }
  if (root == "layout") {
    return(sprintf("the layout's \\code{%s} %s", rel, owner_link()))
  }
  sprintf(
    "the \\code{%s} of %s %s trace %s",
    rel,
    article(root),
    root,
    owner_link()
  )
}

# Example argument for an object constructor.
object_example_arg <- function(key, validators) {
  ch <- validators[[key]]$children
  cand <- c(
    color = 'color = "red"',
    colors = 'colors = c("red", "blue")',
    text = 'text = "title"',
    width = "width = 2",
    size = "size = 10",
    opacity = "opacity = 0.5",
    show = "show = TRUE",
    visible = "visible = TRUE",
    bgcolor = 'bgcolor = "lightyellow"',
    thickness = "thickness = 20"
  )
  nums <- c(width = 2, size = 10, opacity = 0.5, thickness = 20)
  for (n in names(cand)) {
    if (!n %in% ch) {
      next
    }
    e <- validators[[paste(key, n, sep = ".")]]
    if (
      e$superclass %in%
        c("CompoundValidator", "TitleValidator", "CompoundArrayValidator")
    ) {
      next
    }
    if (n %in% names(nums)) {
      # keep generated numbers within the property's range
      val <- nums[[n]]
      lo <- e$min %||% -Inf
      hi <- e$max %||% Inf
      if (val < lo || val > hi) {
        val <- if (is.finite(lo) && is.finite(hi)) {
          (lo + hi) / 2
        } else if (is.finite(lo)) {
          lo
        } else {
          hi
        }
      }
      return(sprintf("%s = %s", n, format(val)))
    }
    return(cand[[n]])
  }
  ""
}

# Generated example: the constructor's call, placed in its trace or the
# layout through the constructors of the objects around it. It builds the
# object rather than a figure: without data, a figure would draw nothing.
object_example <- function(key, ctx) {
  nodes <- ctx$nodes
  lines <- sprintf(
    "%s(%s)",
    ctor_of(key, ctx),
    object_example_arg(key, ctx$validators)
  )
  cur <- key
  repeat {
    i <- match(cur, nodes$key)
    parent <- nodes$parent[[i]]
    if (!nzchar(parent)) {
      return(lines)
    }
    if (nodes$kind[[i]] == "compound_element") {
      prop <- nodes$name[which(nodes$element_key == cur)[[1L]]]
      lines[[1L]] <- paste0("list(", lines[[1L]])
      lines[[length(lines)]] <- paste0(lines[[length(lines)]], ")")
    } else {
      prop <- nodes$name[[i]]
    }
    lines <- c(
      paste0(ctor_of(parent, ctx), "("),
      paste0("  ", c(paste0(prop, " = ", lines[[1L]]), lines[-1L])),
      ")"
    )
    cur <- parent
  }
}

# Generated title: "Scatter selected marker objects", "Layout scene camera objects".
object_title <- function(key, ctx) {
  root <- sub("\\..*$", "", key)
  rel <- gsub(".", " ", substring(key, nchar(root) + 2L), fixed = TRUE)
  paste(
    if (root == "layout") "Layout" else tools::toTitleCase(root),
    rel,
    "objects"
  )
}

# Help page of an object constructor (go_scatter_marker(), go_xaxis(), ...).
object_doc <- function(key, ctx) {
  fn <- ctx$object_fn[[key]]
  desc <- object_description(key, ctx)
  c(
    paste0("#' ", object_title(key, ctx)),
    "#'",
    roxygen_lines(paste0(
      if (nzchar(desc)) paste0(desc, " ") else "",
      sprintf(
        "The object for %s. \\code{%s()} creates one, with exactly its properties; a named list with the same properties works too.",
        object_where(key, ctx),
        fn
      )
    )),
    "#'",
    "#' @details",
    roxygen_lines(paste(
      "Nested objects are named lists, or objects of the constructors their arguments name.",
      "Every property is checked against the plotly.js schema when the object is created",
      "or modified. A property may be a one-sided formula (\\code{color = ~col}): it is kept,",
      "and evaluated in the data (then checked) when its trace is added to a figure with",
      "\\code{add_<trace>()} or \\code{add_trace()}."
    )),
    "#'",
    property_params(key, key, ctx),
    dots_doc(),
    "#' @param skip_invalid If \\code{TRUE}, silently drop invalid properties",
    "#'   instead of raising an error.",
    sprintf(
      "#' @return A \\code{%s} object (a named list).",
      ctx$validators[[key]]$data_class
    ),
    nested_sections(key, ctx),
    "#'",
    sprintf(
      "#' @concept %s",
      if (startsWith(key, "layout.")) "layout objects" else "trace objects"
    ),
    "#' @noMd",
    "#' @export",
    "#' @examples",
    paste0("#' ", object_figure_example(key, ctx))
  )
}

shared_constructor_code <- function(type, ctx) {
  fields <- ctx$families[[type]]$fields
  args <- c(
    "...",
    paste0(fields, " = NULL"),
    "skip_invalid = FALSE"
  )
  c(
    sprintf("go_%s <- function(", type),
    wrap_args(args),
    ") {",
    sprintf(
      '  shared_object("%s", NULL, environment(), list(...), skip_invalid)',
      type
    ),
    "}",
    ""
  )
}

constructor_code <- function(
  key,
  nodes,
  validators,
  fn = validators[[key]]$data_class
) {
  ch <- child_nodes(key, nodes)
  # Properties come after `...` so they must be named in full (no partial matching).
  args <- c(
    "...",
    paste0(ch$name, " = NULL"),
    "skip_invalid = FALSE"
  )
  c(
    sprintf("%s <- function(", fn),
    wrap_args(args),
    ") {",
    sprintf(
      '  plotly_object("%s", NULL, environment(), list(...), skip_invalid)',
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
    sort(names(validators)[vapply(
      validators,
      function(v) !is.null(v$trace_type),
      logical(1)
    )]),
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
  stale <- list.files(
    file.path(outdir, "R"),
    "^zz-gen-.*\\.R$",
    full.names = TRUE
  )
  unlink(stale[!basename(stale) %in% c("zz-gen-version.R", "zz-gen-figure.R")])
  files <- character()
  for (page in roots) {
    src <- c(
      header,
      page_doc(page, ctx, page_figure_fns(page, validators)),
      constructor_code(page, ctx$nodes, validators)
    )
    for (key in ctx$object_roots[startsWith(
      ctx$object_roots,
      paste0(page, ".")
    )]) {
      src <- c(
        src,
        object_doc(key, ctx),
        constructor_code(key, ctx$nodes, validators, ctx$object_fn[[key]])
      )
    }
    check_ascii(src)
    path <- file.path(outdir, "R", sprintf("zz-gen-%s.R", page))
    writeLines(src, path)
    files <- c(files, path)
  }
  src <- header
  for (type in names(ctx$families)) {
    src <- c(src, shared_doc(type, ctx), shared_constructor_code(type, ctx))
  }
  check_ascii(src)
  path <- file.path(outdir, "R", "zz-gen-shared.R")
  writeLines(src, path)
  files <- c(files, path)
  message(sprintf(
    "Wrote %d trace/layout, %d object and %d shared type constructors to %d files",
    length(roots),
    length(ctx$object_roots),
    length(ctx$families),
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
