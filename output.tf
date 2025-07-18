# outputs.tf

output "public_ip_address" {
  description = "The public IP address of the virtual machine."
  value       = azurerm_public_ip.pip.ip_address
}

output "vm_public_dns" {
  description = "The fully qualified domain name of the VM."
  value       = "http://${azurerm_public_ip.pip.ip_address}"
}
