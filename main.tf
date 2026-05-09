terraform {
  required_version = "1.15.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }

  cloud {

    organization = "My-Terraform-808552"

    workspaces {
      name = "terraform-secure-storage-workspace"
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "rg" {
  name     = "813-9764c5fb-hands-on-with-terraform-on-azure"
  location = "West US"
}

module "securestorage" {
  source               = "app.terraform.io/My-Terraform-808552/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "storageaccount808552"
}