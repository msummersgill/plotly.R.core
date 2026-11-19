# Fonts: available_fonts(), and the check save_image() makes for fonts a
# figure asks for that are not installed.

#' Fonts installed on this computer
#'
#' Lists the font families installed on this computer, using the systemfonts
#' package. These are the fonts a figure can use when it is drawn here: in
#' static images ([save_image()], knitted documents) and in figures viewed
#' in a browser on this computer.
#'
#' A figure's fonts are set with `family` properties (e.g.
#' `update_layout(font = go_font(family = "Georgia"))`), which take a CSS
#' font list such as `"Inter, Arial, sans-serif"`: the browser drawing the
#' figure uses the first family in the list that it has, or a generic
#' family (`serif`, `sans-serif`, `monospace`) at the end.
#'
#' Interactive figures are drawn in each viewer's browser, so they use the
#' fonts installed on the *viewer's* computer, which R can't see (and
#' browsers don't let pages list them): a font installed here may be missing
#' for someone opening the HTML file or Shiny app elsewhere. Lists that end
#' with widely available fonts and a generic family (`"Inter, Arial,
#' sans-serif"`) look reasonable everywhere.
#'
#' [save_image()] warns when the first family of a figure's font list is not
#' installed here.
#'
#' @return A sorted character vector of font family names.
#' @seealso [go_font()]
#' @export
#' @examplesIf requireNamespace("systemfonts", quietly = TRUE)
#' head(available_fonts())
#' "Arial" %in% available_fonts()
available_fonts <- function() {
  if (!requireNamespace("systemfonts", quietly = TRUE)) {
    stop(
      "available_fonts() needs the systemfonts package: ",
      'install.packages("systemfonts")',
      call. = FALSE
    )
  }
  sort(unique(systemfonts::system_fonts()$family))
}

# CSS generic font families, which every browser has.
GENERIC_FONTS <- c(
  "serif",
  "sans-serif",
  "monospace",
  "cursive",
  "fantasy",
  "system-ui",
  "ui-serif",
  "ui-sans-serif",
  "ui-monospace",
  "ui-rounded",
  "math",
  "emoji",
  "fangsong"
)

# The font lists (`family` values) a figure asks for, outside its template
# (template fonts, such as plotly's default "Open Sans", are only defaults).
figure_font_families <- function(x) {
  found <- character()
  walk <- function(v) {
    if (!is.list(v) || is.data.frame(v)) {
      return()
    }
    nms <- names(v) %||% rep("", length(v))
    for (i in seq_along(v)) {
      if (identical(nms[[i]], "template")) {
        next
      }
      if (identical(nms[[i]], "family") && is.character(v[[i]])) {
        found <<- c(found, v[[i]])
      } else {
        walk(v[[i]])
      }
    }
  }
  walk(unclass(x))
  unique(found[!is.na(found) & nzchar(found)])
}

# Warn (once a session per family) when the first family of a font list a
# figure asks for is not installed, as the image then uses another font.
check_figure_fonts <- function(p) {
  if (!requireNamespace("systemfonts", quietly = TRUE)) {
    return(invisible())
  }
  x <- if (inherits(p, "go_figure")) {
    unclass(p)[c("data", "layout")]
  } else if (inherits(p, "htmlwidget")) {
    p$x
  }
  stacks <- figure_font_families(x)
  if (!length(stacks)) {
    return(invisible())
  }
  installed <- tolower(available_fonts())
  for (stack in stacks) {
    fams <- trimws(gsub("[\"']", "", strsplit(stack, ",", fixed = TRUE)[[1L]]))
    fams <- fams[nzchar(fams)]
    first <- fams[[1L]]
    if (
      tolower(first) %in%
        c(installed, GENERIC_FONTS) ||
        first %in% the$font_warned
    ) {
      next
    }
    the$font_warned <- c(the$font_warned, first)
    rest <- fams[-1L]
    fallback <- rest[tolower(rest) %in% c(installed, GENERIC_FONTS)]
    warning(
      sprintf(
        "The font \"%s\" is not installed, so the image uses %s (see ?available_fonts)",
        first,
        if (length(fallback)) {
          sprintf("\"%s\" instead", fallback[[1L]])
        } else {
          "the browser's default font"
        }
      ),
      call. = FALSE
    )
  }
  invisible()
}
