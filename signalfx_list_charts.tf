locals {
  signalfx_list_charts = {
    for chart in local.charts : chart["id"] => {
      name                = chart["name"]
      program_text        = chart["programText"]
      description         = chart["description"]
      unit_prefix         = chart["options"]["unitPrefix"]
      color_by            = chart["options"]["colorBy"]
      max_delay           = chart["options"]["programOptions"]["maxDelay"]
      timezone            = chart["options"]["programOptions"]["timezone"]
      disable_sampling    = chart["options"]["programOptions"]["disableSampling"]
      refresh_interval    = chart["options"]["refreshInterval"]
      hide_missing_values = chart["options"]["hideMissingValues"]
      viz_options = [
        for option in coalesce(lookup(chart["options"], "publishLabelOptions", []), []) :
        {
          label        = option["label"]
          display_name = option["displayName"]
          value_unit   = option["valueUnit"]
          value_prefix = option["valuePrefix"]
          value_suffix = option["valueSuffix"]
          color        = try(local.color_map_for_viz_options[option["paletteIndex"]], null)
        } if option != null
      ]
      legend_options_fields = [
        for field in coalesce(lookup(chart["options"]["legendOptions"], "fields", []), []) :
        {
          property = field["property"]
          enabled  = field["enabled"]
        } if field != null
      ]
      max_precision           = chart["options"]["maximumPrecision"]
      secondary_visualization = chart["options"]["secondaryVisualization"]
      color_scales = [
        # TODO: what is the difference between colorScale and colorScale2 in the exported json?
        for scale in chart["options"]["colorScale2"] : {
          gt    = scale["gt"]
          gte   = scale["gte"]
          lt    = scale["lt"]
          lte   = scale["lte"]
          color = try(local.color_map_for_scales[scale["paletteIndex"]], null)
        }
      ]
      sort_by    = chart["options"]["sortBy"]
      time_range = chart["options"]["time"]["range"]

      # missing fields not yet known how to map:
      # - start_time - (Optional) Seconds since epoch. Used for visualization. Conflicts with time_range.
      # - end_time - (Optional) Seconds since epoch. Used for visualization. Conflicts with time_range.

    }
    if chart["options"]["type"] == "List"
  }
}
