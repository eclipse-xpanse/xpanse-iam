resource zitadel_project_role project_role_admin {
  org_id       = zitadel_org.xpanse.id
  project_id   = zitadel_project.eclipse-xpanse.id
  role_key     = "admin"
  display_name = "admin"
}

resource zitadel_project_role project_role_isv {
  org_id       = zitadel_org.xpanse.id
  project_id   = zitadel_project.eclipse-xpanse.id
  role_key     = "isv"
  display_name = "isv"
}

resource zitadel_project_role project_role_user {
  org_id       = zitadel_org.xpanse.id
  project_id   = zitadel_project.eclipse-xpanse.id
  role_key     = "user"
  display_name = "user"
}

resource zitadel_project_role project_role_csp {
  org_id       = zitadel_org.xpanse.id
  project_id   = zitadel_project.eclipse-xpanse.id
  role_key     = "csp"
  display_name = "csp"
}