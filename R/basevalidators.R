# Base validators (the R counterpart of plotly.py/_plotly_utils/basevalidators.py).
#
# The per-property parameters are generated from the plotly.js schema by
# codegen/validators.R and stored in R/sysdata.rda as `.validators`, keyed
# like plotly.py's _validators.json ("scatter.marker.size", "layout.xaxis",
# ...). Each entry names a `superclass`, one of the validators below, which
# checks a value and converts it into the form plotly.js expects.
#
# R-specific conventions:
# - A length-1 atomic vector is a scalar; longer vectors are arrays. Values
#   that must be arrays (data arrays, info arrays) are kept as arrays even at
#   length 1, so they serialise as JSON arrays.
# - Factors are treated as character vectors.
# - NA is allowed inside arrays and serialises as null. NULL removes a
#   property.

the <- new.env(parent = emptyenv())

validators_env <- function() {
  if (is.null(the$validators)) the$validators <- list2env(.validators, hash = TRUE)
  the$validators
}

get_validator <- function(key) {
  env <- validators_env()
  if (exists(key, envir = env, inherits = FALSE)) env[[key]] else NULL
}

# Subplot containers that may carry a numeric suffix in layout (xaxis2, ...).
LAYOUT_SUBPLOT_IDS <- c("coloraxis", "geo", "legend", "map", "mapbox", "polar",
                        "scene", "smith", "ternary", "xaxis", "yaxis")

#' Validate and coerce a property value
#'
#' @param v Value to validate.
#' @param key Validator key, e.g. `"scatter.marker.size"`.
#' @param entry Validator entry; looked up from `key` by default.
#' @param skip_invalid If `TRUE`, invalid properties of compound objects are
#'   dropped instead of raising an error.
#' @return The coerced value, ready for JSON serialisation.
#' @noRd
validate_coerce <- function(v, key, entry = get_validator(key), skip_invalid = FALSE) {
  if (is.null(v)) return(NULL)
  if (is.null(entry)) stop("No validator for '", key, "'", call. = FALSE)
  switch(entry$superclass,
    "DataArrayValidator" = vc_data_array(v, key, entry),
    "EnumeratedValidator" = vc_enumerated(v, key, entry),
    "DashValidator" = vc_enumerated(v, key, entry),
    "BooleanValidator" = vc_boolean(v, key, entry),
    "NumberValidator" = vc_number(v, key, entry),
    "IntegerValidator" = vc_integer(v, key, entry),
    "StringValidator" = vc_string(v, key, entry),
    "ColorValidator" = vc_color(v, key, entry),
    "ColorlistValidator" = vc_colorlist(v, key, entry),
    "ColorscaleValidator" = vc_colorscale(v, key, entry),
    "AngleValidator" = vc_angle(v, key, entry),
    "SubplotidValidator" = vc_subplotid(v, key, entry),
    "FlaglistValidator" = vc_flaglist(v, key, entry),
    "AnyValidator" = vc_any(v, key, entry),
    "InfoArrayValidator" = vc_info_array(v, key, entry),
    "CompoundValidator" = vc_compound(v, key, entry, skip_invalid),
    "TitleValidator" = vc_title(v, key, entry, skip_invalid),
    "CompoundArrayValidator" = vc_compound_array(v, key, entry, skip_invalid),
    stop("Unknown validator '", entry$superclass, "' for '", key, "'", call. = FALSE)
  )
}

# Errors ---------------------------------------------------------------------

prop_name <- function(key) sub("^.*\\.", "", key)
prop_parent <- function(key) if (grepl(".", key, fixed = TRUE)) sub("\\.[^.]+$", "", key) else ""

format_value <- function(v, max = 10L) {
  if (is.list(v)) return(paste0("list of length ", length(v)))
  shown <- utils::head(v, max)
  s <- if (is.character(shown)) paste0('"', shown, '"') else format(shown)
  paste0(paste(s, collapse = ", "), if (length(v) > max) ", ..." else "")
}

