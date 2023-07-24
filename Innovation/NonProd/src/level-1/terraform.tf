terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.62.1"
    }
  }
}

provider "azurerm" {
  subscription_id = "cfa56b4d-9ab3-4006-a8dd-693d6517161f"
  tenant_id       = "8eeb9e98-686a-45ae-8d97-c024b148d437"
  client_id       = "32339278-463f-4d44-84cf-12c9546cce6b"
  client_secret   = "4Vu8Q~ZHcxgfh9~FtOrPgQL~HyRuGihF5Dm0Ecvf"
  features {}
}