// get the user ID of the deployer user.
data "zitadel_machine_users" "deployer" {
  count = var.is_local_dev_env ? 0 : 1
  user_name        = "deployer"
  user_name_method = "TEXT_QUERY_METHOD_EQUALS"
}

resource "zitadel_instance_member" "default" {
  count = var.is_local_dev_env ? 0 : 1
  user_id = data.zitadel_machine_users.deployer[count.index].user_ids[0]
  roles   = ["IAM_OWNER"]
}