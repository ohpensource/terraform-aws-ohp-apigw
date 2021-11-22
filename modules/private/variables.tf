# variable "service_name" { type = string }
# variable "service_suffix" { type = string }
# variable "project_name" { type = string }
variable "region_id" { type = string }

variable "apigw_config" {
  type = map(object({
    name             = string
    path             = string
    method           = string
    integration_type = string
    integration_arn  = string
  }))
}

variable "tags" { type = map(any) }
variable "api_name" { type = string }

variable "api_stage_name" { type = string }

variable "xray_tracing_enabled" {
  type    = bool
  default = false
}
variable "endpoint_configuration" {
  type    = string
  default = "REGIONAL"
}

variable "cloudwatch_logs_retention_in_days" {
  type    = number
  default = 3
}

variable "authorization" {
  type    = string
  default = "NONE"
}
