data "azurerm_client_config" "current" {}

module "landingzones" {
  source = "./modules/landingzones"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_id          = var.root_id
  root_parent_id   = var.root_parent_id
  primary_location = var.primary_location
}
