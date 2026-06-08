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
  jenkins_identities = {
    cft = {
      aat = {
        name           = "jenkins-aat-mi"
        resource_group = "managed-identities-aat-rg"
      },
      demo = {
        name           = "jenkins-demo-mi"
        resource_group = "managed-identities-demo-rg"
      },
      ithc = {
        name           = "jenkins-ithc-mi"
        resource_group = "managed-identities-ithc-rg"
      },
      perftest = {
        name           = "jenkins-perftest-mi"
        resource_group = "managed-identities-perftest-rg"
      },
      preview = {
        name           = "jenkins-preview-mi"
        resource_group = "managed-identities-preview-rg"
      },
      prod = {
        name           = "jenkins-prod-mi"
        resource_group = "managed-identities-prod-rg"
      },
      ptl = {
        name           = "jenkins-cftptl-intsvc-mi"
        resource_group = "managed-identities-cftptl-intsvc-rg"
      },
      ptlsbox = {
        name           = "jenkins-cftptlsbox-intsvc-mi"
        resource_group = "managed-identities-cftsbox-intsvc-rg"
      },
      sbox = {
        name           = "jenkins-sbox-mi"
        resource_group = "managed-identities-sandbox-rg"
      }
    },
    sds = {
      demo = {
        name           = "jenkins-demo-mi"
        resource_group = "managed-identities-demo-rg"
      },
      dev = {
        name           = "jenkins-dev-mi"
        resource_group = "managed-identities-dev-rg"
      },
      ithc = {
        name           = "jenkins-ithc-mi"
        resource_group = "managed-identities-ithc-rg"
      },
      prod = {
        name           = "jenkins-prod-mi"
        resource_group = "managed-identities-prod-rg"
      },
      ptl = {
        name           = "jenkins-ptl-mi"
        resource_group = "managed-identities-ptl-rg"
      },
      ptlsbox = {
        name           = "jenkins-ptlsbox-mi"
        resource_group = "managed-identities-ptlsbox-rg"
      },
      sbox = {
        name           = "jenkins-sbox-mi"
        resource_group = "managed-identities-sandbox-rg"
      },
      stg = {
        name           = "jenkins-stg-mi"
        resource_group = "managed-identities-stg-rg"
      },
      test = {
        name           = "jenkins-test-mi"
        resource_group = "managed-identities-test-rg"
      },
    }
  }
}
