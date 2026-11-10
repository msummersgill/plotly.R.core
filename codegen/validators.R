# Validator parameter codegen (the R counterpart of plotly.py/codegen/validators.py).
#
# Produces one entry per schema node, keyed as in plotly.py's
# _validators.json. Each entry is a list with `superclass` (the base
# validator in R/basevalidators.R) plus the parameters it needs. Enumeration
# values are pre-split by type so validation does no parsing at runtime.

# Schema option name -> validator parameter name.
SIMPLE_PARAMS <- c(
  arrayOk = "array_ok", min = "min", max = "max", values = "values",
  flags = "flags", extras = "extras", items = "items", freeLength = "free_length",
  dimensions = "dimensions", regex = "regex", noBlank = "no_blank", strict = "strict",
  coerceNumber = "coerce_number"
)

# Extra values accepted by DashValidator (plotly.py adds a dash-length regex).
DASH_LIST_REGEX <- "/^\\d+(\\.\\d+)?(px|%)?((,|\\s)\\s*\\d+(\\.\\d+)?(px|%)?)*$/"

# Split a schema `values` list into character, numeric and logical values and
# regular expressions (strings written as "/.../").
split_enum_values <- function(values) {
  values <- lapply(values, function(v) if (is.null(v)) NA else v)
  is_chr <- vapply(values, is.character, logical(1))
  chr <- unlist(values[is_chr])
  is_rx <- if (length(chr)) startsWith(chr, "/") & endsWith(chr, "/") & nchar(chr) > 1 else logical()
  list(
    chr = chr[!is_rx] %||% character(),
    num = as.numeric(unlist(values[vapply(values, is.numeric, logical(1))])),
    lgl = as.logical(unlist(values[vapply(values, is.logical, logical(1))])),
    regex = if (any(is_rx)) substr(chr[is_rx], 2L, nchar(chr[is_rx]) - 1L) else character()
  )
}

# Validator parameters for a simple (valType) node.
simple_params <- function(data, val_type, superclass, key, nodes) {
  p <- list()
  for (opt in intersect(names(SIMPLE_PARAMS), names(data))) {
    p[[SIMPLE_PARAMS[[opt]]]] <- data[[opt]]
  }
  if (superclass == "DashValidator") p$values <- c(p$values, DASH_LIST_REGEX)
  if (!is.null(p$values)) p$values <- split_enum_values(p$values)
  if (val_type == "subplotid") {
    p$base <- data$dflt %||% sub("^/\\^(\\w+).*$", "\\1", data$regex)
  }
  if (val_type %in% c("flaglist")) {
    p$flags <- unlist(p$flags)
    p$extras <- unlist(p$extras) %||% character()
  }
  if (val_type == "info_array") p$items <- info_array_items(p$items)
  if (val_type == "color" && !is.null(nodes)) {
    # Numbers are valid colors when a colorscale sibling exists (plotly.py
    # stores the sibling's path as colorscale_path).
    parent_key <- sub("\\.[^.]+$", "", key)
    sib <- which(nodes$parent == parent_key & nodes$val_type == "colorscale")
    if (length(sib)) p$colorscale_path <- nodes$key[[sib[[1L]]]]
  }
  p
}

# Info array items are either one spec (applies to every element) or a list
# of per-position specs. Convert each spec into a validator entry.
info_array_items <- function(items) {
  single <- !is.null(names(items))
  specs <- if (single) list(items) else items
  entries <- lapply(specs, function(spec) {
    superclass <- paste0(gsub("(^|_)([a-z])", "\\U\\2", spec$valType, perl = TRUE), "Validator")
    c(list(superclass = superclass), simple_params(spec, spec$valType, superclass, "", NULL))
  })
  list(single = single, validators = entries)
}

build_validator_params <- function(nodes) {
  nodes$superclass <- base_validator(nodes)
  # Child property names per compound key, for unknown-property errors.
  children <- split(nodes$name, nodes$parent)

  out <- vector("list", nrow(nodes))
  names(out) <- nodes$key
  for (i in seq_len(nrow(nodes))) {
    key <- nodes$key[[i]]
    kind <- nodes$kind[[i]]
    superclass <- nodes$superclass[[i]]
    entry <- list(superclass = superclass)
    if (kind == "compound_array") {
      entry$element_key <- nodes$element_key[[i]]
      entry$data_class <- data_class_name(entry$element_key)
    } else if (superclass %in% c("CompoundValidator", "TitleValidator")) {
      entry$data_class <- data_class_name(key)
      entry$children <- children[[key]] %||% character()
      if (kind == "trace") entry$trace_type <- key
    } else {
      entry <- c(entry, simple_params(nodes$data[[i]], nodes$val_type[[i]], superclass, key, nodes))
    }
    out[[i]] <- entry
  }
  out
}
