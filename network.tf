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