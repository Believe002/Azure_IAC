# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"

  cloud {
    organization = "Blaze_Vishwaas"

    workspaces {
      name = "electroazure"
    }
  }
  
}

provider "azurerm" {
  features {}
  client_id       = "a9ecd4c5-920a-4feb-ae4a-c39ea86eb6fc"
  tenant_id       = "9e150f1d-92d8-47f9-bf6f-b44bc4b2fa6c"
  subscription_id = "a9ecd4c5-920a-4feb-ae4a-c39ea86eb6fc"
  #   client_secret = "otI8Q~x-aFusyLXRd8jPZxMGkX-2ZLiVeU0RtbTD"
}

resource "azurerm_resource_group" "rg" {
  name     = "ElectroVirtualMachine"
  location = "westus2"
}



resource "azurerm_virtual_network" "rg" {
  name                = "ElectroVnet"
  address_space       = ["172.16.0.0/16"]
  location            = "westus2"
  resource_group_name = "azurerm_resource_group.rg.name"

  subnet {
    name           = "subnet1"
    address_prefix = "172.16.0.0/24"
    security_group = azurerm_network_security_group.rg.id
  }

  subnet {
    name           = "subnet1"
    address_prefix = "172.16.1.0/24"
    security_group = azurerm_network_security_group.rg.id
  }
}


resource "azurerm_network_security_group" "rg" {
  name                = "electroNSG"
  location            = "westus2"
  resource_group_name = "azurerm_resource_group.rg.name"
}






