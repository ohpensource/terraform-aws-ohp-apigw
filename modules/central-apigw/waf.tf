module "waf" {
  source = "../waf"

  ip_set_addresses          = var.waf_allowed_ips
  ip_set_name               = var.name
  waf_web_acl_name          = var.name
  waf_api_gateway_stage_arn = aws_api_gateway_stage.main.arn
  tags                      = var.tags
}