value_type <- function(v) {
  if (is.factor(v)) return("factor")
  cls <- class(v)[[1L]]
  if (is.atomic(v) && length(v) != 1L && !is.matrix(v)) paste0(cls, " vector") else cls
}

raise_invalid_val <- function(v, key, entry, elements = FALSE) {
  what <- if (elements) {
    sprintf("Invalid element(s) received for the '%s' property of %s\n    Invalid elements include: %s",
            prop_name(key), prop_parent(key), format_value(v))
  } else {
    sprintf("Invalid value of type '%s' received for the '%s' property of %s\n    Received value: %s",
            value_type(v), prop_name(key), prop_parent(key), format_value(v))
  }
  msg <- paste0(what, "\n\n", describe_validator(entry, prop_name(key)))
  stop(structure(class = c("plotly_invalid_value", "error", "condition"),
                 list(message = msg, call = NULL)))
}

raise_invalid_elements <- function(v, key, entry) raise_invalid_val(v, key, entry, elements = TRUE)

describe_validator <- function(entry, name) {
  arr <- if (isTRUE(entry$array_ok)) "\n      - A vector of the above" else ""
  head <- sprintf("    The '%s' property is", name)
  rng <- function() {
    if (is.null(entry$min) && is.null(entry$max)) return("")
    sprintf(" in the interval [%s, %s]", format(entry$min %||% -Inf), format(entry$max %||% Inf))
  }
  enum_desc <- function() {
    vals <- c(paste0('"', entry$values$chr, '"'), format(entry$values$num),
              toupper(format(entry$values$lgl)))
    out <- sprintf("%s an enumeration that may be specified as:\n      - One of: %s",
                   head, paste(vals, collapse = ", "))
    if (length(entry$values$regex)) {
      out <- paste0(out, "\n      - A string matching one of: ",
                    paste(entry$values$regex, collapse = ", "))
    }
    out
  }
  switch(entry$superclass,
    DataArrayValidator = paste(head, "an array that may be specified as a vector, factor, Date/POSIXct vector, matrix or list"),
    EnumeratedValidator = , DashValidator = paste0(enum_desc(), arr),
    BooleanValidator = paste0(head, " a logical value (TRUE or FALSE)", arr),
    NumberValidator = paste0(head, " a number and may be specified as:\n      - A number", rng(), arr),
    IntegerValidator = paste0(head, " an integer and may be specified as:\n      - A whole number", rng(), arr),
    StringValidator = paste0(head, " a string and may be specified as:\n      - A character value",
                             if (!is.null(entry$values)) paste0(" in: ", paste(entry$values$chr, collapse = ", ")) else "",
                             if (!isTRUE(entry$strict)) "\n      - A number that will be converted to a string" else "", arr),
    ColorValidator = paste0(head, " a color and may be specified as:\n",
                            "      - A hex string (e.g. '#ff0000'), an rgb/rgba/hsl/hsla/hwb string (e.g. 'rgb(255, 0, 0)')\n",
                            "      - A CSS named color (e.g. 'steelblue') or an R color name (e.g. 'gray50')",
                            if (!is.null(entry$colorscale_path)) paste0("\n      - A number that will be mapped to a color according to ", entry$colorscale_path) else "",
                            arr),
    ColorlistValidator = paste(head, "a vector of colors"),
    ColorscaleValidator = paste0(head, " a colorscale and may be specified as:\n",
                                 "      - A vector of colors, spaced evenly from 0 to 1\n",
                                 "      - A list of c(value, color) pairs, or a two-column data.frame, with values from 0 to 1\n",
                                 "      - One of the named colorscales: ", paste(.named_colorscales, collapse = ", ")),
    AngleValidator = paste0(head, " an angle in degrees, wrapped to the interval [-180, 180)", arr),
    SubplotidValidator = sprintf("%s an identifier of a subplot of type '%s': the string '%s' optionally followed by an integer >= 1",
                                 head, entry$base, entry$base),
    FlaglistValidator = paste0(sprintf("%s a flaglist and may be specified as a string containing:\n      - Any combination of %s joined with '+' characters (e.g. '%s')",
                                       head, paste0('"', entry$flags, '"', collapse = ", "), paste(utils::head(entry$flags, 2L), collapse = "+")),
                               if (length(entry$extras)) paste0("\n        OR exactly one of ", paste0('"', entry$extras, '"', collapse = ", ")) else "", arr),
    AnyValidator = paste(head, "any value"),
    InfoArrayValidator = sprintf("%s an array of %s%d element(s), each validated separately",
                                 head, if (isTRUE(entry$free_length)) "up to " else "", length(entry$items$validators)),
    CompoundValidator = , TitleValidator = sprintf("%s an object (a named list) that may be created with %s()", head, entry$data_class),
    CompoundArrayValidator = sprintf("%s a list of objects (named lists) that may be created with %s()", head, entry$data_class),
    paste(head, "of an unknown type")
  )
}

