# Figure function codegen (the R counterpart of plotly.py/codegen/figure.py).
#
# Writes R/zz-gen-figure.R with
#   - add_<trace>() (an S3 generic with a default method) for every trace type,
#   - select_/update_/for_each_ functions for every layout subplot type
#     (xaxis, yaxis, scene, ...), and
#   - add_/select_/update_/for_each_ functions for layout arrays positioned
#     with xref/yref (annotations, shapes, images, selections).
# The functions are thin wrappers around helpers in R/basefigure.R.

# Arguments of generated functions that are not object properties.
FIGURE_RESERVED_ARGS <- c(
  "fig",
  "split",
  "arg",
  "skip_invalid",
  "row",
  "col",
  "secondary_y",
  "exclude_empty_subplots",
  "data"
)

# Layout subplot containers (plotly.py BaseLayoutType._subplotid_prop_names).
SUBPLOT_TYPES <- c(
  "coloraxis",
  "geo",
  "legend",
  "map",
  "mapbox",
  "polar",
  "scene",
  "smith",
  "ternary",
  "xaxis",
  "yaxis"
)

# English plural, as plotly.py's inflect produces for subplot names.
pluralize <- function(x) {
  ifelse(
    grepl("is$", x),
    sub("is$", "es", x),
    ifelse(
      grepl("x$", x),
      paste0(x, "es"),
      ifelse(grepl("[^aeiou]y$", x), sub("y$", "ies", x), paste0(x, "s"))
    )
  )
}

check_reserved <- function(props, fn) {
  bad <- intersect(props, FIGURE_RESERVED_ARGS)
  if (length(bad)) {
    stop(
      "Properties clash with ",
      fn,
      "() arguments: ",
      paste(bad, collapse = ", ")
    )
  }
}

add_trace_source <- function(trace, validators) {
  entry <- validators[[trace]]
  props <- entry$children
  check_reserved(props, paste0("add_", trace))
  has_xy <- all(c("xaxis", "yaxis") %in% props)
  fn <- paste0("add_", trace)
  extra <- c("row = NULL", "col = NULL", if (has_xy) "secondary_y = NULL")
  args <- c(
    "fig",
    "...",
    "data = NULL",
    "split = NULL",
    paste0(props, " = NULL"),
    extra,
    "skip_invalid = FALSE"
  )
  # add_<trace>() is an S3 generic, so other packages (e.g. plotly, for its
  # plot_ly() objects) can add methods for their own figure classes
  c(
    sprintf("#' @rdname %s", entry$data_class), # documented with go_<trace>()
    "#' @export",
    sprintf('%s <- function(fig, ...) UseMethod("%s")', fn, fn),
    "",
    sprintf("#' @rdname %s", entry$data_class),
    "#' @export",
    sprintf("%s.default <- function(", fn),
    wrap_args(args),
    ") {",
    "  # formulas (x = ~col) are evaluated in `data` or the figure's data, one",
    "  # trace per group of `split` and of discrete colour columns",
    "  add_trace_with_data(",
    sprintf(
      '    fig, "%s", environment(), list(...), data, split, skip_invalid,',
      trace
    ),
    sprintf(
      "    row = row, col = col%s",
      if (has_xy) ", secondary_y = secondary_y" else ""
    ),
    "  )",
    "}",
    ""
  )
}

