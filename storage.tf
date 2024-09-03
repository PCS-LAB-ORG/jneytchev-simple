# Create random 8 digit hex code
resource "random_id" "rando" {
  byte_length = 4
}


# Create Azure Storage Account
resource "azurerm_storage_account" "primary" {
  name = "jneytchevsa${random_id.rando.hex}"
  # resource_group_name      = azurerm_resource_group.primary.name
  # location                 = azurerm_resource_group.primary.location
  resource_group_name      = "jneytchev-manual"
  location                 = "centralus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    owner     = "jneytchev@paloaltonetworks.com"
    yor_name  = "primary"
    yor_trace = "fa8006ea-0d4b-43c0-b75b-b7a3830bafcf"
  }
}


# Define storage container
resource "azurerm_storage_container" "data" {
  name                  = "data"
  storage_account_name  = azurerm_storage_account.primary.name
  container_access_type = "private"
}

