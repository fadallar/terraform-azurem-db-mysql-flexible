// Modules Common Variables
variable "environment" {
  description = "Environment name"
  type        = string
}

variable "stack" {
  description = "Stack name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group the resources will belong to"
  type        = string
}

variable "location" {
  description = "Azure location for Key Vault."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

// Specific MySql variables
variable "administrator_login" {
  description = "MySQL administrator login"
  type        = string
}

variable "custom_mysql_administrator_password" {
  description = "MySQL administrator password. If not set, randomly generated"
  type        = string
  default     = null
}

variable "mysql_version" {
  description = "MySQL server version. Valid values are `5.7` and `8.0.21`"
  type        = string
  default     = "8.0.21"
}

variable "mysql_options" {
  description = "Map of configuration options: https://learn.microsoft.com/en-us/azure/mysql/single-server/concepts-server-parameters"
  type        = map(string)
  default     = {}
}

variable "geo_redundant_backup_enabled" {
  description = "Turn Geo-redundant server backups on/off. Not available for the Basic tier."
  type        = bool
  default     = false
}

variable "create_mode" {
  description = "The creation mode which can be used to restore or replicate existing servers. Possible values are Default, PointInTimeRestore, GeoRestore, and Replica. Changing this forces a new MySQL Flexible Server to be created."
  type        = string
  default     = "Default"
}

variable "backup_retention_days" {
  description = "Backup retention days for the server, supported values are between `7` and `35` days."
  type        = number
  default     = 7
}

variable "databases" {
  description = "Map of databases with default collation and charset."
  type        = map(map(string))
}

variable "tier" {
  description = "Tier for MySQL flexible server SKU. Possible values are: `GeneralPurpose`, `Basic`, `MemoryOptimized`."
  type        = string
  default     = "GeneralPurpose"
}

variable "size" {
  description = "The size for the MySQL Flexible Server."
  type        = string
  default     = "Standard_D2ds_v4"
}

variable "source_server_id" {
  description = "The resource ID of the source MySQL Flexible Server to be restored."
  type        = string
  default     = null
}

variable "high_availability" {
  description = "Map of high availability configuration: https://docs.microsoft.com/en-us/azure/mysql/flexible-server/concepts-high-availability. `null` to disable high availability"
  type = object({
    mode                      = string
    standby_availability_zone = optional(number)
  })
  default = {
    mode                      = "SameZone"
    standby_availability_zone = 1
  }
}

variable "maintenance_window" {
  description = "Map of maintenance window configuration: https://docs.microsoft.com/en-us/azure/mysql/flexible-server/concepts-maintenance"
  type        = map(number)
  default     = null
}

variable "storage" {
  description = "Map of the storage configuration"
  type = object({
    auto_grow_enabled = optional(bool)
    iops              = optional(number)
    size_gb           = optional(number)
  })
  default = null
}

variable "ssl_enforced" {
  description = "Enforce SSL connection on MySQL provider and set require_secure_transport on MySQL Server"
  type        = bool
  default     = true
}

variable "zone" {
  description = "Specifies the Availability Zone in which this MySQL Flexible Server should be located. Possible values are 1, 2 and 3"
  type        = number
  default     = 1
}
