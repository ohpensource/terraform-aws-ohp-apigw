##########
# INPUTS #
##########

variable "tags" {
  type        = map(any)
  description = "(Mandatory) default tags for your resources."
}
variable "lambda_invoke_arn" {
  type        = string
  description = "(Mandatory) Lambda invoke arn to use in the apigw integration."
}
variable "lambda_function_name" {
  type        = string
  description = "(Mandatory) Lambda function name."
}
variable "prefix_name" {
  type        = string
  description = "(Mandatory) Name that will be used as PREFIX for all resources."
}
variable "environment" {
  type        = string
  description = "(Mandatory) environment in which the deployment happen: dev, tst, int, acc, prd"
}

############
# DEFAULTS #
############

variable "http_method" {
  type    = string
  default = "ANY"
}
variable "authorization" {
  type    = string
  default = "NONE"
}
variable "integration_http_method" {
  type    = string
  default = "POST"
}
variable "integration_type" {
  type    = string
  default = "AWS_PROXY"
}
variable "apigw_proxy_path_part" {
  type    = string
  default = "{proxy+}"
}
