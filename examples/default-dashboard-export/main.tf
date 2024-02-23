locals {
  dashboards = {
    intro_splunk_observability_cloud = "./dashboard_Intro to Splunk Observability Cloud.json"
  }
}

module "converter" {
  source   = "../../"
  for_each = local.dashboards

  dashboard_file_path = each.value
}

output "converter" {
  value = module.converter
}
