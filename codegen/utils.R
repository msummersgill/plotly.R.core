# Schema reader for codegen (the R counterpart of plotly.py/codegen/utils.py).
#
# The plotly.js schema is flattened into a data.table with one row per
# "datatype" node: every simple property (has a valType), every compound
# object (nested attributes) and every compound array (role = "object" with
# `items`). Keys follow plotly.py's _validators.json convention:
#
#   scatter                         compound (trace root)
#   scatter.marker.size             simple
#   layout.xaxis                    compound
#   layout.xaxis.rangebreaks        compound array; its elements are
#   layout.xaxis.rangebreak.bounds  ... keyed by the singular element name

read_schema <- function(
  path = file.path("codegen", "resources", "plot-schema.json")
) {
  jsonlite::read_json(path, simplifyVector = FALSE)
}

# Keys in an attributes object that are metadata, not child properties.
NON_PROPERTY_KEYS <- c(
  "items",
  "impliedEdits",
  "transforms",
  "role",
  "editType",
  "description",
  "valType"
)

is_simple_node <- function(x) is.list(x) && !is.null(x$valType)

is_array_node <- function(x) {
  is.list(x) &&
    identical(x$role, "object") &&
    is.list(x$items) &&
    length(x$items) == 1L
}

is_compound_node <- function(x) {
  is.list(x) && !is_simple_node(x) && !is_array_node(x)
}

# Name of the generated constructor for a compound key, e.g.
# "scatter.marker" -> "go_scatter_marker". Used by the datatype codegen.
data_class_name <- function(key) {
  paste0("go_", gsub(".", "_", key, fixed = TRUE))
}

# Walk one attributes object and return a list of node records.
walk_attributes <- function(attrs, key) {
  out <- list()
  for (name in sort(names(attrs))) {
    if (!nzchar(name) || startsWith(name, "_") || name %in% NON_PROPERTY_KEYS) {
      next
    }
    x <- attrs[[name]]
    if (!is.list(x)) {
      next
    } # literals such as trace `type`
    child_key <- paste(key, name, sep = ".")
    if (is_simple_node(x)) {
      out[[length(out) + 1L]] <- node_record(
        child_key,
        key,
        name,
        "simple",
        x$valType,
        x
      )
    } else if (is_array_node(x)) {
      element_name <- names(x$items)[[1L]]
      element_key <- paste(key, element_name, sep = ".")
      out[[length(out) + 1L]] <- node_record(
        child_key,
        key,
        name,
        "compound_array",
        "compound_array",
        x,
        element_key = element_key
      )
      out[[length(out) + 1L]] <- node_record(
        element_key,
        key,
        element_name,
        "compound_element",
        "compound",
        x$items[[1L]]
      )
      out <- c(out, walk_attributes(x$items[[1L]], element_key))
    } else if (is_compound_node(x)) {
      out[[length(out) + 1L]] <- node_record(
        child_key,
        key,
        name,
        "compound",
        "compound",
        x
      )
      out <- c(out, walk_attributes(x, child_key))
    }
  }
  out
}

node_record <- function(
  key,
  parent,
  name,
  kind,
  val_type,
  data,
  element_key = NA_character_
) {
  list(
    key = key,
    parent = parent,
    name = name,
    kind = kind,
    val_type = val_type,
    element_key = element_key,
    description = data$description %||% NA_character_,
    data = list(data)
  )
}

`%||%` <- function(x, y) if (is.null(x)) y else x

# Flatten the schema into a node table.
#
# scope: NULL for the whole schema, or list(traces = <trace names>,
#   layout = <layout compound children to include>). Simple layout properties
#   are always included.
schema_nodes <- function(schema, scope = NULL) {
  traces <- names(schema$traces)
  if (!is.null(scope$traces)) {
    traces <- intersect(traces, scope$traces)
  }

  records <- list()
  for (tr in traces) {
    t <- schema$traces[[tr]]
    records[[length(records) + 1L]] <- node_record(
      tr,
      "",
      tr,
      "trace",
      "compound",
      t$attributes
    )
    records <- c(records, walk_attributes(t$attributes, tr))
  }

  layout_attrs <- merged_layout_attributes(schema)
  if (!is.null(scope$layout)) {
    keep <- vapply(
      names(layout_attrs),
      function(n) {
        is_simple_node(layout_attrs[[n]]) ||
          n %in% scope$layout ||
          !is.list(layout_attrs[[n]])
      },
      logical(1)
    )
    layout_attrs <- layout_attrs[keep]
  }
  records[[length(records) + 1L]] <- node_record(
    "layout",
    "",
    "layout",
    "layout",
    "compound",
    layout_attrs
  )
  records <- c(records, walk_attributes(layout_attrs, "layout"))

  nodes <- data.table::rbindlist(records)
  if (anyDuplicated(nodes$key)) {
    stop(
      "Duplicate schema keys: ",
      paste(nodes$key[duplicated(nodes$key)], collapse = ", ")
    )
  }
  nodes
}

