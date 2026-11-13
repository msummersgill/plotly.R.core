# Base graph object support (the R counterpart of plotly.py's
# basedatatypes.BasePlotlyType). The generated go_*() constructors in
# R/zz-gen-*.R call plotly_object(); the S3 methods below keep objects valid
# when they are modified with `$<-` or `[[<-`.
#
# A graph object is a validated named list classed
# c("<data_class>", "plotly_obj"), e.g. c("go_scatter_marker", "plotly_obj").

# Build a graph object for schema `key` from a starting object/list `arg`,
# the constructor's named property arguments (read from `env`) and extra
# properties in `dots`, which may use plotly.py's "magic underscore" paths
# (e.g. marker_size = 10). Later sources take precedence.
#
# Values may be one-sided formulas (x = ~col): they are evaluated in `data`
# (add_<trace>()'s data or the figure's), or in their environment.
plotly_object <- function(key, arg = NULL, env = NULL, dots = list(), skip_invalid = FALSE, data = NULL) {
  entry <- get_validator(key)
  problems <- list()
  props <- if (is.null(arg)) list() else {
    if (!is.list(arg) || is.data.frame(arg)) {
      stop(sprintf("The first argument to %s() must be a named list or %s object, not %s",
                   entry$data_class, entry$data_class, value_type(arg)), call. = FALSE)
    }
    unclass(arg)
  }
  if (!is.null(entry$trace_type)) props$type <- NULL
  if (!is.null(env)) {
    for (name in entry$children) {
      val <- get(name, envir = env, inherits = FALSE)
      if (!is.null(val)) props[[name]] <- eval_formulas(val, data, name)
    }
  }
  if (length(dots)) {
    if (is.null(names(dots)) || any(!nzchar(names(dots)))) {
      stop(sprintf("All arguments to %s() must be named", entry$data_class), call. = FALSE)
    }
    for (i in seq_along(dots)) {
      val <- eval_formulas(dots[[i]], data, names(dots)[[i]])
      props <- tryCatch(set_magic_property(props, key, entry, names(dots)[[i]], val, skip_invalid), error = function(e) {
        if (!inherits(e, INVALID_CONDITIONS)) stop(e)
        problems[[length(problems) + 1L]] <<- e
        props
      })
    }
  }
  # invalid arguments are reported together with the other invalid properties
  out <- tryCatch(vc_compound(props, key, entry, skip_invalid), error = function(e) {
    if (!length(problems) || !inherits(e, INVALID_CONDITIONS)) stop(e)
    problems <<- c(problems, e$problems %||% list(e))
    NULL
  })
  if (length(problems)) raise_collected(problems)
  if (!is.null(entry$trace_type)) out <- add_trace_type(out, entry$trace_type)
  out
}

# Evaluate one-sided formulas (also inside plain nested lists) in `data`.
eval_formulas <- function(x, data, name) {
  if (inherits(x, "formula")) {
    rhs <- x[[length(x)]]
    return(tryCatch(eval(rhs, if (is.null(data)) list() else data, environment(x)), error = function(e) {
      stop(sprintf("Couldn't evaluate `%s` for property '%s': %s%s", paste(deparse(x), collapse = " "), name,
                   conditionMessage(e),
                   if (is.null(data)) "\n(no data: pass `data` to add_*() or pipe a data frame into go_figure())" else ""),
           call. = FALSE)
    }))
  }
  if (is.list(x) && !is.data.frame(x) && is.null(oldClass(x))) x[] <- lapply(names(x) %||% seq_along(x), function(n) eval_formulas(x[[n]], data, paste(name, n, sep = "_")))
  x
}

# Put the trace type first, as plotly.py does.
add_trace_type <- function(x, type) {
  cls <- class(x)
  x <- unclass(x)
  x$type <- NULL
  x <- c(list(type = type), x)
  class(x) <- cls
  x
}

# Set a property given a plain or "magic underscore" name: "marker_size"
# sets props$marker$size. Names that are themselves properties (error_x,
# paper_bgcolor) win over splitting.
set_magic_property <- function(props, key, entry, name, value, skip_invalid = FALSE) {
  if (!is.na(child_key(key, name)) || (!is.null(entry$trace_type) && name == "type")) {
    props[name] <- list(value)
    return(props)
  }
  pos <- gregexpr("_", name, fixed = TRUE)[[1L]]
  for (p in pos[pos > 0L]) {
    head <- substr(name, 1L, p - 1L)
    rest <- substr(name, p + 1L, nchar(name))
    ck <- child_key(key, head)
    if (is.na(ck)) next
    child <- get_validator(ck)
    if (!child$superclass %in% c("CompoundValidator", "TitleValidator")) next
    sub_props <- props[[head]]
    if (is.character(sub_props) && child$superclass == "TitleValidator") sub_props <- list(text = sub_props)
    sub_props <- if (is.null(sub_props)) list() else unclass(sub_props)
    props[[head]] <- set_magic_property(sub_props, ck, child, rest, value, skip_invalid)
    return(props)
  }
  if (skip_invalid) return(props)
  raise_invalid_prop(name, key, entry)
}

# Map a data class (e.g. "go_scatter_marker") back to its schema key.
class_key <- function(data_class) {
  if (is.null(the$class_keys)) {
    env <- validators_env()
    keys <- ls(env)
    classes <- vapply(keys, function(k) {
      e <- env[[k]]
      if (e$superclass %in% c("CompoundValidator", "TitleValidator")) e$data_class else NA_character_
    }, character(1))
    the$class_keys <- structure(keys[!is.na(classes)], names = classes[!is.na(classes)])
  }
  the$class_keys[[data_class]]
}

set_property <- function(x, name, value) {
  key <- class_key(class(x)[[1L]])
  entry <- get_validator(key)
  cls <- class(x)
  x <- unclass(x)
  if (!is.null(entry$trace_type) && identical(name, "type")) {
    if (!identical(value, entry$trace_type)) {
      stop(sprintf("Cannot change the type of a %s trace", entry$trace_type), call. = FALSE)
    }
  } else {
    ck <- child_key(key, name)
    if (is.na(ck)) raise_invalid_prop(name, key, entry)
    x[name] <- list(validate_coerce(value, ck))
    if (is.null(value)) x[[name]] <- NULL
  }
  class(x) <- cls
  x
}

#' Modify graph objects
#'
#' Setting a property of a graph object (created by a `go_*()` constructor)
#' validates the new value, just like the constructor does. Setting a
#' property to `NULL` removes it.
#'
#' @param x A graph object.
#' @param name,i Property name.
#' @param value New value.
#' @return The modified graph object.
#' @name plotly_obj-modify
#' @examples
#' m <- go_scatter_marker(size = 10)
#' m$color <- "red"
#' m[["symbol"]] <- "diamond"
#' try(m$size <- -1)
NULL

#' @rdname plotly_obj-modify
#' @export
`$<-.plotly_obj` <- function(x, name, value) set_property(x, name, value)

#' @rdname plotly_obj-modify
#' @export
`[[<-.plotly_obj` <- function(x, i, value) {
  if (is.character(i) && length(i) == 1L) set_property(x, i, value) else NextMethod()
}

#' Print a graph object
#'
#' Prints the object's class and its properties as JSON.
#'
#' @param x A graph object.
#' @param ... Unused.
#' @return `x`, invisibly.
#' @export
print.plotly_obj <- function(x, ...) {
  cat("<", class(x)[[1L]], ">\n", sep = "")
  cat(jsonlite::prettify(to_JSON(unclass(x)), indent = 2), sep = "\n")
  invisible(x)
}
