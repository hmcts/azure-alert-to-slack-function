module "application_insights" {
  source = "git::https://github.com/hmcts/terraform-module-application-insights?ref=4.x"

  product = "${local.business_area}-${var.product}"
  env     = local.env

  resource_group_name = azurerm_resource_group.this.name

  common_tags = module.tags.common_tags
}
