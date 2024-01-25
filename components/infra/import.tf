data "azurerm_client_config" "current" {
}

import {
  to = azurerm_resource_group.this
  id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/alerts-slack-${var.env}"
}

import {
  to = azurerm_service_plan.this
  id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/alerts-slack-${var.env}/providers/Microsoft.Web/serverFarms/alerts-slack-${var.env}"
}

import {
  to = azurerm_storage_account.this
  id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/alerts-slack-${var.env}/providers/Microsoft.Storage/storageAccounts/${azurerm_storage_account.this.name}"
}

import {
  to = azurerm_windows_function_app.this
  id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/alerts-slack-${var.env}/providers/Microsoft.Web/sites/alerts-slack-${var.env}"
}

import {
  to = module.application_insights.azurerm_application_insights.this
  id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/alerts-slack-${var.env}/providers/microsoft.insights/components/${module.application_insights.azurerm_application_insights.this.name}"
}