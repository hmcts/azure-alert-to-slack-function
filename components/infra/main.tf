resource "azurerm_resource_group" "this" {
  name     = "${var.product}-${var.component}-${var.env}"
  location = var.location

  tags = module.tags.common_tags
}

resource "azurerm_storage_account" "this" {
  name                     = replace("${var.product}${var.component}${var.env}", "-", "")
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "ZRS"

  tags = module.tags.common_tags
}

module "tags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.env
  product     = "cft-platform"
  builtFrom   = var.builtFrom
}
