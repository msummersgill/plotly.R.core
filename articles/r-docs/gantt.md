# Gantt Charts

#### Gantt Chart

``` r

library(plotly.core)

# Read in data
df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/GanttChart-updated.csv", stringsAsFactors = F)

# Convert to dates
df$Start <- as.Date(df$Start, format = "%m/%d/%Y")

# Sample client name
client <- "Sample Client"

# Choose colors based on number of resources
cols <- RColorBrewer::brewer.pal(length(unique(df$Resource)), name = "Set3")
df$color <- factor(df$Resource, labels = cols)

# Initialize empty plot
fig <- go_figure()

# Each task is a separate trace
# Each trace is essentially a thick line plot
# x-axis ticks are dates and handled automatically

for (i in 1:(nrow(df) - 1)) {
  fig <- fig |>
    add_scatter(
      x = c(df$Start[i], df$Start[i] + df$Duration[i]), # x0, x1
      y = c(i, i), # y0, y1
      mode = "lines",
      line = go_scatter_line(color = as.character(df$color[i]), width = 20),
      showlegend = FALSE,
      hoverinfo = "text",

      # Create custom hover text
      text = paste(
        "Task: ", df$Task[i], "<br>",
        "Duration: ", df$Duration[i], "days<br>",
        "Resource: ", df$Resource[i]
      )
    )
}

fig
```

### Alter Layout

``` r

# Add information to plot and make the chart more presentable

fig <- fig |>
  update_layout(
    # Axis options:
    # 1. Remove gridlines
    # 2. Customize y-axis tick labels and show task names instead of numbers
    xaxis = go_xaxis(showgrid = FALSE, tickfont = go_font(color = "#e6e6e6")),
    yaxis = go_yaxis(
      showgrid = FALSE,
      tickfont = go_font(color = "#e6e6e6"),
      tickmode = "array",
      tickvals = 1:nrow(df),
      ticktext = unique(df$Task),
      domain = c(0, 0.9)
    ),
    plot_bgcolor = "#333333", # Chart area color
    paper_bgcolor = "#333333" # Axis area color
  )

fig
```

### Add Annotations

``` r

# Add total duration and total resources used
# x and y coordinates are based on a domain of [0,1] and not
# actual x-axis and y-axis values
fig <- fig |>
  add_annotation(
    xref = "paper",
    yref = "paper",
    x = 0.80,
    y = 0.1,
    text = paste0(
      "Total Duration: ", sum(df$Duration), " days<br>",
      "Total Resources: ", length(unique(df$Resource)), "<br>"
    ),
    font = go_font(color = "#264E86", size = 12),
    ax = 0,
    ay = 0,
    align = "left",
    showarrow = FALSE
  ) |>
  # Add client name and title on top
  add_annotation(
    xref = "paper",
    yref = "paper",
    x = 0.1,
    y = 1,
    xanchor = "left",
    text = paste0("Gantt Chart: ", client),
    font = go_font(color = "#264E86", size = 20, family = "Times New Roman"),
    ax = 0,
    ay = 0,
    align = "left",
    showarrow = FALSE
  )

fig
```

for more information please refer to
<http://moderndata.plot.ly/gantt-charts-in-r-using-plotly/>
