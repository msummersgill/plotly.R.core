"""Dump plotly.py's color sequences and scales (plotly.colors) to JSON.

Run from the package root with plotly.py installed:
    python3 codegen/resources/px_colors.py
Writes codegen/resources/px-colors.json, which codegen/colors.R turns into
R/zz-gen-colors.R. Reversed ("_r") variants are omitted; use rev().
"""
import json

import plotly
from plotly.colors import cyclical, diverging, qualitative, sequential

out = {"plotly_version": plotly.__version__}
for module_name, module in [("qualitative", qualitative), ("sequential", sequential),
                            ("diverging", diverging), ("cyclical", cyclical)]:
    scales = {}
    for name in sorted(dir(module)):
        value = getattr(module, name)
        if name.startswith("_") or name.endswith("_r") or not isinstance(value, list):
            continue
        if value and all(isinstance(c, str) for c in value):
            scales[name] = value
    out[module_name] = scales

with open("codegen/resources/px-colors.json", "w", encoding="utf-8") as f:
    json.dump(out, f, indent=1)
