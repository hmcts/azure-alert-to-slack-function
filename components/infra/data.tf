data "azurerm_client_config" "current" {
}

data "azurerm_key_vault" "this" {
  name                = "dcdcftapps${var.env}kv"
  resource_group_name = "genesis-rg"
}

data "azurerm_key_vault_secret" "bot_token" {
  name         = "alerts-${var.component}-bot-token"
  key_vault_id = data.azurerm_key_vault.this.id
}

data "azurerm_key_vault_secret" "signing_secret" {
  name         = "alerts-${var.component}-signing-secret"
  key_vault_id = data.azurerm_key_vault.this.id
}
