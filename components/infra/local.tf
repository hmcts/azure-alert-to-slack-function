locals {
  env = var.env == "stg" ? "aat" && contains(lower(data.azurerm_subscription.subscriptionid.display_name), "cftapps") : var.env || var.env == "test" ? "perftest" && contains(lower(data.azurerm_subscription.subscriptionid.display_name), "cftapps") : var.env
}