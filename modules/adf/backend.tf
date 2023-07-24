terraform {
  backend "azurerm" {
    resource_group_name  = "rg-devops-tfmodule-001"
    storage_account_name = "sttfstate003"
    container_name       = "sttfstate-state-001"
    key                  = "terraform.tfstate"
  }
}
