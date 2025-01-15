provider "zitadel" {
  domain           = var.domain
  insecure         = var.insecure
  port             = var.port
  jwt_profile_file = var.jwt_profile_file
}

resource "zitadel_label_policy" "label_policy" {
  org_id                 = zitadel_org.xpanse.id
  primary_color          = "#5469d4"
  hide_login_name_suffix = false
  warn_color             = "#cd3d56"
  background_color       = "#ffffff"
  font_color             = "#000000"
  primary_color_dark     = "#2073c4"
  background_color_dark  = "#111827"
  warn_color_dark        = "#ff3b5b"
  font_color_dark        = "#ffffff"
  disable_watermark      = false
  set_active             = true
  logo_hash              = filemd5("./static/logo-light.png")
  logo_path              = "./static/logo-light.png"
  logo_dark_hash         = filemd5("./static/logo-dark.png")
  logo_dark_path         = "./static/logo-dark.png"
  icon_hash              = filemd5("./static/icon-light.png")
  icon_path              = "./static/icon-light.png"
  icon_dark_hash         = filemd5("./static/icon-dark.png")
  icon_dark_path         = "./static/icon-dark.png"
  theme_mode             = "THEME_MODE_LIGHT"
}