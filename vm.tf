# vm.tf

# Create a network interface
# The NIC connects the VM to the VNet, subnet, and public IP.
resource "azurerm_network_interface" "nic" {
  name                = "nic-${var.prefix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

# Associate the NSG with the NIC
# This applies the firewall rules to the VM's network interface.
resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Create the virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "vm-${var.prefix}"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = "Standard_B1s" # A small, cost-effective size
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.nic.id]

  # For simplicity, we're using password authentication.
  # In a production environment, SSH key authentication is strongly recommended.
  admin_password = "Password1234!"
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}

# Use a custom script extension to provision the web server
# This extension runs a script on the VM after it's created.
resource "azurerm_virtual_machine_extension" "docker_nginx" {
  name                 = "docker-nginx-provisioner"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
    {
        "script": "${base64encode(file("cloud-init.sh"))}"
    }
SETTINGS
}
