# Azure Database for MySql Flexible server
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/)

This module creates an Azure Database for Mysql Flexible server. 

  - It applies a default diagnostics settings  
  - It can configures mysql Databases  
  - It configures MySQL server settings
  - It creates a MySQL Admin Login with a randomly generated password

## Usage

Please refer to the examples folder in this repo 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.22 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.22 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_diagnostic_setting.diagnostics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_mysql_flexible_database.mysql_databases](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_database) | resource |
| [azurerm_mysql_flexible_server.mysql_flexible_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server) | resource |
| [azurerm_mysql_flexible_server_configuration.mysql_flexible_server_config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server_configuration) | resource |
| [azurerm_mysql_flexible_server_firewall_rule.firewall_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server_firewall_rule) | resource |
| [random_password.mysql_administrator_password](https://registry.terraform.io/providers/hashicorp/random/3.4.3/docs/resources/password) | resource |
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/3.4.3/docs/resources/string) | resource |
| [azurerm_monitor_diagnostic_categories.diagcategories](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | MySQL administrator login | `string` | n/a | yes |
| <a name="input_databases"></a> [databases](#input\_databases) | Map of databases with default collation and charset. | `map(map(string))` | n/a | yes |
| <a name="input_diag_log_analytics_workspace_id"></a> [diag\_log\_analytics\_workspace\_id](#input\_diag\_log\_analytics\_workspace\_id) | Log Analytics Workspace Id for logs and metrics diagnostics destination | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | n/a | yes |
| <a name="input_landing_zone_slug"></a> [landing\_zone\_slug](#input\_landing\_zone\_slug) | Landing zone acronym,it will be used to generate the resource nae | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location for Key Vault. | `string` | n/a | yes |
| <a name="input_location_short"></a> [location\_short](#input\_location\_short) | Short string for Azure location. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group the resources will belong to | `string` | n/a | yes |
| <a name="input_stack"></a> [stack](#input\_stack) | Stack name | `string` | n/a | yes |
| <a name="input_allowed_cidrs"></a> [allowed\_cidrs](#input\_allowed\_cidrs) | Map of authorized CIDRs. Mandatory if public access is enabled | `map(string)` | `null` | no |
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | Backup retention days for the server, supported values are between `7` and `35` days. | `number` | `7` | no |
| <a name="input_create_mode"></a> [create\_mode](#input\_create\_mode) | The creation mode which can be used to restore or replicate existing servers. Possible values are Default, PointInTimeRestore, GeoRestore, and Replica. Changing this forces a new MySQL Flexible Server to be created. | `string` | `"Default"` | no |
| <a name="input_custom_diagnostic_settings_name"></a> [custom\_diagnostic\_settings\_name](#input\_custom\_diagnostic\_settings\_name) | Custom name of the diagnostics settings, name will be 'default' if not set. | `string` | `"default"` | no |
| <a name="input_custom_mysql_administrator_password"></a> [custom\_mysql\_administrator\_password](#input\_custom\_mysql\_administrator\_password) | MySQL administrator password. If not set, randomly generated | `string` | `null` | no |
| <a name="input_custom_name"></a> [custom\_name](#input\_custom\_name) | Custom Azure MySQL Flexible Server Name, it will overide the generated name if set | `string` | `""` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default Base tagging | `map(string)` | `{}` | no |
| <a name="input_default_tags_enabled"></a> [default\_tags\_enabled](#input\_default\_tags\_enabled) | Option to enable or disable default tags. | `bool` | `true` | no |
| <a name="input_delegated_subnet_id"></a> [delegated\_subnet\_id](#input\_delegated\_subnet\_id) | The ID of the virtual network subnet to create the MySQL Flexible Server. Mandatory if private access is enabled | `string` | `null` | no |
| <a name="input_enable_private_access"></a> [enable\_private\_access](#input\_enable\_private\_access) | Enable private access (VNET Integration) - Requires a delegated subnet | `bool` | `true` | no |
| <a name="input_enable_public_access"></a> [enable\_public\_access](#input\_enable\_public\_access) | Whether Azure MySQL is available from public network. - Not compatible with private access | `bool` | `false` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Extra tags to add. | `map(string)` | `{}` | no |
| <a name="input_geo_redundant_backup_enabled"></a> [geo\_redundant\_backup\_enabled](#input\_geo\_redundant\_backup\_enabled) | Turn Geo-redundant server backups on/off. Not available for the Basic tier. | `bool` | `false` | no |
| <a name="input_high_availability"></a> [high\_availability](#input\_high\_availability) | Map of high availability configuration: https://docs.microsoft.com/en-us/azure/mysql/flexible-server/concepts-high-availability. `null` to disable high availability | <pre>object({<br>    mode                      = string<br>    standby_availability_zone = optional(number)<br>  })</pre> | <pre>{<br>  "mode": "SameZone",<br>  "standby_availability_zone": 1<br>}</pre> | no |
| <a name="input_logs_retention_days"></a> [logs\_retention\_days](#input\_logs\_retention\_days) | Number of days to keep logs on storage account. | `number` | `30` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Map of maintenance window configuration: https://docs.microsoft.com/en-us/azure/mysql/flexible-server/concepts-maintenance | `map(number)` | `null` | no |
| <a name="input_mysql_options"></a> [mysql\_options](#input\_mysql\_options) | Map of configuration options: https://learn.microsoft.com/en-us/azure/mysql/single-server/concepts-server-parameters | `map(string)` | `{}` | no |
| <a name="input_mysql_version"></a> [mysql\_version](#input\_mysql\_version) | MySQL server version. Valid values are `5.7` and `8.0.21` | `string` | `"8.0.21"` | no |
| <a name="input_network_acls"></a> [network\_acls](#input\_network\_acls) | Object with attributes: `bypass`, `default_action`, `ip_rules`, `virtual_network_subnet_ids`. Set to `null` to disable. See https://www.terraform.io/docs/providers/azurerm/r/key_vault.html#bypass for more information. | <pre>object({<br>    bypass                     = optional(string, "None"),<br>    default_action             = optional(string, "Deny"),<br>    ip_rules                   = optional(list(string)),<br>    virtual_network_subnet_ids = optional(list(string)),<br>  })</pre> | `{}` | no |
| <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id) | The ID of the private dns zone to create the MySQL Flexible Server. Mandatory if private access is enabled | `string` | `null` | no |
| <a name="input_size"></a> [size](#input\_size) | The size for the MySQL Flexible Server: https://learn.microsoft.com/en-us/azure/mysql/flexible-server/concepts-service-tiers-storage#service-tiers-size-and-server-types | `string` | `"Standard_D2ds_v4"` | no |
| <a name="input_source_server_id"></a> [source\_server\_id](#input\_source\_server\_id) | The resource ID of the source MySQL Flexible Server to be restored. | `string` | `null` | no |
| <a name="input_ssl_enforced"></a> [ssl\_enforced](#input\_ssl\_enforced) | Enforce SSL connection on MySQL provider and set require\_secure\_transport on MySQL Server | `bool` | `true` | no |
| <a name="input_storage"></a> [storage](#input\_storage) | Map of the storage configuration | <pre>object({<br>    auto_grow_enabled = optional(bool)<br>    iops              = optional(number)<br>    size_gb           = optional(number)<br>  })</pre> | `null` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Tier for MySQL flexible server SKU. Possible values are: `GeneralPurpose`, `Basic`, `MemoryOptimized`. | `string` | `"GeneralPurpose"` | no |
| <a name="input_workload_info"></a> [workload\_info](#input\_workload\_info) | Workload additional info to be used in the resource name | `string` | `""` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Specifies the Availability Zone in which this MySQL Flexible Server should be located. Possible values are 1, 2 and 3 | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mysql_administrator_login"></a> [mysql\_administrator\_login](#output\_mysql\_administrator\_login) | Administrator login for MySQL server |
| <a name="output_mysql_administrator_password"></a> [mysql\_administrator\_password](#output\_mysql\_administrator\_password) | Administrator password for MySQL server |
| <a name="output_mysql_flexible_database_ids"></a> [mysql\_flexible\_database\_ids](#output\_mysql\_flexible\_database\_ids) | The list of all database resource IDs |
| <a name="output_mysql_flexible_databases"></a> [mysql\_flexible\_databases](#output\_mysql\_flexible\_databases) | Map of databases infos |
| <a name="output_mysql_flexible_databases_names"></a> [mysql\_flexible\_databases\_names](#output\_mysql\_flexible\_databases\_names) | List of databases names |
| <a name="output_mysql_flexible_firewall_rule_ids"></a> [mysql\_flexible\_firewall\_rule\_ids](#output\_mysql\_flexible\_firewall\_rule\_ids) | Map of MySQL created firewall rules |
| <a name="output_mysql_flexible_fqdn"></a> [mysql\_flexible\_fqdn](#output\_mysql\_flexible\_fqdn) | FQDN of the MySQL server |
| <a name="output_mysql_flexible_server_id"></a> [mysql\_flexible\_server\_id](#output\_mysql\_flexible\_server\_id) | MySQL server ID |
| <a name="output_mysql_flexible_server_name"></a> [mysql\_flexible\_server\_name](#output\_mysql\_flexible\_server\_name) | MySQL server name |
| <a name="output_mysql_flexible_server_public_network_access_enabled"></a> [mysql\_flexible\_server\_public\_network\_access\_enabled](#output\_mysql\_flexible\_server\_public\_network\_access\_enabled) | Is the public network access enabled |
| <a name="output_mysql_flexible_server_replica_capacity"></a> [mysql\_flexible\_server\_replica\_capacity](#output\_mysql\_flexible\_server\_replica\_capacity) | The maximum number of replicas that a primary MySQL Flexible Server can have |
<!-- END_TF_DOCS -->
## Related documentation

Microsoft Azure documentation: [docs.microsoft.com/en-us/azure//](https://docs.microsoft.com/en-us/azure//)