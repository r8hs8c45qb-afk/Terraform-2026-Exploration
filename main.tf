terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg_seguridad" {
  name     = "rg-laboratorio-manuel"
  location = "West Europe"
}

resource "azurerm_virtual_network" "vnet_lab" {
  name                = "vnet-seguridad"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg_seguridad.location
  resource_group_name = azurerm_resource_group.rg_seguridad.name
}
