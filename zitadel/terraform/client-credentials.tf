resource "zitadel_machine_user" "api_client_user" {
  org_id      = zitadel_org.xpanse.id
  user_name   = "apiclient"
  name        = "api-client"
  description = "user for xpanse to make authenticated API calls"
  access_token_type = "ACCESS_TOKEN_TYPE_JWT"
}

// get the default organization ID. The deployer user is on the default organization.
data "zitadel_orgs" "default" {
  name = "ZITADEL"
  name_method = "TEXT_QUERY_METHOD_EQUALS"
}

// get the user ID of the deployer user.
data "zitadel_machine_users" "deployer" {
  user_name        = "deployer"
  user_name_method = "TEXT_QUERY_METHOD_EQUALS"
}

resource "zitadel_personal_access_token" "apiclient_user_id_token" {
  org_id          = data.zitadel_orgs.default.ids[0]
  user_id         = data.zitadel_machine_users.deployer.user_ids[0]
}

// direct API call since no terraform module available for creating client credentials
resource "terracurl_request" "machine_secret" {
    name = "machine_secret"
    url = "http://${var.domain}:${var.port}/management/v1/users/${resource.zitadel_machine_user.api_client_user.id}/secret"
    method = "PUT"
    response_codes = [
        200
      ]
    headers = {
        x-zitadel-orgid = zitadel_org.xpanse.id
        Content-Type = "application/json"
        Accept = "application/json"
        Authorization = "Bearer ${resource.zitadel_personal_access_token.apiclient_user_id_token.token}"
        }
    request_body = ""
}
