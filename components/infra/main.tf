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
  environment = var.env
  product     = local.business_area
  builtFrom   = var.builtFrom
}

resource "azurerm_user_assigned_identity" "this" {
  location            = azurerm_resource_group.this.location
  name                = "${var.product}-${var.component}-${local.env}"
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_key_vault_access_policy" "this" {
  key_vault_id = data.azurerm_key_vault.this.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_user_assigned_identity.this.principal_id

  secret_permissions = [
    "Get",
  ]
}