subplot_source <- function(singular, ctx) {
  validators <- ctx$validators
  root <- paste0("layout.", singular)
  plural <- pluralize(singular)
  entry <- validators[[paste0("layout.", singular)]]
  sy <- singular == "yaxis"
  sel_args <- paste0(
    "selector = NULL, row = NULL, col = NULL",
    if (sy) ", secondary_y = NULL" else ""
  )
  pass <- paste0("row, col", if (sy) ", secondary_y" else "")
  c(
    sprintf("#' Select, update or modify %s objects", singular),
    "#'",
    sprintf(
      "#' Work with all of a figure's layout %s objects (\\code{%s}, \\code{%s2}, \\code{%s3}, ...).",
      singular,
      singular,
      singular,
      singular
    ),
    sprintf(
      "#' \\code{select_%s()} returns them as a named list, \\code{update_%s()} updates",
      plural,
      plural
    ),
    sprintf(
      "#' their properties like \\code{\\link{update_layout}()} does, and \\code{for_each_%s()}",
      singular
    ),
    "#' replaces each one with the result of \\code{fn}. The base object (e.g.",
    sprintf(
      "#' \\code{%s}) is always included, even if it has not been set yet.",
      singular
    ),
    "#'",
    "#' @param fig A \\code{go_figure} object.",
    "#' @param selector Which objects to use: \\code{NULL} (all), indices into the",
    "#'   matching objects, a named list of property values that must all match,",
    "#'   or a function that takes an object and returns \\code{TRUE} or \\code{FALSE}.",
    "#' @param row,col Only objects in this subplot grid row and/or column",
    "#'   (figures created with \\code{\\link{make_subplots}()} only).",
    if (sy) {
      "#' @param secondary_y Only secondary (\\code{TRUE}) or primary (\\code{FALSE}) y axes."
    },
    if (root %in% ctx$object_roots) {
      sprintf(
        "#' @param patch A named list or %s object of property updates.",
        rd_link(ctx$object_fn[[root]])
      )
    } else {
      sprintf(
        "#' @param patch A named list of %s property updates (see section \"%s properties\").",
        singular,
        singular
      )
    },
    "#' @param ... Further named updates, by their full names.",
    "#' @param overwrite If \\code{TRUE}, replace nested objects instead of merging.",
    "#' @param fn A function that takes an object and returns the modified object.",
    "#'   If it returns anything other than a list, the object is left unchanged.",
    sprintf(
      "#' @return \\code{select_%s()} returns a named list of %s objects; the",
      plural,
      singular
    ),
    "#'   others return the modified figure.",
    "#'",
    if (root %in% ctx$object_roots) {
      sprintf(
        "#' @seealso %s for the properties of %s objects.",
        rd_link(ctx$object_fn[[root]]),
        singular
      )
    } else {
      c(
        sprintf("#' @section %s properties:", singular),
        property_describe(root, root, ctx),
        nested_sections(root, ctx)
      )
    },
    "#'",
    sprintf("#' @name update_%s", plural),
    "#' @noMd",
    "NULL",
    "",
    sprintf("#' @rdname update_%s", plural),
    "#' @export",
    sprintf("select_%s <- function(fig, %s) {", plural, sel_args),
    sprintf(
      '  select_layout_subplots(fig, "%s", selector, %s)',
      singular,
      pass
    ),
    "}",
    "",
    sprintf("#' @rdname update_%s", plural),
    "#' @export",
    sprintf(
      "update_%s <- function(fig, patch = NULL, ..., %s, overwrite = FALSE) {",
      plural,
      sel_args
    ),
    sprintf(
      '  update_layout_subplots(fig, "%s", patch, selector, list(...), overwrite, %s)',
      singular,
      pass
    ),
    "}",
    "",
    sprintf("#' @rdname update_%s", plural),
    "#' @export",
    sprintf("for_each_%s <- function(fig, fn, %s) {", singular, sel_args),
    sprintf(
      '  for_each_layout_subplot(fig, "%s", fn, selector, %s)',
      singular,
      pass
    ),
    "}",
    ""
  )
}

# Layout arrays whose elements have xref and yref (plotly.py layout_array_nodes).
layout_array_props <- function(validators) {
  keys <- grep("^layout\\.[a-z]+$", names(validators), value = TRUE)
  keys <- keys[vapply(
    keys,
    function(k) validators[[k]]$superclass == "CompoundArrayValidator",
    logical(1)
  )]
  keys[vapply(
    keys,
    function(k) {
      all(
        c("xref", "yref") %in%
          validators[[validators[[k]]$element_key]]$children
      )
    },
    logical(1)
  )]
}

