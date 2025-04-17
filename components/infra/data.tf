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

data "azuread_application" "bootstrap" {
  for_each     = local.business_area == "cft" ? toset(local.cft_subscriptions) : toset(local.sds_subscriptions)
  display_name = "DTS Bootstrap (sub:${each.value})"
  client_id    = each.value == "DTS-HERITAGE-PROD-EXTSVC" ? "5f29910d-50d4-424b-a888-e95c59dc9d70" : null
}