# Helpers --------------------------------------------------------------------

as_char_if_factor <- function(v) if (is.factor(v)) as.character(v) else v

# All-NA logical vectors are valid "missing" values for any validator.
all_na <- function(v) is.atomic(v) && length(v) > 0L && all(is.na(v)) && is.logical(v)

# A length-1 atomic value counts as a scalar.
is_scalar <- function(v) is.atomic(v) && length(v) == 1L && !is.matrix(v)

# Flatten a list of scalars (e.g. list(1, 2, NA)) into an atomic vector.
simplify_list <- function(v) {
  if (!is.list(v) || is.data.frame(v)) return(v)
  if (all(vapply(v, function(e) is.atomic(e) && length(e) == 1L, logical(1)))) unlist(v) else v
}

check_scalar_or_array <- function(v, key, entry) {
  if (!isTRUE(entry$array_ok) && !is_scalar(v)) raise_invalid_val(v, key, entry)
  invisible(TRUE)
}

# Simple validators ----------------------------------------------------------

vc_data_array <- function(v, key, entry) {
  if (is.data.frame(v) || (is.list(v) && !is.null(names(v)))) raise_invalid_val(v, key, entry)
  if (!is.atomic(v) && !is.list(v)) raise_invalid_val(v, key, entry)
  v <- as_char_if_factor(v)
  if (is.atomic(v) && length(v) == 1L && !is.matrix(v)) v <- I(v)
  v
}

vc_number <- function(v, key, entry, integer = FALSE) {
  v <- simplify_list(v)
  if (all_na(v)) v <- as.numeric(v)
  if (!is.numeric(v) || is.factor(v) || is.object(v) && !inherits(v, "AsIs")) raise_invalid_val(v, key, entry)
  check_scalar_or_array(v, key, entry)
  ok <- is.na(v)
  if (integer) {
    whole <- ok | abs(v - round(v)) < sqrt(.Machine$double.eps)
    if (!all(whole)) raise_invalid_elements(v[!whole], key, entry)
  }
  if (!is.null(entry$min) || !is.null(entry$max)) {
    lo <- entry$min %||% -Inf
    hi <- entry$max %||% Inf
    good <- ok | (v >= lo & v <= hi)
    if (!all(good)) {
      if (length(v) == 1L) raise_invalid_val(v, key, entry) else raise_invalid_elements(v[!good], key, entry)
    }
  }
  if (integer) storage.mode(v) <- "integer"
  as.vector(v)
}

vc_integer <- function(v, key, entry) vc_number(v, key, entry, integer = TRUE)

vc_boolean <- function(v, key, entry) {
  v <- simplify_list(v)
  if (!is.logical(v)) raise_invalid_val(v, key, entry)
  check_scalar_or_array(v, key, entry)
  as.vector(v)
}

vc_string <- function(v, key, entry) {
  v <- as_char_if_factor(simplify_list(v))
  if (all_na(v)) v <- as.character(v)
  if (is.numeric(v) && !isTRUE(entry$strict)) v <- as.character(v)
  if (!is.character(v)) raise_invalid_val(v, key, entry)
  check_scalar_or_array(v, key, entry)
  bad <- logical(length(v))
  if (isTRUE(entry$no_blank)) bad <- bad | (!is.na(v) & !nzchar(v))
  if (!is.null(entry$values)) bad <- bad | (!is.na(v) & !(v %in% entry$values$chr))
  if (any(bad)) {
    if (length(v) == 1L) raise_invalid_val(v, key, entry) else raise_invalid_elements(v[bad], key, entry)
  }
  as.vector(v)
}

