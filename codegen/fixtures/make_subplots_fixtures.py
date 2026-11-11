"""Reference output from plotly.py for tests/test-subplots.R.

Run from the package root with plotly.py installed:
    python3 codegen/fixtures/make_subplots_fixtures.py
Writes tests/fixtures/plotly-py-subplots.json. The R test builds the same
figures with make_subplots() and compares the JSON.
"""
import json

import plotly
import plotly.graph_objects as go
from plotly.subplots import make_subplots

CASES = {
    "basic": dict(rows=2, cols=3),
    "titles": dict(rows=2, cols=2, subplot_titles=["A", "B", "", "D"]),
    "shared_x": dict(rows=3, cols=2, shared_xaxes=True, vertical_spacing=0.05),
    "shared_all": dict(rows=2, cols=2, shared_xaxes="all", shared_yaxes="all"),
    "bottom_left": dict(rows=2, cols=2, start_cell="bottom-left", row_heights=[1, 3], column_widths=[0.7, 0.3]),
    "specs": dict(rows=2, cols=2, specs=[[{"secondary_y": True}, {"type": "domain"}], [{"colspan": 2}, None]]),
    "mixed": dict(
        rows=2, cols=3,
        specs=[[{"type": "polar"}, {"type": "scene"}, {"type": "pie"}],
               [{"rowspan": 1}, {"type": "ternary"}, {"type": "geo"}]],
        column_titles=["c1", "c2", "c3"], row_titles=["r1", "r2"], x_title="X", y_title="Y",
    ),
    "rowspan": dict(rows=3, cols=2, specs=[[{"rowspan": 2}, {}], [None, {}], [{"colspan": 2}, None]]),
    "insets": dict(rows=1, cols=2, insets=[{"cell": (1, 2), "l": 0.5, "b": 0.5}]),
}


def placement_figure():
    fig = make_subplots(rows=2, cols=2, specs=[[{"secondary_y": True}, {"type": "domain"}], [{}, {"type": "polar"}]])
    fig.add_trace(go.Scatter(y=[1, 2]), row=1, col=1)
    fig.add_trace(go.Scatter(y=[3, 4]), row=1, col=1, secondary_y=True)
    fig.add_trace(go.Pie(values=[1, 2]), row=1, col=2)
    fig.add_trace(go.Bar(y=[5, 6]), row=2, col=1)
    fig.add_trace(go.Scatterpolar(r=[1, 2], theta=[0, 90]), row=2, col=2)
    fig.add_scatter(y=[7, 8], row="all", col=1)
    fig.update_xaxes(title_text="bottom x", row=2, col=1)
    fig.update_yaxes(title_text="secondary", row=1, col=1, secondary_y=True)
    fig.update_traces(marker_color="red", row=1, col=1)
    fig.add_annotation(text="note", x=1, y=1, row=2, col=1)
    fig.add_shape(type="line", x0=0, x1=1, y0=0, y1=1, xref="x domain", row=1, col=1, secondary_y=True)
    fig.update_annotations(font_size=20, row=2, col=1)
    fig.update_polars(radialaxis_range=[0, 3], row=2, col=2)
    return fig


def without_template(d):
    d["layout"].pop("template", None)
    return d


out = {"plotly_version": plotly.__version__, "cases": {}}
for name, kwargs in CASES.items():
    fig = make_subplots(**kwargs)
    out["cases"][name] = {"layout": without_template(fig.to_plotly_json())["layout"], "grid": fig._grid_str}
out["placement"] = without_template(placement_figure().to_plotly_json())

with open("tests/fixtures/plotly-py-subplots.json", "w", encoding="utf-8") as f:
    json.dump(out, f, indent=1, ensure_ascii=False)
