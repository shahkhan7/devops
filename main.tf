# main.tf

# Configure the Azure Provider
# This block tells Terraform that we are going to be working with Microsoft Azure
# and can be used to set global settings like the subscription.
# Configure the Azure Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 4.36.0"
    }
  }
}


provider "azurerm" {
    
    features {}
    # The provider block configures the Azure provider with the necessary credentials.
   subscription_id = var.subscription_id
   tenant_id       = var.tenant_id
}

# Create a resource group
# A resource group is a logical container into which Azure resources are deployed and managed.
# It's good practice to create a new resource group for each project or application.
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.prefix}-devops-challenge"
  location = var.location
  tags = {
    environment = "dev"
    project     = "DevOps Challenge"
  }
}
