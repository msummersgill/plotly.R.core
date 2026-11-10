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
  if (is.null(desc) || is.na(desc) || !nzchar(desc)) return("")
  desc <- gsub("(^|[[:space:](,.:])\\*([0-9.]+)\\*([[:space:]),.:]|$)", "\\1\\2\\3", desc, perl = TRUE)
  desc <- gsub("*true*", "TRUE", desc, fixed = TRUE)
  desc <- gsub("*false*", "FALSE", desc, fixed = TRUE)
  desc <- gsub("(^|[[:space:](,.:])\\*(\\S+)\\*([[:space:]),.:]|$)", '\\1"\\2"\\3', desc, perl = TRUE)
  desc <- gsub("\\*([^*]+)\\*", '"\\1"', desc, perl = TRUE)
  desc <- gsub("an {array}", "a vector", desc, fixed = TRUE)
  desc <- gsub("{2D arrays}", "matrices", desc, fixed = TRUE)
  desc <- gsub("{2D array}", "matrix", desc, fixed = TRUE)
  desc <- gsub("{arrays}", "vectors", desc, fixed = TRUE)
  desc <- gsub("{array}", "vector", desc, fixed = TRUE)
  # Keep docs ASCII so the PDF manual builds (LaTeX lacks e.g. U+2212).
  for (ch in names(ASCII_REPLACEMENTS)) desc <- gsub(ch, ASCII_REPLACEMENTS[[ch]], desc, fixed = TRUE)
  desc
}

ASCII_REPLACEMENTS <- c("\u2212" = "-", "\u2013" = "-", "\u2014" = "--", "\u00d7" = "x",
                        "\u2018" = "'", "\u2019" = "'", "\u201c" = '"', "\u201d" = '"')

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
    if (is.null(e$min) && is.null(e$max)) return("")
    sprintf(" in the interval [%s, %s]", format(e$min %||% -Inf), format(e$max %||% Inf))
  }
  enum <- function() {
    vals <- c(if (length(e$values$chr)) rd_quoted_list(e$values$chr),
              if (length(e$values$num)) rd_code(as.character(e$values$num)),
              if (length(e$values$lgl)) rd_code(toupper(as.character(e$values$lgl))))
    out <- paste0("One of ", paste(vals, collapse = ", "))
    if (length(e$values$regex)) out <- paste0(out, ", or a string matching ", paste(rd_code_str(e$values$regex), collapse = " or "))
    out
  }
  switch(e$superclass,
    DataArrayValidator = "Data array: a vector, factor, Date/POSIXct vector, matrix or list",
    EnumeratedValidator = , DashValidator = paste0(enum(), arr),
    BooleanValidator = paste0("Logical", arr),
    NumberValidator = paste0("Number", rng(), arr),
    IntegerValidator = paste0("Integer", rng(), arr),
    StringValidator = paste0("String", if (length(e$values$chr)) paste0(", one of ", rd_quoted_list(e$values$chr)) else "", arr),
    ColorValidator = paste0("Color: a CSS color string or R color name",
                            if (!is.null(e$colorscale_path)) paste0(", or a number mapped to a color by ", rd_code(e$colorscale_path)) else "",
                            arr),
    ColorlistValidator = "Vector of colors",
    ColorscaleValidator = paste0("Colorscale: a vector of colors, a two-column data.frame of (value, color), ",
                                 "or one of the named colorscales ", rd_quoted_list(.named_colorscales)),
    AngleValidator = paste0("Angle in degrees", arr),
    SubplotidValidator = sprintf("Subplot id: %s, %s, %s, ...", rd_code_str(e$base),
                                 rd_code_str(paste0(e$base, "2")), rd_code_str(paste0(e$base, "3"))),
    FlaglistValidator = paste0("Any combination of ", rd_quoted_list(e$flags), " joined with ", rd_code_str("+"),
                               if (length(e$extras)) paste0(", or one of ", rd_quoted_list(e$extras)) else "", arr),
    AnyValidator = "Any value",
    InfoArrayValidator = sprintf("Vector or list of %s%d element(s)",
                                 if (isTRUE(e$free_length)) "up to " else "", length(e$items$validators)),
    CompoundValidator = paste0("Named list or ", rd_link(e$data_class), " object"),
    TitleValidator = paste0("String (the title text), named list or ", rd_link(e$data_class), " object"),
    CompoundArrayValidator = paste0("List of named lists or ", rd_link(e$data_class), " objects"),
    stop("No type_doc for ", e$superclass)
  )
}

roxygen_lines <- function(text, prefix = "#' ", width = 80L) {
  paras <- strsplit(text, "\n\n", fixed = TRUE)[[1L]]
  out <- character()
  for (i in seq_along(paras)) {
    if (i > 1L) out <- c(out, sub(" +$", "", prefix))
    out <- c(out, strwrap(paras[[i]], width = width - nchar(prefix), prefix = prefix))
  }
  out
}

param_lines <- function(name, desc, type) {
  desc <- if (is.na(desc)) "" else desc
  paras <- c(if (nzchar(desc)) rd_escape(format_description(desc)), paste0(type, "."))
  first <- strwrap(paras[[1L]], width = 76L, initial = paste0("#' @param ", name, " "), prefix = "#'   ")
  rest <- unlist(lapply(paras[-1L], function(p) c("#'", strwrap(p, width = 76L, prefix = "#'   "))))
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
  if (kind == "trace") return(sprintf("Scatter-family trace: %s", key))
  parts <- strsplit(key, ".", fixed = TRUE)[[1L]]
  s <- paste(parts, collapse = " ")
  paste0(toupper(substr(s, 1L, 1L)), substr(s, 2L, nchar(s)))
}