# plotly.py rewrites 'x1' -> 'x' for anchor-style regexes like ^x([2-9]|[1-9][0-9]+)?( domain)?$
ANCHOR_REGEX <- "^\\^(\\w)\\(\\[2-9\\]\\|\\[1-9\\]\\[0-9\\]\\+\\)\\?(\\( domain\\)\\?)?\\$$"

vc_enumerated <- function(v, key, entry) {
  v <- as_char_if_factor(simplify_list(v))
  if (!is.atomic(v)) raise_invalid_val(v, key, entry)
  check_scalar_or_array(v, key, entry)
  vals <- entry$values
  if (is.character(v) && length(vals$regex)) {
    for (rx in vals$regex[grepl(ANCHOR_REGEX, vals$regex, perl = TRUE)]) {
      ch <- sub(ANCHOR_REGEX, "\\1", rx, perl = TRUE)
      v <- sub(paste0("^", ch, "1( domain)?$"), paste0(ch, "\\1"), v, perl = TRUE)
    }
  }
  ok <- is.na(v)
  if (is.character(v)) {
    ok <- ok | v %in% vals$chr
    for (rx in vals$regex) ok <- ok | grepl(rx, v, perl = TRUE)
  } else if (is.logical(v)) {
    ok <- ok | v %in% vals$lgl
  } else if (is.numeric(v)) {
    ok <- ok | v %in% vals$num
  }
  if (!all(ok)) {
    if (length(v) == 1L) raise_invalid_val(v, key, entry) else raise_invalid_elements(v[!ok], key, entry)
  }
  as.vector(v)
}

# Colors ---------------------------------------------------------------------

RE_HEX <- "^#([a-f0-9]{3}|[a-f0-9]{4}|[a-f0-9]{6}|[a-f0-9]{8})$"
RE_RGB_ETC <- "^(((rgb|hsl)a?|hwb|(ok)?(lab|lch))\\([\\d.]+(%|deg)?([ ,] ?[\\d.]+%?){2}([ /,] ?[\\d.]+%?)?\\)|color\\([\\w-]+([ ,] ?[\\d.]+){3,4}\\))$"
RE_VAR <- "^var\\(\\-\\-.*\\)$"
RE_SPACES_TO_REMOVE <- "(?<!(\\d|%|g)) | (?!\\d)"

# Validate a character vector of colors. Valid CSS colors are returned
# unchanged; R color names (e.g. "gray50") are converted to rgba() strings.
# Invalid colors become NA_character_ (input NAs stay NA).
coerce_colors <- function(x) {
  u <- unique(x[!is.na(x)])
  norm <- tolower(gsub(RE_SPACES_TO_REMOVE, "", gsub(" +", " ", trimws(u)), perl = TRUE))
  ok <- grepl(RE_HEX, norm, perl = TRUE) | grepl(RE_RGB_ETC, norm, perl = TRUE) |
    grepl(RE_VAR, norm, perl = TRUE) | norm %in% .named_colors
  out <- ifelse(ok, u, NA_character_)
  for (i in which(!ok)) {
    rgba <- tryCatch(grDevices::col2rgb(u[[i]], alpha = TRUE), error = function(e) NULL)
    if (!is.null(rgba)) {
      out[[i]] <- sprintf("rgba(%d,%d,%d,%s)", rgba[1L], rgba[2L], rgba[3L],
                          format(round(rgba[4L] / 255, 3)))
    }
  }
  out[match(x, u)]
}

