data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "current" {
  subscription_id = data.azurerm_client_config.current.subscription_id
}

data "azurerm_key_vault" "this" {
  name                = local.business_area == "cft" ? "dtscftptl" : "dtssdsptl"
  resource_group_name = "genesis-rg"
}

data "azurerm_key_vault_secret" "bot_token" {
  name         = "${var.product}-${var.component}-bot-token"
  key_vault_id = data.azurerm_key_vault.this.id
}

data "azurerm_key_vault_secret" "signing_secret" {
  name         = "${var.product}-${var.component}-signing-secret"
  key_vault_id = data.azurerm_key_vault.this.id
}
