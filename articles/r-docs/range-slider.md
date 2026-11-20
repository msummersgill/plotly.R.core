# Range Sliders and Selectors

### Basic Range Slider and Selector Buttons

``` r

library(plotly.core)

# Daily adjusted closing prices
stocks <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/stockdata.csv")
stocks$Date <- as.Date(stocks$Date)
ds <- stocks[stocks$Date >= as.Date("2015-01-01"), ]

fig <- ds |>
  go_figure() |>
  add_scatter(x = ~Date, y = ~AAPL, mode = "lines", name = "Apple") |>
  add_scatter(x = ~Date, y = ~MSFT, mode = "lines", name = "Microsoft") |>
  update_layout(
    title = "Stock Prices",
    xaxis = go_xaxis(
      rangeselector = go_xaxis_rangeselector(
        buttons = list(
          go_xaxis_rangeselector_button(
            count = 3,
            label = "3 mo",
            step = "month",
            stepmode = "backward"
          ),
          go_xaxis_rangeselector_button(
            count = 6,
            label = "6 mo",
            step = "month",
            stepmode = "backward"
          ),
          go_xaxis_rangeselector_button(
            count = 1,
            label = "1 yr",
            step = "year",
            stepmode = "backward"
          ),
          go_xaxis_rangeselector_button(
            count = 1,
            label = "YTD",
            step = "year",
            stepmode = "todate"
          ),
          go_xaxis_rangeselector_button(step = "all")
        )
      ),
      rangeslider = go_xaxis_rangeslider(visible = TRUE)
    ),
    yaxis = go_yaxis(title = "Price")
  )

fig
```
