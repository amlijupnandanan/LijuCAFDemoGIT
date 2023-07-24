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
  source   = "./data-lake"
  settings = local.configure_adls_resources.settings
}