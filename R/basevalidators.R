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
  if (is.null(the$validators)) {
    the$validators <- list2env(.validators, hash = TRUE)
  }
  the$validators
}

#' Look up property validators
#'
#' For packages building on plotly.core (such as plotly): `get_validator()`
#' returns the validator of a property, by its dotted path in the plotly.js
#' schema (e.g. `"scatter.marker.symbol"`, `"layout.xaxis"`), or `NULL` if
#' there is none. Compound validators list their properties in `children`;
#' trace validators have a `trace_type`. `available_trace_types()` lists the
#' trace types.
#'
#' @param key A dotted property path.
#' @return A validator (a list), or `NULL`; or a character vector.
#' @keywords internal
#' @export
get_validator <- function(key) {
  env <- validators_env()
  if (exists(key, envir = env, inherits = FALSE)) env[[key]] else NULL
}

# Subplot containers that may carry a numeric suffix in layout (xaxis2, ...).
LAYOUT_SUBPLOT_IDS <- c(
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

#' Validate and coerce a property value
#'
#' @param v Value to validate.
#' @param key Validator key, e.g. `"scatter.marker.size"`.
#' @param entry Validator entry; looked up from `key` by default.
#' @param skip_invalid If `TRUE`, invalid properties of compound objects are
#'   dropped instead of raising an error.
#' @return The coerced value, ready for JSON serialisation.
#' @noRd
validate_coerce <- function(
  v,
  key,
  entry = get_validator(key),
  skip_invalid = FALSE
) {
  if (is.null(v)) {
    return(NULL)
  }
  if (is.null(entry)) {
    stop("No validator for '", key, "'", call. = FALSE)
  }
  # as_float32() marks numbers to be sent in single precision; keep the mark.
  if (inherits(v, "plotly_float32")) {
    out <- validate_coerce(unclass_float32(v), key, entry, skip_invalid)
    return(if (is.double(out)) as_float32(out) else out)
  }
  # I(x) marks a length-1 vector as an array; keep the mark through coercion.
  if (inherits(v, "AsIs") && is.atomic(v) && length(v) == 1L) {
    out <- validate_coerce(unclass_asis(v), key, entry, skip_invalid)
    return(
      if (is.atomic(out) && length(out) == 1L && !inherits(out, "AsIs")) {
        I(out)
      } else {
        out
      }
    )
  }
  switch(
    entry$superclass,
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
    "FlaglistValidator" = vc_flaglist(v, key, entry, skip_invalid),
    "AnyValidator" = vc_any(v, key, entry),
    "InfoArrayValidator" = vc_info_array(v, key, entry),
    "CompoundValidator" = vc_compound(v, key, entry, skip_invalid),
    "TitleValidator" = vc_title(v, key, entry, skip_invalid),
    "CompoundArrayValidator" = vc_compound_array(v, key, entry, skip_invalid),
    stop(
      "Unknown validator '",
      entry$superclass,
      "' for '",
      key,
      "'",
      call. = FALSE
    )
  )
}

unclass_asis <- function(v) {
  class(v) <- setdiff(class(v), "AsIs")
  if (!length(class(v))) {
    v <- unclass(v)
  }
  v
}

# Errors ---------------------------------------------------------------------

prop_name <- function(key) sub("^.*\\.", "", key)
prop_parent <- function(key) {
  if (grepl(".", key, fixed = TRUE)) sub("\\.[^.]+$", "", key) else ""
}

format_value <- function(v, max = 10L) {
  if (is.list(v)) {
    return(paste0("list of length ", length(v)))
  }
  shown <- utils::head(v, max)
  s <- if (is.character(shown)) paste0('"', shown, '"') else format(shown)
  paste0(paste(s, collapse = ", "), if (length(v) > max) ", ..." else "")
}

value_type <- function(v) {
  if (is.factor(v)) {
    return("factor")
  }
  cls <- class(v)[[1L]]
  if (is.atomic(v) && length(v) != 1L && !is.matrix(v)) {
    paste0(cls, " vector")
  } else {
    cls
  }
}

raise_invalid_val <- function(v, key, entry, elements = FALSE) {
  what <- if (elements) {
    sprintf(
      "Invalid element(s) received for the '%s' property of %s\n    Invalid elements include: %s",
      prop_name(key),
      prop_parent(key),
      format_value(v)
    )
  } else {
    sprintf(
      "Invalid value of type '%s' received for the '%s' property of %s\n    Received value: %s",
      value_type(v),
      prop_name(key),
      prop_parent(key),
      format_value(v)
    )
  }
  msg <- paste0(what, "\n\n", describe_validator(entry, prop_name(key)))
  stop(structure(
    class = c("plotly_invalid_value", "error", "condition"),
    list(message = msg, call = NULL)
  ))
}

raise_invalid_elements <- function(v, key, entry) {
  raise_invalid_val(v, key, entry, elements = TRUE)
}

describe_validator <- function(entry, name) {
  arr <- if (isTRUE(entry$array_ok)) "\n      - A vector of the above" else ""
  head <- sprintf("    The '%s' property is", name)
  rng <- function() {
    if (is.null(entry$min) && is.null(entry$max)) {
      return("")
    }
    sprintf(
      " in the interval [%s, %s]",
      format(entry$min %||% -Inf),
      format(entry$max %||% Inf)
    )
  }
  enum_desc <- function() {
    vals <- c(
      paste0('"', entry$values$chr, '"'),
      format(entry$values$num),
      toupper(format(entry$values$lgl))
    )
    out <- sprintf(
      "%s an enumeration that may be specified as:\n      - One of: %s",
      head,
      paste(vals, collapse = ", ")
    )
    if (length(entry$values$regex)) {
      out <- paste0(
        out,
        "\n      - A string matching one of: ",
        paste(entry$values$regex, collapse = ", ")
      )
    }
    out
  }
  switch(
    entry$superclass,
    DataArrayValidator = paste(
      head,
      "an array that may be specified as a vector, factor, Date/POSIXct vector, matrix or list"
    ),
    EnumeratedValidator = ,
    DashValidator = paste0(enum_desc(), arr),
    BooleanValidator = paste0(head, " a logical value (TRUE or FALSE)", arr),
    NumberValidator = paste0(
      head,
      " a number and may be specified as:\n      - A number",
      rng(),
      arr
    ),
    IntegerValidator = paste0(
      head,
      " an integer and may be specified as:\n      - A whole number",
      rng(),
      arr
    ),
    StringValidator = paste0(
      head,
      " a string and may be specified as:\n      - A character value",
      if (!is.null(entry$values)) {
        paste0(" in: ", paste(entry$values$chr, collapse = ", "))
      } else {
        ""
      },
      if (!isTRUE(entry$strict)) {
        "\n      - A number that will be converted to a string"
      } else {
        ""
      },
      arr
    ),
    ColorValidator = paste0(
      head,
      " a color and may be specified as:\n",
      "      - A hex string (e.g. '#ff0000'), an rgb/rgba/hsl/hsla/hwb string (e.g. 'rgb(255, 0, 0)')\n",
      "      - A CSS named color (e.g. 'steelblue') or an R color name (e.g. 'gray50')",
      if (!is.null(entry$colorscale_path)) {
        paste0(
          "\n      - A number that will be mapped to a color according to ",
          entry$colorscale_path
        )
      } else {
        ""
      },
      arr
    ),
    ColorlistValidator = paste(head, "a vector of colors"),
    ColorscaleValidator = paste0(
      head,
      " a colorscale and may be specified as:\n",
      "      - A vector of colors, spaced evenly from 0 to 1\n",
      "      - A list of c(value, color) pairs, or a two-column data.frame, with values from 0 to 1\n",
      "      - The name of a sequential, diverging or cyclical scale in px_colors (case-insensitive;\n",
      "        append \"_r\" to reverse), e.g. \"Viridis\", \"RdBu_r\""
    ),
    AngleValidator = paste0(
      head,
      " an angle in degrees, wrapped to the interval [-180, 180)",
      arr
    ),
    SubplotidValidator = sprintf(
      "%s an identifier of a subplot of type '%s': the string '%s' optionally followed by an integer >= 1",
      head,
      entry$base,
      entry$base
    ),
    FlaglistValidator = paste0(
      sprintf(
        "%s a flaglist and may be specified as a string containing:\n      - Any combination of %s joined with '+' characters (e.g. '%s')",
        head,
        paste0('"', entry$flags, '"', collapse = ", "),
        paste(utils::head(entry$flags, 2L), collapse = "+")
      ),
      if (length(entry$extras)) {
        paste0(
          "\n        OR exactly one of ",
          paste(
            vapply(
              entry$extras,
              function(e) {
                if (is.character(e)) {
                  paste0('"', e, '"')
                } else {
                  toupper(as.character(e))
                }
              },
              ""
            ),
            collapse = ", "
          )
        )
      } else {
        ""
      },
      arr
    ),
    AnyValidator = paste(head, "any value"),
    InfoArrayValidator = sprintf(
      "%s an array of %s%d element(s), each validated separately",
      head,
      if (isTRUE(entry$free_length)) "up to " else "",
      length(entry$items$validators)
    ),
    CompoundValidator = ,
    TitleValidator = sprintf(
      "%s an object (a named list)%s",
      head,
      shared_hint(class_key(entry$data_class))
    ),
    CompoundArrayValidator = sprintf(
      "%s a list of objects (named lists)%s",
      head,
      shared_hint(entry$element_key)
    ),
    paste(head, "of an unknown type")
  )
}

# Helpers --------------------------------------------------------------------

# ", or a go_font() object" for keys of a shared type.
shared_hint <- function(key) {
  type <- if (is.null(key)) NA else shared_type_of(key)
  if (is.na(type)) "" else sprintf(", or a go_%s() object", type)
}

# Constructor of the object at schema key `key` (go_scatter_marker(),
# go_font(), ...), or NA.
constructor_of <- function(key) unname(.constructors[key])

# The nested call that sets a magic-underscore name: for "scatter" and
# c("marker", "line", "width"), "marker = go_scatter_marker(line =
# go_scatter_marker_line(width = ...))". NULL if the parts name no property.
nested_call <- function(key, parts) {
  for (p in seq_along(parts)) {
    name <- paste(parts[seq_len(p)], collapse = "_")
    ck <- child_key(key, name)
    if (is.na(ck)) {
      next
    }
    if (p == length(parts)) {
      return(paste(name, "= ..."))
    }
    entry <- get_validator(ck)
    is_array <- entry$superclass == "CompoundArrayValidator"
    obj <- if (is_array) entry$element_key else ck
    if (
      !get_validator(obj)$superclass %in%
        c("CompoundValidator", "TitleValidator")
    ) {
      next
    }
    inner <- nested_call(obj, parts[-seq_len(p)])
    if (is.null(inner)) {
      next
    }
    ctor <- constructor_of(obj)
    call <- sprintf("%s(%s)", if (is.na(ctor)) "list" else ctor, inner)
    return(sprintf(
      "%s = %s",
      name,
      if (is_array) sprintf("list(%s)", call) else call
    ))
  }
  NULL
}

# How errors name the object at schema key `key`: its constructor for traces
# and the layout ("go_scatter()"), its path for nested objects ("scatter.marker").
object_label <- function(key, entry) {
  if (!is.null(entry$label)) {
    return(entry$label)
  }
  if (!is.null(entry$trace_type) || identical(key, "layout")) {
    paste0(entry$data_class, "()")
  } else {
    key
  }
}

as_char_if_factor <- function(v) if (is.factor(v)) as.character(v) else v

# All-NA logical vectors are valid "missing" values for any validator.
all_na <- function(v) {
  is.atomic(v) && length(v) > 0L && all(is.na(v)) && is.logical(v)
}

# A length-1 atomic value counts as a scalar.
is_scalar <- function(v) is.atomic(v) && length(v) == 1L && !is.matrix(v)

# Flatten a list of scalars (e.g. list(1, 2, NA)) into an atomic vector.
simplify_list <- function(v) {
  if (!is.list(v) || is.data.frame(v)) {
    return(v)
  }
  if (all(vapply(v, function(e) is.atomic(e) && length(e) == 1L, logical(1)))) {
    unlist(v)
  } else {
    v
  }
}

check_scalar_or_array <- function(v, key, entry) {
  if (!isTRUE(entry$array_ok) && !is_scalar(v)) {
    raise_invalid_val(v, key, entry)
  }
  invisible(TRUE)
}

# Simple validators ----------------------------------------------------------

vc_data_array <- function(v, key, entry) {
  # A data.frame is 2D data (e.g. customdata): serialised as rows of values.
  if (is.data.frame(v)) {
    return(v)
  }
  if (is.list(v) && !is.null(names(v))) {
    raise_invalid_val(v, key, entry)
  }
  if (!is.atomic(v) && !is.list(v)) {
    raise_invalid_val(v, key, entry)
  }
  v <- as_char_if_factor(v)
  if (is.atomic(v) && length(v) == 1L && !is.matrix(v)) {
    v <- I(v)
  }
  v
}

vc_number <- function(v, key, entry, integer = FALSE) {
  v <- simplify_list(v)
  if (all_na(v)) {
    v <- as.numeric(v)
  }
  if (!is.numeric(v) || is.factor(v) || is.object(v) && !inherits(v, "AsIs")) {
    raise_invalid_val(v, key, entry)
  }
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
      if (length(v) == 1L) {
        raise_invalid_val(v, key, entry)
      } else {
        raise_invalid_elements(v[!good], key, entry)
      }
    }
  }
  if (integer) {
    storage.mode(v) <- "integer"
  }
  as.vector(v)
}

