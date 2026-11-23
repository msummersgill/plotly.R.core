#' Render TeX in a plotly graph using MathJax
#'
#' This function makes it slightly easier to render TeX in a plotly graph --
#' it ensures the provided string is surrounded with `$` (this is what plotly.js
#' uses to declare a string as TeX). MathJax must be included with
#' `config(p, mathjax = "local")` (or `"cdn"`); [save_image()] needs nothing.
#'
#' @param x a character vector
#' @return `x`, surrounded with `$`.
#' @export
#' @author Carson Sievert
#' @seealso [config]
#' @examples
#' go_figure() |>
#'   update_layout(title = TeX("\\text{Some mathjax: }\\alpha+\\beta x")) |>
#'   config(mathjax = "cdn")
TeX <- function(x) {
  startsWithDollar <- grepl("^\\$", x)
  endsWithDollar <- grepl("\\$$", x)
  paste0(ifelse(startsWithDollar, "", "$"), x, ifelse(endsWithDollar, "", "$"))
}

# plotly.js 4 typesets with MathJax 3 or 4 (not 2); tex-svg.js is MathJax
# 3.2.2's single-file TeX-to-SVG build
mathjax_cdn <- function() {
  htmltools::htmlDependency(
    name = "mathjax",
    version = "3.2.2",
    src = c(href = "https://cdn.jsdelivr.net/npm/mathjax@3.2.2/es5"),
    script = "tex-svg.js"
  )
}

# The MathJax bundled with the package: works offline, and is embedded in
# self-contained HTML
mathjax_local <- function() {
  htmltools::htmlDependency(
    name = "mathjax",
    version = "3.2.2",
    src = dependency_dir("mathjax"),
    package = "plotly.core",
    script = "tex-svg.js",
    all_files = FALSE
  )
}


# The bundled MathJax script (for static image export), rather than a
# MathJax directory set with the PLOTLY_MATHJAX_PATH environment variable
mathjax_path <- function() {
  system.file(
    "htmlwidgets",
    "lib",
    "mathjax",
    "tex-svg.js",
    package = "plotly.core"
  )
}
