# Tables

### Basic Table

A table’s `values` take one vector per column; the rows of a matrix
built with [`rbind()`](https://rdrr.io/r/base/cbind.html) become the
columns of the table.

``` r

library(plotly.core)

diamonds <- ggplot2::diamonds

fig <- go_figure() |>
  add_table(
    columnwidth = c(100, 100),
    columnorder = c(0, 1),
    header = go_table_header(
      values = c("Cut", "Price"),
      align = c("center", "center"),
      line = go_table_header_line(width = 1, color = "black"),
      fill = go_table_header_fill(color = c("grey", "grey")),
      font = go_font(family = "Arial", size = 14, color = "white")
    ),
    cells = go_table_cells(
      values = rbind(as.character(diamonds$cut), diamonds$price),
      align = c("center", "center"),
      line = go_table_cells_line(color = "black", width = 1),
      font = go_font(family = "Arial", size = 12, color = "black")
    )
  )

fig
```

### Styled Table

``` r

library(plotly.core)

fig <- go_figure() |>
  add_table(
    header = go_table_header(
      values = c("<b>EXPENSES</b>", "<b>Q1</b>", "<b>Q2</b>", "<b>Q3</b>", "<b>Q4</b>"),
      line = go_table_header_line(color = "#506784"),
      fill = go_table_header_fill(color = "#119DFF"),
      align = c("left", "center"),
      font = go_font(color = "white", size = 12)
    ),
    cells = go_table_cells(
      values = rbind(
        c("Salaries", "Office", "Merchandise", "Legal", "<b>TOTAL</b>"),
        c(1200000, 20000, 80000, 2000, 1212000),
        c(1300000, 20000, 70000, 2000, 1392000),
        c(1300000, 20000, 120000, 2000, 1442000),
        c(1400000, 20000, 90000, 2000, 1412000)
      ),
      line = go_table_cells_line(color = "#506784"),
      fill = go_table_cells_fill(color = c("#25FEFD", "white")),
      align = c("left", "center"),
      font = go_font(color = "#506784", size = 12)
    )
  )

fig
```

### Table From a Dataframe

``` r

library(plotly.core)

fig <- go_figure() |>
  add_table(
    header = go_table_header(
      values = c("<b>Cars</b>", names(mtcars)),
      align = c("left", rep("center", ncol(mtcars))),
      line = go_table_header_line(width = 1, color = "black"),
      fill = go_table_header_fill(color = "rgb(235, 100, 230)"),
      font = go_font(family = "Arial", size = 14, color = "white")
    ),
    cells = go_table_cells(
      values = rbind(
        rownames(mtcars),
        t(as.matrix(unname(mtcars)))
      ),
      align = c("left", rep("center", ncol(mtcars))),
      line = go_table_cells_line(color = "black", width = 1),
      fill = go_table_cells_fill(
        color = c("rgb(235, 193, 238)", "rgba(228, 222, 249, 0.65)")
      ),
      font = go_font(family = "Arial", size = 12, color = "black")
    )
  )

fig
```

### Changing Size of Rows and Columns

``` r

library(plotly.core)

lorem <- "Lorem ipsum dolor sit amet, tollit discere inermis pri ut. Eos ea iusto timeam, an prima laboramus vim. Id usu aeterno adversarium, summo mollis timeam vel ad"
values <- rbind(
  c("Salaries", "Office", "Merchandise", "Legal", "<b>TOTAL<br>EXPENSES</b>"),
  rep(lorem, 5)
)

fig <- go_figure() |>
  add_table(
    columnorder = c(1, 2),
    columnwidth = c(80, 400),
    header = go_table_header(
      values = c("<b>EXPENSES</b><br>as of July 2017", "<b>DESCRIPTION</b>"),
      line = go_table_header_line(color = "#506784"),
      fill = go_table_header_fill(color = "#119DFF"),
      align = c("left", "center"),
      font = go_font(color = "white", size = 12),
      height = 40
    ),
    cells = go_table_cells(
      values = values,
      line = go_table_cells_line(color = "#506784"),
      fill = go_table_cells_fill(color = c("#25FEFD", "white")),
      align = c("left", "center"),
      font = go_font(color = "#506784", size = 12),
      height = 30
    )
  )

fig
```

\#Reference

See
[`go_table()`](https://msummersgill.github.io/plotly.R.core/reference/go_table.md)
for more information and chart attribute options!
