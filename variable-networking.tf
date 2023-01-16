// Network and Firewall variables
variable "enable_public_access" {
  description = "Whether Azure MySQL is available from public network. - Not compatible with private access"
  type        = bool
  default     = false
}

variable "allowed_cidrs" {
  description = "Map of authorized CIDRs"
  type        = map(string)
}

variable "network_acls" {
  description = "Object with attributes: `bypass`, `default_action`, `ip_rules`, `virtual_network_subnet_ids`. Set to `null` to disable. See https://www.terraform.io/docs/providers/azurerm/r/key_vault.html#bypass for more information."
  type = object({
    bypass                     = optional(string, "None"),
    default_action             = optional(string, "Deny"),
    ip_rules                   = optional(list(string)),
    virtual_network_subnet_ids = optional(list(string)),
  })
  default = {}
}
variable "enable_private_access" {
  description = "Enable private access (VNET Integration) - Requires a delegated subnet"
  type        = bool
  default     = true
}

variable "delegated_subnet_id" {
  description = "The ID of the virtual network subnet to create the MySQL Flexible Server."
  type        = string
  default     = null
}

variable "private_dns_zone_id" {
  description = "The ID of the private dns zone to create the MySQL Flexible Server."
  type        = string
  default     = null
}