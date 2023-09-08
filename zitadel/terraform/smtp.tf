resource zitadel_smtp_config smtp {
  count          = var.smtp_sender_address == "" || var.smtp_sender_name == "" || var.smtp_host_port == "" || var.smtp_login_user == "" || var.smtp_login_password == "" ? 0 : 1
  sender_address = var.smtp_sender_address
  sender_name    = var.smtp_sender_name
  tls            = true
  host           = var.smtp_host_port
  user           = var.smtp_login_user
  password       = var.smtp_login_password
}