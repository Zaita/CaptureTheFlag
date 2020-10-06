resource "azurerm_storage_account" "storage_account_zaita_io" {
  name                     = "zaitaiostorage"
  resource_group_name      = azurerm_resource_group.zaita_io.name
  location                 = azurerm_resource_group.zaita_io.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

