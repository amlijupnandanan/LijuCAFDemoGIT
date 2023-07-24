terraform {
  backend "azurerm" {

    resource_group_name  = "AZZEEDEMOLIJURG01"
    storage_account_name = "usezeestg01"
    container_name       = "tfstate-level1-sprint1"
    key                  = "zee_digital_nonprod_level1.tfstate"
  }
}
