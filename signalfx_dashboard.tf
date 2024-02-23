locals {
  # the exported dashboard json apparently always has a $.filters.time section with two fields, 'start' and 'end'
  # With a relative time filter, this is how the time record looks like: {"start": "-1w", "end": "Now"}
  # With an absolute time filter, both start and end contain an epoch timestamp
  dashboard_has_absolute_time_filter = can(tonumber(local.dashboard["filters"]["time"]["start"]))
  signalfx_dashboard = {
    name              = local.dashboard["name"]
    description       = local.dashboard["name"]
    charts_resolution = lower(local.dashboard["chartDensity"])
    start_time        = local.dashboard_has_absolute_time_filter ? try(local.dashboard["filters"]["time"]["start"], null) : null
    end_time          = local.dashboard_has_absolute_time_filter ? try(local.dashboard["filters"]["time"]["end"], null) : null
    time_range        = local.dashboard_has_absolute_time_filter ? null : try(local.dashboard["filters"]["time"]["start"], null)
    filters = local.dashboard["filters"]["sources"] != null ? [
      for filter in local.dashboard["filters"]["sources"] : {
        property       = filter["property"]
        negated        = filter["NOT"]
        values         = flatten([filter["value"]])
        apply_if_exist = filter["applyIfExists"]
      }
    ] : []
    variables = local.dashboard["filters"]["variables"] != null ? [
      for variable in local.dashboard["filters"]["variables"] : {
        property               = variable["property"]
        alias                  = variable["alias"]
        description            = variable["description"]
        values                 = variable["value"]
        value_required         = variable["required"]
        values_suggested       = variable["preferredSuggestions"]
        restricted_suggestions = variable["restricted"]
        replace_only           = variable["replaceOnly"]
        apply_if_exist         = variable["applyIfExists"]
      }
    ] : []
    charts = {
      for chart in local.dashboard["charts"] : chart["chartId"] => {
        column = chart["column"]
        height = chart["height"]
        row    = chart["row"]
        width  = chart["width"]
      }
    }

    # NOTE: the following parameters are not yet converted
    # - dashboard_group
    # - tags
    # - permissions
    # - grid
    # - column
    # - event_overlay

  }
}
