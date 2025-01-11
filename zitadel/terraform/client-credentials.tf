resource "zitadel_machine_user" "api_client_user" {
  org_id      = zitadel_org.xpanse.id
  user_name   = "apiclient"
  name        = "api-client"
  description = "user for xpanse to make authenticated API calls"
  access_token_type = "ACCESS_TOKEN_TYPE_JWT"
  with_secret = true
}
