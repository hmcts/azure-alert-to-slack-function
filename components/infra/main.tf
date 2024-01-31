resource "azurerm_resource_group" "this" {
  name     = "${var.product}-${var.component}-${local.env}"
  location = var.location

  tags = module.tags.common_tags
}

resource "azurerm_storage_account" "this" {
  name                     = replace("${var.product}${var.component}${local.env}", "-", "")
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "ZRS"

  tags = module.tags.common_tags
}

module "tags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = local.env
  product     = "cft-platform"
  builtFrom   = var.builtFrom
}

resource "azurerm_key_vault_access_policy" "function" {
  provider     = azurerm.cftptl
  key_vault_id = data.azurerm_key_vault.cftptl.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_windows_function_app.this.identity[0].principal_id

  secret_permissions = [
    "Get",
  ]

  depends_on = [ azurerm_windows_function_app.this ]
}