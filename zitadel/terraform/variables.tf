variable "auth_token_type" {
  type        = string
  default     = "OpaqueToken"
  description = "The token type for authorization with a default value of 'OpaqueToken' and another value of 'JWT'.Better performance with type 'JWT', safer with type 'OpaqueToken'. Update the default value with 'JWT' can improve performance of authorization."
}

variable "domain" {
  type    = string
}

variable "insecure" {
  type    = bool
}

variable "port" {
  type    = number
}

variable "jwt_profile_file" {
  type    = string
}

variable "smtp_sender_address" {
  type        = string
  description = "The address of e-mail sender."
}

variable "smtp_sender_name" {
  type        = string
  description = "The name of e-mail sender."
}

variable "smtp_host_port" {
  type        = string
  description = "The host and port of smtp service with format {host}:{port}. Example:'smtp.gmail.com:587'"
}

variable "smtp_login_user" {
  type        = string
  description = "The account of e-mail sender to login."
}

variable "smtp_login_password" {
  type        = string
  description = "The password of e-mail sender to login."
}

variable "redirect_xpanse-ui_uris" {
  type    = list(string)
}

variable "post_logout_redirect_uris"{
  type    = list(string)
}

variable "redirect_swagger-ui_uris" {
  type    = list(string)
}

variable "xpanse-ui_base_uri" {
  type    = string
}

variable "xpanse_swagger-ui_base_uri" {
  type    = string
}

variable "terraform-boot_swagger-ui_base_uri" {
  type    = string
}