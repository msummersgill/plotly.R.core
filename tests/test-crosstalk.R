library(plotly.core)

if (requireNamespace("crosstalk", quietly = TRUE)) {
  sd <- crosstalk::SharedData$new(iris, group = "iris")

  # A figure linked per trace: each species' points carry their rows' keys;
  # a fitted line stands for all of them
  fig <- go_figure()
  for (i in seq_along(levels(iris$Species))) {
    rows <- which(iris$Species == levels(iris$Species)[[i]])
    fig <- fig |>
      add_scatter(
        x = iris$Sepal.Width[rows],
        y = iris$Sepal.Length[rows],
        mode = "markers"
      ) |>
      set_crosstalk_keys(
        sd$key()[rows],
        group = "iris",
        traces = 2L * i - 1L
      ) |>
      add_scatter(
        x = range(iris$Sepal.Width[rows]),
        y = range(iris$Sepal.Length[rows]),
        mode = "lines"
      ) |>
      set_crosstalk_keys(
        sd$key()[rows],
        group = "iris",
        traces = 2L * i,
        simple = TRUE
      )
  }
  keys <- attr(fig, "plotly_keys")
  stopifnot(
    length(fig$data) == 6L,
    identical(unlist(attr(fig, "plotly_sets")), rep("iris", 6L)),
    identical(keys[[1]], as.character(1:50)),
    identical(keys[[2]], list(simple = as.character(1:50))),
    identical(keys[[3]], as.character(51:100))
  )

  # The widget: highlight defaults, keys as JSON arrays, crosstalk libraries
  w <- as_widget(fig)
  json <- as.character(attr(w$x, "TOJSON_FUNC")(w$x))
  stopifnot(
    identical(w$x$highlight$on, "plotly_click"),
    identical(w$x$highlight$off, "plotly_doubleclick"),
    grepl('"keys":[["1","2","3"', json, fixed = TRUE),
    grepl('{"simple":["1","2"', json, fixed = TRUE),
    "crosstalk" %in% vapply(w$dependencies, `[[`, "", "name"),
    is.null(w$x$selectize),
    is.null(w$x$layout$dragmode)
  )

  # highlight(): options, default selection, selectize items, dragmode
  w <- as_widget(highlight(
    fig,
    on = "plotly_selected",
    color = "red",
    selectize = TRUE,
    defaultValues = c("2", "200")
  ))
  hl <- w$x$highlight
  stopifnot(
    identical(hl$off, "plotly_deselect"),
    identical(hl$color, "#FF0000"),
    identical(unclass(hl$defaultSelection$iris), "2"),
    is.null(hl$defaultValues),
    identical(w$x$layout$dragmode, "select"),
    length(w$x$selectize$iris$items) == 150L,
    identical(w$x$selectize$iris$items[[3]], list(value = "3", label = "3")),
    identical(w$x$selectize$iris$group, "iris"),
    "selectize" %in% vapply(w$dependencies, `[[`, "", "name")
  )
  stopifnot(
    identical(
      attr(
        suppressMessages(highlight(fig, dynamic = TRUE)),
        "plotly_highlight"
      )$color,
      c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3")
    ),
    identical(
      as.character(attr(highlight(fig, on = NULL), "plotly_highlight")$off),
      "plotly_relayout"
    ),
    inherits(try(highlight(fig, opacityDim = 2), silent = TRUE), "try-error"),
    inherits(try(highlight(fig, on = "plotly_foo"), silent = TRUE), "try-error")
  )

  # Options as the plotly package's highlight() took them: CSS colours (e.g.
  # from toRGB()), flags given as NULL or 1; its messages
  hl <- attr(
    suppressMessages(highlight(
      fig,
      color = c(
        "rgba(255,0,0,0.5)",
        "hsl(120, 100%, 50%)",
        "blue",
        "#00FF0080"
      ),
      dynamic = 1,
      persistent = 1,
      selectize = NULL
    )),
    "plotly_highlight"
  )
  stopifnot(
    identical(
      hl$color,
      c("rgba(255,0,0,0.5)", "hsl(120, 100%, 50%)", "#0000FF", "#00FF0080")
    ),
    isTRUE(hl$dynamic),
    isTRUE(hl$persistent),
    isFALSE(hl$selectize)
  )
  msgs <- character()
  withCallingHandlers(
    highlight(fig, persistent = TRUE, dynamic = TRUE),
    message = function(m) {
      msgs <<- c(msgs, conditionMessage(m))
      invokeRestart("muffleMessage")
    }
  )
  stopifnot(
    any(grepl("holding the shift key", msgs)),
    any(grepl("Adding more colors", msgs))
  )
  # a default `off` is marked for the plotly package, and sent as a string
  hl <- attr(highlight(fig, on = "plotly_selected"), "plotly_highlight")
  stopifnot(
    inherits(hl$off, "plotly_default"),
    identical(
      as_widget(highlight(fig, on = "plotly_selected"))$x$highlight$off,
      "plotly_deselect"
    ),
    !inherits(
      attr(highlight(fig, off = "plotly_relayout"), "plotly_highlight")$off,
      "plotly_default"
    )
  )

  # A selectize payload given by the plotly package (keyed by a hash of the
  # group name) is used for its group
  given <- list(
    abc123 = list(
      items = data.frame(
        value = as.character(1:150),
        label = paste("row", 1:150)
      ),
      group = "iris"
    )
  )
  f2 <- highlight(fig, selectize = TRUE)
  attr(f2, "plotly_selectize") <- given
  sel <- as_widget(f2)$x$selectize
  stopifnot(
    identical(names(sel), "iris"),
    identical(sel$iris$items[[1]]$label, "row 1")
  )

  # set_crosstalk_keys() on any figure
  g <- go_figure() |>
    add_scatter(
      x = iris$petal_width,
      y = iris$petal_length,
      mode = "markers"
    ) |>
    add_scatter(x = c(0, 2), y = c(1, 6), mode = "lines") |>
    set_crosstalk_keys(sd, traces = 1) |>
    set_crosstalk_keys(
      sd$key()[1:10],
      group = "iris",
      traces = 2,
      simple = TRUE
    )
  stopifnot(
    identical(attr(g, "plotly_keys")[[1]], as.character(1:150)),
    identical(attr(g, "plotly_keys")[[2]], list(simple = as.character(1:10))),
    identical(attr(g, "plotly_sets"), list("iris", "iris")),
    inherits(
      try(set_crosstalk_keys(g, sd, traces = 3), silent = TRUE),
      "try-error"
    ),
    inherits(try(set_crosstalk_keys(g, 1:3), silent = TRUE), "try-error")
  )

  # Unlinked figures carry no crosstalk settings
  w0 <- as_widget(
    go_figure(iris) |> add_scatter(x = ~Sepal.Width, y = ~Sepal.Length)
  )
  stopifnot(is.null(w0$x$highlight), is.null(w0$x$sets))
}

