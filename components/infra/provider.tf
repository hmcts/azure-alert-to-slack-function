terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">3.54.0"
    }
  }
  required_version = ">=1.5.0"
  #   backend "azurerm" {}
}

provider "azurerm" {
  features {}
}
