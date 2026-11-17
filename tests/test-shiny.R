# Shiny bindings, widget settings and knitr output (the event/proxy round trip
# needs a browser and is not tested here).
library(plotly.core)

expect_error <- function(expr, pattern) {
  msg <- tryCatch(
    {
      expr
      NULL
    },
    error = function(e) conditionMessage(e)
  )
  if (is.null(msg)) {
    stop(
      "Expected an error matching '",
      pattern,
      "' but none was raised",
      call. = FALSE
    )
  }
  if (!grepl(pattern, msg)) {
    stop("Error message did not match '", pattern, "':\n", msg, call. = FALSE)
  }
  invisible(TRUE)
}

fig <- go_figure(go_scatter(y = 1:3)) |>
  event_source("src") |>
  event_register("plotly_legendclick") |>
  event_unregister("plotly_hover") |>
  config(scrollZoom = TRUE, locale = "de")
w <- as_widget(fig)
stopifnot(
  identical(w$x$source, "src"),
  "plotly_legendclick" %in% w$x$shinyEvents,
  !"plotly_hover" %in% w$x$shinyEvents,
  isTRUE(w$x$config$scrollZoom),
  identical(w$x$config$locale, "de"),
  any(vapply(w$dependencies, `[[`, "", "name") == "plotly-locale-de")
)
# settings survive figure operations
fig2 <- update_layout(fig, title = "T")
stopifnot(identical(attr(fig2, "plotly_source"), "src"))
expect_error(config(fig, scrolZoom = TRUE), "Invalid config option")
expect_error(config(fig, locale = "xx"), "Unknown locale")
expect_error(event_register(fig, "plotly_bogus"), "should be one of")

w <- as_widget(config(fig, mathjax = "cdn"))
stopifnot(any(vapply(w$dependencies, `[[`, "", "name") == "mathjax"))
# the bundled MathJax: a local dependency, also with mathjax = TRUE
for (mj in list("local", TRUE)) {
  dep <- Filter(
    function(d) d$name == "mathjax",
    as_widget(config(fig, mathjax = mj))$dependencies
  )[[1]]
  stopifnot(
    identical(dep$script, "tex-svg.js"),
    identical(dep$package, "plotly.core"),
    file.exists(system.file(dep$src$file, "tex-svg.js", package = dep$package))
  )
}
stopifnot(inherits(try(config(fig, mathjax = "web"), silent = TRUE), "try-error"))

if (requireNamespace("shiny", quietly = TRUE)) {
  out <- plotlyOutput("plot", height = "300px")
  stopifnot(
    inherits(out, "shiny.tag.list") || inherits(out, "shiny.tag"),
    grepl("plotly_core", as.character(out))
  )
  stopifnot(is.function(renderPlotly(go_figure())))
  expect_error(event_data("plotly_click", session = NULL), "No reactive domain")
  expect_error(plotlyProxy("plot", session = NULL), "server function")
  expect_error(plotlyProxyInvoke(list(), "restyle"), "proxy object")
}

# htmlwidgets keep their settings in x
lw <- event_register(
  plotly_widget(go_figure(go_scatter(y = 1:3))),
  "plotly_hover"
)
stopifnot(
  inherits(lw, "htmlwidget"),
  "plotly_hover" %in% lw$x$shinyEvents,
  identical(as_widget(lw), lw)
)

# the Plotly Cloud share button is off by default (JS CONFIG_DEFAULTS); config() opts in
local({
  f <- go_figure(go_scatter(y = 1:3))
  stopifnot(
    is.null(
      config(f, scrollZoom = TRUE) |>
        plotly.core:::get_widget_setting("config") |>
        (\(x) x$showSendToCloud)()
    ),
    isTRUE(
      plotly.core:::get_widget_setting(
        config(f, showSendToCloud = TRUE),
        "config"
      )$showSendToCloud
    ),
    isTRUE(
      plotly.core:::get_widget_setting(
        config(f, cloud = TRUE),
        "config"
      )$showSendToCloud
    ),
    isFALSE(
      plotly.core:::get_widget_setting(
        config(f, cloud = FALSE),
        "config"
      )$showSendToCloud
    )
  )
})
