# SignalFX Dashboard Converter

The module uses a JSON export from a SignalFX Dashboard and transforms it into terraform ready parameters.
This can be used with the [SignalFX Terraform Provider](https://registry.terraform.io/providers/splunk-terraform/signalfx/) or directly with our synvert-datadrivers/terraform-signalfx-dashboard module.

## Documentation

The module is documented using the terraform-docs.

### Examples

Examples can be found in the [examples](./examples) directory.


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dashboard_file_path"></a> [dashboard\_file\_path](#input\_dashboard\_file\_path) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_signalfx_dashboard"></a> [signalfx\_dashboard](#output\_signalfx\_dashboard) | n/a |
| <a name="output_signalfx_list_charts"></a> [signalfx\_list\_charts](#output\_signalfx\_list\_charts) | n/a |
| <a name="output_signalfx_log_views"></a> [signalfx\_log\_views](#output\_signalfx\_log\_views) | n/a |
| <a name="output_signalfx_single_value_charts"></a> [signalfx\_single\_value\_charts](#output\_signalfx\_single\_value\_charts) | n/a |
| <a name="output_signalfx_table_charts"></a> [signalfx\_table\_charts](#output\_signalfx\_table\_charts) | n/a |
| <a name="output_signalfx_text_charts"></a> [signalfx\_text\_charts](#output\_signalfx\_text\_charts) | n/a |
| <a name="output_signalfx_time_charts"></a> [signalfx\_time\_charts](#output\_signalfx\_time\_charts) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
