provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "~> 2.30.0  
  features {}
}

variable "rgname" {
  type        = string
  description = "The name of the resource group to create"
}

variable "domain_name" {
  type        = string
  description = "The domain name to use for the deployment"
}

variable "dns_alias" {
  type        = string
  description = "The domain name to use for the deployment"
}

resource "azurerm_resource_group" "zaita_io" {
 name = var.rgname
 location = "Australia East"


resource "azurerm_storage_account" "storage_account_zaita_io" {
  name                     = "zaitaiostorage"
  resource_group_name      = azurerm_resource_group.zaita_io.name
  location                 = azurerm_resource_group.zaita_io.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_cdn_profile" "ctf_zaita_io" {
  name                = "ctfcdn"
  location            = azurerm_resource_group.zaita_io.location
  resource_group_name = azurerm_resource_group.zaita_io.name
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "ctf_zaita_io" {
  name                = "ctfzaitaio"
  profile_name        = azurerm_cdn_profile.ctf_zaita_io.name
  location            = azurerm_resource_group.zaita_io.location
  resource_group_name = azurerm_resource_group.zaita_io.name
  origin_host_header  = "ctfzaitaio.azureedge.net"
  
  origin {
    name      = "ctfzaitaio"
    host_name = "ctfzaitaio.azureedge.net"
  }
}

# DNS Update for the DNS Zone so ctf.zaita.io works
resource "azurerm_dns_zone" "zaita_io" {
 name     = "zaita.io"
 resource_group_name = azurerm_resource_group.zaita_io.name
}

resource "azurerm_dns_a_record" "ctf_zaita_io" {
 name                = var.dns_alias
 zone_name           = azurerm_dns_zone.zaita_io.name
 resource_group_name = azurerm_resource_group.zaita_io.name
 ttl                 = 3600
 records             = ["116.251.192.218"]
}


