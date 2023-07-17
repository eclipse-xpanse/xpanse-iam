output "application_api_client_id" {
  value = zitadel_application_api.application_api.client_id
  sensitive = true
}

output "application_api_client_secret" {
  value = zitadel_application_api.application_api.client_secret
  sensitive = true
}

output "xpanse-ui_client_id" {
  value = zitadel_application_oidc.xpanse-ui.client_id
  sensitive = true
}

output "xpanse-ui_client_secret" {
  value = zitadel_application_oidc.xpanse-ui.client_secret
  sensitive = true
}

output "swagger-ui_client_id" {
  value = zitadel_application_oidc.swagger-ui.client_id
  sensitive = true
}

output "swagger-ui_client_secret" {
  value = zitadel_application_oidc.swagger-ui.client_secret
  sensitive = true
}