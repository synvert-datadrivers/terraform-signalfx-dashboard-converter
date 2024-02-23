locals {
  signalfx_time_charts = {
    for chart in local.charts : chart["id"] => {
      name               = chart["name"]
      program_text       = chart["programText"]
      plot_type          = chart["options"]["defaultPlotType"]
      description        = chart["description"]
      axes_precision     = chart["options"]["axisPrecision"]
      unit_prefix        = chart["options"]["unitPrefix"]
      color_by           = chart["options"]["colorBy"]
      minimum_resolution = chart["options"]["programOptions"]["minimumResolution"]
      max_delay          = chart["options"]["programOptions"]["maxDelay"]
      timezone           = chart["options"]["programOptions"]["timezone"]
      disable_sampling   = chart["options"]["programOptions"]["disableSampling"]
      time_range         = chart["options"]["time"]["range"]
      axes_include_zero  = chart["options"]["includeZero"]
      axis_left = try(
        {
          high_watermark       = chart["options"]["axes"][0]["highWatermark"]
          high_watermark_label = chart["options"]["axes"][0]["highWatermarkLabel"]
          label                = chart["options"]["axes"][0]["label"]
          low_watermark        = chart["options"]["axes"][0]["lowWatermark"]
          low_watermark_label  = chart["options"]["axes"][0]["lowWatermarkLabel"]
          max_value            = chart["options"]["axes"][0]["max"]
          min_value            = chart["options"]["axes"][0]["min"]
        },
        {}
      )
      axis_right = try(
        {
          high_watermark       = chart["options"]["axes"][1]["highWatermark"]
          high_watermark_label = chart["options"]["axes"][1]["highWatermarkLabel"]
          label                = chart["options"]["axes"][1]["label"]
          low_watermark        = chart["options"]["axes"][1]["lowWatermark"]
          low_watermark_label  = chart["options"]["axes"][1]["lowWatermarkLabel"]
          max_value            = chart["options"]["axes"][1]["max"]
          min_value            = chart["options"]["axes"][1]["min"]
        },
        {}
      )
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
      event_options = try(
        [
          for event in chart["options"]["eventPublishLabelOptions"] : {
            label        = event["label"]
            display_name = event["displayName"]
            # TODO: Verify this is the right color map
            color = try(local.color_map_for_viz_options[event["paletteIndex"]], null)
          }
        ],
        []
      )
      # TODO: Verify this is the right color map
      histogram_options = try(
        local.color_map_for_viz_options[chart["options"]["histogramChartOptions"]["colorThemeIndex"]],
        null
      )
      legend_option_fields = try(
        [
          for field in coalesce(chart["options"]["legendOptions"]["fields"], []) : {
            property = field["property"]
            enabled  = field["enabled"]
          }
        ],
        []
      )
      on_chart_legend_dimension = chart["options"]["onChartLegendOptions"]["dimensionInLegend"]
      show_event_lines          = chart["options"]["showEventLines"]
      show_data_markers         = chart["options"]["lineChartOptions"]["showDataMarkers"]

      # missing fields not yet known how to map:
      # - start_time - (Optional) Seconds since epoch. Used for visualization. Conflicts with time_range.
      # - end_time - (Optional) Seconds since epoch. Used for visualization. Conflicts with time_range.

    }
    if chart["options"]["type"] == "TimeSeriesChart"
  }
}
