HTMLWidgets.widget({
  name: "plotlyr",
  type: "output",

  factory: function(el, width, height) {
    return {
      renderValue: function(x) {
        var layout = Object.assign({}, x.layout);
        var config = Object.assign({ responsive: true }, x.config);
        Plotly.react(el, x.data, layout, config);
      },
      resize: function(width, height) {
        if (el.layout) Plotly.Plots.resize(el);
      }
    };
  }
});
