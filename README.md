This Module is to create a Manages Kubernetes Cluster.
All the required variables are passed with default values.

<Usage>

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.101.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  tenant_id       = "<tenant_id>"
  subscription_id = "<subscription_id>"
  client_id       = "<client_id>"
  client_secret   = "<client_secret>"
}

<Paste the Provision Instructions here>