layout_array_source <- function(array_key, ctx) {
  validators <- ctx$validators
  prop <- sub("^layout\\.", "", array_key)
  element_key <- validators[[array_key]]$element_key
  element <- validators[[element_key]]
  singular <- sub("^layout\\.", "", element_key)
  prefix <- if (singular == "image") "layout_" else "" # as plotly.py: add_layout_image()
  sing <- paste0(prefix, singular)
  plur <- paste0(prefix, prop)
  check_reserved(element$children, paste0("add_", sing))
  sel_args <- "selector = NULL, row = NULL, col = NULL, secondary_y = NULL"
  args <- c(
    "fig",
    "arg = NULL",
    "...",
    "data = NULL",
    paste0(element$children, " = NULL"),
    "row = NULL",
    "col = NULL",
    "secondary_y = NULL",
    "exclude_empty_subplots = FALSE",
    "skip_invalid = FALSE"
  )
  fig_docs <- FIGURE_ARG_DOCS[c(
    "fig",
    "row",
    "col",
    "secondary_y",
    "exclude_empty_subplots"
  )]
  fig_docs$data <- "A data frame in which formula properties (e.g. \\code{x = ~col}, \\code{text = ~label}) are evaluated, giving one object per row. Default: the data given to \\code{\\link{go_figure}()}."
  fig_docs$row <- "Subplot grid row whose axes the object refers to (figures created with \\code{\\link{make_subplots}()} only). May be \\code{\"all\"} or a vector to add the object to several cells."
  fig_docs$col <- "Subplot grid column whose axes the object refers to (see \\code{row})."
  fig_docs$secondary_y <- "If \\code{TRUE}, refer to the secondary y axis of the subplot."
  desc <- object_description(element_key, ctx)
  c(
    sprintf("#' Add %s layout %s", "a", singular),
    "#'",
    if (nzchar(desc)) c(roxygen_lines(desc), "#'"),
    roxygen_lines(sprintf(
      "\\code{add_%s()} adds %s %s to the figure's layout \\code{%s}. %s",
      sing,
      if (grepl("^[aeiou]", singular)) "an" else "a",
      singular,
      prop,
      "Nested objects are named lists, e.g. \\code{font = list(size = 14)}, or objects of the constructors their arguments name."
    )),
    "#'",
    roxygen_lines(sprintf(
      "Properties that take a single value may be given vectors, or formulas evaluated in \\code{data} (\\code{text = ~label}), to add several %s at once, one per element; the other properties are recycled.",
      prop
    )),
    "#'",
    "#' @param arg Optional named list of properties to start from. Named",
    "#'   arguments take precedence.",
    # nested objects are documented on the element's constructor page
    property_params(
      element_key,
      if (element_key %in% ctx$object_roots) "" else element_key,
      ctx,
      fig_docs
    ),
    dots_doc(),
    "#' @param skip_invalid If \\code{TRUE}, silently drop invalid properties",
    "#'   instead of raising an error.",
    "#' @return The modified figure.",
    sprintf(
      "#' @seealso %s",
      paste(
        c(
          rd_link(paste0("update_", plur)),
          if (element_key %in% ctx$object_roots) {
            rd_link(ctx$object_fn[[element_key]])
          }
        ),
        collapse = ", "
      )
    ),
    if (!element_key %in% ctx$object_roots) nested_sections(element_key, ctx),
    "#'",
    "#' @concept layout objects",
    "#' @noMd",
    "#' @export",
    sprintf("add_%s <- function(", sing),
    wrap_args(args),
    ") {",
    "  # properties that take one value may be vectors: one object per element",
    sprintf(
      '  add_layout_items(fig, "%s", "%s", arg, environment(), list(...), data, skip_invalid,',
      element_key,
      prop
    ),
    "    row, col, secondary_y, exclude_empty_subplots)",
    "}",
    "",
    sprintf("#' Select, update or modify %s", prop),
    "#'",
    sprintf(
      "#' \\code{select_%s()} returns the figure's %s matching \\code{selector}",
      plur,
      prop
    ),
    sprintf(
      "#' (and grid cell); \\code{update_%s()} updates their properties like",
      plur
    ),
    sprintf(
      "#' \\code{\\link{update_layout}()} does; \\code{for_each_%s()} replaces each one with",
      sing
    ),
    "#' the result of \\code{fn}.",
    "#'",
    "#' @param fig A \\code{go_figure} object.",
    "#' @param selector Which objects to use: \\code{NULL} (all), indices into the",
    "#'   matching objects, a named list of property values that must all match,",
    "#'   or a function that takes an object and returns \\code{TRUE} or \\code{FALSE}.",
    "#' @param row,col Only objects on this subplot grid row and/or column's axes.",
    "#' @param secondary_y Only objects on secondary (\\code{TRUE}) or primary (\\code{FALSE}) y axes.",
    sprintf(
      "#' @param patch A named list of property updates (see %s).",
      rd_link(paste0("add_", sing))
    ),
    "#' @param ... Further named updates, by their full names.",
    "#' @param overwrite If \\code{TRUE}, replace nested objects instead of merging.",
    "#' @param fn A function that takes an object and returns the modified object.",
    "#'   If it returns anything other than a list, the object is left unchanged.",
    sprintf(
      "#' @return \\code{select_%s()} returns a list of %s objects; the",
      plur,
      singular
    ),
    "#'   others return the modified figure.",
    sprintf("#' @seealso %s", rd_link(paste0("add_", sing))),
    sprintf("#' @name update_%s", plur),
    "#' @noMd",
    "NULL",
    "",
    sprintf("#' @rdname update_%s", plur),
    "#' @export",
    sprintf("select_%s <- function(fig, %s) {", plur, sel_args),
    sprintf(
      '  select_layout_array(fig, "%s", selector, row, col, secondary_y)',
      prop
    ),
    "}",
    "",
    sprintf("#' @rdname update_%s", plur),
    "#' @export",
    sprintf(
      "update_%s <- function(fig, patch = NULL, ..., %s, overwrite = FALSE) {",
      plur,
      sel_args
    ),
    sprintf(
      '  update_layout_array(fig, "%s", patch, selector, list(...), overwrite, row, col, secondary_y)',
      prop
    ),
    "}",
    "",
    sprintf("#' @rdname update_%s", plur),
    "#' @export",
    sprintf("for_each_%s <- function(fig, fn, %s) {", sing, sel_args),
    sprintf(
      '  for_each_layout_array(fig, "%s", fn, selector, row, col, secondary_y)',
      prop
    ),
    "}",
    ""
  )
}

