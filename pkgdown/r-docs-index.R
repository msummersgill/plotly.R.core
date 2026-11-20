# Builds the gallery index of the R docs examples sub-site
# (vignettes/articles/r-docs/index.Rmd) and its thumbnails.
#
# Each page's front matter gives its title, category (display_as) and order.
# A thumbnail is the first figure the page draws, saved with save_image().
#
# Usage, from the package root:
#   Rscript pkgdown/r-docs-index.R              # index, missing thumbnails
#   Rscript pkgdown/r-docs-index.R --thumbnails # index, all thumbnails

library(plotly.core)

dir <- "vignettes/articles/r-docs"
# thumb-<slug>.png, next to the pages: pkgdown URL-escapes the "/" of image
# paths in subfolders
thumb_file <- function(slug) file.path(dir, paste0("thumb-", slug, ".png"))
redo_thumbnails <- "--thumbnails" %in% commandArgs(TRUE)

# Gallery sections, in page order
CATEGORIES <- c(
  file_settings = "Fundamentals",
  basic = "Basic Charts",
  statistical = "Statistical Charts",
  scientific = "Scientific Charts",
  financial = "Financial Charts",
  maps = "Maps",
  "3d_charts" = "3D Charts",
  multiple_axes = "Subplots and Multiple Axes",
  ai_ml = "Artificial Intelligence and Machine Learning",
  controls = "Controls",
  animations = "Animations",
  advanced_opt = "Advanced",
  transforms = "Transforms",
  legacy_charts = "Legacy Charts",
  other = "Other"
)

front_matter <- function(path) {
  rmarkdown::yaml_front_matter(path)[c("title", "display_as", "order")] |>
    lapply(function(x) x %||% NA)
}

# The first go_figure a page's code chunks create (NULL if none).
first_figure <- function(path) {
  code <- knitr::purl(
    path,
    output = tempfile(),
    quiet = TRUE,
    documentation = 0
  )
  exprs <- tryCatch(parse(code), error = function(e) expression())
  env <- new.env(parent = globalenv())
  old <- setwd(dirname(path))
  on.exit(setwd(old))
  for (e in exprs) {
    val <- tryCatch(
      withVisible(suppressWarnings(suppressMessages(eval(e, env)))),
      error = function(err) NULL
    )
    if (!is.null(val) && val$visible && inherits(val$value, "go_figure")) {
      return(val$value)
    }
  }
  NULL
}

pages <- setdiff(list.files(dir, "[.]Rmd$"), "index.Rmd")
info <- do.call(
  rbind,
  lapply(pages, function(p) {
    fm <- front_matter(file.path(dir, p))
    data.frame(
      slug = sub("[.]Rmd$", "", p),
      title = fm$title,
      category = if (fm$display_as %in% names(CATEGORIES)) {
        fm$display_as
      } else {
        "other"
      },
      order = suppressWarnings(as.numeric(fm$order)),
      stringsAsFactors = FALSE
    )
  })
)

# Thumbnails
info$thumb <- file.exists(thumb_file(info$slug))
for (i in which(redo_thumbnails | !info$thumb)) {
  fig <- first_figure(file.path(dir, paste0(info$slug[[i]], ".Rmd")))
  if (is.null(fig)) {
    next
  }
  fig <- fig |>
    update_layout(
      showlegend = FALSE,
      title = "",
      margin = go_margin(l = 10, r = 10, t = 10, b = 10)
    )
  ok <- tryCatch(
    {
      save_image(
        fig,
        thumb_file(info$slug[[i]]),
        width = 400,
        height = 400,
        scale = 0.65
      )
      TRUE
    },
    error = function(e) FALSE
  )
  info$thumb[[i]] <- ok
  message(info$slug[[i]], if (ok) ": thumbnail" else ": no thumbnail")
}

card <- function(row) {
  img <- if (row$thumb) {
    sprintf('<img src="thumb-%s.png" alt="" loading="lazy">', row$slug)
  } else {
    '<div class="r-docs-nothumb"></div>'
  }
  sprintf(
    '<a class="r-docs-card" href="%s.html">%s<span>%s</span></a>',
    row$slug,
    img,
    htmltools::htmlEscape(row$title)
  )
}

sections <- unlist(lapply(names(CATEGORIES), function(cat) {
  rows <- info[info$category == cat, ]
  if (!nrow(rows)) {
    return(NULL)
  }
  rows <- rows[order(rows$order, rows$title), ]
  c(
    paste("##", CATEGORIES[[cat]]),
    "",
    '<div class="r-docs-grid">',
    vapply(split(rows, seq_len(nrow(rows))), card, ""),
    "</div>",
    ""
  )
}))

writeLines(
  c(
    "---",
    'title: "Plotly R examples"',
    'description: "The Plotly R graphing library examples, written with plotly.core graph objects."',
    "---",
    "",
    "These examples are adapted from the [Plotly R documentation](https://plotly.com/r/),",
    "rewritten with plotly.core's graph objects: `go_figure()`, `add_<trace>()`,",
    "`update_layout()` and the `go_*()` constructors.",
    "",
    sections
  ),
  file.path(dir, "index.Rmd")
)
message("Wrote ", file.path(dir, "index.Rmd"), " (", nrow(info), " pages)")
