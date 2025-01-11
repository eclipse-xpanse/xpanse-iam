module "create-dev-users" {
  source = "./dev-users"
  count = var.is_local_dev_env ? 1 : 0
  test_users = var.test_users
  xpanse_org_id = zitadel_org.xpanse.id
  xpanse_project_id = zitadel_project.eclipse-xpanse.id
  domain = var.domain
  port = var.port
}