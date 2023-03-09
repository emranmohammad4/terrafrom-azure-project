# web applicaton teraform project resource group
resource "azurerm_resource_group" "web-rg" {
  name     = "web-rg"
  location = "East US"
  tags = {
  environment = "dev"
  tier = "frontend"
  }
}




