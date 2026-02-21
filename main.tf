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

# 1. Grupo de Recursos
resource "azurerm_resource_group" "rg_seguridad" {
  name     = "rg-laboratorio-manuel"
  location = "West Europe"
}

# 2. Red Virtual
resource "azurerm_virtual_network" "vnet_lab" {
  name                = "vnet-seguridad"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg_seguridad.location
  resource_group_name = azurerm_resource_group.rg_seguridad.name
}

# 3. Subred
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-interna"
  resource_group_name  = azurerm_resource_group.rg_seguridad.name
  virtual_network_name = azurerm_virtual_network.vnet_lab.name
  address_prefixes     = ["10.0.1.0/24"]
}

# 4. Network Security Group (Firewall)
resource "azurerm_network_security_group" "nsg_lab" {
  name                = "nsg-seguridad-01"
  location            = azurerm_resource_group.rg_seguridad.location
  resource_group_name = azurerm_resource_group.rg_seguridad.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# 5. Asociación de Seguridad
resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg_lab.id
}
