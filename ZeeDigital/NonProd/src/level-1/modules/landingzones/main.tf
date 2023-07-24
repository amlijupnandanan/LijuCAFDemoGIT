terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.5.0"
    }
  }
}

data "azurerm_client_config" "current" {}

module "enterprise_scale_digital_nonprod" {
  source           = "Azure/caf-enterprise-scale/azurerm"
  version          = "~>4.0.2"
  default_location = var.primary_location

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_id                   = var.root_id
  root_parent_id            = "mg-${var.root_id}-digital"
  library_path              = "${path.module}/lib"
  deploy_core_landing_zones = false
  custom_landing_zones      = local.custom_landing_zones_digital_np
}