resource "azurerm_role_assignment" "monitoring_reader" {
  for_each             = local.business_area == "cft" ? toset(local.cft_subscriptions) : toset(local.sds_subscriptions)
  scope                = azurerm_monitor_action_group.action_group.id
  role_definition_name = "Monitoring Reader"
  principal_id         = data.azuread_service_principal.bootstrap[each.value].object_id
  principal_type       = "ServicePrincipal"
}

resource "azurerm_role_assignment" "user_access_administrator" {
  for_each             = local.business_area == "cft" ? toset(local.cft_user_access_subs) : toset(local.sds_user_access_subs)
  scope                = azurerm_monitor_action_group.action_group.id
  role_definition_name = "User Access Administrator"
  principal_id         = data.azuread_service_principal.bootstrap[each.value].object_id
  principal_type       = "ServicePrincipal"
}
