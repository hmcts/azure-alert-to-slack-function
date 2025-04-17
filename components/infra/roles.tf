resource "azurerm_role_assignment" "monitoring_reader" {
  for_each             = local.subscriptions
  name                 = "monitoring-reader"
  scope                = azurerm_monitor_action_group.action_group.id
  role_definition_name = "Monitoring Reader"
  principal_id         = data.azuread_application.bootstrap[each.value].object_id
  principal_type       = "ServicePrincipal"
}