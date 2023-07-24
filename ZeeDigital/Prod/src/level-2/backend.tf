terraform {
  backend "azurerm" {
    resource_group_name = "myrg"
    key = "terraform-level-2.tfstate"
    container_name = "tfstate"
  }
}