constructor_source <- function(key, nodes, validators, schema) {
  entry <- validators[[key]]
  node <- nodes[nodes$key == key, ]
  kind <- node$kind[[1L]]
  children <- nodes[nodes$parent == key, ]
  children <- children[order(children$name), ]
  # Compound-array element entries are reached through their array property.
  children <- children[children$kind != "compound_element", ]
  bad <- children$name[children$name %in% RESERVED_ARGS | make.names(children$name) != children$name]
  if (length(bad)) stop("Property names clash with constructor arguments or are not syntactic: ", paste(bad, collapse = ", "))

  fn <- entry$data_class
  title <- if (kind == "trace") paste(tools::toTitleCase(key), "trace") else if (kind == "layout") "Figure layout" else object_title(key, kind)
  desc <- if (kind == "trace") schema$traces[[key]]$meta$description else if (kind == "layout") {
    "Layout properties of a figure: axes, title, legend, margins, fonts and other settings that are not specific to a trace."
  } else node$description[[1L]]
  desc <- rd_escape(format_description(desc %||% ""))
  if (!nzchar(desc)) desc <- sprintf("Properties of %s.", rd_code(key))
  parent <- node$parent[[1L]]
  parent_fn <- if (nzchar(parent)) validators[[parent]]$data_class

  lines <- c(
    paste0("#' ", title),
    "#'",
    roxygen_lines(desc),
    "#'",
    roxygen_lines(paste0(
      "Creates a validated ", rd_code(fn), " graph object (a named list). ",
      "Every property is checked against the plotly.js schema when the object is ",
      "created or modified (see ", rd_link("plotly_obj-modify"), ")."
    )),
    "#'",
    "#' @param arg Optional named list, or graph object of the same type, to",
    "#'   initialise properties from. Named arguments take precedence.",
    unlist(lapply(seq_len(nrow(children)), function(i) {
      ck <- children$key[[i]]
      param_lines(children$name[[i]], children$description[[i]], type_doc(validators[[ck]]))
    })),
    "#' @param ... Further properties, including nested properties in",
    "#'   \"magic underscore\" form, e.g. \\code{marker_size = 10} for",
    "#'   \\code{marker = list(size = 10)}.",
    "#' @param skip_invalid If \\code{TRUE}, silently drop invalid properties",
    "#'   instead of raising an error.",
    sprintf("#' @return A \\code{%s} graph object.", fn),
    if (!is.null(parent_fn)) sprintf("#' @seealso Parent object: %s", rd_link(parent_fn)),
    "#' @noMd",
    "#' @export"
  )
  if (kind == "trace") {
    lines <- c(lines, "#' @examples",
      sprintf("#' %s(x = 1:3, y = c(2, 1, 3), mode = \"markers\", marker = list(size = 12))", fn),
      sprintf("#' %s(x = 1:3, y = c(2, 1, 3), marker_color = \"red\", line_dash = \"dot\")", fn))
  } else if (kind == "layout") {
    lines <- c(lines, "#' @examples",
      sprintf("#' %s(title = \"My plot\", xaxis = list(title = \"x\", range = c(0, 10)))", fn))
  }

  args <- c("arg = NULL", paste0(children$name, " = NULL"), "...", "skip_invalid = FALSE")
  c(
    lines,
    sprintf("%s <- function(", fn),
    wrap_args(args),
    ") {",
    sprintf('  plotly_object("%s", arg, environment(), list(...), skip_invalid)', key),
    "}",
    ""
  )
}

write_datatypes <- function(nodes, validators, schema, outdir = ".") {
  nodes <- as.data.frame(nodes) # base indexing: avoid data.table column scoping
  compound_keys <- names(validators)[vapply(validators, function(v) v$superclass %in% c("CompoundValidator", "TitleValidator"), logical(1))]
  roots <- sub("\\..*$", "", compound_keys)
  version <- schema_version(outdir)
  # Remove stale generated files before writing.
  stale <- list.files(file.path(outdir, "R"), "^zz-gen-.*\\.R$", full.names = TRUE)
  unlink(stale[!basename(stale) %in% c("zz-gen-version.R", "zz-gen-figure.R")])
  files <- character()
  for (root in unique(roots)) {
    keys <- compound_keys[roots == root]
    keys <- keys[order(keys != root, keys)] # root object first
    src <- c(
      sprintf("# Generated by codegen/datatypes.R from the plotly.js %s schema. Do not edit by hand.", version),
      "",
      unlist(lapply(keys, constructor_source, nodes = nodes, validators = validators, schema = schema))
    )
    non_ascii <- grep("[^\\x01-\\x7F]", src, value = TRUE, perl = TRUE)
    if (length(non_ascii)) {
      stop("Non-ASCII characters in generated docs; add them to ASCII_REPLACEMENTS:\n",
           paste(utils::head(non_ascii, 5L), collapse = "\n"))
    }
    path <- file.path(outdir, "R", sprintf("zz-gen-%s.R", root))
    writeLines(src, path)
    files <- c(files, path)
  }
  message(sprintf("Wrote %d constructors to %s", length(compound_keys), paste(basename(files), collapse = ", ")))
  invisible(files)
}

schema_version <- function(outdir) {
  yaml <- readLines(file.path(outdir, "inst", "htmlwidgets", "plotly_R_core.yaml"))
  trimws(sub("^\\s*version:", "", grep("^\\s*version:", yaml, value = TRUE)[[1L]]))
}
