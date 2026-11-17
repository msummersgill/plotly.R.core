# Graph object constructor codegen (the R counterpart of
# plotly.py/codegen/datatypes.py).
#
# Writes one go_*() constructor per compound schema node, with roxygen docs
# built from the schema descriptions and the validator parameters. Output
# goes to R/zz-gen-<root>.R, one file per trace type plus one for layout.

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
    CompoundValidator = paste0(
      "Named list or ",
      rd_link(e$data_class),
      " object"
    ),
    TitleValidator = paste0(
      "String (the title text), named list or ",
      rd_link(e$data_class),
      " object"
    ),
    CompoundArrayValidator = paste0(
      "List of named lists or ",
      rd_link(e$data_class),
      " objects"
    ),
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

param_lines <- function(name, desc, type) {
  desc <- if (is.na(desc)) "" else desc
  paras <- c(
    if (nzchar(desc)) rd_escape(format_description(desc)),
    paste0(type, ".")
  )
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

# Title for a constructor, e.g. "scatter.marker.colorbar" -> "Scatter marker colorbar".
object_title <- function(key, kind) {
  if (kind == "trace") {
    return(sprintf("Scatter-family trace: %s", key))
  }
  parts <- strsplit(key, ".", fixed = TRUE)[[1L]]
  s <- paste(parts, collapse = " ")
  paste0(toupper(substr(s, 1L, 1L)), substr(s, 2L, nchar(s)))
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
      "marker_color = \"red\""
    }
  )
  sprintf("%s(%s)", fn, paste(args, collapse = ", "))
}

# Help pages ---------------------------------------------------------------------
#
# Constructors are documented one page per trace type (go_<trace>() with all
# its nested objects and add_<trace>()), plus one page for go_layout() and one
# per top-level layout object (go_layout_xaxis() with its nested objects;
# go_layout_annotation() with add_annotation(); ...). This keeps the help to
# ~100 pages instead of ~1000. Arguments are documented once per page; when
# several objects on a page share a property name, each gets its own note.

# Help page key for a compound key: "bar.marker.line" -> "bar",
# "layout.xaxis.title" -> "layout.xaxis", "layout" -> "layout".
page_key <- function(key) {
  parts <- strsplit(key, ".", fixed = TRUE)[[1L]]
  if (parts[[1L]] == "layout" && length(parts) > 1L) {
    paste(parts[1:2], collapse = ".")
  } else {
    parts[[1L]]
  }
}

