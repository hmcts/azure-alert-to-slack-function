resource "azurerm_service_plan" "this" {
  name                = "${var.product}-${var.component}-${var.env}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  os_type             = "Windows"
  sku_name            = "Y1"

  tags = module.tags.common_tags
}

resource "azurerm_windows_function_app" "this" {
  name                = "${var.product}-${var.component}-${var.env}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  storage_account_name       = azurerm_storage_account.this.name
  storage_account_access_key = azurerm_storage_account.this.primary_access_key
  service_plan_id            = azurerm_service_plan.this.id

  functions_extension_version = "~4"

  site_config {
    application_stack {
      node_version = "~18"
    }
    application_insights_connection_string = module.application_insights.connection_string
  }

  app_settings = {
    AzureWebJobsFeatureFlags = "EnableWorkerIndexing"
  }

  tags = module.tags.common_tags
}