variable "tenant_id" {
  type        = string
  description = "billing tenant ID for Azure"
  default     = "bd55c2ea-0ea2-43b0-844c-5f0f7514e38a"
}
variable "subscription_id" {
  type        = string
  description = "Your Azure Subscription ID"
  default     = "15fb9914-0707-44fd-a9fa-96f741eac317" # Replace with your actual subscription ID
}
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group to create"
  default     = "DevopsWebApp-RG" # You can change this to any name you prefer
}
variable "location" {
  type        = string
  description = "The Azure region to deploy resources in"
  default     = "Uk South" # You can change this to any Azure region you prefer
}

 variable "prefix" {
  description = "A prefix to be used for all resource names."
  type        = string
  default     = "devopschallenge"
}

variable "admin_username" {
  type        = string
  description = "The administrator username for the virtual machine."
  default     = "azureuser"
}
  
