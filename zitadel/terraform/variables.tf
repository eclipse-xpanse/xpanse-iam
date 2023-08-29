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

variable "swagger-ui_base_uri" {
  type    = string
}