vc_integer <- function(v, key, entry) vc_number(v, key, entry, integer = TRUE)

vc_boolean <- function(v, key, entry) {
  v <- simplify_list(v)
  if (!is.logical(v)) {
    raise_invalid_val(v, key, entry)
  }
  check_scalar_or_array(v, key, entry)
  as.vector(v)
}

vc_string <- function(v, key, entry) {
  v <- as_char_if_factor(simplify_list(v))
  if (all_na(v)) {
    v <- as.character(v)
  }
  if (is.numeric(v) && !isTRUE(entry$strict)) {
    # plotly.py keeps numeric arrays as they are; single numbers become strings
    if (isTRUE(entry$array_ok) && length(v) > 1L && is.null(entry$values)) {
      return(as.vector(v))
    }
    v <- as.character(v)
  }
  if (!is.character(v)) {
    raise_invalid_val(v, key, entry)
  }
  check_scalar_or_array(v, key, entry)
  bad <- logical(length(v))
  if (isTRUE(entry$no_blank)) {
    bad <- bad | (!is.na(v) & !nzchar(v))
  }
  if (!is.null(entry$values)) {
    bad <- bad | (!is.na(v) & !(v %in% entry$values$chr))
  }
  if (any(bad)) {
    if (length(v) == 1L) {
      raise_invalid_val(v, key, entry)
    } else {
      raise_invalid_elements(v[bad], key, entry)
    }
  }
  as.vector(v)
}

