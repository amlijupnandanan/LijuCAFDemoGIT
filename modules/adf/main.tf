terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.62.1"
    }
  }
}

provider "azurerm" {
  features {}
}

module "data_factory" {
  source   = "./data-factory"
  settings = local.configure_adf_resources.settings
}