vc_color <- function(v, key, entry) {
  v <- as_char_if_factor(simplify_list(v))
  if (all_na(v)) return(as.vector(v))
  check_scalar_or_array(v, key, entry)
  if (is.numeric(v) && !is.object(v)) {
    if (is.null(entry$colorscale_path)) raise_invalid_val(v, key, entry)
    return(as.vector(v))
  }
  if (!is.character(v)) raise_invalid_val(v, key, entry)
  out <- coerce_colors(v)
  bad <- is.na(out) & !is.na(v)
  if (any(bad)) {
    if (length(v) == 1L) raise_invalid_val(v, key, entry) else raise_invalid_elements(v[bad], key, entry)
  }
  out
}

vc_colorlist <- function(v, key, entry) {
  v <- as_char_if_factor(simplify_list(v))
  if (!is.character(v)) raise_invalid_val(v, key, entry)
  out <- coerce_colors(v)
  if (anyNA(out)) raise_invalid_elements(v[is.na(out)], key, entry)
  I(out)
}

vc_colorscale <- function(v, key, entry) {
  v <- as_char_if_factor(v)
  if (is.character(v) && length(v) == 1L) {
    i <- match(tolower(v), tolower(.named_colorscales))
    if (is.na(i)) raise_invalid_val(v, key, entry)
    return(.named_colorscales[[i]])
  }
  if (is.character(v) && length(v) > 1L) {
    cols <- coerce_colors(v)
    if (anyNA(cols)) raise_invalid_elements(v[is.na(cols)], key, entry)
    stops <- seq(0, 1, length.out = length(cols))
  } else {
    if (is.data.frame(v) || is.matrix(v)) {
      if (ncol(v) != 2L) raise_invalid_val(v, key, entry)
      stops <- v[, 1L]
      cols <- as.character(v[, 2L])
    } else if (is.list(v) && length(v) > 0L &&
               all(vapply(v, function(e) length(e) == 2L, logical(1)))) {
      stops <- vapply(v, function(e) suppressWarnings(as.numeric(e[[1L]])), numeric(1))
      cols <- vapply(v, function(e) as.character(e[[2L]]), character(1))
    } else {
      raise_invalid_val(v, key, entry)
    }
    stops <- suppressWarnings(as.numeric(stops))
    cols <- coerce_colors(cols)
    if (anyNA(stops) || any(stops < 0 | stops > 1) || anyNA(cols)) raise_invalid_val(v, key, entry)
  }
  unname(Map(function(s, col) list(s, col), stops, cols))
}

# Other simple validators ----------------------------------------------------

vc_angle <- function(v, key, entry) {
  v <- vc_number(v, key, utils::modifyList(entry, list(min = NULL, max = NULL)))
  ((v + 180) %% 360) - 180
}

vc_subplotid <- function(v, key, entry) {
  v <- as_char_if_factor(v)
  if (!is.character(v)) raise_invalid_val(v, key, entry)
  check_scalar_or_array(v, key, entry)
  re <- paste0("^", entry$base, "(\\d*)$")
  digits <- ifelse(grepl(re, v), sub(re, "\\1", v), NA_character_)
  ok <- !is.na(digits) & !(nzchar(digits) & suppressWarnings(as.integer(digits)) == 0L)
  if (!all(ok)) {
    if (length(v) == 1L) raise_invalid_val(v, key, entry) else raise_invalid_elements(v[!ok], key, entry)
  }
  v[digits == "1"] <- entry$base
  v
}

vc_flaglist <- function(v, key, entry) {
  v <- as_char_if_factor(simplify_list(v))
  if (!is.character(v)) raise_invalid_val(v, key, entry)
  check_scalar_or_array(v, key, entry)
  u <- unique(v[!is.na(v)])
  coerce1 <- function(s) {
    s <- trimws(s)
    if (s %in% entry$extras) return(s)
    parts <- trimws(strsplit(s, "[,+]")[[1L]])
    if (length(parts) && all(parts %in% entry$flags)) paste(parts, collapse = "+") else NA_character_
  }
  cu <- vapply(u, coerce1, character(1), USE.NAMES = FALSE)
  out <- cu[match(v, u)]
  bad <- is.na(out) & !is.na(v)
  if (any(bad)) {
    if (length(v) == 1L) raise_invalid_val(v, key, entry) else raise_invalid_elements(v[bad], key, entry)
  }
  out
}

