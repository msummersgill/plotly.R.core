HTMLWidgets.widget({
  name: "plotly_R_core",
  type: "output",

  factory: function(el, width, height) {
    return {
      renderValue: function(x) {
        var layout = Object.assign({}, x.layout);
        var config = Object.assign({ responsive: true }, x.config);
        Plotly.react(el, { data: x.data, layout: layout, config: config, frames: x.frames || [] });
      },
      resize: function(width, height) {
        if (el.layout) Plotly.Plots.resize(el);
      }
    };
  }
});
