locals {
  env = var.env == "stg" && contains(lower(data.azurerm_subscription.current.display_name), "cftapps") ? "aat" : var.env || var.env == "test" && contains(lower(data.azurerm_subscription.current.display_name), "cftapps") ? "perftest" : var.env
}