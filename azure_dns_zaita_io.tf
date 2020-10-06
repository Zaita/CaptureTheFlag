resource "azurerm_dns_zone" "zaita_io" {
 name     = "zaita.io"
 resource_group_name = azurerm_resource_group.zaita_io.name
}

resource "azurerm_dns_a_record" "zaita_io" {
 name = "@"
 zone_name           = azurerm_dns_zone.zaita_io.name
 resource_group_name = azurerm_resource_group.zaita_io.name
 ttl                 = 3600
 records             = ["116.251.192.218"]
}

resource "azurerm_dns_a_record" "ctf_zaita_io" {
 name = "ctf"
 zone_name           = azurerm_dns_zone.zaita_io.name
 resource_group_name = azurerm_resource_group.zaita_io.name
 ttl                 = 3600
 records             = ["116.251.192.218"]
}

resource "azurerm_dns_a_record" "_ctf_zaita_io" {
 name = "*.ctf"
 zone_name           = azurerm_dns_zone.zaita_io.name
 resource_group_name = azurerm_resource_group.zaita_io.name
 ttl                 = 3600
 records             = ["116.251.192.218"]
}

resource "azurerm_dns_cname_record" "www_zaita_io" {
 name = "www"
 zone_name           = azurerm_dns_zone.zaita_io.name
 resource_group_name = azurerm_resource_group.zaita_io.name
 ttl                 = 3600
 record              = "zaita.io"
}