vc_any <- function(v, key, entry) as_char_if_factor(v)

vc_info_array <- function(v, key, entry) {
  v <- as_char_if_factor(v)
  if (is.data.frame(v) || !(is.atomic(v) || is.list(v))) raise_invalid_val(v, key, entry)
  dims <- entry$dimensions %||% 1L
  items <- entry$items
  validate_el <- function(el, item, idx) {
    if (length(el) == 1L && is.atomic(el) && is.na(el)) return(NA)
    validate_coerce(el, paste0(key, "[", idx, "]"), item)
  }
  is_2d <- is.matrix(v) || (is.list(v) && length(v) > 0L && !is_scalar(v[[1L]]))
  if (is_2d && identical(as.character(dims), "1")) raise_invalid_val(v, key, entry)
  if (is_2d) {
    rows <- if (is.matrix(v)) lapply(seq_len(nrow(v)), function(i) v[i, ]) else v
    return(lapply(seq_along(rows), function(i) {
      row <- as.list(rows[[i]])
      if (!items$single && length(row) != length(items$validators)) raise_invalid_val(v, key, entry)
      lapply(seq_along(row), function(j) {
        validate_el(row[[j]], items$validators[[if (items$single) 1L else j]], paste(i, j, sep = "]["))
      })
    }))
  }
  if (identical(as.character(dims), "2") && length(v)) raise_invalid_val(v, key, entry)
  v <- as.list(v)
  n <- length(items$validators)
  if (!items$single) {
    if (!isTRUE(entry$free_length) && length(v) != n) raise_invalid_val(v, key, entry)
    if (isTRUE(entry$free_length) && length(v) > n) raise_invalid_val(v, key, entry)
  }
  lapply(seq_along(v), function(i) validate_el(v[[i]], items$validators[[if (items$single) 1L else i]], i))
}

# Compound validators --------------------------------------------------------

# Resolve the validator key for a child property, mapping numbered layout
# subplots (xaxis2, scene3, ...) onto their base key.
child_key <- function(key, name) {
  ck <- paste(key, name, sep = ".")
  if (!is.null(get_validator(ck))) return(ck)
  if (key == "layout") {
    base <- sub("\\d+$", "", name)
    if (base %in% LAYOUT_SUBPLOT_IDS && grepl("^[a-z]+[1-9][0-9]*$", name)) {
      bk <- paste(key, base, sep = ".")
      if (!is.null(get_validator(bk))) return(bk)
    }
  }
  NA_character_
}

raise_invalid_prop <- function(name, key, entry) {
  valid <- entry$children
  dist <- if (length(valid)) utils::adist(name, valid, ignore.case = TRUE)[1L, ] else integer()
  best <- which(dist == min(dist, Inf) & dist <= max(2, nchar(name) %/% 3))
  hint <- if (length(best)) sprintf('\n\nDid you mean "%s"?', valid[[best[[1L]]]]) else ""
  msg <- sprintf("Invalid property specified for object of type %s: '%s'%s\n\n    Valid properties:\n%s",
                 entry$data_class, name, hint,
                 paste(strwrap(paste(valid, collapse = ", "), indent = 8, exdent = 8), collapse = "\n"))
  stop(structure(class = c("plotly_invalid_property", "error", "condition"),
                 list(message = msg, call = NULL)))
}

empty_object <- function() structure(list(), names = character())

# Compound values are returned as graph objects: named lists classed
# c(<data_class>, "plotly_obj"), e.g. c("go_scatter_marker", "plotly_obj").
as_graph_object <- function(x, entry) {
  class(x) <- c(entry$data_class, "plotly_obj")
  x
}

INVALID_CONDITIONS <- c("plotly_invalid_value", "plotly_invalid_property")

