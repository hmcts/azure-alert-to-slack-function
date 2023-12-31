module "application_insights" {
  source = "git@github.com:hmcts/terraform-module-application-insights?ref=main"

  product = var.product
  env     = var.env

  resource_group_name = azurerm_resource_group.this.name

  common_tags = module.tags.common_tags
}
