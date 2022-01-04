variable "account_id" {
  type        = string
  description = "aws account id to deploy"
}
variable "name" {
  type = string
}
variable "region" {
  type = string
}
variable "environment" {
  type = string
}
variable "dns_zone" {
  type = string
}
variable "wildcard_arn" {
  type = string
}
variable "api_stage_name" {
  type = string
}
variable "waf_allowed_ips" {
  type = list(any)
}
variable "tags" {
  type = map(any)
}
variable "certificate_path" {
  type = string
}
variable "certificate_s3_key" {
  type = string
}
variable "security_policy" {
  type    = string
  default = "TLS_1_2"
}
variable "xray_tracing_enabled" {
  type    = bool
  default = false
}
variable "endpoint_configuration" {
  type    = string
  default = "REGIONAL"
}

locals {
  default_tags = var.tags

  access_log_settings = {
    requestId = "$context.requestId"
    identity = {
      ip     = "$context.identity.sourceIp"
      caller = "$context.identity.caller"
      user   = "$context.identity.user"
    }
    requestTime      = "$context.requestTime"
    requestTimeEpoch = "$context.requestTimeEpoch"
    httpMethod       = "$context.httpMethod"
    resourcePath     = "$context.resourcePath"
    status           = "$context.status"
    protocol         = "$context.protocol"
    responseLength   = "$context.responseLength"
    xrayTraceId      = "$context.xrayTraceId"
  }


}

variable "api_resource_policy" {
  type        = string
  description = "JSON formatted policy document that controls access to the API Gateway"
  default     = null
}
