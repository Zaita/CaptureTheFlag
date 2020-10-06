locals {
 client_certificate_path = "/home/zaita/terraform/azure/principal/service-principal.pfx"

}

provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "~> 2.30.0"

  subscription_id             = "29f93ffb-32dc-48bc-977a-346d91c5f512"
  client_id                   = "e8956a6c-8598-440a-a173-fb31373d20cd"
  client_certificate_path     = local.client_certificate_path
  client_certificate_password = ""
  tenant_id                   = "8a6d6f5e-a9db-42e1-a489-872bb2416ca5"
}

