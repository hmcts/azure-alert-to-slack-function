data "azurerm_client_config" "current" {
}

data "azurerm_key_vault" "cftptl" {
  provider            = azurerm.cftptl
  name                = "cftptl-intsvc"
  resource_group_name = "core-infra-intsvc-rg"
}

data "azurerm_key_vault_secret" "bot_token" {
  name         = "${var.product}-${var.component}-bot-token"
  key_vault_id = data.azurerm_key_vault.cftptl.id
}

data "azurerm_key_vault_secret" "signing_secret" {
  name         = "${var.product}-${var.component}-signing-secret"
  key_vault_id = data.azurerm_key_vault.cftptl.id
}