# go_figure() / add_<trace>() with a SharedData: traces whose points are its
# rows are linked; others (and traces of plain data) aren't
if (requireNamespace("crosstalk", quietly = TRUE)) {
  sd <- crosstalk::SharedData$new(mtcars, group = "cars")
  f <- sd |>
    go_figure() |>
    add_scatter(x = ~mpg, y = ~hp, mode = "markers") |>
    add_scatter(x = c(10, 30), y = c(50, 300), mode = "lines") |>
    add_bar(x = ~cyl, y = ~mpg, data = mtcars) |>
    add_histogram(
      x = ~wt,
      data = crosstalk::SharedData$new(mtcars, group = "other")
    ) |>
    highlight(on = "plotly_selected", color = "red")
  keys <- attr(f, "plotly_keys")
  stopifnot(
    identical(attr(f, "plotly_sets"), list("cars", NULL, NULL, "other")),
    identical(keys[[1]], rownames(mtcars)),
    is.null(keys[[2]]),
    identical(as_widget(f)$x$layout$dragmode, "select")
  )
  # with subplot cells: each added trace is linked
  g <- make_subplots(rows = 1, cols = 2) |>
    add_scatter(
      x = ~mpg,
      y = ~hp,
      data = sd,
      mode = "markers",
      row = 1,
      col = "all"
    )
  stopifnot(identical(attr(g, "plotly_sets"), list("cars", "cars")))
}
