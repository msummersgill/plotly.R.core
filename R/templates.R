# Figure templates (the R counterpart of plotly.py's plotly.io.templates).
#
# Built-in templates are the JSON files from plotly.py's package_data,
# bundled in inst/templates. A template is a named list with `layout` and
# `data` elements; `data` holds per-trace-type lists of default traces.

#' Figure templates
#'
#' Templates (themes) set default layout and trace properties for figures.
#' The built-in templates are those of plotly.py: `"plotly"` (the default),
#' `"plotly_white"`, `"plotly_dark"`, `"ggplot2"`, `"seaborn"`,
#' `"simple_white"`, `"presentation"`, `"xgridoff"`, `"ygridoff"`,
#' `"gridon"` and `"none"`. Templates can be combined with `"+"`, e.g.
#' `"plotly_white+presentation"`; later templates take precedence.
#'
#' Figures without a `layout$template` use the default template when they
#' are rendered. Plotly Express functions add their template to the figure.
#'
#' @param name Template name, or several joined with `"+"`.
#' @param template A named list with `layout` and/or `data` elements, e.g.
#'   `list(layout = list(font = list(family = "Georgia")))`.
#' @return `get_template()` returns the template as a named list.
#'   `template_names()` returns the available names. `default_template()`
#'   returns the default template name; with an argument it sets the default
#'   and returns the previous one invisibly. `register_template()` returns
#'   `name` invisibly.
#' @export
#' @examples
#' template_names()
#' tpl <- get_template("plotly_white+presentation")
#' tpl$layout$font
#'
#' register_template("big_font", list(layout = list(font = list(size = 20))))
#' old <- default_template("plotly+big_font")
#' default_template(old)
get_template <- function(name) {
  if (!is.character(name) || length(name) != 1L) stop("`name` must be a single string", call. = FALSE)
  parts <- strsplit(name, "+", fixed = TRUE)[[1L]]
  Reduce(merge_templates, lapply(parts, load_template))
}

#' @rdname get_template
#' @export
template_names <- function() {
  builtin <- c(sub("[.]json$", "", list.files(system.file("templates", package = "plotly.core"), "[.]json$")), "none")
  unique(c(builtin, ls(template_registry())))
}

#' @rdname get_template
#' @export
register_template <- function(name, template) {
  if (!is.character(name) || length(name) != 1L || grepl("+", name, fixed = TRUE)) {
    stop("`name` must be a single string without '+'", call. = FALSE)
  }
  assign(name, check_template(template), envir = template_registry())
  invisible(name)
}

#' @rdname get_template
#' @export
default_template <- function(name) {
  current <- getOption("plotly.core.template", "plotly")
  if (missing(name)) return(current)
  get_template(name) # validate
  options(plotly.core.template = name)
  invisible(current)
}

template_registry <- function() {
  if (is.null(the$templates)) the$templates <- new.env(parent = emptyenv())
  the$templates
}

load_template <- function(name) {
  reg <- template_registry()
  if (exists(name, envir = reg, inherits = FALSE)) return(reg[[name]])
  if (name == "none") return(list(data = list(scatter = list(list()))))
  path <- system.file("templates", paste0(name, ".json"), package = "plotly.core")
  if (!nzchar(path)) {
    stop(sprintf("Unknown template '%s'. Available templates: %s", name,
                 paste(template_names(), collapse = ", ")), call. = FALSE)
  }
  tpl <- jsonlite::read_json(path, simplifyVector = FALSE)
  assign(name, tpl, envir = reg)
  tpl
}

check_template <- function(template) {
  if (is.character(template) && length(template) == 1L) return(get_template(template))
  if (!is.list(template) || (length(template) && is.null(names(template))) ||
      !all(names(template) %in% c("layout", "data"))) {
    stop("A template must be a named list with `layout` and/or `data` elements", call. = FALSE)
  }
  template <- lapply(template, unclass)
  if (!is.null(template$layout)) template$layout <- plain_value(template$layout)
  template
}

# Merge two templates as plotly.py does: layouts are merged recursively;
# per-trace-type defaults are cycled to a common length and merged
# element-wise.
merge_templates <- function(t1, t2) {
  out <- t1
  out$layout <- deep_merge(t1$layout, t2$layout)
  for (type in union(names(t1$data), names(t2$data))) {
    a <- t1$data[[type]]
    b <- t2$data[[type]]
    if (length(a) && length(b)) {
      n <- length(a) * length(b) / gcd(length(a), length(b))
      a <- rep(a, length.out = n)
      b <- rep(b, length.out = n)
      out$data[[type]] <- Map(deep_merge, a, b)
    } else {
      out$data[[type]] <- if (length(b)) b else a
    }
  }
  out
}

gcd <- function(a, b) if (b == 0) a else gcd(b, a %% b)

# Recursive merge of named lists; values in `b` win.
deep_merge <- function(a, b) {
  if (is.null(a)) return(b)
  if (is.null(b)) return(a)
  if (!is.list(a) || !is.list(b) || is.null(names(b)) || is.null(names(a))) return(b)
  for (n in names(b)) a[n] <- list(deep_merge(a[[n]], b[[n]]))
  a
}

# Value at a path inside a template's layout, e.g. c("colorscale", "sequential").
template_layout_value <- function(template, path) {
  x <- template[["layout"]]
  for (p in path) {
    if (!is.list(x)) return(NULL)
    x <- x[[p]]
  }
  x
}
