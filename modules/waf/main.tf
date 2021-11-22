resource "aws_wafv2_ip_set" "main" {
  name               = var.ip_set_name
  description        = var.ip_set_description
  scope              = var.ip_set_scope
  ip_address_version = var.ip_set_ip_addr_version
  addresses          = var.ip_set_addresses
  tags               = var.tags
}


resource "aws_wafv2_web_acl_association" "main" {
  resource_arn = var.waf_api_gateway_stage_arn
  web_acl_arn  = aws_wafv2_web_acl.main.arn
}

resource "aws_wafv2_web_acl" "main" {
  name        = var.waf_web_acl_name
  description = var.waf_web_acl_description
  scope       = var.waf_web_acl_scope

  default_action {
    block {}
  }

  rule {
    name     = "rule-1"
    priority = 1

    action {
      allow {}
    }

    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.main.arn
      }

    }

    visibility_config {
      cloudwatch_metrics_enabled = var.waf_enable_web_acl_rule_metrics
      metric_name                = "${var.waf_web_acl_name}-rule-1"
      sampled_requests_enabled   = var.waf_enable_web_acl_rule_request_sampling
    }
  }

  tags = var.tags

  visibility_config {
    cloudwatch_metrics_enabled = var.waf_enable_web_acl_metrics
    metric_name                = var.waf_web_acl_name
    sampled_requests_enabled   = var.waf_enable_web_acl_request_sampling
  }
}


