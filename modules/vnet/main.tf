terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


Resource "azurerm_virtual_network" "vnet1" {
  name = "vnet1"
  location = "centralindia"
  resource_group_name = "rg-devops-tfmodule-001"
  address_space = ["10.0.0.0/16"]
}

#build devsubnet and link to mainnetwork virtual network
Resource "azurerm_subnet" "subnet1" {
  name = "dev-subnet1"
  resource_group_name = "rg-devops-tfmodule-001"
  address_prefixes = ["10.0.1.0/24"]
  virtual_network_name = azurerm_virtual_network.vnet1.name
}

#build testsubnet and link to mainnetwork virtual network
Resource "azurerm_subnet" "subnet2" {
  name = "dev-subnet2"
  resource_group_name = "rg-devops-tfmodule-001"
  address_prefixes = ["10.0.2.0/24"]
  virtual_network_name = azurerm_virtual_network.vnet1.name
}