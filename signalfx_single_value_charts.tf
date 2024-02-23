locals {
  signalfx_single_value_charts = {
    for chart in local.charts : chart["id"] => {
      name         = chart["name"]
      description  = chart["description"]
      program_text = chart["programText"]
      color_by     = chart["options"]["colorBy"]
      color_scales = [
        # TODO: what is the difference between colorScale and colorScale2 in the exported json?
        for scale in chart["options"]["colorScale2"] : {
          gt    = scale["gt"]
          gte   = scale["gte"]
          lt    = scale["lt"]
          lte   = scale["lte"]
          color = local.color_map_for_scales[scale["paletteIndex"]]
        }
      ]
      viz_options = [
        for option in coalesce(lookup(chart["options"], "publishLabelOptions", []), []) :
        {
          label        = option["label"]
          display_name = option["displayName"]
          axis         = local.axis_lookup_map[option["yAxis"]]
          plot_type    = option["plotType"]
          value_unit   = option["valueUnit"]
          value_prefix = option["valuePrefix"]
          value_suffix = option["valueSuffix"]
          color        = try(local.color_map_for_viz_options[option["paletteIndex"]], null)
        } if option != null
      ]
      unit_prefix             = chart["options"]["unitPrefix"]
      max_delay               = chart["options"]["programOptions"]["maxDelay"]
      refresh_interval        = chart["options"]["refreshInterval"]
      max_precision           = chart["options"]["maximumPrecision"]
      is_timestamp_hidden     = chart["options"]["timestampHidden"]
      secondary_visualization = chart["options"]["secondaryVisualization"]
      show_spark_line         = chart["options"]["showSparkLine"]
    }
    if chart["options"]["type"] == "SingleValue"
  }
}