write_figure <- function(ctx, outdir = ".") {
  validators <- ctx$validators
  traces <- sort(names(validators)[vapply(
    validators,
    function(v) !is.null(v$trace_type),
    logical(1)
  )])
  subplots <- SUBPLOT_TYPES[
    paste0("layout.", SUBPLOT_TYPES) %in% names(validators)
  ]
  arrays <- layout_array_props(validators)
  src <- c(
    sprintf(
      "# Generated by codegen/figure.R from the plotly.js %s schema. Do not edit by hand.",
      schema_version(outdir)
    ),
    "",
    update_layout_source(validators),
    unlist(lapply(traces, add_trace_source, validators = validators)),
    unlist(lapply(subplots, subplot_source, ctx = ctx)),
    unlist(lapply(arrays, layout_array_source, ctx = ctx))
  )
  writeLines(src, file.path(outdir, "R", "zz-gen-figure.R"))
  message(sprintf(
    "Wrote figure functions: add_<trace> for %d trace types; subplot functions for %s; layout array functions for %s",
    length(traces),
    paste(subplots, collapse = ", "),
    paste(sub("layout.", "", arrays, fixed = TRUE), collapse = ", ")
  ))
}

# update_layout(), with every layout property as an argument (documented
# with go_layout()'s).
update_layout_source <- function(validators) {
  props <- validators[["layout"]]$children
  bad <- intersect(props, c("fig", "patch", "overwrite"))
  if (length(bad)) {
    stop(
      "Layout properties clash with update_layout() arguments: ",
      paste(bad, collapse = ", ")
    )
  }
  c(
    "#' Update a figure's layout",
    "#'",
    "#' Updates layout properties, merging nested objects (e.g. \\code{xaxis}) with",
    "#' any existing values unless \\code{overwrite = TRUE}. Properties can be given",
    "#' in \\code{patch}, as arguments, or both; arguments are applied last.",
    "#' Nested properties are given as objects (\\code{xaxis = go_xaxis(title = \"x\")})",
    "#' or named lists, which are merged into the existing objects. \\code{NULL}",
    "#' removes a property. Numbered subplot properties (\\code{xaxis2},",
    "#' \\code{scene3}, ...) are given in \\code{...}.",
    "#'",
    "#' @param fig A \\code{go_figure} object.",
    "#' @param patch A named list or \\code{\\link{go_layout}()} object of updates.",
    "#' @param ... Numbered subplot properties (\\code{xaxis2 = go_xaxis(...)}).",
    "#' @param overwrite If \\code{TRUE}, replace nested objects instead of merging.",
    "#' @inheritParams go_layout",
    "#' @return The modified figure.",
    "#' @seealso \\code{\\link{go_layout}()}, \\code{\\link{update_xaxes}()} and the other",
    "#'   \\code{update_*()} functions.",
    "#' @export",
    "#' @examples",
    "#' go_figure() |>",
    "#'   update_layout(title = \"Title\", xaxis = go_xaxis(range = c(0, 10))) |>",
    "#'   update_layout(xaxis = go_xaxis(title = \"x\"), yaxis = go_yaxis(type = \"log\"))",
    "update_layout <- function(",
    wrap_args(c(
      "fig",
      "patch = NULL",
      "...",
      paste0(props, " = NULL"),
      "overwrite = FALSE"
    )),
    ") {",
    "  check_figure(fig)",
    "  # the properties given, NULL included (NULL removes a property)",
    sprintf("  args <- given_args(environment(), %s)", "LAYOUT_PROPERTIES"),
    "  layout <- update_object(",
    "    fig$layout,",
    '    "layout",',
    "    combine_patch(patch, c(args, list(...)), fig),",
    "    overwrite",
    "  )",
    "  modify_figure(fig, layout = layout)",
    "}",
    "",
    sprintf(
      "LAYOUT_PROPERTIES <- c(%s)",
      paste0('"', props, '"', collapse = ", ")
    ),
    ""
  )
}
