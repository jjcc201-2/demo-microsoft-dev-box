terraform {

  required_providers {
     azapi = {
      source  = "azure/azapi"
      version = "=2.6.1"
    }
    
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.39.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "=3.5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "=3.1.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azapi" {

}