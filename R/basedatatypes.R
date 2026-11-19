# Base graph object support (the R counterpart of plotly.py's
# basedatatypes.BasePlotlyType). The generated go_*() constructors in
# R/zz-gen-*.R call plotly_object(); the S3 methods below keep objects valid
# when they are modified with `$<-` or `[[<-`.
#
# A graph object is a validated named list classed
# c("<data_class>", "plotly_obj"), e.g. c("go_scatter_marker", "plotly_obj").

# Build a graph object for schema `key` from a starting object/list `arg`,
# the constructor's named property arguments (read from `env`) and extra
# properties in `dots` (full property names, e.g. xaxis2 in a layout). Later
# sources take precedence.
#
# Values may be one-sided formulas (x = ~col): they are evaluated in `data`
# (add_<trace>()'s data or the figure's), or in their environment. Constructors
# (go_scatter(), go_scatter_marker(), ...) don't pass `data`: they keep formulas
# as they are, for add_<trace>() or add_trace() to evaluate (see vc_compound()).
plotly_object <- function(
  key,
  arg = NULL,
  env = NULL,
  dots = list(),
  skip_invalid = FALSE,
  data = NULL
) {
  entry <- get_validator(key)
  defer <- missing(data)
  if (inherits(arg, "go_figure")) {
    figure_as_arg(sys.call(-1L)[[1L]], key, entry)
  }
  problems <- list()
  props <- if (is.null(arg)) {
    list()
  } else {
    if (!is.list(arg) || is.data.frame(arg)) {
      stop(
        sprintf(
          "The first argument to %s() must be a named list or %s object, not %s",
          entry$data_class,
          entry$data_class,
          value_type(arg)
        ),
        call. = FALSE
      )
    }
    unclass(arg)
  }
  if (!is.null(entry$trace_type)) {
    props$type <- NULL
  }
  if (!is.null(env)) {
    for (name in entry$children) {
      val <- get(name, envir = env, inherits = FALSE)
      if (!is.null(val)) {
        props[[name]] <- if (defer) val else eval_formulas(val, data, name)
      }
    }
  }
  if (length(dots)) {
    if (is.null(names(dots)) || any(!nzchar(names(dots)))) {
      stop(
        sprintf("All arguments to %s() must be named", entry$data_class),
        call. = FALSE
      )
    }
    for (i in seq_along(dots)) {
      val <- if (defer) {
        dots[[i]]
      } else {
        eval_formulas(dots[[i]], data, names(dots)[[i]])
      }
      props <- tryCatch(
        set_named_property(
          props,
          key,
          entry,
          names(dots)[[i]],
          val,
          skip_invalid
        ),
        error = function(e) {
          if (!inherits(e, INVALID_CONDITIONS)) {
            stop(e)
          }
          problems[[length(problems) + 1L]] <<- e
          props
        }
      )
    }
  }
  # invalid arguments are reported together with the other invalid properties
  out <- tryCatch(
    vc_compound(props, key, entry, skip_invalid),
    error = function(e) {
      if (!length(problems) || !inherits(e, INVALID_CONDITIONS)) {
        stop(e)
      }
      problems <<- c(problems, e$problems %||% list(e))
      NULL
    }
  )
  if (length(problems)) {
    raise_collected(problems)
  }
  if (!is.null(entry$trace_type)) {
    out <- add_trace_type(out, entry$trace_type)
  }
  out
}

# Figure functions for layout objects that have one.
FIGURE_FUNCTIONS <- c(
  "layout.annotation" = "add_annotation",
  "layout.shape" = "add_shape",
  "layout.image" = "add_layout_image",
  "layout.selection" = "add_selection",
  "layout.coloraxis" = "update_coloraxes",
  "layout.geo" = "update_geos",
  "layout.legend" = "update_legends",
  "layout.map" = "update_maps",
  "layout.polar" = "update_polars",
  "layout.scene" = "update_scenes",
  "layout.smith" = "update_smiths",
  "layout.ternary" = "update_ternaries",
  "layout.xaxis" = "update_xaxes",
  "layout.yaxis" = "update_yaxes"
)

