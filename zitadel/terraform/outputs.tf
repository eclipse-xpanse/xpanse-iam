locals{
  protocol = var.insecure == true ? "https://" : "http://"
  port_str = var.port == 80 ? "" : var.port == 443 ? "" : var.port
}

output "authorization-server-endpoint" {
  value       = "${local.protocol}${var.domain}${local.port_str}"
  description = "Output the value of authorization-server-endpoint for configuring the consuming applications."
}

output "authorization-api-client-id" {
  value       = nonsensitive(zitadel_application_api.application_api.client_id)
  description = "Output the value of authorization-api-client-id for configuring the consuming application 'Xapnse-Api'."
}

output "authorization-api-client-secret" {
  value       = nonsensitive(zitadel_application_api.application_api.client_secret)
  description = "Output the value of authorization-api-client-secret for configuring the consuming application 'Xapnse-Api'."
}

output "authorization-swagger-ui-client-id" {
  value       = nonsensitive(zitadel_application_oidc.swagger-ui.client_id)
  description = "Output the value of authorization-swagger-ui-client-id for configuring the consuming application 'Xapnse-Api'."
}

output "authorization-xpanse-ui-client-id" {
  value       = nonsensitive(zitadel_application_oidc.xpanse-ui.client_id)
  description = "Output the value of authorization-xpanse-ui-client-i for configuring the consuming application 'Xpanse-UI'."
}