// get the default organization ID. The deployer user is on the default organization.
data "zitadel_orgs" "default" {
  name        = "ZITADEL"
  name_method = "TEXT_QUERY_METHOD_EQUALS"
}

// get the user ID of the default service account admin user.
data "zitadel_machine_users" "zitadel-admin-sa" {
  user_name        = "zitadel-admin-sa"
  user_name_method = "TEXT_QUERY_METHOD_EQUALS"
}

# get access token to make API calls.
resource "zitadel_personal_access_token" "apiclient_user_id_token" {
  org_id  = data.zitadel_orgs.default.ids[0]
  user_id = data.zitadel_machine_users.zitadel-admin-sa.user_ids[0]
}


resource "zitadel_human_user" "test-users" {
  for_each = {for i, item in var.test_users : i => item}

  org_id             = var.xpanse_org_id
  user_name          = each.value.email
  first_name         = each.value.name
  last_name          = each.value.name
  nick_name          = each.value.name
  display_name       = each.value.name
  preferred_language = "en"
  gender             = "GENDER_MALE"
  phone              = "+41799999999"
  is_phone_verified  = true
  email              = each.value.email
  is_email_verified  = true
  initial_password   = "Password1!"
}

locals {
  roles_map = {
    for created_users in zitadel_human_user.test-users : created_users.user_name => [
      for test_user in var.test_users : { id : created_users.id, roles : test_user.roles }
      if test_user.email == created_users.user_name
    ]
  }

  passwords_map = {
    for created_users in zitadel_human_user.test-users : created_users.user_name => [
      for test_user in var.test_users : { id : created_users.id, password : test_user.password }
      if test_user.email == created_users.user_name
    ]
  }

  meta_data_map = flatten([
    for created_users in zitadel_human_user.test-users : [
      for test_user in var.test_users : [
        for meta_data_entry in test_user.meta-data :{
          id : created_users.id, user_name : created_users.user_name, data_key : meta_data_entry.key,
          data_value : meta_data_entry.value
        } if created_users.user_name == test_user.email
      ]
    ]
  ])
}

resource "zitadel_user_grant" "test-roles" {
  for_each = local.roles_map

  project_id = var.xpanse_project_id
  org_id     = var.xpanse_org_id
  role_keys  = each.value[0].roles
  user_id    = each.value[0].id
}

resource "zitadel_user_metadata" "meta-data" {
  for_each = {for obj in local.meta_data_map : "${obj.user_name}-${obj.data_key}" => obj}

  org_id  = var.xpanse_org_id
  user_id = each.value.id
  key     = each.value.data_key
  value   = each.value.data_value
}

//direct API call since no terraform module available for creating client credentials
resource "terracurl_request" "update_password" {
  lifecycle {
    ignore_changes = all
  }
  for_each = local.passwords_map
  name     = "update_password"
  url      = "http://${var.domain}:${var.port}/v2/users/${each.value[0].id}/password"
  method   = "POST"
  response_codes = [
    200
  ]
  headers = {
    x-zitadel-orgid = var.xpanse_org_id
    Content-Type    = "application/json"
    Accept          = "application/json"
    Authorization   = "Bearer ${zitadel_personal_access_token.apiclient_user_id_token.token}"
  }
  request_body = <<EOF
  {
   "newPassword":{
      "password": "${each.value[0].password}",
      "changeRequired":false
   },
   "currentPassword":"Password1!"
}
  EOF
}
