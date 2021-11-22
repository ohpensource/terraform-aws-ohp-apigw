

variable "ip_set_name" {
  type        = string
  description = "Waf v2 IP Set name"
}

variable "ip_set_description" {
  type        = string
  default     = "Waf v2 IP set"
  description = "Waf v2 IP Set description"
}

variable "ip_set_scope" {
  type        = string
  default     = "REGIONAL"
  description = "(Required) Specifies whether this is for an AWS CloudFront distribution or for a regional application. Valid values are CLOUDFRONT or REGIONAL"
}

variable "ip_set_ip_addr_version" {
  type        = string
  default     = "IPV4"
  description = "(Required) Specify IPV4 or IPV6. Valid values are IPV4 or IPV6"
}

variable "ip_set_addresses" {
  type        = list(any)
  description = "(Required) Contains an array of strings that specify one or more IP addresses or blocks of IP addresses in Classless Inter-Domain Routing (CIDR) notation. AWS WAF supports all address ranges for IP versions IPv4 and IPv6"
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "waf_web_acl_name" {
  description = "(Required) A friendly name of the WebACL"
}

variable "waf_web_acl_description" {
  description = "(Optional) A friendly description of the WebACL"
  default     = "WebACL"
}

variable "waf_web_acl_scope" {
  description = "(Required) Specifies whether this is for an AWS CloudFront distribution or for a regional application. Valid values are CLOUDFRONT or REGIONAL. To work with CloudFront, you must also specify the region us-east-1 (N. Virginia) on the AWS provider."
  default     = "REGIONAL"
}

variable "waf_api_gateway_stage_arn" {
  description = "API Gateway Stage Arn"
}

variable "waf_enable_web_acl_rule_metrics" {
  default     = true
  description = "(Required) A boolean indicating whether the associated resource sends metrics to CloudWatch"
}

variable "waf_enable_web_acl_rule_request_sampling" {
  default     = true
  description = " (Required) A boolean indicating whether AWS WAF should store a sampling of the web requests that match the rules. You can view the sampled requests through the AWS WAF console."
}

variable "waf_enable_web_acl_metrics" {
  default     = true
  description = "(Required) A boolean indicating whether the associated resource sends metrics to CloudWatch"
}

variable "waf_enable_web_acl_request_sampling" {
  default     = true
  description = " (Required) A boolean indicating whether AWS WAF should store a sampling of the web requests that match the rules. You can view the sampled requests through the AWS WAF console."
}
