

# data "azurerm_function_app_host_keys" "host_keys" {
#   name                = azurerm_windows_function_app.this.name
#   resource_group_name = azurerm_resource_group.this.name
#   depends_on          = [azurerm_windows_function_app.this]
# }

# resource "azurerm_monitor_action_group" "action_group" {
#   name                = "${local.business_area}-${var.product}-${var.component}-warning-alerts"
#   resource_group_name = azurerm_resource_group.this.name
#   short_name          = "${substr(var.product, 0, 3)}-${local.env}"

#   azure_function_receiver {
#     function_app_resource_id = azurerm_windows_function_app.this.id
#     function_name            = "httpTrigger"
#     http_trigger_url         = "https://${azurerm_windows_function_app.this.default_hostname}/api/httpTrigger?code=${data.azurerm_function_app_host_keys.host_keys.default_function_key}"
#     name                     = "slack-alerts"
#     use_common_alert_schema  = true
#   }

#   tags = module.tags.common_tags
# }