# A figure piped into a go_*() constructor (fig |> go_scatter(...)): the
# constructor creates a standalone object, so point to what adds it to a figure.
figure_as_arg <- function(fn, key, entry) {
  fn <- if (is.character(fn)) fn else paste(deparse(fn), collapse = "")
  fn <- sub("^.*::", "", fn)
  how <- if (!is.null(entry$trace_type)) {
    sprintf(
      "To add a %s trace to a figure, use add_%s(fig, ...).",
      entry$trace_type,
      entry$trace_type
    )
  } else if (identical(key, "layout")) {
    "To change a figure's layout, use update_layout(fig, ...)."
  } else if (!is.null(key) && !is.na(FIGURE_FUNCTIONS[key])) {
    sprintf("To add it to a figure, use %s(fig, ...).", FIGURE_FUNCTIONS[[key]])
  } else if (!is.null(key) && grepl("^layout\\.[a-z]+$", key)) {
    sprintf(
      "To add it to a figure, use update_layout(fig, %s = %s(...)).",
      prop_name(key),
      fn
    )
  } else {
    sprintf(
      "Use it as a property of a trace or the layout instead, e.g. update_layout(fig, <property> = %s(...)).",
      fn
    )
  }
  stop(
    sprintf(
      "%s() creates an object, not a figure, and can't take a figure as its first argument. %s",
      fn,
      how
    ),
    call. = FALSE
  )
}

# Does `x` hold a one-sided formula, at any depth?
has_formula <- function(x) {
  inherits(x, "formula") ||
    (is.list(x) && !is.data.frame(x) && any(vapply(x, has_formula, logical(1))))
}

