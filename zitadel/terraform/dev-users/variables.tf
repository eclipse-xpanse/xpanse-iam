variable "test_users" {
  type = list(object({
    name     = string
    email    = string
    password = string
    roles = list(string)
    meta-data = list(object({
      key   = string
      value = string
    }))
  }))

}

variable "xpanse_org_id" {
  description = "ID of xpanse organization"
  type        = string
}

variable "xpanse_project_id" {
  description = "ID of eclipse-xpanse project"
  type        = string
}

variable "domain" {
  description = "Domain name of the zitadel instance"
  type        = string
}

variable "port" {
  description = "Port of the zitadel application instance"
  type        = number
}