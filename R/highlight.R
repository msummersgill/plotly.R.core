#' Query graphical elements in multiple linked views
#'
#' This function sets a variety of options for brushing (i.e., highlighting)
#' multiple plots. These options are primarily designed for linking
#' multiple plotly graphs, and may not behave as expected when linking
#' plotly to another htmlwidget package via crosstalk. In some cases,
#' other htmlwidgets will respect these options, such as persistent selection
#' in leaflet.
#'
#' A figure is linked when its data come from a [crosstalk::SharedData]
#' (pipe one into [go_figure()] and add traces with formulas such as
#' `add_scatter(x = ~col)`, or link traces with [set_crosstalk_keys()]).
#' Linked figures highlight on click by default; `highlight()` changes that.
#' `highlight()` also works on plotly htmlwidgets.
#'
#' @param p a [go_figure()] or a plotly htmlwidget.
#' @param on turn on a selection on which event(s)? To disable on events
#' altogether, use `NULL`. Currently the following are supported:
#' \itemize{
#'  \item `'plotly_click'`
#'  \item `'plotly_hover'`
#'  \item `'plotly_selected'`: triggered through rectangular
#'  (layout.dragmode = 'select') or lasso (layout.dragmode = 'lasso') brush.
#'  \item `'plotly_selecting'`: as `'plotly_selected'`, while dragging.
#' }
#' @param off turn off a selection on which event(s)? To disable off
#' events altogether, use `NULL`. Currently the following are supported:
#' \itemize{
#'  \item `'plotly_doubleclick'`: triggered on a double mouse click while
#'  (layout.dragmode = 'zoom') or (layout.dragmode = 'pan')
#'  \item `'plotly_deselect'`: triggered on a double mouse click while
#'  (layout.dragmode = 'select') or (layout.dragmode = 'lasso')
#'  \item `'plotly_relayout'`: triggered whenever axes are rescaled
#'  (i.e., clicking the home button in the modebar) or whenever the height/width
#'  of the plot changes.
#' }
#' @param persistent should selections persist (i.e., accumulate)? We often
#' refer to the default (`FALSE`) as a 'transient' selection mode;
#' which is recommended, because one may switch from 'transient' to
#' 'persistent' selection by holding the shift key.
#' @param dynamic should a widget for changing selection colors be included?
#' @param color character string of color(s) to use for
#' highlighting selections: R colour names, hex colours or CSS colours such
#' as `"rgba(255,0,0,0.5)"`. If `NULL` (the default), the color of selected
#' marks are not altered.
#' @param selectize whether or not to render a selectize.js widget for selecting
#'   the keys. A list of additional selectize.js options may
#'   also be provided.
#' @param defaultValues a vector of values for setting a "default selection".
#' These values should match the key attribute.
#' @param opacityDim a number between 0 and 1 used to reduce the
#' opacity of non-selected traces (by multiplying with the existing opacity).
#' @param selected attributes of the selection, see [attrs_selected()].
#' @param debounce amount of time to wait before firing an event (in milliseconds).
#' The default of 0 means do not debounce at all.
#' Debouncing is mainly useful when `on = "plotly_hover"` to avoid firing too many events
#' when users clickly move the mouse over relevant graphical marks.
#' @param ... currently not supported.
#' @return `p` with the highlighting options.
#' @export
#' @author Carson Sievert
#' @references \url{https://plotly-r.com/client-side-linking.html}
#' @seealso [attrs_selected()], [set_crosstalk_keys()]
#' @examplesIf requireNamespace("crosstalk", quietly = TRUE)
#' crosstalk::SharedData$new(iris) |>
#'   go_figure() |>
#'   add_scatter(x = ~Sepal.Width, y = ~Sepal.Length, mode = "markers") |>
#'   highlight(on = "plotly_selected", color = "red")
highlight <- function(
  p,
  on = "plotly_click",
  off,
  persistent = getOption("persistent", FALSE),
  dynamic = FALSE,
  color = NULL,
  selectize = FALSE,
  defaultValues = NULL,
  opacityDim = getOption("opacityDim", 0.2),
  selected = attrs_selected(),
  debounce = 0,
  ...
) {
  # currently ... is not-supported and will catch
  # some arguments we supported at one point
  dots <- list(...)
  if (length(dots)) {
    warning(
      "The following arguments are not supported:\n",
      toString(names(dots)),
      "\n",
      "Arguments such as: hoverinfo and showInLegend \n",
      "have been replaced by selected and other",
      call. = FALSE
    )
  }

  if (
    !is.numeric(opacityDim) ||
      length(opacityDim) != 1L ||
      opacityDim < 0 ||
      1 < opacityDim
  ) {
    stop("opacityDim must be between 0 and 1", call. = FALSE)
  }
  # flags may be given as e.g. 1, "TRUE" or NULL
  persistent <- as_flag(persistent)
  dynamic <- as_flag(dynamic)
  if (!is.list(selectize)) {
    selectize <- as_flag(selectize)
  }
  if (dynamic && length(color) < 2) {
    message("Adding more colors to the selection color palette.")
    # RColorBrewer::brewer.pal(4, "Set1")
    color <- c(color, c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3"))
  }
  if (!dynamic && length(color) > 1) {
    warning(
      "Can only use a single color for selections when `dynamic = FALSE`.",
      call. = FALSE
    )
    color <- color[1]
  }

  # NULL may be used to disable on/off events
  if (!is.null(on)) {
    on <- match.arg(
      on,
      paste0("plotly_", c("click", "hover", "selected", "selecting"))
    )
  }

  # TODO: expose unhover?
  off_options <- paste0(
    "plotly_",
    c("doubleclick", "deselect", "relayout")
  )
  if (missing(off)) {
    off_default <- switch(
      on %||% "",
      plotly_selecting = ,
      plotly_selected = "plotly_deselect",
      plotly_click = "plotly_doubleclick",
      plotly_hover = "plotly_doubleclick"
    )
    # marked as a default (as plotly's default() does), so the plotly
    # package can say which event it chose
    off <- structure(
      off_default %||% "plotly_relayout",
      class = "plotly_default"
    )
  }

  if (isTRUE(persistent)) {
    message(
      "We recommend setting `persistent` to `FALSE` (the default) because ",
      "persistent selection mode can now be used by holding the shift key ",
      "(while triggering the `on` event)."
    )
  }

  # main (non-plotly.js) spec passed along to HTMLwidgets.renderValue()
  hl <- list(
    on = on,
    off = if (inherits(off, "plotly_default")) {
      off
    } else if (!is.null(off)) {
      match.arg(off, off_options)
    },
    persistent = persistent,
    dynamic = dynamic,
    color = if (length(color)) hex_colour(color),
    selectize = selectize,
    defaultValues = defaultValues,
    opacityDim = opacityDim,
    selected = selected,
    debounce = debounce
  )

  if (inherits(p, "htmlwidget")) {
    # As plotly's highlight() does: the widget's libraries are fixed before
    # it renders. Only the plotly package's widgets (built later, by
    # plotly_build()) use the default marker.
    if (!inherits(p, "plotly") && !is.null(hl$off)) {
      hl$off <- as.character(hl$off)
    }
    p$x$highlight <- hl
    # attach HTML dependencies (these libraries are used in the HTMLwidgets.renderValue() method)
    # TODO: only attach these when keys are present!
    p$dependencies <- c(
      p$dependencies,
      crosstalk_deps(list(selectize = selectize, dynamic = dynamic))
    )
    return(p)
  }
  # figures get the libraries when rendered, if their traces are linked
  set_widget_setting(p, "highlight", hl)
}

#' Specify attributes of selection traces
#'
#' By default the name of the selection trace derives from the selected values.
#'
#'
#' @param opacity a number between 0 and 1 specifying the overall opacity of
#' the selected trace
#' @param ... other trace attributes attached to the selection trace.
#' @return A list of trace attributes.
#' @export
#' @author Carson Sievert
attrs_selected <- function(opacity = 1, ...) {
  if (!is.numeric(opacity) || opacity < 0 || 1 < opacity) {
    stop("opacity must be between 0 and 1", call. = FALSE)
  }

  args <- list(
    opacity = opacity
  )

  # TODO: verify attr names... maybe that should happen in the build step?
  dots <- list(...)

  c(dots, args)
}


# ----------------------------------------------------------------------------
# Utility functions
# ----------------------------------------------------------------------------

# The defaults of highlight(), for linked figures without highlight(). They
# are spelled out (rather than evaluated from formals(highlight), which
# drops `off`, whose default depends on `on`), as the widget needs `off`.
highlight_defaults <- function() {
  list(
    on = "plotly_click",
    off = "plotly_doubleclick",
    persistent = getOption("persistent", FALSE),
    dynamic = FALSE,
    color = NULL,
    selectize = FALSE,
    defaultValues = NULL,
    opacityDim = getOption("opacityDim", 0.2),
    selected = attrs_selected(),
    debounce = 0
  )
}

# plotly.core uses the selectize.js crosstalk ships (crosstalk is needed for
# linking anyway) rather than bundling its own copy
selectizeLib <- function(bootstrap = TRUE) {
  htmltools::htmlDependency(
    name = "selectize",
    version = "0.12.4",
    package = "crosstalk",
    src = "lib/selectize",
    stylesheet = if (bootstrap) "css/selectize.bootstrap3.css",
    script = "js/selectize.min.js"
  )
}

colourPickerLib <- function() {
  htmltools::htmlDependency(
    name = "colourpicker",
    version = "1.1",
    package = "plotly.core",
    src = dependency_dir("colourpicker"),
    stylesheet = "colourpicker.min.css",
    script = "colourpicker.min.js"
  )
}

dependency_dir <- function(...) {
  file.path('htmlwidgets', 'lib', ...)
}
