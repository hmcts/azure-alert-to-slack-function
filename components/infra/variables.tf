variable "location" {
  default = "uksouth"
}

variable "product" {
  default = "alerts"
}

variable "component" {
  default = "slack"
}

variable "env" {
}

variable "builtFrom" {

}

variable "action_group_reader_principal_ids" {
  description = "Service principal object IDs granted Reader access to the SDS action group."
  type        = set(string)
  default     = []
}

