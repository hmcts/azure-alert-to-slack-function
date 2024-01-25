data "azurerm_client_config" "current" {
}

import {
  to = azurerm_resource_group.this
  id = "/subscriptions/${azurerm_client_config.current.subscription_id}/resourceGroups/${azurerm_resource_group.this.name}"
}

import {
  to = azurerm_service_plan.this
  id = "/subscriptions/${azurerm_client_config.current.subscription_id}/resourceGroups/${azurerm_resource_group.this.name}/providers/Microsoft.Web/serverFarms/${azurerm_resource_group.this.name}"
}

import {
  to = azurerm_storage_account.this
  id = "/subscriptions/${azurerm_client_config.current.subscription_id}/resourceGroups/${azurerm_resource_group.this.name}/providers/Microsoft.Storage/storageAccounts/${azurerm_storage_account.this.name}"
}

import {
  to = azurerm_windows_function_app.this
  id = "/subscriptions/${azurerm_client_config.current.subscription_id}/resourceGroups/${azurerm_resource_group.this.name}/providers/Microsoft.Web/sites/${azurerm_resource_group.this.name}"
}

import {
  to = module.application_insights.azurerm_application_insights.this
  id = "/subscriptions/${azurerm_client_config.current.subscription_id}/resourceGroups/${azurerm_resource_group.this.name}/providers/microsoft.insights/components/${module.application_insights.azurerm_application_insights.this.name}"
}