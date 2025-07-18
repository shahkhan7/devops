variable "tenant_id" {
  type        = string
  description = "billing tenant ID for Azure"
  default     = "xxxxxxxxxxxxxxxxxxxx"
}
variable "subscription_id" {
  type        = string
  description = "Your Azure Subscription ID"
  default     = "xxxxxxxxxxxxxxxx" # Replace with your actual subscription ID
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
  
