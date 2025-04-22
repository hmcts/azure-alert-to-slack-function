resource "azurerm_role_assignment" "monitoring_reader" {
  for_each             = local.business_area == "cft" ? toset(local.cft_subscriptions) : toset(local.sds_subscriptions)
  scope                = azurerm_monitor_action_group.action_group.id
  role_definition_name = "Monitoring Reader"
  principal_id         = data.azuread_service_principal.bootstrap[each.value].object_id
  principal_type       = "ServicePrincipal"
}