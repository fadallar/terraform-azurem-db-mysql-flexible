locals {
administrator_password = coalesce(var.custom_mysql_administrator_password, random_password.mysql_administrator_password.result)

tier_map = {
    "GeneralPurpose"  = "GP"
    "Burstable"       = "B"
    "MemoryOptimized" = "MO"
  }

default_mysql_options = {
    require_secure_transport = var.ssl_enforced ? "ON" : "OFF"
  }
}