# plotly.py rewrites 'x1' -> 'x' for anchor-style regexes like ^x([2-9]|[1-9][0-9]+)?( domain)?$
ANCHOR_REGEX <- "^\\^(\\w)\\(\\[2-9\\]\\|\\[1-9\\]\\[0-9\\]\\+\\)\\?(\\( domain\\)\\?)?\\$$"

vc_enumerated <- function(v, key, entry) {
  v <- as_char_if_factor(simplify_list(v))
  if (!is.atomic(v)) {
    raise_invalid_val(v, key, entry)
  }
  check_scalar_or_array(v, key, entry)
  vals <- entry$values
  if (is.character(v) && length(vals$regex)) {
    for (rx in vals$regex[grepl(ANCHOR_REGEX, vals$regex, perl = TRUE)]) {
      ch <- sub(ANCHOR_REGEX, "\\1", rx, perl = TRUE)
      v <- sub(
        paste0("^", ch, "1( domain)?$"),
        paste0(ch, "\\1"),
        v,
        perl = TRUE
      )
    }
  }
  ok <- is.na(v)
  if (is.character(v)) {
    ok <- ok | v %in% vals$chr
    for (rx in vals$regex) {
      ok <- ok | grepl(rx, v, perl = TRUE)
    }
  } else if (is.logical(v)) {
    ok <- ok | v %in% vals$lgl
  } else if (is.numeric(v)) {
    ok <- ok | v %in% vals$num
  }
  if (!all(ok)) {
    if (length(v) == 1L) {
      raise_invalid_val(v, key, entry)
    } else {
      raise_invalid_elements(v[!ok], key, entry)
    }
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
  norm <- tolower(gsub(
    RE_SPACES_TO_REMOVE,
    "",
    gsub(" +", " ", trimws(u)),
    perl = TRUE
  ))
  ok <- grepl(RE_HEX, norm, perl = TRUE) |
    grepl(RE_RGB_ETC, norm, perl = TRUE) |
    grepl(RE_VAR, norm, perl = TRUE) |
    norm %in% .named_colors
  out <- ifelse(ok, u, NA_character_)
  for (i in which(!ok)) {
    # hex without "#" (e.g. "ffff"), which plotly.js (tinycolor) also accepts
    if (
      grepl(
        "^([a-f0-9]{3}|[a-f0-9]{4}|[a-f0-9]{6}|[a-f0-9]{8})$",
        norm[[i]],
        perl = TRUE
      )
    ) {
      out[[i]] <- paste0("#", norm[[i]])
      next
    }
    rgba <- tryCatch(
      grDevices::col2rgb(u[[i]], alpha = TRUE),
      error = function(e) NULL
    )
    if (!is.null(rgba)) {
      out[[i]] <- sprintf(
        "rgba(%d,%d,%d,%s)",
        rgba[1L],
        rgba[2L],
        rgba[3L],
        format(round(rgba[4L] / 255, 3))
      )
    }
  }
  out[match(x, u)]
}

vc_color <- function(v, key, entry) {
  v <- as_char_if_factor(simplify_list(v))
  if (all_na(v)) {
    return(as.vector(v))
  }
  check_scalar_or_array(v, key, entry)
  if (is.numeric(v) && !is.object(v)) {
    if (is.null(entry$colorscale_path)) {
      raise_invalid_val(v, key, entry)
    }
    return(as.vector(v))
  }
  if (!is.character(v)) {
    raise_invalid_val(v, key, entry)
  }
  out <- coerce_colors(v)
  bad <- is.na(out) & !is.na(v)
  if (any(bad)) {
    if (length(v) == 1L) {
      raise_invalid_val(v, key, entry)
    } else {
      raise_invalid_elements(v[bad], key, entry)
    }
  }
  out
}

vc_colorlist <- function(v, key, entry) {
  v <- as_char_if_factor(simplify_list(v))
  if (!is.character(v)) {
    raise_invalid_val(v, key, entry)
  }
  out <- coerce_colors(v)
  if (anyNA(out)) {
    raise_invalid_elements(v[is.na(out)], key, entry)
  }
  I(out)
}

vc_colorscale <- function(v, key, entry) {
  v <- as_char_if_factor(v)
  if (is.character(v) && length(v) == 1L) {
    named <- named_colorscale(v)
    if (is.null(named)) {
      raise_invalid_val(v, key, entry)
    }
    v <- named
  }
  if (is.character(v) && length(v) > 1L) {
    cols <- coerce_colors(v)
    if (anyNA(cols)) {
      raise_invalid_elements(v[is.na(cols)], key, entry)
    }
    stops <- seq(0, 1, length.out = length(cols))
  } else {
    if (is.data.frame(v) || is.matrix(v)) {
      if (ncol(v) != 2L) {
        raise_invalid_val(v, key, entry)
      }
      stops <- v[, 1L]
      cols <- as.character(v[, 2L])
    } else if (
      is.list(v) &&
        length(v) > 0L &&
        all(vapply(v, function(e) length(e) == 2L, logical(1)))
    ) {
      stops <- vapply(
        v,
        function(e) suppressWarnings(as.numeric(e[[1L]])),
        numeric(1)
      )
      cols <- vapply(v, function(e) as.character(e[[2L]]), character(1))
    } else {
      raise_invalid_val(v, key, entry)
    }
    stops <- suppressWarnings(as.numeric(stops))
    cols <- coerce_colors(cols)
    if (anyNA(stops) || any(stops < 0 | stops > 1) || anyNA(cols)) {
      raise_invalid_val(v, key, entry)
    }
  }
  unname(Map(function(s, col) list(s, col), stops, cols))
}

# Named colorscales: the sequential, diverging and cyclical scales of
# px_colors, matched case-insensitively ("_r" reverses), as in plotly.py.
named_colorscale <- function(name) {
  if (is.null(the$named_colorscales)) {
    scales <- c(px_colors$sequential, px_colors$diverging, px_colors$cyclical)
    names(scales) <- tolower(names(scales))
    the$named_colorscales <- scales[!duplicated(names(scales), fromLast = TRUE)]
  }
  key <- tolower(name)
  reverse <- endsWith(key, "_r")
  if (reverse) {
    key <- substr(key, 1L, nchar(key) - 2L)
  }
  cols <- the$named_colorscales[[key]]
  if (is.null(cols)) {
    return(NULL)
  }
  if (reverse) rev(cols) else cols
}

# Other simple validators ----------------------------------------------------

vc_angle <- function(v, key, entry) {
  v <- vc_number(v, key, utils::modifyList(entry, list(min = NULL, max = NULL)))
  ((v + 180) %% 360) - 180
}

vc_subplotid <- function(v, key, entry) {
  v <- as_char_if_factor(v)
  if (!is.character(v)) {
    raise_invalid_val(v, key, entry)
  }
  check_scalar_or_array(v, key, entry)
  re <- paste0("^", entry$base, "(\\d*)$")
  digits <- ifelse(grepl(re, v), sub(re, "\\1", v), NA_character_)
  ok <- !is.na(digits) &
    !(nzchar(digits) & suppressWarnings(as.integer(digits)) == 0L)
  if (!all(ok)) {
    if (length(v) == 1L) {
      raise_invalid_val(v, key, entry)
    } else {
      raise_invalid_elements(v[!ok], key, entry)
    }
  }
  v[digits == "1"] <- entry$base
  v
}

# With skip_invalid, unknown flags are dropped and the valid ones kept, as
# plotly.js does (e.g. mode = "marker+text" is "text").
vc_flaglist <- function(v, key, entry, skip_invalid = FALSE) {
  v <- as_char_if_factor(simplify_list(v))
  # non-string extras, e.g. automargin = TRUE
  if (
    is_scalar(v) &&
      !is.character(v) &&
      any(vapply(entry$extras, identical, logical(1), v))
  ) {
    return(v)
  }
  if (!is.character(v)) {
    raise_invalid_val(v, key, entry)
  }
  check_scalar_or_array(v, key, entry)
  u <- unique(v[!is.na(v)])
  coerce1 <- function(s) {
    s <- trimws(s)
    if (s %in% unlist(Filter(is.character, entry$extras))) {
      return(s)
    }
    parts <- trimws(strsplit(s, "[,+]")[[1L]])
    if (skip_invalid) {
      parts <- parts[parts %in% entry$flags]
    }
    if (length(parts) && all(parts %in% entry$flags)) {
      paste(parts, collapse = "+")
    } else {
      NA_character_
    }
  }
  cu <- vapply(u, coerce1, character(1), USE.NAMES = FALSE)
  out <- cu[match(v, u)]
  bad <- is.na(out) & !is.na(v)
  if (any(bad)) {
    if (length(v) == 1L) {
      raise_invalid_val(v, key, entry)
    } else {
      raise_invalid_elements(v[bad], key, entry)
    }
  }
  out
}

vc_any <- function(v, key, entry) as_char_if_factor(v)

vc_info_array <- function(v, key, entry) {
  v <- as_char_if_factor(v)
  if (is.data.frame(v) || !(is.atomic(v) || is.list(v))) {
    raise_invalid_val(v, key, entry)
  }
  dims <- entry$dimensions %||% 1L
  items <- entry$items
  validate_el <- function(el, item, idx) {
    if (length(el) == 1L && is.atomic(el) && is.na(el)) {
      return(NA)
    }
    validate_coerce(el, paste0(key, "[", idx, "]"), item)
  }
  is_2d <- !identical(as.character(dims), "1") &&
    (is.matrix(v) ||
      (is.list(v) &&
        length(v) > 0L &&
        (is.list(v[[1L]]) || (is.atomic(v[[1L]]) && length(v[[1L]]) > 1L))))
  if (is_2d) {
    rows <- if (is.matrix(v)) {
      lapply(seq_len(nrow(v)), function(i) v[i, ])
    } else {
      v
    }
    return(lapply(seq_along(rows), function(i) {
      row <- as.list(rows[[i]])
      if (!items$single && length(row) != length(items$validators)) {
        raise_invalid_val(v, key, entry)
      }
      lapply(seq_along(row), function(j) {
        validate_el(
          row[[j]],
          items$validators[[if (items$single) 1L else j]],
          paste(i, j, sep = "][")
        )
      })
    }))
  }
  if (identical(as.character(dims), "2") && length(v)) {
    raise_invalid_val(v, key, entry)
  }
  v <- as.list(v)
  n <- length(items$validators)
  if (!items$single) {
    if (!isTRUE(entry$free_length) && length(v) != n) {
      raise_invalid_val(v, key, entry)
    }
    if (isTRUE(entry$free_length) && length(v) > n) {
      raise_invalid_val(v, key, entry)
    }
  }
  lapply(seq_along(v), function(i) {
    validate_el(v[[i]], items$validators[[if (items$single) 1L else i]], i)
  })
}

# Compound validators --------------------------------------------------------

# Resolve the validator key for a child property, mapping numbered layout
# subplots (xaxis2, scene3, ...) onto their base key.
child_key <- function(key, name) {
  ck <- paste(key, name, sep = ".")
  if (!is.null(get_validator(ck))) {
    return(ck)
  }
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
  dist <- if (length(valid)) {
    utils::adist(name, valid, ignore.case = TRUE)[1L, ]
  } else {
    integer()
  }
  best <- which(dist == min(dist, Inf) & dist <= max(2, nchar(name) %/% 3))
  hint <- if (length(best)) {
    sprintf('\n\nDid you mean "%s"?', valid[[best[[1L]]]])
  } else {
    ""
  }
  # plotly.py's "magic underscore" names (marker_size) are not supported:
  # suggest the nested call, e.g. marker = go_scatter_marker(size = ...)
  if (grepl("_", name, fixed = TRUE)) {
    nested <- nested_call(key, strsplit(name, "_", fixed = TRUE)[[1L]])
    if (!is.null(nested)) {
      hint <- paste0(
        "\n\nNested properties are set with their objects: ",
        nested
      )
    }
  }
  msg <- sprintf(
    "Invalid property specified for %s: '%s'%s\n\n    Valid properties:\n%s",
    object_label(key, entry),
    name,
    hint,
    paste(
      strwrap(paste(valid, collapse = ", "), indent = 8, exdent = 8),
      collapse = "\n"
    )
  )
  stop(structure(
    class = c("plotly_invalid_property", "error", "condition"),
    list(message = msg, call = NULL)
  ))
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
  if (inherits(v, entry$data_class)) {
    return(v)
  } # already validated
  if (inherits(v, "plotly_obj") && !inherits(v, "plotly_shared")) {
    # an object made for another place: only where the property has its name
    # (a bar marker.line in a scatter marker.line, go_xaxis() in xaxis2)
    from <- tryCatch(class_key(class(v)[[1L]]), error = function(e) NULL)
    # (or of the same shared type: a scene xaxis in zaxis)
    same_type <- !is.null(from) &&
      !is.na(shared_type_of(key)) &&
      identical(shared_type_of(from), shared_type_of(key))
    if (!is.null(from) && prop_name(from) != prop_name(key) && !same_type) {
      stop(
        sprintf("A %s object can't be used for %s", from, key),
        call. = FALSE
      )
    }
  }
  if (inherits(v, "plotly_shared")) {
    # a go_font(), go_colorbar(), ... object: only where the schema has one
    type <- sub("^go_", "", class(v)[[1L]])
    if (!identical(shared_type_of(key), type)) {
      stop(
        sprintf(
          "A go_%s() object can't be used for %s, which is %s",
          type,
          key,
          sub(
            "^ *The '[^']*' property is ",
            "",
            describe_validator(entry, prop_name(key))
          )
        ),
        call. = FALSE
      )
    }
  }
  if (is.data.frame(v) || !is.list(v)) {
    raise_invalid_val(v, key, entry)
  }
  v <- unclass(v)
  if (!length(v)) {
    return(as_graph_object(empty_object(), entry))
  }
  nms <- names(v)
  if (is.null(nms) || any(!nzchar(nms))) {
    raise_invalid_val(v, key, entry)
  }
  if (anyDuplicated(nms)) {
    msg <- sprintf(
      "Duplicate properties for %s: %s",
      object_label(key, entry),
      paste(unique(nms[duplicated(nms)]), collapse = ", ")
    )
    if (!skip_invalid) {
      stop(msg, call. = FALSE)
    }
    # keep the first value, as `$` does and as the plotly package sent it
    # (jsonlite renames later duplicates "type.1", ..., which plotly.js ignores)
    warning(msg, "; using the first value", call. = FALSE)
    keep <- !duplicated(nms)
    v <- v[keep]
    nms <- nms[keep]
  }
  out <- vector("list", length(v))
  names(out) <- nms
  # invalid properties and values, all reported together (see raise_collected())
  problems <- list()
  collect <- function(expr) {
    if (skip_invalid) {
      return(expr)
    }
    tryCatch(expr, error = function(e) {
      if (!inherits(e, INVALID_CONDITIONS)) {
        stop(e)
      }
      problems[[length(problems) + 1L]] <<- e
      NULL
    })
  }
  for (i in seq_along(v)) {
    name <- nms[[i]]
    if (!is.null(entry$trace_type) && name == "type") {
      if (!identical(as.character(v[[i]]), entry$trace_type)) {
        stop(
          sprintf(
            "Trace type '%s' does not match %s()",
            format_value(v[[i]]),
            entry$data_class
          ),
          call. = FALSE
        )
      }
      out[i] <- list(entry$trace_type)
      next
    }
    ck <- child_key(key, name)
    if (!is.na(ck) && inherits(v[[i]], "formula")) {
      # deferred: a constructor keeps x = ~col for add_<trace>() or add_trace()
      # to evaluate in the figure's data; plotly_widget() refuses any left
      out[i] <- list(v[[i]])
      next
    }
    if (is.na(ck)) {
      if (skip_invalid) {
        next
      }
      collect(raise_invalid_prop(name, key, entry))
      next
    }
    val <- if (skip_invalid) {
      tryCatch(
        validate_coerce(v[[i]], ck, skip_invalid = TRUE),
        error = function(e) {
          if (!inherits(e, INVALID_CONDITIONS)) {
            stop(e)
          }
          # plotly.js doesn't check the elements of arrays given for arrayOk
          # properties (it draws textposition "right" as "middle right"), so
          # keep them as they are
          if (is_passthrough_array(v[[i]], get_validator(ck))) {
            as_char_if_factor(v[[i]])
          } else {
            NULL
          }
        }
      )
    } else {
      collect(validate_coerce(v[[i]], ck))
    }
    if (!is.null(val)) out[i] <- list(val)
  }
  if (length(problems)) {
    raise_collected(problems)
  }
  as_graph_object(out[!vapply(out, is.null, logical(1))], entry)
}

# An array (atomic, length > 1) for an arrayOk property, which plotly.js takes
# without checking its elements.
is_passthrough_array <- function(v, entry) {
  isTRUE(entry$array_ok) &&
    is.atomic(v) &&
    is.null(dim(v)) &&
    length(v) > 1L
}

# One error for all the invalid properties of an object: a single one as is,
# several as a list of their first lines followed by the first one in full.
raise_collected <- function(problems) {
  if (length(problems) == 1L) {
    stop(problems[[1L]])
  }
  first_lines <- vapply(
    problems,
    function(e) strsplit(conditionMessage(e), "\n")[[1L]][[1L]],
    ""
  )
  msg <- sprintf(
    "%d invalid properties:\n%s\n\n%s",
    length(problems),
    paste0("  * ", first_lines, collapse = "\n"),
    conditionMessage(problems[[1L]])
  )
  stop(structure(
    class = c("plotly_invalid_property", "error", "condition"),
    list(message = msg, call = NULL, problems = problems)
  ))
}

# A title may be given as a string, shorthand for list(text = <string>).
vc_title <- function(v, key, entry, skip_invalid = FALSE) {
  v <- as_char_if_factor(v)
  if (is.character(v) || is.numeric(v)) {
    if (length(v) != 1L) {
      raise_invalid_val(v, key, entry)
    }
    v <- list(text = as.character(v))
  }
  vc_compound(v, key, entry, skip_invalid)
}

vc_compound_array <- function(v, key, entry, skip_invalid = FALSE) {
  if (
    is.data.frame(v) ||
      !is.list(v) ||
      inherits(v, "plotly_obj") ||
      !is.null(names(v))
  ) {
    raise_invalid_val(v, key, entry)
  }
  element <- get_validator(entry$element_key)
  lapply(
    v,
    validate_coerce,
    key = entry$element_key,
    entry = element,
    skip_invalid = skip_invalid
  )
}

# Traces and figure data -------------------------------------------------------

#' @rdname get_validator
#' @export
available_trace_types <- function() {
  keys <- ls(validators_env())
  keys[vapply(
    keys,
    function(k) !is.null(get_validator(k)$trace_type),
    logical(1)
  )]
}

# Validate one trace (a named list with an optional `type`, default "scatter").
validate_trace <- function(trace, skip_invalid = FALSE) {
  if (!is.list(trace) || is.data.frame(trace)) {
    stop("A trace must be a named list, not ", value_type(trace), call. = FALSE)
  }
  if (
    inherits(trace, "plotly_obj") &&
      !is.null(trace$type) &&
      inherits(trace, get_validator(trace$type)$data_class %||% "")
  ) {
    return(trace)
  }
  type <- trace$type %||% "scatter"
  entry <- if (is.character(type) && length(type) == 1L) get_validator(type)
  if (is.null(entry$trace_type)) {
    stop(
      sprintf(
        "Invalid trace type '%s'. Available trace types: %s",
        format_value(type),
        paste(sort(available_trace_types()), collapse = ", ")
      ),
      call. = FALSE
    )
  }
  trace <- unclass(trace)
  trace$type <- NULL
  out <- vc_compound(trace, type, entry, skip_invalid)
  add_trace_type(out, type)
}

# Validate figure data: an unnamed list of traces.
# A single trace (a graph object, or a named list) is also accepted.
validate_data <- function(data, skip_invalid = FALSE) {
  if (is.null(data)) {
    return(list())
  }
  if (!is.list(data) || is.data.frame(data)) {
    stop("Figure data must be a list of traces", call. = FALSE)
  }
  if (inherits(data, "plotly_obj") || !is.null(names(data))) {
    data <- list(data)
  }
  unname(lapply(data, validate_trace, skip_invalid = skip_invalid))
}

validate_layout <- function(layout, skip_invalid = FALSE) {
  validate_coerce(layout %||% list(), "layout", skip_invalid = skip_invalid)
}
