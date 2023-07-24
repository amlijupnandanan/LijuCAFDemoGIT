# Get the connectivity and management configuration
# settings from outputs via the respective terraform
# remote state files

data "terraform_remote_state" "level-1" {
  backend = "azurerm"

  config = {
    container_name       = "tfstate"
    key                  = "terraform-level-1.tfstate"
    access_key           = var.tf_storage_access_key
    storage_account_name = "mystgtfstate999"
  }
}