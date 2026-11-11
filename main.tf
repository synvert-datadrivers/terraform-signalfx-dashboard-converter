locals {
  dashboard_json = jsondecode(file(var.dashboard_file_path))
  charts         = [for chart in local.dashboard_json["chartExports"] : chart["chart"]]
  dashboard = try(
    local.dashboard_json["dashboardExports"][0]["dashboard"],
    local.dashboard_json["dashboardExport"]["dashboard"]
  )
  axis_lookup_map = {
    # translates the yAxis value for viz options between the inger value and the name
    0 = "left"
    1 = "right"
  }
  color_map_for_viz_options = {
    # translates palette indices to color names for viz options only
    # https://github.com/splunk-terraform/terraform-provider-signalfx/blob/main/internal/visual/color_palette.go
    0  = "gray"
    1  = "blue"
    2  = "azure"
    3  = "navy"
    4  = "brown"
    5  = "orange"
    6  = "yellow"
    7  = "magenta"
    8  = "red"
    9  = "pink"
    10 = "violet"
    11 = "purple"
    12 = "lilac"
    13 = "emerald"
    14 = "chartreuse"
    15 = "yellowgreen"
    16 = "gold"
    17 = "iris"
    18 = "green"
    19 = "jade"
    20 = "cerise"
    21 = "aquamarine"
  }
  color_map_for_scales = {
    # translates palette indices to color names for color scale only (e.g. used in single value charts, this is a different palette!)
    # https://github.com/splunk-terraform/terraform-provider-signalfx/blob/main/internal/visual/color_scale_palette.go
    0  = "gray"
    1  = "blue"
    2  = "azure"
    3  = "navy"
    4  = "brown"
    5  = "orange"
    6  = "yellow"
    7  = "magenta"
    8  = "cerise"
    9  = "pink"
    10 = "violet"
    11 = "purple"
    12 = "lilac"
    13 = "emerald"
    14 = "chartreuse"
    15 = "yellowgreen"
    16 = "red"
    17 = "gold"
    18 = "iris"
    19 = "green"
    20 = "jade"
    21 = "aquamarine"
  }
}