# Arguments of figure functions documented on constructor pages.
FIGURE_ARG_DOCS <- list(
  fig = "A \\code{go_figure} object.",
  data = paste(
    "A data frame in which formula properties (e.g. \\code{x = ~col},",
    "\\code{marker_size = ~col}) are evaluated. Default: the data given to",
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

object_description <- function(key, nodes, schema) {
  kind <- nodes$kind[nodes$key == key][[1L]]
  desc <- if (kind == "trace") {
    schema$traces[[key]]$meta$description
  } else if (kind == "layout") {
    "Layout properties of a figure: axes, title, legend, margins, fonts and other settings that are not specific to a trace."
  } else {
    nodes$description[nodes$key == key][[1L]]
  }
  rd_escape(format_description(if (is.null(desc) || is.na(desc)) "" else desc))
}

# @param lines for all property arguments of the constructors on a page.
# `docs` may hold entries for figure function arguments (fig, row, ...);
# property names that coincide with them share one entry.
property_param_lines <- function(keys, nodes, validators, docs = list()) {
  # docs: name -> list of (fn, text)
  for (key in keys) {
    fn <- validators[[key]]$data_class
    ch <- child_nodes(key, nodes)
    for (i in seq_len(nrow(ch))) {
      desc <- ch$description[[i]]
      desc <- if (is.na(desc)) "" else rd_escape(format_description(desc))
      text <- paste0(
        if (nzchar(desc)) paste0(desc, " ") else "",
        type_doc(validators[[ch$key[[i]]]]),
        "."
      )
      docs[[ch$name[[i]]]] <- c(
        docs[[ch$name[[i]]]],
        list(list(fn = fn, text = text))
      )
    }
  }
  unlist(lapply(sort(names(docs)), function(name) {
    entries <- docs[[name]]
    texts <- vapply(entries, `[[`, "", "text")
    if (length(unique(texts)) == 1L) {
      paras <- texts[[1L]]
    } else {
      fns <- vapply(entries, `[[`, "", "fn")
      paras <- vapply(
        unique(texts),
        function(t) {
          paste0(
            "\\strong{",
            paste0("\\code{", fns[texts == t], "()}", collapse = ", "),
            "}: ",
            t
          )
        },
        ""
      )
    }
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
  }))
}

page_title <- function(page, kind) {
  if (kind == "trace") {
    return(paste(tools::toTitleCase(page), "traces"))
  }
  if (page == "layout") {
    return("Figure layout")
  }
  paste("Layout", sub("^layout\\.", "", page), "objects")
}

# Roxygen block for a page, attached to its root constructor.
page_doc <- function(page, keys, nodes, validators, schema, figure_fns) {
  root_fn <- validators[[page]]$data_class
  kind <- nodes$kind[nodes$key == page][[1L]]
  desc <- object_description(page, nodes, schema)
  if (!nzchar(desc)) {
    desc <- sprintf("Properties of %s.", rd_code(page))
  }
  nested <- setdiff(keys, page)
  fig_docs <- list()
  for (f in figure_fns) {
    for (a in f$args) {
      fig_docs[[a]] <- c(
        fig_docs[[a]],
        list(list(fn = f$fn, text = FIGURE_ARG_DOCS[[a]]))
      )
    }
  }

  lines <- c(
    paste0("#' ", page_title(page, kind)),
    "#'",
    roxygen_lines(desc),
    "#'",
    roxygen_lines(paste0(
      rd_code(paste0(root_fn, "()")),
      if (length(nested)) " and the nested object constructors below" else "",
      " create validated graph objects (named lists). Every property is checked against the plotly.js ",
      "schema when an object is created or modified (see ",
      rd_link("plotly_obj-modify"),
      ").",
      if (length(figure_fns)) {
        paste0(
          " ",
          paste(
            vapply(figure_fns, function(f) rd_code(paste0(f$fn, "()")), ""),
            collapse = ", "
          ),
          " creates an object and adds it to a figure."
        )
      } else {
        ""
      }
    )),
    if (length(nested)) {
      c(
        "#'",
        "#' @details Nested objects documented here:",
        "#' \\describe{",
        unlist(lapply(nested, function(k) {
          d <- object_description(k, nodes, schema)
          roxygen_lines(sprintf(
            "\\item{%s}{%s%s}",
            rd_code(paste0(validators[[k]]$data_class, "()")),
            rd_code(k),
            if (nzchar(d)) paste0(": ", d) else ""
          ))
        })),
        "#' }"
      )
    },
    "#'",
    "#' @param arg Optional named list, or graph object of the same type, to",
    "#'   initialise properties from (constructors). Named arguments take precedence.",
    property_param_lines(keys, nodes, validators, fig_docs),
    "#' @param ... Further properties, including nested properties in",
    "#'   \"magic underscore\" form, e.g. \\code{marker_size = 10} for",
    "#'   \\code{marker = list(size = 10)}. Property values may be one-sided",
    "#'   formulas, evaluated in \\code{data} for \\code{add_*()} functions.",
    "#' @param skip_invalid If \\code{TRUE}, silently drop invalid properties",
    "#'   instead of raising an error.",
    "#' @return Each \\code{go_*()} function returns a graph object of the same",
    "#'   class as its name; \\code{add_*()} functions return the modified figure.",
    sprintf(
      "#' @seealso %s",
      if (kind == "trace") {
        paste(rd_link("go_figure"), rd_link("add_trace"), sep = ", ")
      } else if (page == "layout") {
        paste(rd_link("go_figure"), rd_link("update_layout"), sep = ", ")
      } else {
        rd_link("go_layout")
      }
    ),
    "#' @noMd",
    "#' @export"
  )
  if (kind == "trace") {
    lines <- c(
      lines,
      "#' @examples",
      paste0("#' ", trace_example(root_fn, page, validators))
    )
  } else if (page == "layout") {
    lines <- c(
      lines,
      "#' @examples",
      sprintf(
        "#' %s(title = \"My plot\", xaxis = list(title = \"x\", range = c(0, 10)))",
        root_fn
      )
    )
  }
  lines
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

# Figure functions documented on constructor pages: add_<trace>() on trace
# pages and add_<annotation, shape, ...>() on layout array element pages.
page_figure_fns <- function(page, validators) {
  entry <- validators[[page]]
  if (!is.null(entry$trace_type)) {
    has_xy <- all(c("xaxis", "yaxis") %in% entry$children)
    return(list(list(
      fn = paste0("add_", page),
      args = c("fig", "data", "row", "col", if (has_xy) "secondary_y")
    )))
  }
  for (array_key in layout_array_props(validators)) {
    if (identical(validators[[array_key]]$element_key, page)) {
      singular <- sub("^layout\\.", "", page)
      fn <- paste0("add_", if (singular == "image") "layout_" else "", singular)
      return(list(list(
        fn = fn,
        args = c("fig", "row", "col", "secondary_y", "exclude_empty_subplots")
      )))
    }
  }
  list()
}

write_datatypes <- function(nodes, validators, schema, outdir = ".") {
  nodes <- as.data.frame(nodes) # base indexing: avoid data.table column scoping
  compound_keys <- names(validators)[vapply(
    validators,
    function(v) v$superclass %in% c("CompoundValidator", "TitleValidator"),
    logical(1)
  )]
  files_by <- sub("\\..*$", "", compound_keys) # one source file per trace type / layout
  pages <- vapply(compound_keys, page_key, "")
  version <- schema_version(outdir)
  # Remove stale generated files before writing.
  stale <- list.files(
    file.path(outdir, "R"),
    "^zz-gen-.*\\.R$",
    full.names = TRUE
  )
  unlink(stale[!basename(stale) %in% c("zz-gen-version.R", "zz-gen-figure.R")])
  files <- character()
  for (root in unique(files_by)) {
    src <- c(
      sprintf(
        "# Generated by codegen/datatypes.R from the plotly.js %s schema. Do not edit by hand.",
        version
      ),
      ""
    )
    for (page in unique(pages[files_by == root])) {
      keys <- compound_keys[pages == page]
      keys <- keys[order(keys != page, keys)] # page root first
      root_fn <- validators[[page]]$data_class
      src <- c(
        src,
        page_doc(
          page,
          keys,
          nodes,
          validators,
          schema,
          page_figure_fns(page, validators)
        ),
        constructor_code(page, nodes, validators)
      )
      for (k in setdiff(keys, page)) {
        src <- c(
          src,
          sprintf("#' @rdname %s", root_fn),
          "#' @export",
          constructor_code(k, nodes, validators)
        )
      }
    }
    non_ascii <- grep("[^\\x01-\\x7F]", src, value = TRUE, perl = TRUE)
    if (length(non_ascii)) {
      stop(
        "Non-ASCII characters in generated docs; add them to ASCII_REPLACEMENTS:\n",
        paste(utils::head(non_ascii, 5L), collapse = "\n")
      )
    }
    path <- file.path(outdir, "R", sprintf("zz-gen-%s.R", root))
    writeLines(src, path)
    files <- c(files, path)
  }
  message(sprintf(
    "Wrote %d constructors on %d help pages to %d files",
    length(compound_keys),
    length(unique(pages)),
    length(files)
  ))
  invisible(files)
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
