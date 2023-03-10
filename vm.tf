#vm for web application
resource "azurerm_linux_virtual_machine" "web-vm" {
  name                = "web-server"
  resource_group_name = azurerm_resource_group.web-rg.name
  location            = azurerm_resource_group.web-rg.location
  size                = "Standard_F2"
  admin_username      = "azureuser"
  cutsom_data         = filebase64(web.sh)
  network_interface_ids = [
    azurerm_network_interface.web-nic.id,
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}