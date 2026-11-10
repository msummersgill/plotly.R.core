# Codegen entry point (the R counterpart of plotly.py/codegen/__init__.py).
# Run with `Rscript commands.R codegen` from the package root.

# Which parts of the schema to generate. NULL generates everything; the
# initial pass covers a simple 2D scatter plot.
CODEGEN_SCOPE <- list(
  traces = "scatter",
  layout = c("xaxis", "yaxis", "title", "font", "legend", "margin", "hoverlabel")
)

perform_codegen <- function(outdir = ".", scope = CODEGEN_SCOPE) {
  schema <- read_schema(file.path(outdir, "codegen", "resources", "plot-schema.json"))
  nodes <- schema_nodes(schema, scope)
  validators <- build_validator_params(nodes)

  # Every superclass used must be implemented in R/basevalidators.R.
  used <- unique(c(
    vapply(validators, `[[`, "", "superclass"),
    unlist(lapply(validators, function(v) vapply(v$items$validators, `[[`, "", "superclass")))
  ))
  impl <- readLines(file.path(outdir, "R", "basevalidators.R"))
  missing <- used[!vapply(used, function(s) any(grepl(paste0('"', s, '"'), impl, fixed = TRUE)), logical(1))]
  if (length(missing)) stop("Validators not implemented in R/basevalidators.R: ", paste(missing, collapse = ", "))

  .validators <- validators
  .named_colors <- read_named_colors(file.path(outdir, "codegen", "resources", "named-colors.txt"))
  .named_colorscales <- plotly_colorscale_names(schema)
  save(.validators, .named_colors, .named_colorscales,
       file = file.path(outdir, "R", "sysdata.rda"), compress = "xz")

  message(sprintf(
    "Generated %d validators (%d compound, %d compound array) for traces: %s",
    length(validators),
    sum(vapply(validators, function(v) v$superclass %in% c("CompoundValidator", "TitleValidator"), logical(1))),
    sum(vapply(validators, function(v) v$superclass == "CompoundArrayValidator", logical(1))),
    paste(scope$traces %||% "all", collapse = ", ")
  ))
  invisible(validators)
}
