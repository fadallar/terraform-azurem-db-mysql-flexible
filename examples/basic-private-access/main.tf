####################Basic Azure DB for Mysql Setup###################################################################
#
# This an example for setting-up a an Azure Database MySql Flexible
# This examples creates
#  - Sets the different Azure Region representation ( location, location_short, location_cli ...) --> module "regions_master"
#  - Instanciates a map object with the common Tags ot be applied to all resources --> module "base_tagging"
#  - A resource-group --> module "ressource" 
#  - A Flexible MysQL Server with private access and an sql admin user --> module "mysql_db"
#  - Set the default diagnostics settings (All Logs and metric) whith a Log Anamytics workspace as destination --> module "mysql_db"
#  - Two SQL Databases --> module "mysql_db"
#
#  The template does not create the dedicated subnet for the private
#  The template does not create the log analytics workspace
#
#  Please replace the modules source and version with your relevant information
##################################################################################################################
// Core modules

module "regions_master" {
  source  = "app.terraform.io/<ORGANIZATION>/regions-master/azurem"
  version = "x.y.z"
  azure_region = var.location # example eu-west
}

module "base_tagging" {
  source  = "app.terraform.io/<ORGANIZATION>/base-tagging/azurerm"
  version = "x.y.z"
  environment = var.environment
  stack = var.stack
  spoc =  var.spoc
  change = var.change
  costcenter = var.costcenter
  owner = var.owner
}

// Resource Group
module "ressource" {
    source  = "app.terraform.io/<ORGANIZATION>/rg/azurerm"
    version = "x.y.z"
    environment = var.environment
    stack       = var.stack
    location    = module.regions_master.location
    location_short  = module.regions_master.location_short
}

// MySQL 

module "mysql_db" {
  source  = "app.terraform.io/<ORGANIZATION>/static-site/azurerm"
  version = "x.y.z"
  // Common base
  environment = var.environment
  stack       = var.stack
  landing_zone_slug = var.landing_zone_slug
  location                        = module.regions_master.location
  location_short                  = module.regions_master.location_short
  resource_group_name             = module.rg.resource_group_name
  default_tags                    = module.base-tagging.base_tags
  
  diag_log_analytics_workspace_id = "" ### log_analytics_workspace resource Id
  administrator_login = "examplesqladminlogin"
  
  databases = {
    "myfirstdb" = {
      "charset"   = "utf8"
      "collation" = "utf8_general_ci"
    } ,
    "myseconddb" = {
      "charset"   = "utf8"
      "collation" = "utf8_general_ci"
    }
  }

}