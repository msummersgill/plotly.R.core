# Figure function codegen (the R counterpart of plotly.py/codegen/figure.py).
#
# Writes R/zz-gen-figure.R with
#   - add_<trace>(fig, <trace properties>, ...) for every trace type, and
#   - select_<subplots>(), for_each_<subplot>(), update_<subplots>() for every
#     layout subplot type (xaxis, yaxis, legend, ...).
# The functions are thin wrappers around helpers in R/basefigure.R.

# Arguments of add_<trace>() that are not trace properties.
FIGURE_RESERVED_ARGS <- c("fig", "skip_invalid")

# Layout subplot containers (plotly.py BaseLayoutType._subplotid_prop_names).
SUBPLOT_TYPES <- c("coloraxis", "geo", "legend", "map", "mapbox", "polar",
                   "scene", "smith", "ternary", "xaxis", "yaxis")

# English plural, as plotly.py's inflect produces for subplot names.
pluralize <- function(x) {
  ifelse(grepl("is$", x), sub("is$", "es", x),
  ifelse(grepl("x$", x), paste0(x, "es"),
  ifelse(grepl("[^aeiou]y$", x), sub("y$", "ies", x), paste0(x, "s"))))
}

add_trace_source <- function(trace, nodes, validators) {
  entry <- validators[[trace]]
  props <- entry$children
  bad <- intersect(props, FIGURE_RESERVED_ARGS)
  if (length(bad)) stop("Trace properties clash with add_", trace, "() arguments: ", paste(bad, collapse = ", "))
  fn <- paste0("add_", trace)
  args <- c("fig", paste0(props, " = NULL"), "...", "skip_invalid = FALSE")
  c(
    sprintf("#' Add a %s trace to a figure", trace),
    "#'",
    sprintf("#' Creates a trace with %s and adds it to the figure with", rd_link(entry$data_class)),
    sprintf("#' %s.", rd_link("add_trace")),
    "#'",
    "#' @param fig A \\code{go_figure} object.",
    sprintf("#' @inheritParams %s", entry$data_class),
    "#' @return The modified figure.",
    sprintf("#' @seealso %s, %s", rd_link(entry$data_class), rd_link("go_figure")),
    "#' @noMd",
    "#' @export",
    "#' @examples",
    sprintf("#' fig <- go_figure() |> %s(x = 1:3, y = c(2, 1, 3), marker_color = \"red\")", fn),
    sprintf("%s <- function(", fn),
    wrap_args(args),
    ") {",
    sprintf('  add_trace(fig, plotly_object("%s", NULL, environment(), list(...), skip_invalid))', trace),
    "}",
    ""
  )
}

subplot_source <- function(singular, validators) {
  plural <- pluralize(singular)
  entry <- validators[[paste0("layout.", singular)]]
  c(
    sprintf("#' Select, update or modify %s objects", singular),
    "#'",
    sprintf("#' Work with all of a figure's layout %s objects (\\code{%s}, \\code{%s2}, \\code{%s3}, ...).", singular, singular, singular, singular),
    sprintf("#' \\code{select_%s()} returns them as a named list, \\code{update_%s()} updates", plural, plural),
    sprintf("#' their properties like \\code{\\link{update_layout}()} does, and \\code{for_each_%s()}", singular),
    "#' replaces each one with the result of \\code{fn}. The base object (e.g.",
    sprintf("#' \\code{%s}) is always included, even if it has not been set yet.", singular),
    "#'",
    "#' @param fig A \\code{go_figure} object.",
    "#' @param selector Which objects to use: \\code{NULL} (all), a named list of",
    "#'   property values that must all match, or a function that takes an object",
    "#'   and returns \\code{TRUE} or \\code{FALSE}.",
    sprintf("#' @param patch A named list or %s object of property updates.", rd_link(entry$data_class)),
    "#' @param ... Further named updates (names may use magic underscores).",
    "#' @param overwrite If \\code{TRUE}, replace nested objects instead of merging.",
    "#' @param fn A function that takes an object and returns the modified object.",
    "#'   If it returns anything other than a list, the object is left unchanged.",
    sprintf("#' @return \\code{select_%s()} returns a named list of %s objects; the", plural, rd_link(entry$data_class)),
    "#'   others return the modified figure.",
    sprintf("#' @name update_%s", plural),
    "#' @noMd",
    "#' @examples",
    sprintf("#' fig <- go_figure() |> update_%s(title_text = \"%s\")", plural, singular),
    sprintf("#' names(select_%s(fig))", plural),
    "NULL",
    "",
    sprintf("#' @rdname update_%s", plural),
    "#' @export",
    sprintf("select_%s <- function(fig, selector = NULL) {", plural),
    sprintf('  select_layout_subplots(fig, "%s", selector)', singular),
    "}",
    "",
    sprintf("#' @rdname update_%s", plural),
    "#' @export",
    sprintf("update_%s <- function(fig, patch = NULL, selector = NULL, ..., overwrite = FALSE) {", plural),
    sprintf('  update_layout_subplots(fig, "%s", patch, selector, list(...), overwrite)', singular),
    "}",
    "",
    sprintf("#' @rdname update_%s", plural),
    "#' @export",
    sprintf("for_each_%s <- function(fig, fn, selector = NULL) {", singular),
    sprintf('  for_each_layout_subplot(fig, "%s", fn, selector)', singular),
    "}",
    ""
  )
}

write_figure <- function(validators, outdir = ".") {
  traces <- names(validators)[vapply(validators, function(v) !is.null(v$trace_type), logical(1))]
  subplots <- SUBPLOT_TYPES[paste0("layout.", SUBPLOT_TYPES) %in% names(validators)]
  src <- c(
    sprintf("# Generated by codegen/figure.R from the plotly.js %s schema. Do not edit by hand.", schema_version(outdir)),
    "",
    unlist(lapply(sort(traces), add_trace_source, validators = validators)),
    unlist(lapply(subplots, subplot_source, validators = validators))
  )
  writeLines(src, file.path(outdir, "R", "zz-gen-figure.R"))
  message(sprintf("Wrote figure functions: add_%s; select/update/for_each for %s",
                  paste(sort(traces), collapse = ", add_"), paste(subplots, collapse = ", ")))
}
