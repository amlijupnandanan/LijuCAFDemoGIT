
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.5.0"
    }
  }
}

data "azurerm_client_config" "current" {}

module "enterprise_scale_lz_digital" {
  source           = "Azure/caf-enterprise-scale/azurerm"
  version          = "~>4.0.2"
  default_location = var.primary_location

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id            = var.root_parent_id
  root_id                   = var.root_id
  library_path              = "${path.module}/lib"
  deploy_core_landing_zones = false
  custom_landing_zones      = local.custom_landing_zones
}
