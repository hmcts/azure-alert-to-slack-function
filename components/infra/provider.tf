terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">3.54.0"
    }
  }
  required_version = ">=1.5.0"
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}
  alias           = "cftptl"
  subscription_id = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
}
