#' Functions for packages that build on plotly.core
#'
#' Exported for packages that extend plotly.core, such as plotly.express:
#' building figures from data (`trace_data()`, `validate_trace()`,
#' `set_trace_grid_reference()`, `subplot_type_for_trace_type()`), templates
#' (`check_template()`, `template_layout_value()`, `deep_merge()`), colour
#' scales (`named_colorscale()`), widget settings (`set_widget_setting()`,
#' `pad_list()`) and JSON values (`empty_object()`, `format_datetime()`).
#' They are not meant for use in figures, and may change between versions.
#'
#' @param fig,p A figure.
#' @param data A data frame, or `NULL` for the figure's data.
#' @param trace A trace (a named list or graph object).
#' @param skip_invalid Whether to drop invalid properties instead of raising
#'   an error.
#' @param a,b Lists to merge: `b`'s values replace `a`'s.
#' @param template A template.
#' @param path A layout property path, e.g. `c("font", "family")`.
#' @param name A colour scale name, or a widget setting name.
#' @param grid_ref,row,col,secondary_y A subplot grid reference and cell.
#' @param trace_type A trace type, e.g. `"scatter"`.
#' @param x A vector of date-times, or a list.
#' @param value A widget setting value.
#' @param n A length.
#' @keywords internal
#' @name plotly.core-extending
NULL