# Layout attributes including those contributed by trace modules (barmode,
# boxgap, ...), as plotly.py's LayoutNode does. barpolar's go under polar.
merged_layout_attributes <- function(schema) {
  layout <- schema$layout$layoutAttributes
  for (tr in names(schema$traces)) {
    extra <- schema$traces[[tr]]$layoutAttributes
    if (!length(extra)) {
      next
    }
    if (tr == "barpolar") {
      for (n in names(extra)) {
        layout$polar[[n]] <- extra[[n]]
      }
    } else {
      for (n in setdiff(names(extra), names(layout))) {
        layout[[n]] <- extra[[n]]
      }
    }
  }
  layout
}

# plotly.py's choice of validator for each node (PlotlyNode.name_base_validator).
base_validator <- function(nodes) {
  vt <- nodes$val_type
  out <- paste0(gsub("(^|_)([a-z])", "\\U\\2", vt, perl = TRUE), "Validator")
  out[nodes$kind == "compound_array"] <- "CompoundArrayValidator"
  out[
    nodes$kind %in% c("compound", "compound_element", "trace", "layout")
  ] <- "CompoundValidator"
  out[nodes$name == "title" & nodes$kind == "compound"] <- "TitleValidator"
  out[endsWith(nodes$name, "dash") & vt == "string"] <- "DashValidator"
  out
}

read_named_colors <- function(
  path = file.path("codegen", "resources", "named-colors.txt")
) {
  x <- readLines(path)
  x[nzchar(x) & !startsWith(x, "#")]
}

# The core dimensional properties of each trace type: listed first in its
# go_<trace>() and add_<trace>() arguments and documentation (the rest are
# alphabetical). Types not listed use x, y, z.
TRACE_DIMENSIONS <- list(
  scatterpolar = c("r", "theta"),
  scatterpolargl = c("r", "theta"),
  barpolar = c("r", "theta"),
  scattergeo = c("lat", "lon", "locations"),
  scattermap = c("lat", "lon"),
  densitymap = c("lat", "lon", "z"),
  choropleth = c("locations", "z"),
  choroplethmap = c("locations", "z"),
  ohlc = c("x", "open", "high", "low", "close"),
  candlestick = c("x", "open", "high", "low", "close"),
  scatterternary = c("a", "b", "c"),
  scattersmith = c("real", "imag"),
  scattercarpet = c("a", "b"),
  carpet = c("a", "b", "x", "y"),
  contourcarpet = c("a", "b", "z"),
  pie = c("labels", "values"),
  funnelarea = c("labels", "values"),
  sunburst = c("labels", "parents", "values", "ids"),
  treemap = c("labels", "parents", "values", "ids"),
  icicle = c("labels", "parents", "values", "ids"),
  sankey = c("node", "link"),
  table = c("header", "cells"),
  parcoords = "dimensions",
  parcats = "dimensions",
  splom = "dimensions",
  indicator = "value",
  cone = c("x", "y", "z", "u", "v", "w"),
  streamtube = c("x", "y", "z", "u", "v", "w"),
  mesh3d = c("x", "y", "z", "i", "j", "k"),
  isosurface = c("x", "y", "z", "value"),
  volume = c("x", "y", "z", "value"),
  image = c("z", "source")
)

# `props` (property names of schema key `key`) in argument order: a trace's
# dimensions first, then the rest as given.
order_props <- function(key, props) {
  if (grepl(".", key, fixed = TRUE)) {
    return(props)
  }
  dims <- intersect(TRACE_DIMENSIONS[[key]] %||% c("x", "y", "z"), props)
  c(dims, setdiff(props, dims))
}
