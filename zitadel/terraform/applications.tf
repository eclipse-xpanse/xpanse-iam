resource zitadel_application_api application_api {
  org_id           = zitadel_org.xpanse.id
  project_id       = zitadel_project.eclipse-xpanse.id
  name             = "api"
  auth_method_type = "API_AUTH_METHOD_TYPE_BASIC"
}

resource zitadel_application_oidc xpanse-ui {
  project_id                  = zitadel_project.eclipse-xpanse.id
  org_id                      = zitadel_org.xpanse.id
  name                        = "xpanse-ui"
  redirect_uris               = [for path in var.redirect_xpanse-ui_uris : "${var.xpanse-ui_base_uri}${path}"]
  response_types              = ["OIDC_RESPONSE_TYPE_CODE"]
  grant_types                 = ["OIDC_GRANT_TYPE_AUTHORIZATION_CODE"]
  post_logout_redirect_uris   = [for path in var.post_logout_redirect_uris : "${var.xpanse-ui_base_uri}${path}"]
  app_type                    = "OIDC_APP_TYPE_USER_AGENT"
  auth_method_type            = "OIDC_AUTH_METHOD_TYPE_NONE"
  version                     = "OIDC_VERSION_1_0"
  clock_skew                  = "0s"
  dev_mode                    = true
  access_token_type           = var.auth_token_type == "JWT" ? "OIDC_TOKEN_TYPE_JWT" : "OIDC_TOKEN_TYPE_BEARER"
  access_token_role_assertion = var.auth_token_type == "JWT" ? true : false
  id_token_role_assertion     = true
  id_token_userinfo_assertion = true
  additional_origins          = []
}

resource zitadel_application_oidc swagger-ui {
  project_id                  = zitadel_project.eclipse-xpanse.id
  org_id                      = zitadel_org.xpanse.id
  name                        = "swagger-ui"
  response_types              = ["OIDC_RESPONSE_TYPE_CODE"]
  grant_types                 = ["OIDC_GRANT_TYPE_AUTHORIZATION_CODE"]
  app_type                    = "OIDC_APP_TYPE_USER_AGENT"
  auth_method_type            = "OIDC_AUTH_METHOD_TYPE_NONE"
  version                     = "OIDC_VERSION_1_0"
  clock_skew                  = "0s"
  dev_mode                    = true
  access_token_type           = var.auth_token_type == "JWT" ? "OIDC_TOKEN_TYPE_JWT" : "OIDC_TOKEN_TYPE_BEARER"
  access_token_role_assertion = var.auth_token_type == "JWT" ? true : false
  id_token_role_assertion     = true
  id_token_userinfo_assertion = true
  additional_origins          = []
  redirect_uris               = flatten([
    for path in var.redirect_swagger-ui_uris : [
      "${var.xpanse_swagger-ui_base_uri}${path}",
      "${var.terraform-boot_swagger-ui_base_uri}${path}",
      "${var.tofu-maker_swagger-ui_base_uri}${path}"
    ]
    ])
}