vc_compound <- function(v, key, entry, skip_invalid = FALSE) {
  if (inherits(v, entry$data_class)) return(v) # already validated
  if (is.data.frame(v) || !is.list(v)) raise_invalid_val(v, key, entry)
  v <- unclass(v)
  if (!length(v)) return(as_graph_object(empty_object(), entry))
  nms <- names(v)
  if (is.null(nms) || any(!nzchar(nms))) raise_invalid_val(v, key, entry)
  if (anyDuplicated(nms)) {
    stop(sprintf("Duplicate properties for %s: %s", entry$data_class,
                 paste(unique(nms[duplicated(nms)]), collapse = ", ")), call. = FALSE)
  }
  out <- vector("list", length(v))
  names(out) <- nms
  for (i in seq_along(v)) {
    name <- nms[[i]]
    if (!is.null(entry$trace_type) && name == "type") {
      if (!identical(as.character(v[[i]]), entry$trace_type)) {
        stop(sprintf("Trace type '%s' does not match %s()", format_value(v[[i]]), entry$data_class), call. = FALSE)
      }
      out[i] <- list(entry$trace_type)
      next
    }
    ck <- child_key(key, name)
    if (is.na(ck)) {
      if (skip_invalid) next
      raise_invalid_prop(name, key, entry)
    }
    val <- if (skip_invalid) {
      tryCatch(validate_coerce(v[[i]], ck, skip_invalid = TRUE), error = function(e) {
        if (inherits(e, INVALID_CONDITIONS)) NULL else stop(e)
      })
    } else {
      validate_coerce(v[[i]], ck)
    }
    if (!is.null(val)) out[i] <- list(val)
  }
  as_graph_object(out[!vapply(out, is.null, logical(1))], entry)
}

# A title may be given as a string, shorthand for list(text = <string>).
vc_title <- function(v, key, entry, skip_invalid = FALSE) {
  v <- as_char_if_factor(v)
  if (is.character(v) || is.numeric(v)) {
    if (length(v) != 1L) raise_invalid_val(v, key, entry)
    v <- list(text = as.character(v))
  }
  vc_compound(v, key, entry, skip_invalid)
}

vc_compound_array <- function(v, key, entry, skip_invalid = FALSE) {
  if (is.data.frame(v) || !is.list(v) || inherits(v, "plotly_obj") || !is.null(names(v))) {
    raise_invalid_val(v, key, entry)
  }
  element <- get_validator(entry$element_key)
  lapply(v, validate_coerce, key = entry$element_key, entry = element, skip_invalid = skip_invalid)
}

# Traces and figure data -------------------------------------------------------

available_trace_types <- function() {
  keys <- ls(validators_env())
  keys[vapply(keys, function(k) !is.null(get_validator(k)$trace_type), logical(1))]
}

# Validate one trace (a named list with an optional `type`, default "scatter").
validate_trace <- function(trace, skip_invalid = FALSE) {
  if (!is.list(trace) || is.data.frame(trace)) {
    stop("A trace must be a named list, not ", value_type(trace), call. = FALSE)
  }
  if (inherits(trace, "plotly_obj") && !is.null(trace$type) &&
      inherits(trace, get_validator(trace$type)$data_class %||% "")) {
    return(trace)
  }
  type <- trace$type %||% "scatter"
  entry <- if (is.character(type) && length(type) == 1L) get_validator(type)
  if (is.null(entry$trace_type)) {
    stop(sprintf("Invalid trace type '%s'. Available trace types: %s",
                 format_value(type), paste(sort(available_trace_types()), collapse = ", ")),
         call. = FALSE)
  }
  trace <- unclass(trace)
  trace$type <- NULL
  out <- vc_compound(trace, type, entry, skip_invalid)
  add_trace_type(out, type)
}

# Validate figure data: an unnamed list of traces.
# A single trace (a graph object, or a named list) is also accepted.
validate_data <- function(data, skip_invalid = FALSE) {
  if (is.null(data)) return(list())
  if (!is.list(data) || is.data.frame(data)) stop("Figure data must be a list of traces", call. = FALSE)
  if (inherits(data, "plotly_obj") || !is.null(names(data))) data <- list(data)
  unname(lapply(data, validate_trace, skip_invalid = skip_invalid))
}

validate_layout <- function(layout, skip_invalid = FALSE) {
  validate_coerce(layout %||% list(), "layout", skip_invalid = skip_invalid)
}
