// Need to add a delegated subnet here 
// Delegation Microsoft.DBforMySQL/flexibleServer
#resource "azurerm_subnet" "mysqldelegatedsubnet" {
#  name                 = format("snet-pe-%s",local.name)
#  resource_group_name = var.resource_group_name
#  virtual_network_name = var.virtual_network_name
#  address_prefixes     = [var.delegated_subnet_prefix]
#
#  delegation {
#    name = "delegation"
#
#    service_delegation {
#      name    = "Microsoft.DBforMySQL/flexibleServer"
#      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
#    }
#  }
#}
resource "azurerm_mysql_flexible_server_firewall_rule" "firewall_rules" {
  for_each = var.enable_public_access ? var.allowed_cidrs : {}

  name                = each.key
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql_flexible_server.name
  start_ip_address    = cidrhost(each.value, 0)
  end_ip_address      = cidrhost(each.value, -1)
}