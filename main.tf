/**
  * # README.md
  *
  * This is the readme of the example repository for terraform-docs poc.
  */

# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
  subscription_id = "4e5d226b-e71d-4384-8ca3-1cc183c291de"
  #  pwdalias        = "value"
}

variable "some_vars" {
  description = "Some value descirption"
  type        = number
  default     = 10
}


/**
  * # README.md
  *
  * This is some resource.
  */
// Creates resource group
resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroupNEW"
  location = "West Europe"
}

# Creates resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

# create some not important resource
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.10.0.0/16"]
  dns_servers         = ["10.10.0.4", "10.10.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.10.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.10.2.0/24"
    #security_group = azurerm_network_security_group.example.id
  }

  tags = {
    environment = "Production"
  }
}

output "some_value" {
  value = "Some Value"
}