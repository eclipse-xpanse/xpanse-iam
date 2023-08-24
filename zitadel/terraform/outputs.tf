locals{
  protocol = var.insecure == false ? "https://" : "http://"
  port_str = var.port == 80 ? "" : var.port == 443 ? "" : ":${var.port}"
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

output "REACT_APP_ZITADEL_CLIENT_ID" {
  value       = nonsensitive(zitadel_application_oidc.xpanse-ui.client_id)
  description = "Output the value of REACT_APP_ZITADEL_CLIENT_ID for configuring the consuming application 'Xpanse-UI'."
}