# Evaluate one-sided formulas (also inside nested lists and graph objects that
# kept them: go_scatter_marker(color = ~col)) in `data`. Graph objects with
# formulas become plain lists again, to be validated with the values.
eval_formulas <- function(x, data, name) {
  if (inherits(x, "plotly_obj") && has_formula(x)) {
    x <- unclass(x)
  }
  if (inherits(x, "formula")) {
    rhs <- x[[length(x)]]
    return(tryCatch(
      eval(rhs, if (is.null(data)) list() else data, environment(x)),
      error = function(e) {
        stop(
          sprintf(
            "Couldn't evaluate `%s` for property '%s': %s%s",
            paste(deparse(x), collapse = " "),
            name,
            conditionMessage(e),
            if (is.null(data)) {
              "\n(no data: pass `data` to add_*() or pipe a data frame into go_figure())"
            } else {
              ""
            }
          ),
          call. = FALSE
        )
      }
    ))
  }
  if (is.list(x) && !is.data.frame(x) && is.null(oldClass(x))) {
    x[] <- lapply(names(x) %||% seq_along(x), function(n) {
      eval_formulas(x[[n]], data, paste(name, n, sep = "."))
    })
  }
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

# Set a property given its full name; unknown names are invalid.
set_named_property <- function(
  props,
  key,
  entry,
  name,
  value,
  skip_invalid = FALSE
) {
  if (
    !is.na(child_key(key, name)) ||
      (!is.null(entry$trace_type) && name == "type")
  ) {
    props[name] <- list(value)
    return(props)
  }
  if (skip_invalid) {
    return(props)
  }
  raise_invalid_prop(name, key, entry)
}

# Shared object types -------------------------------------------------------------
#
# go_font(), go_colorbar(), ... (R/zz-gen-shared.R) create objects that may be
# used wherever the schema has an object of that type. The schema's versions
# differ slightly, so an object is checked against each variant when it is
# created (it must be valid for at least one) and against the exact schema key
# when it is placed in a figure (see vc_compound()).

shared_types <- function() .shared_types

# Shared type of schema key `key`, or NA.
shared_type_of <- function(key) {
  if (is.null(the$shared_of)) {
    types <- shared_types()
    the$shared_of <- unlist(lapply(names(types), function(t) {
      stats::setNames(rep(t, length(types[[t]]$keys)), types[[t]]$keys)
    }))
  }
  unname(the$shared_of[key])
}

shared_object <- function(
  type,
  arg = NULL,
  env = NULL,
  dots = list(),
  skip_invalid = FALSE
) {
  info <- shared_types()[[type]]
  fn <- paste0("go_", type)
  if (inherits(arg, "go_figure")) {
    figure_as_arg(fn, NULL, NULL)
  }
  props <- if (is.null(arg)) {
    list()
  } else {
    if (!is.list(arg) || is.data.frame(arg)) {
      stop(
        sprintf(
          "The first argument to %s() must be a named list or %s object, not %s",
          fn,
          fn,
          value_type(arg)
        ),
        call. = FALSE
      )
    }
    unclass(arg)
  }
  if (!is.null(env)) {
    for (name in info$fields) {
      val <- get(name, envir = env, inherits = FALSE)
      if (!is.null(val)) props[[name]] <- val
    }
  }
  if (length(dots)) {
    if (is.null(names(dots)) || any(!nzchar(names(dots)))) {
      stop(sprintf("All arguments to %s() must be named", fn), call. = FALSE)
    }
    props[names(dots)] <- dots
  }
  validate_shared(props, type, skip_invalid)
}

# Validate `props` as a shared object of `type`: valid if any variant accepts
# them. Errors are reported for the variant with the fewest problems.
validate_shared <- function(props, type, skip_invalid = FALSE) {
  info <- shared_types()[[type]]
  fn <- paste0("go_", type)
  props <- unclass(props)
  unknown <- setdiff(names(props), info$fields)
  if (length(unknown)) {
    if (skip_invalid) {
      props <- props[setdiff(names(props), unknown)]
    } else {
      raise_invalid_prop(
        unknown[[1L]],
        info$variants[[1L]],
        list(children = info$fields, label = paste0(fn, "()"))
      )
    }
  }
  best <- NULL
  for (key in info$variants) {
    res <- tryCatch(
      vc_compound(props, key, get_validator(key), skip_invalid),
      error = function(e) e
    )
    if (!inherits(res, "error")) {
      out <- unclass(res)
      class(out) <- c(fn, "plotly_shared", "plotly_obj")
      return(out)
    }
    if (!inherits(res, INVALID_CONDITIONS)) {
      stop(res)
    }
    n <- length(res$problems %||% list(res))
    if (is.null(best) || n < best$n) {
      best <- list(n = n, error = res, key = key)
    }
  }
  # name the constructor rather than the schema key it was checked against
  e <- best$error
  e$message <- gsub(
    best$key,
    paste0(fn, "()"),
    conditionMessage(e),
    fixed = TRUE
  )
  stop(e)
}

# Map a data class (e.g. "go_scatter_marker") back to its schema key.
class_key <- function(data_class) {
  if (is.null(the$class_keys)) {
    env <- validators_env()
    keys <- ls(env)
    classes <- vapply(
      keys,
      function(k) {
        e <- env[[k]]
        if (e$superclass %in% c("CompoundValidator", "TitleValidator")) {
          e$data_class
        } else {
          NA_character_
        }
      },
      character(1)
    )
    the$class_keys <- structure(
      keys[!is.na(classes)],
      names = classes[!is.na(classes)]
    )
  }
  the$class_keys[[data_class]]
}

set_property <- function(x, name, value) {
  if (inherits(x, "plotly_shared")) {
    type <- sub("^go_", "", class(x)[[1L]])
    x <- unclass(x)
    x[name] <- list(value)
    if (is.null(value)) {
      x[[name]] <- NULL
    }
    return(validate_shared(x, type))
  }
  key <- class_key(class(x)[[1L]])
  entry <- get_validator(key)
  cls <- class(x)
  x <- unclass(x)
  if (!is.null(entry$trace_type) && identical(name, "type")) {
    if (!identical(value, entry$trace_type)) {
      stop(
        sprintf("Cannot change the type of a %s trace", entry$trace_type),
        call. = FALSE
      )
    }
  } else {
    ck <- child_key(key, name)
    if (is.na(ck)) {
      raise_invalid_prop(name, key, entry)
    }
    # a formula is kept for add_<trace>() to evaluate (see vc_compound())
    x[name] <- list(
      if (inherits(value, "formula")) value else validate_coerce(value, ck)
    )
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
#' f <- go_font(size = 10)
#' f$color <- "red"
#' f[["family"]] <- "Georgia"
#' try(f$size <- -1)
#'
#' tr <- go_scatter(x = 1:3, y = 3:1)
#' tr$mode <- "markers"
#' tr$marker <- list(size = 12, color = "red")
NULL

#' @rdname plotly_obj-modify
#' @export
`$<-.plotly_obj` <- function(x, name, value) set_property(x, name, value)

#' @rdname plotly_obj-modify
#' @export
`[[<-.plotly_obj` <- function(x, i, value) {
  if (is.character(i) && length(i) == 1L) {
    set_property(x, i, value)
  } else {
    NextMethod()
  }
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
  cls <- class(x)[[1L]]
  label <- if (inherits(x, "plotly_shared")) {
    cls
  } else {
    key <- class_key(cls)
    entry <- get_validator(key)
    if (is.null(entry$trace_type) && key != "layout") key else cls
  }
  cat("<", label, ">\n", sep = "")
  cat(jsonlite::prettify(to_JSON(unclass(x)), indent = 2), sep = "\n")
  invisible(x)
}
