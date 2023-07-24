terraform {
  backend "azurerm" {
    container_name = "tfstate"
    key = "terraform-level-3.tfstate"
    resource_group_name = "MyRG"
  }
}