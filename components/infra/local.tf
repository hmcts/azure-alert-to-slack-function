locals {
  env           = (var.env == "stg" && strcontains(lower(data.azurerm_subscription.current.display_name), "cftapps")) ? "aat" : (var.env == "test" && strcontains(lower(data.azurerm_subscription.current.display_name), "cftapps")) ? "perftest" : var.env
  business_area = strcontains(lower(data.azurerm_subscription.current.display_name), "cft") ? "cft" : "sds"
  cft_subscriptions = [
    "DCD-CFTAPPS-TEST",
    "DCD-CFTAPPS-ITHC",
    "DCD-CNP-QA",
    "DCD-CFTAPPSDATA-DEMO",
    "DCD-CFTAPPS-DEV",
    "DCD-CFTAPPS-DEMO",
    "DCD-CNP-DEV",
    "DCD-CNP-Prod",
    "DCD-CFTAPPS-PROD",
    "DCD-CFTAPPS-STG",
    "DCD-CFT-Sandbox",
    "DCD-CFTAPPS-SBOX",
    "DCD-CFT-VH-Pilot",
    "DTS-CFTPTL-INTSVC",
    "DTS-CFTSBOX-INTSVC"

  ]
  sds_subscriptions = [
    "DTS-SHAREDSERVICES-ITHC",
    "DTS-SHAREDSERVICES-DEMO",
    "DTS-SHAREDSERVICES-TEST",
    "DTS-SHAREDSERVICES-DEV",
    "DTS-SHAREDSERVICES-PROD",
    "DTS-SHAREDSERVICESPTL-SBOX",
    "DTS-SHAREDSERVICES-SBOX",
    "DTS-SHAREDSERVICESPTL",
    "DTS-SHAREDSERVICES-STG",
    "DTS-ARCHIVING-TEST",
    "DTS-ARCHIVING-PROD",
    "HMCTS-HUB-PROD-INTSVC",
    "HMCTS-HUB-SBOX-INTSVC",
    "HMCTS-SOC-SBOX",
    "HMCTS-SOC-PROD",
    "Reform-CFT-VH-Dev"
  ]
}
