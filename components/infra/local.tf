locals {
  env           = (var.env == "stg" && strcontains(lower(data.azurerm_subscription.current.display_name), "cftapps")) ? "aat" : (var.env == "test" && strcontains(lower(data.azurerm_subscription.current.display_name), "cftapps")) ? "perftest" : var.env
  business_area = strcontains(lower(data.azurerm_subscription.current.display_name), "cftapps") ? "cft-platform" : "sds-platform"
}