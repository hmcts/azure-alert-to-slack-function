locals {
  env = var.env == "stg" ? "aat" : var.env
}