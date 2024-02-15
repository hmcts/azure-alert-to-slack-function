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
variable "email_receiver_config" {
  description = "Configuration for email receiver in the action group"
  type        = map(string)
  default     = null
}
