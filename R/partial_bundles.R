#' Use a partial bundle of plotly.js
#'
#' Leveraging plotly.js' partial bundles can lead to smaller file sizes
#' and faster rendering. The full list of available bundles, and the
#' trace types that they support, are available
#' [here](https://github.com/plotly/plotly.js/blob/master/dist/README.md#partial-bundles)
#'
#' By default, figures load the full plotly.js bundle (about 4.8 MB). The
#' partial bundles shipped with plotly.core (and their trace types) are:
#'
#' * `"basic"`: bar, pie, scatter (about 1.2 MB)
#' * `"cartesian"`: also box, contour, heatmap, histogram, histogram2d,
#'   histogram2dcontour, image, scatterternary, violin
#' * `"finance"`: bar, candlestick, funnel, funnelarea, histogram,
#'   indicator, ohlc, pie, scatter, waterfall
#' * `"geo"`: choropleth, scatter, scattergeo
#' * `"gl2d"`: parcoords, scatter, scattergl, splom
#' * `"gl3d"`: cone, isosurface, mesh3d, scatter, scatter3d, streamtube,
#'   surface, volume
#' * `"map"`: choroplethmap, densitymap, scatter, scattermap
#'
#' Use `options(plotly.core.bundle = "auto")` to use the smallest bundle for
#' every figure. `partial_bundle()` is an S3 generic, so packages can add
#' methods for their own figure classes (the plotly package does for
#' `plot_ly()` objects).
#'
#' @details WARNING: use this function with caution when rendering multiple
#' plotly graphs on a single website. That's because a page loads a single
#' plotly.js: if multiple plotly.js bundles are used, one bundle (the full
#' bundle, if any graph uses it) is loaded for all of them, and graphs with
#' trace types it doesn't have won't render.
#' See the examples section for an example.
#'
#' @param p a [go_figure()] or htmlwidget.
#' @param type name of the (partial) bundle. The default, `'auto'`, attempts to
#' find the smallest single bundle that can render `p` (including the traces
#' of its animation frames). If no single partial bundle can render `p`, then
#' the full bundle (`'full'`) is used.
#' @param local,minified unused: the bundles are the minified ones shipped
#' with the package, which work without an internet connection (kept for
#' compatibility with the plotly package).
#' @return `p`, which renders with that bundle.
#' @author Carson Sievert
#' @export
#' @examplesIf interactive() || !identical(.Platform$OS.type, "windows")
#'
#' # ----------------------------------------------------------------------
#' # This function is always safe to use when rendering a single
#' # plotly graph. In this case, we get a 3x file reduction.
#' # ----------------------------------------------------------------------
#'
#' \dontrun{
#' library(plotly.core)
#' p <- go_figure() |> add_scatter(x = 1:10, y = 1:10, mode = "markers")
#' save_widget <- function(p, f) {
#'   write_html(p, f)
#'   mb <- round(file.info(f)$size / 1e6, 3)
#'   message("File is: ", mb, " MB")
#' }
#' f1 <- tempfile(fileext = ".html")
#' f2 <- tempfile(fileext = ".html")
#' save_widget(p, f1)
#' save_widget(partial_bundle(p), f2)
#'
#' # ----------------------------------------------------------------------
#' # But, since a page loads one plotly.js,
#' # be careful when putting multiple graphs in a larger document!
#' # Here the page loads the full bundle, which the surface (part of the
#' # gl3d bundle, not the cartesian one) needs.
#' # ----------------------------------------------------------------------
#'
#' library(htmltools)
#' p1 <- go_figure() |>
#'   add_heatmap(z = volcano) |>
#'   partial_bundle()
#' p2 <- go_figure() |>
#'   add_surface(z = volcano) |>
#'   partial_bundle(type = "full")
#' browsable(tagList(plotly_widget(p1), plotly_widget(p2)))
#' }
#'
partial_bundle <- function(p, type = "auto", local = TRUE, minified = TRUE) {
  UseMethod("partial_bundle")
}

#' @export
partial_bundle.default <- function(
  p,
  type = "auto",
  local = TRUE,
  minified = TRUE
) {
  # the bundle is chosen (for "auto") when the figure is drawn, from its
  # trace types
  type <- match.arg(type, c("auto", "full", names(bundleTraceMap)))
  p <- set_widget_setting(p, "bundle", type)
  # unfortunately, htmlwidgets doesn't appear to support manipulation of
  # dependencies field during preRenderHook(), so for a widget the plotly.js
  # dependency is replaced now
  if (inherits(p, "htmlwidget")) {
    p <- set_plotlyjs_dependency(
      p,
      verify_partial_bundle(type, figure_trace_types(p$x))
    )
  }
  p
}

# The bundle to load for a figure with trace types `types`: "full", or a
# partial bundle that has them all
verify_partial_bundle <- function(bundle, types) {
  bundle <- match.arg(bundle, c("auto", "full", names(bundleTraceMap)))
  # return early if we're using the main (full) bundle (the default)
  if (identical(bundle, "full")) {
    return("full")
  }
  covers <- vapply(
    bundleTraceMap,
    function(t) all(types %in% t),
    logical(1)
  )
  if (identical(bundle, "auto")) {
    # resolve an auto bundle by using the smallest bundle that supports all
    # the types; the full bundle if none does
    if (!any(covers)) {
      return("full")
    }
    candidates <- names(bundleTraceMap)[covers]
    sizes <- file.size(vapply(candidates, plotlyjs_bundle_file, ""))
    return(candidates[[which.min(sizes)]])
  }
  # verify that this partial bundle actually supports this viz; if not, the
  # full bundle is used
  if (!covers[[bundle]]) {
    warning(
      sprintf(
        "The '%s' plotly.js bundle doesn't have trace type(s) %s; using the full bundle",
        bundle,
        paste0(
          "'",
          setdiff(types, bundleTraceMap[[bundle]]),
          "'",
          collapse = ", "
        )
      ),
      call. = FALSE
    )
    return("full")
  }
  bundle
}

# The plotly.js dependencies of a widget (all bundles are named "plotly-main")
plotlyjsBundleIDX <- function(p) {
  depNames <- vapply(p$dependencies, `[[`, "", "name")
  which(depNames == "plotly-main")
}

# bundleTraceMap, the trace types of each partial bundle, is created from
# plotly.js's dist/README.md by the plotly.js update in commands.R (in
# R/zz-gen-version.R)
