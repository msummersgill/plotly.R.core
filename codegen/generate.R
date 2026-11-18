# Codegen entry point (the R counterpart of plotly.py/codegen/__init__.py).
# Run with `Rscript commands.R codegen` from the package root.

# Which parts of the schema to generate: NULL generates everything, or
# list(traces = <trace names>, layout = <layout compound properties>) limits
# the output (simple layout properties are always included).
CODEGEN_SCOPE <- NULL

perform_codegen <- function(outdir = ".", scope = CODEGEN_SCOPE) {
  schema <- read_schema(file.path(
    outdir,
    "codegen",
    "resources",
    "plot-schema.json"
  ))
  nodes <- schema_nodes(schema, scope)
  validators <- build_validator_params(nodes)

  # Every superclass used must be implemented in R/basevalidators.R.
  used <- unique(c(
    vapply(validators, `[[`, "", "superclass"),
    unlist(lapply(validators, function(v) {
      vapply(v$items$validators, `[[`, "", "superclass")
    }))
  ))
  impl <- readLines(file.path(outdir, "R", "basevalidators.R"))
  missing <- used[
    !vapply(
      used,
      function(s) any(grepl(paste0('"', s, '"'), impl, fixed = TRUE)),
      logical(1)
    )
  ]
  if (length(missing)) {
    stop(
      "Validators not implemented in R/basevalidators.R: ",
      paste(missing, collapse = ", ")
    )
  }

  .validators <- validators
  .named_colors <- read_named_colors(file.path(
    outdir,
    "codegen",
    "resources",
    "named-colors.txt"
  ))
  .config_options <- sort(names(schema$config))
  ctx <- doc_context(nodes, validators, schema)
  .shared_types <- shared_types_data(ctx)
  # constructor of each object, for messages
  .constructors <- c(
    ctx$object_fn,
    stats::setNames(paste0("go_", ctx$shared_of), names(ctx$shared_of))
  )
  save(
    .validators,
    .named_colors,
    .config_options,
    .shared_types,
    .constructors,
    file = file.path(outdir, "R", "sysdata.rda"),
    compress = "xz"
  )

  write_datatypes(ctx, outdir)
  write_figure(ctx, outdir)
  write_colors(outdir)

  message(sprintf(
    "Generated %d validators (%d compound, %d compound array) for traces: %s",
    length(validators),
    sum(vapply(
      validators,
      function(v) v$superclass %in% c("CompoundValidator", "TitleValidator"),
      logical(1)
    )),
    sum(vapply(
      validators,
      function(v) v$superclass == "CompoundArrayValidator",
      logical(1)
    )),
    paste(scope$traces %||% "all", collapse = ", ")
  ))
  invisible(validators)
}
