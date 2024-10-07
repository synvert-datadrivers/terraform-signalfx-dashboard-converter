locals {
  signalfx_time_charts = {
    for chart in local.charts : chart["id"] => {
      name               = chart["name"]
      program_text       = length(chart["programText"]) >= 18 && length(chart["programText"]) <= 50000 ? chart["programText"] : "default_program_text"
      plot_type          = try(chart["options"]["defaultPlotType"], null)
      description        = chart["description"]
      axes_precision     = try(chart["options"]["axisPrecision"], null)
      unit_prefix        = try(chart["options"]["unitPrefix"], null)
      color_by           = contains(["Metric", "Dimension", "Scale"], lookup(chart["options"], "colorBy", "Metric")) ? lookup(chart["options"], "colorBy", "Metric") : "Metric"
      minimum_resolution = try(chart["options"]["programOptions"]["minimumResolution"], null)
      max_delay          = try(chart["options"]["programOptions"]["maxDelay"], null)
      timezone           = try(chart["options"]["programOptions"]["timezone"], null)
      disable_sampling   = try(chart["options"]["programOptions"]["disableSampling"], null)
      time_range         = try(chart["options"]["time"]["range"], null)
      axes_include_zero  = try(chart["options"]["includeZero"], null)
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
          axis         = try(local.axis_lookup_map[option["yAxis"]], null)
          plot_type    = try(option["plotType"], null)
          value_unit   = option["valueUnit"]
          value_prefix = option["valuePrefix"]
          value_suffix = option["valueSuffix"]
          color        = try(local.color_map_for_viz_options[option["paletteIndex"]], null)
        } if option != null
      ]
      on_chart_legend_dimension = try(chart["options"]["onChartLegendOptions"]["dimensionInLegend"], null)
    }
  }
}