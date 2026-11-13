/*
 * htmlwidgets binding for plotly.core.
 *
 * x = {data, layout, config, frames, source, shinyEvents, keys, and for
 *      crosstalk linking: sets, frameKeys, highlight, selectize; fitBounds:
 *      {mapId: [west, south, east, north]} initial views of map subplots}
 *
 * In Shiny, registered plotly.js events are sent to the server as the input
 * "<event>-<source>" (read with event_data()), and messages from
 * plotlyProxyInvoke() call plotly.js methods on existing plots. The event
 * handling follows the legacy plotly R package so that event_data() returns
 * the same structures.
 *
 * Linked highlighting (crosstalk) is a port of the legacy package's widget:
 * traces with a crosstalk `set` (group) and `key` listen to the group's
 * selection and filter handles; selected observations are drawn as extra
 * "selection traces" and the other traces are dimmed.
 */

// plotly.js config defaults: no modebar button that uploads the chart to
// Plotly Cloud (opt in with config(showSendToCloud = TRUE))
var CONFIG_DEFAULTS = {responsive: true, showSendToCloud: false};

// Map traces (MapLibre) in pages opened from a file (a saved widget, or a
// plot shown in the browser from R): plotly.js gives MapLibre its worker as
// a blob: URL, which MapLibre takes as cross-origin on file:// pages and
// loads as a module importing it, which Chrome refuses ("Worker failed to
// load"), leaving maps blank (Chrome runs only classic workers from blob:
// URLs there). A worker URL ending in ".cjs" makes MapLibre fetch the script
// and start a classic worker instead, so JavaScript blob URLs get a "#.cjs"
// fragment there (a fragment does not change what a blob URL refers to), and
// fetching one drops the worker's final `export{...}` (the worker starts
// itself, through `self.worker`), which a classic script can't contain.
(function() {
  if (typeof window === "undefined" || window.location.protocol !== "file:" ||
      !window.URL || !URL.createObjectURL || URL.createObjectURL.plotlyCore) return;
  var create = URL.createObjectURL;
  var patched = function(obj) {
    var url = create.apply(URL, arguments);
    return obj && obj.type === "text/javascript" ? url + "#.cjs" : url;
  };
  patched.plotlyCore = true;
  URL.createObjectURL = patched;
  if (!window.fetch || !window.Response) return;
  var fetch0 = window.fetch;
  window.fetch = function(input) {
    var res = fetch0.apply(this, arguments);
    if (typeof input !== "string" || input.indexOf("blob:") !== 0 || !/#\.cjs$/.test(input)) return res;
    return res.then(function(r) {
      return r.text().then(function(text) {
        text = text.replace(/;?\s*export\s*\{[^{}]*\}\s*;?(\s*(\/\*[\s\S]*?\*\/\s*)*)$/, ";$1");
        return new Response(text, {status: 200, headers: {"Content-Type": "text/javascript"}});
      });
    });
  };
})();


(function() {

  // Messages from plotlyProxyInvoke(): {id, method, args (JSON string)}
  var proxyHandlerRegistered = false;
  function registerProxyHandler() {
    if (proxyHandlerRegistered || !HTMLWidgets.shinyMode) return;
    proxyHandlerRegistered = true;
    Shiny.addCustomMessageHandler("plotly-calls", function(msg) {
      var gd = document.getElementById(msg.id);
      if (!gd) throw new Error("Couldn't find plotly graph with id: " + msg.id);
      var args = typeof msg.args === "string" ? JSON.parse(msg.args) : (msg.args || []);
      if (msg.method === "reconfig") {
        // not a plotly.js method: re-render with a new configuration
        Plotly.react(gd, gd.data, gd.layout, Object.assign({}, CONFIG_DEFAULTS, args[0] || {}));
        return;
      }
      if (!Plotly[msg.method]) throw new Error("Unknown plotly.js method " + msg.method);
      Plotly[msg.method].apply(null, [gd].concat(args));
    });
  }

  // Point-level event data: curveNumber, pointNumber, x, y and, when
  // present, z, customdata and the trace's key (x.keys[curveNumber]).
  function pointEventData(gd, x) {
    return function(eventData) {
      if (eventData === undefined || eventData === null || !eventData.hasOwnProperty("points")) return null;
      return eventData.points.map(function(pt) {
        var obj = {curveNumber: pt.curveNumber, pointNumber: pt.pointNumber, x: pt.x, y: pt.y};
        if (pt.hasOwnProperty("z")) obj.z = pt.z;
        if (pt.hasOwnProperty("customdata")) obj.customdata = pt.customdata;
        var trace = (gd.data || [])[pt.curveNumber] || {};
        var keys = trace.hasOwnProperty("key") ? trace.key : (x.keys || [])[pt.curveNumber];
        if (keys !== undefined && keys !== null) {
          if (!Array.isArray(keys)) {
            obj.key = keys;
          } else if (typeof pt.pointNumber === "number") {
            obj.key = keys[pt.pointNumber];
          } else if (Array.isArray(pt.pointNumber)) {
            obj.key = keys[pt.pointNumber[0]][pt.pointNumber[1]];
          } else if (Array.isArray(pt.pointNumbers)) {
            obj.key = pt.pointNumbers.map(function(i) { return keys[i]; });
          }
        }
        return obj;
      });
    };
  }

  function legendEventData(d) {
    var trace = d.data[d.curveNumber];
    if (!trace.legendgroup) return decodeTypedArrays(clone(trace));
    return decodeTypedArrays(clone(d.data.filter(function(t) { return t.legendgroup === trace.legendgroup; })));
  }

  function registerShinyEvents(gd, el, x) {
    if (!HTMLWidgets.shinyMode || !Shiny.setInputValue) return;
    var source = x.source || "A";
    var send = function(name, value) {
      Shiny.setInputValue(name + "-" + source, value, {priority: "event"});
    };
    // events that clear other inputs
    var clearMap = {
      plotly_deselect: ["plotly_selected", "plotly_selecting", "plotly_brushed", "plotly_brushing", "plotly_click"],
      plotly_unhover: ["plotly_hover"],
      plotly_doubleclick: ["plotly_click"]
    };
    Object.keys(clearMap).forEach(function(evt) {
      gd.on(evt, function() { clearMap[evt].forEach(function(name) { send(name, null); }); });
    });
    var points = pointEventData(gd, x);
    var processors = {
      plotly_click: points,
      plotly_sunburstclick: points,
      plotly_hover: points,
      plotly_unhover: points,
      plotly_selected: function(d) { if (d) return points(d); },
      plotly_selecting: function(d) { if (d) return points(d); },
      plotly_brushed: function(d) { if (d) return d.range ? d.range : d.lassoPoints; },
      plotly_brushing: function(d) { if (d) return d.range ? d.range : d.lassoPoints; },
      plotly_legendclick: legendEventData,
      plotly_legenddoubleclick: legendEventData,
      plotly_clickannotation: function(d) { return d.fullAnnotation; }
    };
    (x.shinyEvents || []).forEach(function(event) {
      var process = processors[event] || function(d) { return d ? d : el.id; };
      // plotly_brushed/brushing are R-only names for selection ranges
      var jsEvent = event === "plotly_brushed" ? "plotly_selected" :
                    event === "plotly_brushing" ? "plotly_selecting" : event;
      gd.on(jsEvent, function(d) { send(event, JSON.stringify(process(d))); });
    });
  }


  // Crosstalk ---------------------------------------------------------------

  // Put keys and sets (not plotly.js attributes) back on the traces, so the
  // selection logic (and selection traces) can carry them.
  function attachKeys(traces, keys, sets) {
    (traces || []).forEach(function(tr, i) {
      var k = (keys || [])[i], s = (sets || [])[i];
      if (k !== undefined && k !== null) {
        tr.key = k;
        tr._isSimpleKey = !Array.isArray(k);
        tr._isNestedKey = Array.isArray(k) && k.some(Array.isArray);
      }
      if (s !== undefined && s !== null) tr.set = s;
    });
  }

  function hasCrosstalk(x) {
    return typeof crosstalk !== "undefined" && x.highlight && (x.sets || []).some(function(s) { return s; });
  }

  function isPlainObject(obj) {
    return Object.prototype.toString.call(obj) === "[object Object]" &&
      Object.getPrototypeOf(obj) === Object.prototype;
  }

  function deepExtend(target, src) {
    Object.keys(src || {}).forEach(function(k) {
      if (isPlainObject(src[k])) {
        target[k] = deepExtend(isPlainObject(target[k]) ? target[k] : {}, src[k]);
      } else {
        target[k] = src[k];
      }
    });
    return target;
  }

  function clone(obj) { return JSON.parse(JSON.stringify(obj)); }

  // Typed array specs ({dtype, bdata[, shape]}, written by the R serialiser)
  // back to plain arrays, for code that works on the input traces (crosstalk
  // subsetting, legend event data sent to Shiny).
  var TYPED_ARRAYS = {i1: Int8Array, u1: Uint8Array, u1c: Uint8ClampedArray, i2: Int16Array,
                      u2: Uint16Array, i4: Int32Array, u4: Uint32Array, f4: Float32Array, f8: Float64Array};
  function isTypedArraySpec(v) {
    return isPlainObject(v) && typeof v.bdata === "string" && TYPED_ARRAYS.hasOwnProperty(v.dtype);
  }
  function decodeTypedArraySpec(v) {
    var bin = atob(v.bdata), bytes = new Uint8Array(bin.length);
    for (var i = 0; i < bin.length; i++) bytes[i] = bin.charCodeAt(i);
    var arr = Array.prototype.slice.call(new TYPED_ARRAYS[v.dtype](bytes.buffer));
    var shape = v.shape ? String(v.shape).split(",").map(Number) : [];
    if (shape.length !== 2) return arr;
    var rows = [];
    for (var r = 0; r < shape[0]; r++) rows.push(arr.slice(r * shape[1], (r + 1) * shape[1]));
    return rows;
  }
  // Dates and date-times sent as typed arrays (days or wall-clock ms since
  // 1970, marked with `rdate`) back to the strings R would have written:
  // "YYYY-MM-DD" and "YYYY-MM-DD HH:MM:SS[.mmm]" (plotly.js reads numbers on
  // date axes in the viewer's time zone, so they can't be passed as numbers).
  var DAY_MS = 86400000;
  function pad(n, w) { var s = String(n); while (s.length < w) s = "0" + s; return s; }
  function restoreDateSpec(spec) {
    var vals = decodeTypedArraySpec(spec), isDate = spec.rdate === "date";
    var out = new Array(vals.length), lastDay = NaN, dayStr = "";
    for (var i = 0; i < vals.length; i++) {
      var v = vals[i];
      if (v !== v || v === null) { out[i] = null; continue; }
      var ms = isDate ? v * DAY_MS : v;
      var day = Math.floor(ms / DAY_MS);
      if (day !== lastDay) {
        var d = new Date(day * DAY_MS);
        dayStr = pad(d.getUTCFullYear(), 4) + "-" + pad(d.getUTCMonth() + 1, 2) + "-" + pad(d.getUTCDate(), 2);
        lastDay = day;
      }
      if (isDate) { out[i] = dayStr; continue; }
      var t = ms - day * DAY_MS, msec = t % 1000, secs = (t - msec) / 1000;
      out[i] = dayStr + " " + pad(Math.floor(secs / 3600), 2) + ":" + pad(Math.floor(secs / 60) % 60, 2) + ":" +
        pad(secs % 60, 2) + (msec ? "." + pad(msec, 3) : "");
    }
    return out;
  }
  // Typed arrays repeated in the figure are sent once: the first spec has
  // `bid`, later ones are {bref: <bid>} (see widget_to_JSON() in R), here
  // made the same object again.
  function collectSharedSpecs(obj, ids) {
    if (Array.isArray(obj)) {
      for (var i = 0; i < obj.length; i++) collectSharedSpecs(obj[i], ids);
    } else if (isTypedArraySpec(obj)) {
      if (obj.bid !== undefined) { ids[obj.bid] = obj; delete obj.bid; }
    } else if (isPlainObject(obj)) {
      Object.keys(obj).forEach(function(k) { collectSharedSpecs(obj[k], ids); });
    }
  }
  function resolveSharedSpecs(obj, ids) {
    if (Array.isArray(obj)) {
      for (var i = 0; i < obj.length; i++) obj[i] = resolveSharedSpecs(obj[i], ids);
    } else if (isPlainObject(obj) && !isTypedArraySpec(obj)) {
      var keys = Object.keys(obj);
      if (keys.length === 1 && keys[0] === "bref" && ids.hasOwnProperty(obj.bref)) return ids[obj.bref];
      keys.forEach(function(k) { obj[k] = resolveSharedSpecs(obj[k], ids); });
    }
    return obj;
  }
  function restoreSharedSpecs(x) {
    var ids = {};
    collectSharedSpecs([x.data, x.frames || []], ids);
    if (Object.keys(ids).length) resolveSharedSpecs([x.data, x.frames || []], ids);
  }

  function restoreDates(obj) {
    if (Array.isArray(obj)) {
      if (obj.length && typeof obj[0] === "object") {
        for (var i = 0; i < obj.length; i++) obj[i] = restoreDates(obj[i]);
      }
    } else if (isTypedArraySpec(obj)) {
      // a shared spec is decoded once and its strings shared
      if (obj.rdate) return obj._restored || (obj._restored = restoreDateSpec(obj));
    } else if (isPlainObject(obj)) {
      Object.keys(obj).forEach(function(k) { obj[k] = restoreDates(obj[k]); });
    }
    return obj;
  }

  function decodeTypedArrays(obj) {
    if (Array.isArray(obj)) {
      for (var i = 0; i < obj.length; i++) obj[i] = decodeTypedArrays(obj[i]);
    } else if (isTypedArraySpec(obj)) {
      return decodeTypedArraySpec(obj);
    } else if (isPlainObject(obj)) {
      Object.keys(obj).forEach(function(k) { obj[k] = decodeTypedArrays(obj[k]); });
    }
    return obj;
  }

  function asArray(k) { return Array.isArray(k) ? k : [k]; }

  // match functions: indices of the trace's key that are selected
  function findMatches(haystack, needleSet) {
    var matches = [];
    asArray(haystack).forEach(function(obj, i) {
      if (obj === null || needleSet.indexOf(obj) >= 0) matches.push(i);
    });
    return matches;
  }
  function findSimpleMatches(haystack, needleSet) {
    var match = asArray(haystack).every(function(val) { return val === null || needleSet.indexOf(val) >= 0; });
    return match ? [0] : [];
  }
  function findNestedMatches(haystack, needleSet) {
    var matches = [];
    haystack.forEach(function(hay, i) {
      if (asArray(hay).every(function(val) { return val === null || needleSet.indexOf(val) >= 0; })) matches.push(i);
    });
    return matches;
  }
  function getMatchFunc(trace) {
    return trace._isNestedKey ? findNestedMatches : trace._isSimpleKey ? findSimpleMatches : findMatches;
  }

  function subsetArrayAttrs(obj, indices) {
    var newObj = {};
    Object.keys(obj).forEach(function(k) {
      var val = obj[k];
      if (k.charAt(0) === "_" || k === "colorscale") {
        newObj[k] = val;
      } else if (isPlainObject(val)) {
        newObj[k] = subsetArrayAttrs(val, indices);
      } else if (Array.isArray(val)) {
        newObj[k] = indices.map(function(i) { return val[i]; });
      } else {
        newObj[k] = val;
      }
    });
    return newObj;
  }

  function removeBrush(el) {
    var outlines = el.querySelectorAll(".select-outline");
    for (var i = 0; i < outlines.length; i++) outlines[i].remove();
  }

  function debounce(func, wait) {
    var timeout;
    return function() {
      var context = this, args = arguments;
      clearTimeout(timeout);
      timeout = setTimeout(function() { timeout = null; func.apply(context, args); }, wait);
    };
  }

  function TraceManager(gd, highlight) {
    this.gd = gd;
    this.origData = clone(gd.data);
    this.origOpacity = this.origData.map(function(tr) { return tr.opacity === 0 ? 0 : (tr.opacity || 1); });
    // group name -> null or the keys most recently selected in that group
    this.groupSelections = {};
    this.highlight = highlight;
  }

  TraceManager.prototype.updateFilter = function(group, keys) {
    var traces;
    if (keys === undefined || keys === null) {
      traces = clone(this.origData);
    } else {
      traces = [];
      this.origData.forEach(function(trace) {
        if (!trace.key || trace.set !== group) return;
        var matches = getMatchFunc(trace)(trace.key, keys);
        if (matches.length > 0) traces.push(trace._isSimpleKey ? trace : subsetArrayAttrs(trace, matches));
      });
    }
    Plotly.react(this.gd, traces, this.gd.layout);
  };

  TraceManager.prototype.updateSelection = function(group, keys) {
    if (keys !== null && !Array.isArray(keys)) throw new Error("Invalid keys argument; null or array expected");
    var gd = this.gd, hl = this.highlight, self = this;
    var nNewTraces = gd.data.length - this.origData.length;
    if (keys === null || !hl.persistent && nNewTraces > 0) {
      var toRemove = [];
      gd.data.forEach(function(tr, i) { if (tr._isCrosstalkTrace) toRemove.push(i); });
      if (toRemove.length) Plotly.deleteTraces(gd, toRemove);
      this.groupSelections[group] = keys;
    } else {
      var sel = this.groupSelections[group] = this.groupSelections[group] || [];
      keys.forEach(function(k) { if (sel.indexOf(k) < 0) sel.push(k); });
    }

    if (keys === null) {
      Plotly.restyle(gd, {opacity: this.origOpacity}, this.origOpacity.map(function(_, i) { return i; }));
      return;
    }
    if (keys.length < 1) return;

    var traces = [];
    var colour = crosstalk.group(group).var("plotlySelectionColour").get() || (hl.color || [])[0];
    for (var i = 0; i < this.origData.length; i++) {
      var trace = clone(gd.data[i]);
      if (!trace.key || trace.set !== group) continue;
      var matches = getMatchFunc(trace)(trace.key, keys);
      if (matches.length === 0) continue;
      if (!trace._isSimpleKey) trace = subsetArrayAttrs(trace, matches);
      var d = gd._fullData[i];
      deepExtend(trace, hl.selected);
      if (d.marker) { trace.marker = trace.marker || {}; trace.marker.color = colour || trace.marker.color || d.marker.color; }
      if (d.line) { trace.line = trace.line || {}; trace.line.color = colour || trace.line.color || d.line.color; }
      if (d.textfont) { trace.textfont = trace.textfont || {}; trace.textfont.color = colour || trace.textfont.color || d.textfont.color; }
      if (d.fillcolor) trace.fillcolor = colour || trace.fillcolor || d.fillcolor;
      trace.name = trace.name || keys.join("<br />");
      trace.legendgroup = trace.legendgroup || keys.join("<br />");
      // mapping between this trace and the one it targets (for frames)
      trace._originalIndex = i;
      trace._newIndex = gd._fullData.length + traces.length;
      trace._isCrosstalkTrace = true;
      traces.push(trace);
    }
    if (traces.length === 0) return;

    Plotly.addTraces(gd, traces).then(function(gd) {
      // add selection traces to the animation frames that use their originals
      var hash = gd._transitionData._frameHash;
      (gd._transitionData._frames || []).forEach(function(frame) {
        var newIndices = [];
        traces.forEach(function(tr) {
          if (frame.traces.indexOf(tr._originalIndex) > -1) {
            newIndices.push(tr._newIndex);
            frame.traces.push(tr._newIndex);
          }
        });
        if (newIndices.length === 0) return;
        var ctr = 0, n = frame.data.length;
        for (var j = 0; j < n; j++) {
          var ft = frame.data[j];
          if (!ft.key || ft.set !== group) continue;
          var m = getMatchFunc(ft)(ft.key, keys);
          if (m.length === 0) continue;
          if (!ft._isSimpleKey) ft = subsetArrayAttrs(ft, m);
          var fd = gd._fullData[newIndices[ctr]];
          if (fd) {
            if (fd.marker) ft.marker = fd.marker;
            if (fd.line) ft.line = fd.line;
            if (fd.textfont) ft.textfont = fd.textfont;
          }
          ctr = ctr + 1;
          frame.data.push(ft);
        }
        hash[frame.name] = frame;
      });
    });

    // dim the traces of the selected groups
    var toDim = [], opacities = [], sets = Object.keys(this.groupSelections);
    for (var t = 0; t < this.origData.length; t++) {
      var opacity = this.origOpacity[t] || 1;
      if (opacity !== gd._fullData[t].opacity || hl.opacityDim === 1) continue;
      if (sets.indexOf(gd.data[t].set) >= 0) {
        toDim.push(t);
        opacities.push(opacity * hl.opacityDim);
      }
    }
    if (toDim.length > 0) {
      Plotly.restyle(gd, {opacity: opacities}, toDim);
      // turn off the selected/unselected API
      Plotly.restyle(gd, {selectedpoints: null});
    }
  };

  // selectize dropdowns and the colour picker, above the plot
  function addControlPanel(el, x, ids) {
    if (!(x.selectize || x.highlight.dynamic)) return null;
    var old = el.parentElement.querySelector("#" + el.id + "-crosstalk-panel");
    if (old) old.remove();
    var flex = document.createElement("div");
    flex.id = el.id + "-crosstalk-panel";
    flex.className = "plotly-crosstalk-control-panel";
    flex.style.display = "flex";
    flex.style.flexWrap = "wrap";
    var panel = {};
    if (x.highlight.dynamic) {
      var pickerDiv = document.createElement("div");
      var input = document.createElement("input");
      input.id = el.id + "-colourpicker";
      var label = document.createElement("label");
      label.htmlFor = input.id;
      label.innerHTML = "Brush color&nbsp;&nbsp;";
      pickerDiv.appendChild(label);
      pickerDiv.appendChild(input);
      flex.appendChild(pickerDiv);
      panel.picker = input;
    }
    if (x.selectize) {
      panel.selects = {};
      Object.keys(x.selectize).forEach(function(group, i) {
        var container = document.createElement("div");
        container.id = el.id + "-selectize-" + i;
        container.className = "form-group crosstalk-input-plotly-highlight";
        container.style.width = "80%";
        var label = document.createElement("label");
        label.className = "control-label";
        label.textContent = x.selectize[group].group;
        var select = document.createElement("select");
        select.multiple = true;
        var selectDiv = document.createElement("div");
        selectDiv.appendChild(select);
        container.appendChild(label);
        container.appendChild(selectDiv);
        flex.appendChild(container);
        panel.selects[group] = select;
      });
    }
    el.parentElement.insertBefore(flex, el);
    return panel;
  }

  function registerCrosstalk(el, x) {
    var gd = el, hl = x.highlight;
    hl.color = hl.color === undefined || hl.color === null ? [] : asArray(hl.color);
    // 'inform the world' about the highlight options (e.g. leaflet's
    // persistent selection)
    crosstalk.var("plotlyCrosstalkOpts").set(hl);

    // persistent selection while the shift key is held
    if (!hl.persistent) {
      window.addEventListener("mousemove", function(e) {
        hl.persistent = !!e.shiftKey;
        hl.persistentShift = !!e.shiftKey;
      });
    }

    var groups = [];
    (x.sets || []).forEach(function(s) { if (s && groups.indexOf(s) < 0) groups.push(s); });

    var panel = addControlPanel(el, x);
    if (panel && panel.picker) {
      var picker = window.jQuery(panel.picker);
      picker.colourpicker({changeDelay: 0});
      picker.colourpicker("settings", {value: hl.color[0], showColour: "both", palette: "limited",
                                       allowedCols: hl.color.join(" ")});
      picker.colourpicker("value", hl.color[0]);
      var setColour = function() {
        groups.forEach(function(g) { crosstalk.group(g).var("plotlySelectionColour").set(picker.colourpicker("value")); });
      };
      setColour();
      picker.on("change", setColour);
    }

    var traceManager = new TraceManager(gd, hl);

    // {set: [keys]} of the selected points
    function pointsToKeys(points) {
      var keysBySet = {};
      points.forEach(function(pt) {
        var trace = gd.data[pt.curveNumber];
        if (!trace || !trace.key || !trace.set) return;
        keysBySet[trace.set] = keysBySet[trace.set] || [];
        var ptNum = typeof pt.pointNumber === "number" ? pt.pointNumber : pt.pointNumbers;
        var key = trace._isSimpleKey ? trace.key :
          Array.isArray(ptNum) ? ptNum.map(function(i) { return trace.key[i]; }) : trace.key[ptNum];
        var flat = trace._isNestedKey ? [].concat.apply([], key) : key;
        keysBySet[trace.set] = keysBySet[trace.set].concat(flat);
      });
      return keysBySet;
    }

    var handles = [];
    groups.forEach(function(set) {
      var selection = new crosstalk.SelectionHandle(set);
      var filter = new crosstalk.FilterHandle(set);
      handles.push(selection, filter);
      var selectize = null;

      filter.on("change", function(e) {
        removeBrush(el);
        traceManager.updateFilter(set, e.value);
      });

      selection.on("change", function(e) {
        var value = e.value;
        // plotly_selected fires previously selected points too when the
        // shift key is held: keep just the new ones
        if (hl.on === "plotly_selected" && hl.persistentShift && value && e.oldValue) {
          value = value.filter(function(k) { return e.oldValue.indexOf(k) < 0; });
        }
        // skip a selection identical to one already applied
        var history = crosstalk.var("plotlySelectionHistory").get() || [];
        var event = {receiverID: gd.id, plotlySelectionColour: crosstalk.group(set).var("plotlySelectionColour").get()};
        event[set] = value;
        var ev = JSON.stringify(event);
        for (var i = 0; i < history.length; i++) {
          if (JSON.stringify(history[i]) === ev) return;
        }
        if (!hl.persistent) history = [event]; else history.push(event);
        crosstalk.var("plotlySelectionHistory").set(history);

        traceManager.updateSelection(set, value);
        if (selectize) {
          if (!hl.persistent || value === null) selectize.clear(true);
          if (value) selectize.addItems(value, true);
          selectize.close();
        }
      });

      var turnOn = function(e) {
        if (!e || !e.points) return;
        var selected = pointsToKeys(e.points);
        Object.keys(selected).forEach(function(s) {
          if (s === set) selection.set(selected[s], {sender: el});
        });
      };
      if (hl.debounce > 0) turnOn = debounce(turnOn, hl.debounce);
      if (hl.on) gd.on(hl.on, turnOn);
      if (hl.off) {
        gd.on(hl.off, function() {
          removeBrush(el);
          crosstalk.var("plotlySelectionHistory").set(null);
          selection.set(null, {sender: el});
        });
      }

      // selectize dropdown <-> selection
      if (panel && panel.selects && panel.selects[set]) {
        var options = x.selectize[set];
        var opts = Object.assign({
          options: [{value: "", label: "(All)"}].concat(options.items || []),
          searchField: "label", valueField: "value", labelField: "label", maxItems: 50
        }, options);
        delete opts.items;
        delete opts.group;
        selectize = window.jQuery(panel.selects[set]).selectize(opts)[0].selectize;
        selectize.on("change", function() {
          var current = traceManager.groupSelections[set] || [];
          if (!hl.persistent) {
            removeBrush(el);
            current.forEach(function(k) { selectize.removeItem(k, true); });
          }
          var newItems = selectize.items.filter(function(k) { return current.indexOf(k) < 0; });
          if (newItems.length > 0) {
            traceManager.updateSelection(set, newItems);
          } else {
            traceManager.updateSelection(set, null);
            traceManager.updateSelection(set, selectize.items);
          }
        });
      }

      // default selection (highlight(defaultValues = ...))
      var defaults = (hl.defaultSelection || {})[set];
      if (defaults && defaults.length) {
        selection.set(defaults);
      } else if (selection.value && selection.value.length) {
        // a selection made before this plot was rendered (e.g. another
        // plot's defaultValues)
        traceManager.updateSelection(set, selection.value);
      }
    });
    return function() { handles.forEach(function(h) { h.close(); }); };
  }

  // add_sf() on map subplots: fit the initial view to the data
  function fitMapBounds(gd, x) {
    Object.keys(x.fitBounds || {}).forEach(function(id) {
      var sp = gd._fullLayout && gd._fullLayout[id] && gd._fullLayout[id]._subplot;
      if (sp && sp.map && sp.map.cameraForBounds) {
        // set through plotly.js so its layout (and relayout events) agree
        var b = x.fitBounds[id];
        var cam = sp.map.cameraForBounds([[b[0], b[1]], [b[2], b[3]]], {padding: 10});
        if (!cam) return;
        var center = cam.center.toArray ? cam.center.toArray() : [cam.center.lng, cam.center.lat];
        var update = {};
        update[id + ".center"] = {lon: center[0], lat: center[1]};
        update[id + ".zoom"] = cam.zoom;
        Plotly.relayout(gd, update);
      }
    });
  }

  HTMLWidgets.widget({
    name: "plotly_core",
    type: "output",

    factory: function(el, width, height) {
      var rendered = false;
      var closeCrosstalk = null;
      return {
        renderValue: function(x) {
          registerProxyHandler();
          var config = Object.assign({}, CONFIG_DEFAULTS, x.config || {});
          restoreSharedSpecs(x);
          restoreDates(x.data);
          (x.frames || []).forEach(function(f) { if (f) restoreDates(f.data); });
          // crosstalk subsets the input traces' arrays
          if (x.sets) { decodeTypedArrays(x.data); decodeTypedArrays(x.frames || []); }
          attachKeys(x.data, x.keys, x.sets);
          (x.frameKeys || []).forEach(function(fk, i) {
            if (x.frames && x.frames[i]) attachKeys(x.frames[i].data, fk.keys, fk.sets);
          });
          var figure = {data: x.data, layout: Object.assign({}, x.layout), config: config,
                        frames: x.frames || []};
          if (closeCrosstalk) { closeCrosstalk(); closeCrosstalk = null; }
          if (rendered) {
            // remove old event handlers before re-registering
            if (el.removeAllListeners) el.removeAllListeners();
            Plotly.purge(el);
          }
          rendered = true;
          var plot = Plotly.newPlot(el, figure);
          plot.then(function() {
            registerShinyEvents(el, el, x);
            fitMapBounds(el, x);
            if (hasCrosstalk(x)) closeCrosstalk = registerCrosstalk(el, x);
          });
        },
        resize: function(width, height) {
          if (el.layout) Plotly.Plots.resize(el);
        }
      };
    }
  });
})();
