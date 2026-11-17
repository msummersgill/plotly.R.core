/*
 * plotly.core's decoding of the figure data the R serialiser writes
 * (widget_to_JSON() in R/widget.R): base64 typed arrays, arrays shared by
 * several traces, and dates and date-times sent as numbers. Used by the
 * htmlwidget binding (plotly_core.js) and by static image export, which loads
 * it into its headless browser page (R/chromote.R).
 */
window.PlotlyCoreCodec = (function() {
  function isPlainObject(obj) {
    return Object.prototype.toString.call(obj) === "[object Object]" &&
      Object.getPrototypeOf(obj) === Object.prototype;
  }

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
    // microseconds within each millisecond (see date_array_spec() in R)
    var usec = spec.usec ? decodeTypedArraySpec(spec.usec) : null;
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
      var us = msec * 1000 + (usec ? usec[i] : 0);
      // as format_datetime() in R: microseconds, trailing zeros dropped
      out[i] = dayStr + " " + pad(Math.floor(secs / 3600), 2) + ":" + pad(Math.floor(secs / 60) % 60, 2) + ":" +
        pad(secs % 60, 2) + (us ? "." + pad(us, 6).replace(/0+$/, "") : "");
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

  // The figure as plotly.js takes it: shared arrays resolved and date-times
  // restored to strings (typed arrays of numbers are left for plotly.js)
  function prepareFigure(x) {
    restoreSharedSpecs(x);
    restoreDates(x.data);
    (x.frames || []).forEach(function(f) { if (f) restoreDates(f.data); });
    return x;
  }

  return {
    isPlainObject: isPlainObject,
    isTypedArraySpec: isTypedArraySpec,
    decodeTypedArraySpec: decodeTypedArraySpec,
    decodeTypedArrays: decodeTypedArrays,
    restoreSharedSpecs: restoreSharedSpecs,
    restoreDates: restoreDates,
    prepareFigure: prepareFigure
  };
})();
